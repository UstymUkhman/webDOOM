### native
#./configure --disable-i386-asm --disable-gl --disable-cpu-opt
# make
# ./src/prboom -nofullscreen -nosound

### web
#EMCONFIGURE_JS=1 ~/Dev/emscripten/emconfigure ./configure --disable-i386-asm --disable-gl --disable-cpu-opt --without-net --with-sdl-prefix=/home/alon/Dev/emscripten/system
make -j 2
mv src/prboom src/prboom.bc
~/Dev/emscripten/emcc src/prboom.bc -o boon.html --preload-file prboom.wad --preload-file doom.wad -s TOTAL_MEMORY=134217728 -O3 --pre-js pre.js

