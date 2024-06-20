#!/usr/bin/env bash

PATH=/usr/bin/:/usr/local/bin/:/bin:/usr/sbin/:/sbin
set -euo pipefail
IFS=$'\n\t'

NVIM_GROUP=vm
REPLACE_GROUP="{{ install_server_nvim_group }}"

LN_ORIG_BASE=~/.config/nvim

DST_BASE=~/.dotfiles/nvim
DST_GRP="${DST_BASE}/lua/${NVIM_GROUP}"
DST_LAZY="${DST_GRP}/lazy"

rm -rf "$DST_BASE"
mkdir -p "${DST_LAZY}"

echo "copy base files"
for file in ./*.lua.j2; do
  cp "$file" "${DST_BASE}/$(basename "$file" .j2)"
done

echo "copy group base files"
for file in ./lua/*.lua.j2; do
  cp "$file" "${DST_GRP}/$(basename "$file" .j2)"
done

echo "copy lazy confs"
for file in ./lazy/*.lua.j2; do
  cp "$file" "${DST_LAZY}/$(basename "$file" .j2)"
done

# Use find to locate all .lua files in the destination and replace Jinja2 variable
echo "replace jinja2 variables"
find "$DST_BASE" -type f -name "*.lua" -exec sed -i "s/$REPLACE_GROUP/$NVIM_GROUP/g" {} +

echo "Lua files copied, renamed, and Jinja2 variables replaced successfully."

# CREATE LINKS -----------------------------------------------------------------
echo "Create symlink from '$DST_BASE' as '$LN_ORIG_BASE'"
rm -f "${LN_ORIG_BASE}"
ln -sf "${DST_BASE}" "${LN_ORIG_BASE}"
echo "All symlinks created."
