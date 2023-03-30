#!/bin/bash

#  Install git and nvim
sudo apt update && sudo apt install git neovim ripgrep gettext cmake build-essential

# 1) Install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# 2) Install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin


# 3) Build neovim
echo "Building neovim ..."
git clone https://github.com/neovim/neovim.git
pushd $PWD
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
popd
rm -Rf neovim

nvim -c PackerSync -c PackerInstall -c 'sleep 5' -c qa --headless

