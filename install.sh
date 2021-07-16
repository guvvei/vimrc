#!/bin/bash
set -e

mkdir -p .undodir

echo "\
source `pwd`/vimrcs/basic.vim
source `pwd`/vimrcs/plugins.vim"\
> ~/.vimrc
