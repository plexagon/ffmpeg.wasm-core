#!/bin/bash

set -euo pipefail
source $(dirname $0)/var.sh

LIB_PATH=third_party/openh264

cd $LIB_PATH
mkdir -p build_openh264
cd build_openh264
rm -rf *.*
CFLAGS="-Oz -fno-stack-protector -U_FORTIFY_SOURCE"
CXXFLAGS=$CFLAGS
LDFLAGS="-fno-stack-protector -U_FORTIFY_SOURCE"
emmake make -f ../Makefile install-static OS=linux ARCH=mips PREFIX=$BUILD_DIR
