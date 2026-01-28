#!/bin/bash
echo "Configurando interfaz GNOME Sunset..."

echo -e "${ORANGE}Aplicando Wallpaper Eevee Sunset...${NC}"

# Creamos la carpeta de destino si no existe y movemos la imagen
mkdir -p ~/Pictures/Wallpapers
cp ./wallpaper/eevee_sunset.jpg ~/Pictures/Wallpapers/

# Aplicamos la configuración por CLI
WP_FILE="file://$HOME/Pictures/Wallpapers/eevee_sunset.jpg"
gsettings set org.gnome.desktop.background picture-uri-dark "$WP_FILE"
gsettings set org.gnome.desktop.background picture-uri "$WP_FILE"
gsettings set org.gnome.desktop.background picture-options 'zoom'

DOTFILES=$(pwd)
mkdir -p "$HOME/.config/gtk-4.0"
mkdir -p "$HOME/.config/gtk-3.0"
mkdir -p "$HOME/.themes/Sunset-Luciano/gnome-shell"
cp "$DOTFILES/themes/gtk.css" "$HOME/.config/gtk-3.0/"
cp "$DOTFILES/themes/gtk.css" "$HOME/.config/gtk-4.0/"
cp "$DOTFILES/themes/gnome-shell.css" "$HOME/.themes/Sunset-Luciano/gnome-shell/"

# 1. Centrar ventanas nuevas
gsettings set org.gnome.mutter center-new-windows true

# 2. Formato de reloj (Para que combine con tu Starship)
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-format '24h'
gsettings set org.gnome.desktop.interface clock-show-seconds true

# 3. Tema oscuro (Indispensable para el estilo Sunset)
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.shell.extensions.ding show-home false
gsettings set org.gnome.shell.extensions.ding show-trash false
gsettings set org.gnome.shell.extensions.ding show-volumes false
gsettings set org.gnome.shell.extensions.ding show-network-volumes false

#Ubuntu dock
# 1. Mover el dock a la parte inferior (estilo moderno)
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'

# 2. Desactivar el "Modo Extendido" (hace que parezca una cápsula flotante)
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false

# 3. Centrar el dock automáticamente
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 48
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode 'FIXED'

# 4. Color de fondo: Usaremos el marrón oscuro (#241a24) de tu terminal
# Nota: dash-to-dock usa formato RGB decimal (24, 26, 36) para este comando
gsettings set org.gnome.shell.extensions.dash-to-dock background-color 'rgb(26,20,26)'
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.85

# 5. Mostrar el dock siempre (o auto-ocultar según prefieras)
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true

# 6. Ocultar el botón de "Mostrar Aplicaciones" (opcional, para un look más limpio)
gsettings set org.gnome.shell.extensions.dash-to-dock show-show-apps-button true

# Activar 'Hacer clic para minimizar' (vital para flujo rápido)
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

# Quitar los iconos de unidades montadas/papelera para limpiar el diseño
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false

# 3. Hacer que aparezca solo al tocar el borde (requiere presión/barrera)
gsettings set org.gnome.shell.extensions.dash-to-dock require-pressure-to-show true

# 4. Ajustar la sensibilidad (presión necesaria para que aparezca)
# Un valor de 100 es estándar, puedes subirlo si se activa por accidente
gsettings set org.gnome.shell.extensions.dash-to-dock pressure-threshold 100

# Tiempo que tarda en aparecer (en segundos)
gsettings set org.gnome.shell.extensions.dash-to-dock animation-time 0.2

# Tiempo de espera antes de ocultarse
gsettings set org.gnome.shell.extensions.dash-to-dock hide-delay 0.2
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
# Desactiva el estilo personalizado del tema del dock para que sea más plano
gsettings set org.gnome.shell.extensions.dash-to-dock apply-custom-theme false
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode 'FIXED'
# Forzar que el fondo sea totalmente plano (sin bordes redondeados internos molestos)
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true

gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-style "BINARY"
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-width 0

# 1. Activar el asistente de mosaico (Tiling Assistant)
gsettings set org.gnome.shell.extensions.tiling-assistant enable-tiling-popup true

# 2. Desactivar el popup que pregunta qué ventana poner al lado (si te resulta molesto)
# gsettings set org.gnome.shell.extensions.tiling-assistant enable-tiling-popup false

# 3. Activar el "Layout Grouping" (mover ventanas juntas si están pegadas)
gsettings set org.gnome.shell.extensions.tiling-assistant enable-raise-tile-group true

# 1. Añadir "Gaps" (espacio entre ventanas)
# Un valor de 8 o 10 da un look muy limpio
gsettings set org.gnome.shell.extensions.tiling-assistant window-gap 8

# 2. Bordes redondeados en las ventanas al hacer mosaico
gsettings set org.gnome.shell.extensions.tiling-assistant active-window-hint 2

gsettings set org.gnome.shell.extensions.tiling-assistant active-window-hint-border-size 2

gsettings set org.gnome.shell.extensions.tiling-assistant active-window-hint-color "rgb(239,149,92)"

gsettings set org.gnome.shell.extensions.tiling-assistant screen-bottom-gap 4
gsettings set org.gnome.shell.extensions.tiling-assistant screen-top-gap 4
gsettings set org.gnome.shell.extensions.tiling-assistant screen-left-gap 4
gsettings set org.gnome.shell.extensions.tiling-assistant screen-right-gap 4

# Cambiar fuentes
gsettings set org.gnome.desktop.interface font-name 'Inter Tight 11'
gsettings set org.gnome.desktop.interface document-font-name 'Inter 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrainsMono Nerd Font 10'

# Añadir el repositorio oficial de Papirus e instalar iconos
sudo add-apt-repository ppa:papirus/papirus -y
sudo apt update
sudo apt install -y papirus-icon-theme papirus-folders

# Cambiar el color de las carpetas a Marrón (Estilo Sunset/Madera)
# Opciones recomendadas: 'brown', 'orange' o 'grey'
sudo papirus-folders -C brown --theme Papirus-Dark

# Aplicar el tema de iconos al sistema
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'

sudo apt update
sudo apt install pipx -y
pipx install gnome-extensions-cli --system-site-packages
pipx ensurepath
source ~/.zshrc
rehash
gext install clipboard-indicator@tudmotu.com Vitals@CoreCoding.com color-picker@tuberry caffeine@patapon.info user-theme@gnome-shell-extensions.gcampax.github.com
