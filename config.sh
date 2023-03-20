#!/bin/sh
cmake \
    -DCMAKE_TOOLCHAIN_FILE="tools/cw/2.0/sp2p2/codewarrior.toolchain.cmake" \
    -DCMAKE_BUILD_TYPE=Release \
    -GNinja -S . -B build
