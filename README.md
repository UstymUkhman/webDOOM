# [webDOOM](http://35.158.218.205/experiments/webDOOM/) #

> **DOOM** and **DOOM II** games compiled for web with [WebAssembly](https://webassembly.org/).

_You can try it [here](http://35.158.218.205/experiments/webDOOM/)._


**webDOOM** uses [PrBoom](http://prboom.sourceforge.net/) open source **DOOM** code, classic game assets like Doom1.wad and Doom2.wad [files](http://www.pc-freak.net/blog/doom-1-doom-2-doom-3-game-wad-files-for-download-playing-doom-on-debian-linux-via-freedoom-open-source-doom-engine/), original [music](http://www.wolfensteingoodies.com/archives/olddoom/music.htm) in MP3 format and [sound effects](https://archive.org/details/dsbossit) in WAV format.

Big thanks to all sites in links above for providing required assets to make it feel like original games and especially to the WebAssembly comunity that keeps working on [this](http://kripken.github.io/emscripten-site/) amazing tool!

![](./public/preview.gif)


## Building webDOOM on Debian ##

You can build it on your own by following these steps:

- First of all, *PrBoom* (v2.5.0) requires a 32-bit Linux distro (*better if Debian based*), so I would recomend you to install [this one](http://releases.ubuntu.com/14.04/) for your [Virtual Machine](https://www.virtualbox.org/) if you're running a 64-bit based OS.

- Once it's done, follow [these](http://prboom.sourceforge.net/linux.html) steps to be sure to have all necessary packages to compile PrBoom code (actually you can skip `libsdl-net1.2-dev` and `SDL_net` packages since online game is not supported).

- Be also sure to have `git`, `autoconf` and `automake` tools.

- Now you can download and install the `emscripten` compiler by following [these](https://kripken.github.io/emscripten-site/docs/getting_started/downloads.html) instructions.

- Finally, clone this repo.

- Run `./configure` script in the root folded (it can take a while) and when all the `Makefile`s have been created, be sure to set correct compiler paths for `emcc`'s [*CC*](https://github.com/UstymUkhman/webDOOM/blob/master/Makefile#L98); [*CPP*](https://github.com/UstymUkhman/webDOOM/blob/master/Makefile#L101); [*LIBS*](https://github.com/UstymUkhman/webDOOM/blob/master/Makefile#L121); [*RANLIB*](https://github.com/UstymUkhman/webDOOM/blob/master/Makefile#L139) and [*SDL* options](https://github.com/UstymUkhman/webDOOM/blob/master/Makefile#L140-L142) based on the location of `emsdk`'s folder on your machine in **all** `Makefile`s of this repository.

- Make sure to have the required [music files](https://github.com/UstymUkhman/webDOOM/blob/master/src/m_misc.c#L725) in [here](https://github.com/UstymUkhman/webDOOM/tree/master/build/doom1/music) (or [here](https://github.com/UstymUkhman/webDOOM/tree/master/build/doom2/music) if you're building *DOOM II*) as well as the [SFX files](https://github.com/UstymUkhman/webDOOM/blob/master/src/sounds.c#L124) (for convenience of downloaded SFX files, their names are preceded by `ds` characters as you can see [here](https://github.com/UstymUkhman/webDOOM/blob/master/src/SDL/i_sound.c#L185)).

- Alternatively, you can build with `-nosound` flag by adding it to your Module object as explained [here](https://kripken.github.io/emscripten-site/docs/api_reference/module.html#creating-the-module-object).

- With active `emcc` compiler (run `./emsdk activate latest` and `source ./emsdk_env.sh` in your *emsdk* directory), navigate to the root folder of this repo and run `./build.sh` to compile **DOOM** or `./build.sh doom2` to compile **DOOM II**. When running `./build.sh` the first time, it can take a while because `emscripten`'s cache hasn't been set yet, but at the end you should see the `HTML` application in `web` folder [here](https://github.com/UstymUkhman/webDOOM/tree/master/build).


### Building webDOOM on Windows ###

I was not able to compile PrBoom on Windows because of some issues:

- PrBoom needs to be compiled by using its `Makefile` which requires a `make` command to be executed from your console in the project folded.

- There are several ways to have a `make` command even if you're using a Windows machine and those are to install one of the following consoles: [*MinGW*](http://www.mingw.org/wiki/Getting_Started); [*Cygwin*](https://www.cygwin.com/) or [*WSL*](https://docs.microsoft.com/en-us/windows/wsl/install-win10).

- Besides that, PrBoom's code is strictly related to the compiler's architecture, so you'll have to use a `mingw32` bash (for example) in order to avoid all the errors that will come if you'll try to build it directly on a `x64` CPU.

- Another pain in the ass refers to the `SDL` version you'll have to use (**1.2.x**) which is pretty old and can cause some problems when trying to install it for a `mingw32` compiler.

- So, even if you'll figure out all the requirements above, you'll find out that unfortunately, `emcc` does not support *MinGW* or *Cygwin* enviroments (at least I faced this problem with v1.38.13) and there's no Windows Subsystem for Linux that emulates an `x32` architecture.

- Despite that, you can install `emscripten`; clone this repo and run `build.bat` (for **DOOM**) or `build.bat doom2` (for **DOOM II**) on Windows that will produce you a valid `HTML` application from [this](https://github.com/UstymUkhman/webDOOM/blob/master/build/final.bc) `LLVM` code.
