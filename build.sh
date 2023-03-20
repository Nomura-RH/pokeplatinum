#!/bin/sh
export NINJA_STATUS='[%p %f/%t] '
ninja -C build
