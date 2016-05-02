# customvim

My Vim custom settings.

## Important

- Install [powerline prepatched fonts](https://github.com/powerline/fonts) to
  user powerline symbols in vim-airline;

# How to...

## Install

```shell
cd ~

# clone customvim
git clone git@github.com:spelcaster/customvim.git .vim

# backup your .vimrc
cp -rfv .vimrc .vimrc.bak

# create a symbolic link to customvim .vimrc
ln -s .vim/.vimrc .vimrc

cd .vim

# install plugins
git submodule update --init --recursive
```

# Reference

- [List of used plugins](https://raw.githubusercontent.com/spelcaster/customvim/master/.gitmodules)
- [Remove Submodule](https://gist.github.com/kyleturner/1563153)

# License
This file is free software configuration code: you can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation, version 3..

This configuration is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this configure rile.  If not, see <http://www.gnu.org/licenses/>

