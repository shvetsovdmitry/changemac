# ChangeMAC

ChangeMAC - [macchanger](https://github.com/alobbs/macchanger) wrapper (2019 May 3) v0.6

![license](https://img.shields.io/github/license/shvetsovdmitry/changemac.svg?style=flat-square)
![version](https://img.shields.io/github/release/shvetsovdmitry/changemac.svg?style=flat-square)
![commit activity](https://img.shields.io/github/commit-activity/w/shvetsovdmitry/changemac.svg?style=flat-square)
![latest commit](https://img.shields.io/github/last-commit/shvetsovdmitry/changemac.svg?style=flat-square)
![release date](https://img.shields.io/github/release-date/shvetsovdmitry/changemac.svg?style=flat-square)

## Installation:

1) Clone the repo:
> `git clone https://github.com/shvetsovdmitry/changemac`

2) Go into the directory:
> `cd changemac`

3) Copy code file to `/usr/bin`:
> `sudo cp changemac /usr/bin`

4) Launch from everywhere:
> `sudo changemac [options] device`

## Options:

* `-m \<MAC\>` - MAC to use (Default: 0A:1B:2C:3D:4E:5F) 
* `-p` - Reset MAC to default (permanent) 
* `-r` - Set fully random MAC 
* `-a` - Set random vendor MAC of the same kind 
* `-A` - Set random vendor MAC of any kind 
* `-s` - Restart network-manager 
* `-v` - Verbose output 
* `-h` - Show help information

## License
MIT

Because this is an open source project, I am constantly evaluating feedback and continuing to improve upon the content.

Copyright (c) 2019, Dmitry Shvetsov
