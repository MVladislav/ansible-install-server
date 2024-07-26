#!/bin/bash

if [ -d "$HOME/.local/bin" ]; then
  if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    export PATH="$HOME/.local/bin:$PATH"
  fi
fi
