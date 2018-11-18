#!/bin/bash
title Building web-doom
cd build/
mkdir web
cls

emcc final.bc -o web/web-doom.html ^
     --preload-file prboom.wad     ^
     --preload-file doom.wad       ^
     --preload-file music          ^
     -s ALLOW_MEMORY_GROWTH=1      ^
     -s LEGACY_GL_EMULATION=1      ^
     --no-heap-copy -O3

cd ..
