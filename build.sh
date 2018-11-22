#!/bin/bash

rm -rf ./build/final.bc
rm -rf ./build/web

cd ./src/SDL/
make clean
cd ..

make clean
cd ..

make clean
make

rm ./build/prboom.wad
rm ./src/prboom-game-server
mv ./src/prboom ./build/final.bc
cp ./data/prboom.wad ./build/prboom.wad

cd ./build/
mkdir web

emcc final.bc -o web/web-doom.html \
     --preload-file prboom.wad     \
     --preload-file doom.wad       \
     --preload-file music          \
     --preload-file sfx            \
     -s ALLOW_MEMORY_GROWTH=1      \
     -s LEGACY_GL_EMULATION=1      \
     --no-heap-copy -O3

cd ..

