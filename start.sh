#!/bin/zsh

function print-in-red {
  echo "\033[0;31m$1\033[0m"
}

# install neovim
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
sudo chmod u+x nvim.appimage
mkdir -p ~/.bin
mv nvim.appimage ~/.bin/nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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
  mkdir -p ~/.config/zsh && \
  ln -s "$PWD/.zshrc" ~/.config/zsh/.zshrc && \
  echo "Linked zshrc"
} || {
  >&2 print-in-red "Failed to link zshrc"
}

{
  mkdir -p ~/.config/i3 && \
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
  mkdir -p ~/.config/nvim && \
  ln -s "$PWD/init.vim" ~/.config/nvim/init.vim && \
  echo "Linked init.vim for neovim"
} || {
  >&2 print-in-red "Failed to link init.vim for neovim"
}

{
  mkdir -p ~/.config/alacritty && \
  ln -s "$PWD/alacritty.yml" ~/.config/alacritty/alacritty.yml && \
  echo "Linked alacritty config"
} || {
  >&2 print-in-red "Failed to link alacritty config"
}

{
  mkdir -p ~/.local/share/fonts/ && \
  ln -s "$PWD/fonts/Anonymice Nerd Font Complete.ttf" "$HOME/.local/share/fonts/Anonymice Nerd Font Complete.ttf" && \
  ln -s "$PWD/fonts/Anonymice Nerd Font Complete Mono.ttf" "$HOME/.local/share/fonts/Anonymice Nerd Font Complete Mono.ttf" && \
  echo "Linked fonts"
} || {
  >&2 print-in-red "Failed to link fonts"
}
