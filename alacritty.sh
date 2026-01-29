#!/bin/bash

sudo apt install cmake g++ pkg-config libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

ALACRITTY_DIR="/tmp/alacritty"
git clone https://github.com/alacritty/alacritty.git "$ALACRITTY_DIR"

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

source "$HOME/.bashrc"
hash -r

cargo build --release --manifest-path="$ALACRITTY_DIR/Cargo.toml"
sudo tic -xe alacritty,alacritty-direct "$ALACRITTY_DIR/extra/alacritty.info"
infocmp alacritty

sudo cp "$ALACRITTY_DIR/target/release/alacritty" /usr/local/bin # or anywhere else in $PATH
sudo cp "$ALACRITTY_DIR/extra/logo/alacritty-term.svg" /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install "$ALACRITTY_DIR/extra/linux/Alacritty.desktop"
sudo update-desktop-database

mkdir -p "$HOME/.config/alacritty"
cp ./themes/alacritty.toml "$HOME/.config/alacritty/"

gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['']"
KEY_PATH="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$KEY_PATH name "Launch Alacritty"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$KEY_PATH command "alacritty"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$KEY_PATH binding "<Control><Alt>t"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['$KEY_PATH']"
