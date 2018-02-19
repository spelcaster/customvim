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

### Plugins with a Makefile

The following directories have a Makefile on it and they should be built to work
as expected.

```shell
bundle/clang_complete
bundle/deoplete.nvim
bundle/emmet
bundle/yajs
bundle/vimproc
bundle/supertab

# example: build deoplete
# deoplete install some python dependencies, so it need to be run as super user
cd bundle/deoplete.nvim
sudo make
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

