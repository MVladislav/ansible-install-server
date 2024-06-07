#!/bin/bash
export GEM_HOME="$HOME/.gems"

if [[ ":$PATH:" != *":$GEM_HOME/bin:"* ]]; then
  export PATH="$PATH:$GEM_HOME/bin"
fi
