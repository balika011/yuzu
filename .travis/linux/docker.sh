#!/bin/bash -ex

apt-get update
apt-get install --no-install-recommends -y build-essential git libqt5opengl5-dev libsdl2-dev libssl-dev python qtbase5-dev wget cmake ninja-build ccache

cd /yuzu

mkdir build && cd build
cmake .. -DYUZU_BUILD_UNICORN=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=/usr/lib/ccache/gcc -DCMAKE_CXX_COMPILER=/usr/lib/ccache/g++ -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON -G Ninja
ninja

ctest -VV -C Release
