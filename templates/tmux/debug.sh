#!/usr/bin/env bash

REPLACE_PATH="{{ install_server_tmux_path }}"
REPLACE_PATH_P="{{ install_server_tmux_path_plugins }}"

DST_BASE=~/.tmux
DST_PLUG="${DST_BASE}/plugins"
DST_SCRIPTS=~/.local/bin
rm -rf "$DST_BASE"
mkdir -p "$DST_PLUG"

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
/bin/cat <<'EOF' >"${HOME}/.tmux.conf"
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
EOF

# Use find to locate all .lua files in the destination and replace Jinja2 variable
echo "replace jinja2 variables"
find "$DST_BASE" -type f -name "*.conf" -exec sed -i "s|$REPLACE_PATH|$DST_BASE|g" {} +
find "$DST_BASE" -type f -name "*.conf" -exec sed -i "s|$REPLACE_PATH_P|$DST_PLUG|g" {} +
sed -i "s|${REPLACE_PATH}|${DST_BASE}|g" "${HOME}/.tmux.conf"
sed -i "s|${REPLACE_PATH_P}|${DST_PLUG}|g" "${HOME}/.tmux.conf"

echo "Conf files copied, renamed, and Jinja2 variables replaced successfully."
