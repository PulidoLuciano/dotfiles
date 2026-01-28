#!/bin/bash

# Colores para la salida
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Iniciando la automatización de la terminal...${NC}"

# 1. Actualizar sistema e instalar dependencias base
echo -e "${GREEN}Instalando dependencias base (git, curl, zsh, unzip)...${NC}"
sudo apt update && sudo apt install -y git curl zsh unzip build-essential

# 2. Instalar JetBrainsMono Nerd Font
if [ ! -d "$HOME/.local/share/fonts/JetBrainsMono" ]; then
    echo -e "${GREEN}Instalando JetBrainsMono Nerd Font...${NC}"
    mkdir -p ~/.local/share/fonts
    curl -fLO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
    unzip JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono
    rm JetBrainsMono.zip
    fc-cache -fv
else
    echo -e "${GREEN}✅ La fuente ya está instalada.${NC}"
fi

# 3. Instalar Oh My Zsh (si no existe)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${GREEN}Instalando Oh My Zsh...${NC}"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo -e "${GREEN}✅ Oh My Zsh ya está instalado.${NC}"
fi

# 4. Instalar Plugins de Zsh
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
echo -e "${GREEN}Configurando plugins de sugerencias y resaltado...${NC}"

# Autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# Syntax Highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# 5. Instalar Starship Prompt
if ! command -v starship &> /dev/null; then
    echo -e "${GREEN}Instalando Starship Prompt...${NC}"
    curl -sS https://starship.rs/install.sh | sh -s -- -y
else
    echo -e "${GREEN}✅ Starship ya está instalado.${NC}"
fi

# 6. Crear Enlaces Simbólicos (Symlinks)
# Esto conecta los archivos de tu repo con el sistema
DOTFILES_DIR=$(pwd)

echo -e "${BLUE}Creando enlaces simbólicos para los archivos de configuración...${NC}"

# .zshrc
rm -f ~/.zshrc
ln -s "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc
echo -e "${GREEN}✅ Enlace creado para .zshrc${NC}"

# starship.toml
mkdir -p ~/.config
rm -f ~/.config/starship.toml
ln -s "$DOTFILES_DIR/starship/starship.toml" ~/.config/starship.toml
echo -e "${GREEN}✅ Enlace creado para starship.toml${NC}"

# 7. Cambiar Shell a Zsh
if [ "$SHELL" != "$(which zsh)" ]; then
    echo -e "${BLUE}Cambiando el shell por defecto a Zsh...${NC}"
    sudo chsh -s $(which zsh) $(whoami)
fi

echo -e "${BLUE}--------------------------------------------------${NC}"
echo -e "${GREEN}¡Todo listo! Por favor, cierra la terminal y vuelve a abrirla.${NC}"
echo -e "${GREEN}No olvides configurar 'JetBrainsMono Nerd Font' en las preferencias de tu terminal.${NC}"
echo -e "${BLUE}--------------------------------------------------${NC}"
