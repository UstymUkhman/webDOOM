# webDOOM #

***DOOM** game compiled for web with emscripten.*

You can try it [here](http://52.59.223.146/experiments/webDOOM).

**webDOOM** uses [PrBoom](http://prboom.sourceforge.net/) open source DOOM code and classic game assets like [Doom1.wad](http://www.pc-freak.net/blog/doom-1-doom-2-doom-3-game-wad-files-for-download-playing-doom-on-debian-linux-via-freedoom-open-source-doom-engine/) with original [music](http://www.wolfensteingoodies.com/archives/olddoom/music.htm) and [sound effects](https://archive.org/details/dsbossit) converted in MP3 format.

Big thanks to all sites in links above for providing required assets to make it feel like the original game and especially to the WebAssembly comunity that keeps working on [this](http://kripken.github.io/emscripten-site/) amazing tool.

## Building webDOOM ##

You can build it on your own by following this steps:

- First of all, *PrBoom* (v2.5.0) requires a 32-bit Linux distro (*better if Debian based*), so I would recomend you to install [this](http://releases.ubuntu.com/14.04/) for your [Virtual Machine](https://www.virtualbox.org/) if you're running a 64-bit based OS.

- Once it's done follow [these](http://prboom.sourceforge.net/linux.html) steps to be sure to have all the necessary packages to compile PrBoom code (actually you can skip `libsdl-net1.2-dev` and `SDL_net` packages since online game is not supported).

- Be also sure to also have `git`, `autoconf` and `automake` tools.

- Now you can download and install the `emscripten` compiler by following [this](https://kripken.github.io/emscripten-site/docs/getting_started/downloads.html) instructions.

- Finally, clone this repo.
