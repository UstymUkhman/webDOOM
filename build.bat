#!/bin/bash
title Building web-doom
cd build/
mkdir web
cls

emcc final.bc -o web/web-doom.html ^
     --preload-file prboom.wad     ^
     --preload-file doom2.wad      ^
     --preload-file music          ^
     --preload-file sfx            ^
     -s TOTAL_MEMORY=32MB          ^
     -s LEGACY_GL_EMULATION=1      ^
     --no-heap-copy -O3

cd ..
