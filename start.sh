#!/bin/zsh

function print-in-red {
  echo "\033[0;31m$1\033[0m"
}

# TODO maybe install things like nvim
# and maybe just use bash and install zsh and oh-my-zsh
# etc.

{
  cd tilde && \
  git remote add mine git@github.com:rivertam/.files.git && \
  git merge mine/master && \
  cd ..
} || {
  >&2 print-in-red "Failed to initialize tilde"
  cd ..
}

mkdir -p ~/.config
{
  ln -s "$PWD/tilde" ~/.config && \
  echo "Linked tilde"
} || {
  >&2 print-in-red "Failed to link tilde"
}

{
  ln -s "$PWD/.zshrc" ~/.config/zsh/.zshrc && \
  echo "Linked zshrc"
} || {
  >&2 print-in-red "Failed to link zshrc"
}

{
  ln -s "$PWD/.i3config" ~/.config/i3/config && \
  echo "Linked i3 config"
} || {
  >&2 print-in-red "Failed to link i3 config"
}

{
  ln -s "$PWD/.xinitrc" ~/.xinitrc && \
  echo "Linked xinitrc"
} || {
  >&2 print-in-red "Failed to link xinitrc"
}

{
  ln -s "$PWD/init.vim" ~/.config/nvim/init.vim && \
  echo "Linked init.vim for neovim"
} || {
  >&2 print-in-red "Failed to link init.vim for neovim"
}
