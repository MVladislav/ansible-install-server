#!/bin/bash
export GOPATH="$HOME/.go"

if [[ ":$PATH:" != *":/usr/local/go/bin:"* ]]; then
  export PATH="$PATH:/usr/local/go/bin"
fi

if [[ ":$PATH:" != *":$GOPATH/bin:"* ]]; then
  export PATH="$PATH:$GOPATH/bin"
fi
