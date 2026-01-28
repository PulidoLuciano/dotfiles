#!/bin/bash

sudo apt purge neovim

echo -e "${ORANGE} Descargando lenguajes necesarios... ${NC}"
sudo apt update && sudo apt upgrade -y
sudo apt install -y git curl zsh unzip build-essential xclip ripgrep fd-find python3-venv nodejs npm golang-go default-jdk pip

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
rm ./nvim-linux-x86_64.tar.gz

# Definir la ruta de Neovim
NVIM_BIN_PATH="/opt/nvim-linux-x86_64/bin"

# Verificar si la ruta ya está en el .zshrc para no duplicarla
if ! grep -q "$NVIM_BIN_PATH" ~/.zshrc; then
  echo -e "${BLUE}Añadiendo Neovim al PATH en .zshrc...${NC}"
  echo "export PATH=\"\$PATH:$NVIM_BIN_PATH\"" >>~/.zshrc
  echo -e "${GREEN}✅ PATH actualizado.${NC}"
else
  echo -e "${GREEN}✅ La ruta de Neovim ya existe en el PATH.${NC}"
fi

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/

sudo apt install fzf

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep_14.1.1-1_amd64.deb
sudo dpkg -i ripgrep_14.1.1-1_amd64.deb

sudo apt install fd-find

npm install tree-sitter-cli

git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git
rm lazygit
rm lazygit.tar.gz
rm ripgrep_14.1.1-1_amd64.deb

# Vincular toda la carpeta de nvim
DOTFILES_DIR=$(pwd)
rm -rf ~/.config/nvim
ln -s "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

echo -e "${BLUE}Instalando herramientas de formateo de código...${NC}"
# Instalación vía npm (Prettier para Web/React Native)
sudo npm install -g prettier
# Instalación vía pip (Black para tus análisis de datos con Pandas)
pip install black --break-system-packages
# Instalación de clang-format para C/C++
sudo apt install -y clang-format

echo -e "${ORANGE}--- Instalación Completada ---${NC}"
echo -e "Abre Neovim y Mason instalará los LSPs automáticamente."
