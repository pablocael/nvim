#  Install git and nvim
sudo apt update && sudo apt install git neovim ripgrep

# 1) Install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

nvim -c PackerSync -c PackerInstall -c 'sleep 5' -c qa --headless

