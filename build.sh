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

memory="32MB"
game="doom1"

if [ "$1" == "doom2" || "$1" == "2" ]; then
    game="doom2"
fi

emcc final.bc -o web/${game}.html  	\
     --preload-file prboom.wad     	\
     --preload-file ${game}/${game}.wad \
     --preload-file ${game}/music  	\
     --preload-file ${game}/sfx    	\
     -s TOTAL_MEMORY=${memory}     	\
     -s LEGACY_GL_EMULATION=1      	\
     --no-heap-copy -O3
     # --pre-js pre.js

cd ..

