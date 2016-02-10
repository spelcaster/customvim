#!/bin/bash

VIMDIR=~/.vim

cd $VIMDIR/bundle/vim-colorschemes/colors

for colorscheme in *; do
    ln -s $VIMDIR/bundle/vim-colorschemes/colors/$colorscheme \
        $VIMDIR/colors/$colorscheme;
    echo $colorscheme
done

cd -

