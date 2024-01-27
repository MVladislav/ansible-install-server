#!/usr/bin/env bash

NVIM_GROUP=vm
REPLACE_GROUP="{{ install_server_nvim_group }}"

DST_BASE=~/.config/nvim
DST_GRP="lua/${NVIM_GROUP}"
DST_LAZY="${DST_GRP}/lazy"

mkdir -p "${DST_BASE}/${DST_LAZY}"

echo "copy base files"
for file in ./*.lua.j2; do
  cp "$file" "${DST_BASE}/$(basename "$file" .j2)"
done

echo "copy group base files"
for file in ./lua/*.lua.j2; do
  cp "$file" "${DST_BASE}/${DST_GRP}/$(basename "$file" .j2)"
done

echo "copy lazy confs"
for file in ./lazy/*.lua.j2; do
  cp "$file" "${DST_BASE}/${DST_LAZY}/$(basename "$file" .j2)"
done

# Use find to locate all .lua files in the destination and replace Jinja2 variable
echo "replace jinja2 variables"
find "$DST_BASE" -type f -name "*.lua" -exec sed -i "s/$REPLACE_GROUP/$NVIM_GROUP/g" {} +

# # Use find to locate all .lua files in the destination and replace Jinja2 variable
# find "$DST_BASE" -type f -name "*.lua" -exec sh -c 'sed -i "s/$0/$1/g" "$2" && echo "Replaced in: $2"' "$REPLACE_GROUP" "$NVIM_GROUP" {} \;

echo "Lua files copied, renamed, and Jinja2 variables replaced successfully."
