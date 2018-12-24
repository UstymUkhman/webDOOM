#!/bin/bash
title Building web-doom
cd build/
mkdir web
cls

set game="doom1"

IF "%1%"=="2" (set game="doom2")
IF "%1%"=="doom2" (set game="doom2")

emcc final.bc -o web/%game%.html ^
     --preload-file prboom.wad   ^
     --preload-file %game%.wad   ^
     --preload-file %game%/music ^
     --preload-file sfx          ^
     -s TOTAL_MEMORY=256MB       ^
     -s LEGACY_GL_EMULATION=1    ^
     --no-heap-copy -O3

cd ..
