set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_CROSSCOMPILING 1)

# Grab the WINE variable from the environment
if(DEFINED ENV{WINE})
    set(WINE $ENV{WINE})
endif()

# Check if the toolchain is located in the Windows
# file system, and WSL is accessing it through 'mnt/c'
if(${CMAKE_CURRENT_LIST_DIR} MATCHES "^/mnt/c")
    set(WSL_ACCESSING_WINDOWS TRUE)
endif()

# WSL1 can run the toolchain natively by
# accessing it in the Windows file system.
# All other non-Windows platforms need wine
if(NOT DEFINED WINE AND UNIX AND NOT WSL_ACCESSING_WINDOWS)
    set(WINE "wine")
endif()

if((NOT WRAP_PATH_UNIX OR NOT WRAP_PATH_WIN) AND UNIX)
    # Prepend /mnt/c to absolute paths if building
    # on WSL and accessing the Windows file system
    if(WSL_ACCESSING_WINDOWS)
        set(WRAP_PATH_UNIX "/mnt/c")
        set(WRAP_PATH_WIN "C:")
    endif()

    if(WINE)
        message(CHECK_START "Querying build directory using winepath")
        set(WRAP_PATH_UNIX "${CMAKE_SOURCE_DIR}")
        execute_process(
            COMMAND ${WINE} winepath -w "${WRAP_PATH_UNIX}"
            OUTPUT_VARIABLE WRAP_PATH_WIN
            RESULT_VARIABLE CMD_WINEPATH_ERROR
            OUTPUT_STRIP_TRAILING_WHITESPACE
        )
        if(CMD_WINEPATH_ERROR)
            message(FATAL_ERROR "Failed to execute '${WINE}'")
        endif()
        message(CHECK_PASS "${WRAP_PATH_WIN}")
    endif()
endif()
set(WRAP_PATH_UNIX "${WRAP_PATH_UNIX}" CACHE INTERNAL "")
set(WRAP_PATH_WIN "${WRAP_PATH_WIN}" CACHE INTERNAL "")

# Configure the compiler wrapper
foreach(tool mwccarm mwasmarm mwldarm)
    set(WRAP_TOOL "${CMAKE_CURRENT_LIST_DIR}/${tool}.exe")
    configure_file(
        "${CMAKE_CURRENT_LIST_DIR}/wrapper.sh.in"
        "${CMAKE_CURRENT_BINARY_DIR}/${tool}"
        @ONLY
    )
endforeach()

# Set mwccarm as the C/C++ compiler, and mwasmarm as the assembler
set(CMAKE_C_COMPILER   "${CMAKE_CURRENT_BINARY_DIR}/mwccarm")
set(CMAKE_CXX_COMPILER "${CMAKE_CURRENT_BINARY_DIR}/mwccarm")
set(CMAKE_ASM_COMPILER "${CMAKE_CURRENT_BINARY_DIR}/mwasmarm")
set(CMAKE_LINKER       "${CMAKE_CURRENT_BINARY_DIR}/mwldarm")

# Configure this compiler vendor
foreach(lang C CXX ASM)
    # Register the compiler so it can be detected
    list(APPEND CMAKE_${lang}_COMPILER_ID_VENDORS Metrowerks)
    set(CMAKE_${lang}_COMPILER_ID_VENDOR_FLAGS_Metrowerks "--version")
    set(CMAKE_${lang}_COMPILER_ID_VENDOR_REGEX_Metrowerks "Metrowerks")

    # Set the compile commands
    set(CMAKE_${lang}_COMPILE_OBJECT "<CMAKE_${lang}_COMPILER> <FLAGS> <DEFINES> <INCLUDES> -o <OBJECT> -c <SOURCE>")
    set(CMAKE_${lang}_LINK_EXECUTABLE "<CMAKE_LINKER> <CMAKE_${lang}_LINK_FLAGS> <LINK_FLAGS> -o <TARGET>.nef <LINK_LIBRARIES>")
    set(CMAKE_${lang}_CREATE_STATIC_LIBRARY "<CMAKE_LINKER> <LINK_FLAGS> -library -o <TARGET> <OBJECTS>")

    # Set default compiler flags
    set(CMAKE_${lang}_FLAGS_INIT " -nodefaults")
    set(CMAKE_${lang}_FLAGS_DEBUG_INIT " -g")
    set(CMAKE_${lang}_FLAGS_MINSIZEREL_INIT " ")
    set(CMAKE_${lang}_FLAGS_RELEASE_INIT " ")
    set(CMAKE_${lang}_FLAGS_RELWITHDEBINFO_INIT " -g")
    if(NOT lang STREQUAL "ASM")
        string(APPEND CMAKE_${lang}_FLAGS_DEBUG_INIT
            " -O0 -inline off -g")
        string(APPEND CMAKE_${lang}_FLAGS_MINSIZEREL_INIT
            " -O4 -inline on,noauto -opt space")
        string(APPEND CMAKE_${lang}_FLAGS_RELEASE_INIT
            " -O4 -inline on,noauto -opt speed")
        string(APPEND CMAKE_${lang}_FLAGS_RELWITHDEBINFO_INIT
            " -O4 -inline on,noauto -opt speed")
    endif()

    # Set depfiles generation flags
    set(CMAKE_DEPFILE_FLAGS_${lang} "-gccdep -MD")

    if(NOT lang STREQUAL "ASM")
        # Set standard libs include paths
        set(CMAKE_${lang}_STANDARD_INCLUDE_DIRECTORIES
            "${CMAKE_SOURCE_DIR}/lib/msl/include"
            "${CMAKE_SOURCE_DIR}/lib/msl/include/MSL_C"
            "${CMAKE_SOURCE_DIR}/lib/msl/include/MSL_Extras"
        )
    endif()
endforeach()

# Configure the linker
set(CMAKE_EXE_LINKER_FLAGS_INIT " -nodefaults")
set(CMAKE_STATIC_LINKER_FLAGS_INIT " -nodefaults")

# The compiler cannot link executables without heavy assistance
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# Skip all possible cmake tests, hardcoding the compiler
foreach(lang C CXX)
    set(CMAKE_${lang}_COMPILER_ID_RUN TRUE)
    set(CMAKE_${lang}_ABI_COMPILED TRUE)
    set(CMAKE_${lang}_COMPILER_ID "Metrowerks")
endforeach()
set(CMAKE_ASM_COMPILER_ID "Metrowerks")
