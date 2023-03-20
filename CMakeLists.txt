# ====== PROJECT SETTINGS ======

cmake_minimum_required(VERSION 3.16)
project(pokeplatinum C ASM)

include(ExternalProject)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/main)

# ========== TOOLS ==========

ExternalProject_Add(pokeplatinum_tools
    SOURCE_DIR "${CMAKE_SOURCE_DIR}/tools"
    BINARY_DIR "${CMAKE_CURRENT_BINARY_DIR}/tools"
    CMAKE_GENERATOR Ninja
    INSTALL_COMMAND ""
)

# Native tools
set(FIXROM ${CMAKE_CURRENT_BINARY_DIR}/tools/fixrom/fixrom)
set(GEN_FX_CONSTS ${CMAKE_CURRENT_BINARY_DIR}/tools/gen_fx_consts/gen_fx_consts)
set(MWASMARM_PATCHER ${CMAKE_CURRENT_BINARY_DIR}/tools/mwasmarm_patcher/mwasmarm_patcher)

# Binary-only tools
set(MAKELCF ${CMAKE_SOURCE_DIR}/tools/maketools/makelcf.exe)
set(MAKEROM ${CMAKE_SOURCE_DIR}/tools/maketools/makerom.exe)

# ======== GAME CODE ========

# Since it is extremely painful to set target options per-language,
# the strategy here is to build the c and asm game sources as two
# separate targets, set properties on each, and then link them together

file(GLOB_RECURSE MAIN_C_SOURCES LIST_DIRECTORIES true src/*.c)
add_library(main_C OBJECT ${MAIN_C_SOURCES})
add_dependencies(main_C pokeplatinum_tools)

target_compile_options(main_C
    PRIVATE -proc arm946e
    PRIVATE -enum int
    PRIVATE -lang c99
    PRIVATE -Cpp_exceptions off
    PRIVATE -msgstyle gcc
    PRIVATE -gccinc
    PRIVATE -ipa file
    PRIVATE -interworking
    PRIVATE -char signed
    PRIVATE -include global/thumb.h
    PRIVATE -prefix global/global.mch
)

target_compile_definitions(main_C
    PRIVATE GAME_VERSION=PLATINUM
    PRIVATE GAME_LANGUAGE=ENGLISH
)

target_include_directories(main_C
    PRIVATE include
)

file(GLOB_RECURSE MAIN_ASM_SOURCES LIST_DIRECTORIES true asm/*.s)
add_library(main_ASM OBJECT ${MAIN_ASM_SOURCES})
add_dependencies(main_ASM pokeplatinum_tools)

target_compile_options(main_ASM
    PRIVATE -proc arm5TE
    PRIVATE -gccinc
    PRIVATE -include thumb.h
)

target_include_directories(main_ASM
    PRIVATE asm
    PRIVATE asm/include
    PRIVATE include/global
)

add_executable(main)
target_link_libraries(main PRIVATE main_C main_ASM syscall)

target_link_options(main
    PRIVATE -w on
    PRIVATE -proc arm946e
    PRIVATE -nopic
    PRIVATE -nopid
    PRIVATE -interworking
    PRIVATE -map closure,unused
    PRIVATE -symtab sort
    PRIVATE -msgstyle gcc
    PRIVATE -nostdlib
    PRIVATE -m _start
    PRIVATE -force_active "DGTi_hash2_arm4_small, Exception_Table_Index, Unk_02101B00, Unk_02101CE4"
)

# ======== DEPENDENCIES ========

set(DEPENDENCIES gamespy libVCT msl NitroDWC NitroSDK NitroSystem NitroWiFi syscall)

# Compile NitroSDK with cw 2.0/sp2
set(CMAKE_PROJECT_NitroSDK_INCLUDE ${CMAKE_CURRENT_LIST_DIR}/tools/cw/2.0/sp2/codewarrior.toolchain.cmake)

foreach(dep ${DEPENDENCIES})
    add_subdirectory(lib/${dep})
    add_dependencies(${dep} pokeplatinum_tools)
    target_link_libraries(main_C PRIVATE ${dep})
endforeach()

# Generate fx_const.h
add_custom_target(fx_const.h ALL
    cd ..
    COMMAND ${GEN_FX_CONSTS} lib/NitroSDK/include/nitro/fx/fx_const.h
    DEPENDS pokeplatinum_tools
)

# Make NitroSDK depend on the generated fx_const.h
add_dependencies(NitroSDK_C fx_const.h)

# Pass crt0.obj to the linker
target_link_options(main PRIVATE lib/syscall/libsyscall.a lib/NitroSDK/CMakeFiles/NitroSDK_C.dir/src/init/crt0.c.obj)

# ========= LCF & RESPONSE ==========

# Run makelcf.exe to build main.lcf
add_custom_target(main.lcf ALL
    cd ${CMAKE_SOURCE_DIR}
    COMMAND ${WINE} ${MAKELCF} platinum.us/main.lsf platinum.us/main.lcf.template build/main.lcf
    COMMENT "Generating main.lcf"
)

# Run makelcf.exe to build main.response
add_custom_target(main.response ALL
    cd ${CMAKE_SOURCE_DIR}
    COMMAND ${WINE} ${MAKELCF} platinum.us/main.lsf platinum.us/main.response.template build/main.response
    COMMENT "Generating main.response"
)

# Set main.lcf and main.response as dependencies for the 'main' executable
set_target_properties(main PROPERTIES LINK_DEPENDS main.lcf)
set_target_properties(main PROPERTIES LINK_DEPENDS main.response)

# Pass main.lcf and main.response to the linker
target_link_options(main PRIVATE main.lcf)
target_link_options(main PRIVATE @main.response)

# ========== FILE SYSTEM ============

add_subdirectory(files)

# =============== ROM ===============

# Run makerom.exe
add_custom_target(pokeplatinum.us.nds ALL
    cd ${CMAKE_SOURCE_DIR}
    COMMAND ${WINE} ${MAKEROM} -DBUILD_DIR=build/main -DNITROFS_FILES=${NITROFS_FILES} -DTITLE_NAME=\"POKEMON;PL\" -DBNR=platinum.us/banner.bnr -DHEADER_TEMPLATE=platinum.us/rom_header_template.sbin platinum.us/rom.rsf build/pokeplatinum.us.nds build/pokeplatinum.us.nlf
    DEPENDS main
    COMMENT "Building ROM..."
)

# Run fixrom
add_custom_target(fixrom ALL
    cd ${CMAKE_SOURCE_DIR}
    COMMAND ${FIXROM} build/pokeplatinum.us.nds --secure-crc 0xF8B8 --game-code CPUE
    DEPENDS pokeplatinum.us.nds pokeplatinum_tools
    COMMENT "Running fixrom..."
)

# ========== SHA1 ===========

add_custom_target(sha1_check ALL
    cd ${CMAKE_SOURCE_DIR}
    COMMAND sha1sum -c platinum.us/main.sha1
    COMMAND sha1sum -c platinum.us/rom.sha1
    DEPENDS fixrom
)
