#!/usr/bin/env bash

REPLACE_PATH="{{ install_server_tmux_path }}"
REPLACE_PATH_P="{{ install_server_tmux_path_plugins }}"

DOTFILE_PATH=~/.dotfiles

LN_ORIG_TMUX=~/.tmux.conf
LN_ORIG_BASE=~/.tmux
LN_ORIG_PLUG="${LN_ORIG_BASE}/plugins"
LN_ORIG_SCRIPT=~/.local/bin
DST_TMUX="$DOTFILE_PATH/tmux.conf"
DST_BASE="$DOTFILE_PATH/tmux"
DST_PLUG="${DST_BASE}/plugins"
DST_SCRIPTS="$DOTFILE_PATH/bin"

# DST_BASE=~/.tmux
# DST_PLUG="${DST_BASE}/plugins"
# DST_SCRIPTS=~/.local/bin
rm -rf "$DST_BASE"
mkdir -p "$DST_PLUG"
mkdir -p "$DST_SCRIPTS"

echo "install dep"
sudo apt install fzf

echo "install tpm"
git clone https://github.com/tmux-plugins/tpm "${DST_PLUG}/tpm"

echo "copy base files"
for file in ./*.conf.j2; do
  cp "$file" "${DST_BASE}/$(basename "$file" .j2)"
done

echo "copy script files"
for script in ./scripts/*.j2; do
  cp "$script" "${DST_SCRIPTS}/$(basename "$script" .j2)"
  chmod 760 "${DST_SCRIPTS}/$(basename "$script" .j2)"
done

echo "copy .tmux.conf"
/bin/cat <<'EOF' >"$DST_TMUX"
source-file {{ install_server_tmux_path }}/setup.conf
source-file {{ install_server_tmux_path }}/remap.conf

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
# set -g @plugin 'tmux-plugins/tmux-resurrect'
# set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'catppuccin/tmux'
set -g @plugin 'tmux-plugins/tmux-battery'
set -g @plugin 'tmux-plugins/tmux-cpu'

source-file {{ install_server_tmux_path }}/style.conf

run '{{ install_server_tmux_path_plugins }}/tpm/tpm'

set -g status-bg default
set -g status-style bg=default
set -g pane-active-border-style 'fg=default,bg=default'
set -g pane-border-style 'fg=default,bg=default'
EOF

# Use find to locate all .lua files in the destination and replace Jinja2 variable
echo "replace jinja2 variables"
find "$DST_BASE" -type f -name "*.conf" -exec sed -i "s|$REPLACE_PATH|$LN_ORIG_BASE|g" {} +
find "$DST_BASE" -type f -name "*.conf" -exec sed -i "s|$REPLACE_PATH_P|$LN_ORIG_PLUG|g" {} +
sed -i "s|${REPLACE_PATH}|${LN_ORIG_BASE}|g" "$DST_TMUX"
sed -i "s|${REPLACE_PATH_P}|${LN_ORIG_PLUG}|g" "$DST_TMUX"

echo "Conf files copied, renamed, and Jinja2 variables replaced successfully."

# CREATE LINKS -----------------------------------------------------------------
echo "create symlink from '$DST_BASE' as '$LN_ORIG_BASE'"
rm -f "${LN_ORIG_BASE}"
ln -sf "${DST_BASE}" "${LN_ORIG_BASE}"
echo "create symlink from '$DST_TMUX' as '$LN_ORIG_TMUX'"
rm -f "${LN_ORIG_TMUX}"
ln -sf "${DST_TMUX}" "${LN_ORIG_TMUX}"

echo "create symlink from '$DST_SCRIPTS/*' into '$LN_ORIG_SCRIPT/'"
for script in "$DST_SCRIPTS"/*; do
  ln -sf "$script" "${LN_ORIG_SCRIPT}/$(basename "$script")"
done

# ADD FONTS --------------------------------------------------------------------
FONTS_URLS=(
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/NerdFontsSymbolsOnly.tar.xz"
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.tar.xz"
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.tar.xz"
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/UbuntuMono.tar.xz"
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraMono.tar.xz"
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/RobotoMono.tar.xz"
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/ProggyClean.tar.xz"
)
FONTS_DIR=~/.local/share/fonts/nerd-fonts
mkdir -p "$FONTS_DIR"

for url in "${FONTS_URLS[@]}"; do
  file_name=$(basename "$url")
  echo "Downloading $file_name..."
  curl -sL -o "/tmp/$file_name" "$url"
  echo "Extracting $file_name..."
  tar -xf "/tmp/$file_name" -C "$FONTS_DIR"
  rm "/tmp/$file_name"
done
