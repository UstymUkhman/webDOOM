#!/bin/bash

rm -rf ./build/web

cd ./src/SDL/
make clean
cd ..

make clean
cd ..

make clean
make

rm ./src/prboom-game-server
mv ./src/prboom ./build/final.bc

cd ./build/
mkdir web

emcc final.bc -o web/web-doom.html \
     --preload-file prboom.wad     \
     --preload-file doom.wad       \
     --preload-file music          \
     -s ALLOW_MEMORY_GROWTH=1      \
     -s LEGACY_GL_EMULATION=1      \
     --no-heap-copy -O3

cd ..

