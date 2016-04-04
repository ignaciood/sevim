#!/bin/bash

function die()
{
  echo "${@}"
  exit 1
}

vim_dir="$HOME/.vim"

git clone --recursive https://github.com/SebiSujar/myvim $vim_dir \
  || die "Could not clone the repository to ${HOME}/.vim"

ln -s $vim_dir/vimrc $HOME/.vimrc \
  || die "Could not create symbolic link in ${HOME}"

echo "installing plugins, this may take a while"
echo | echo | vim +PluginInstall +qall &>/dev/null
