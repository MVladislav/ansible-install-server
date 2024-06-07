#!/bin/bash
NPM_PACKAGES="${HOME}/.npm-packages"

if [[ ":$PATH:" != *":$NPM_PACKAGES/share/man:"* ]]; then
  export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"
fi

if [[ ":$PATH:" != *":/snap/node/current/bin:"* ]]; then
  export PATH="/snap/node/current/bin:$PATH"
fi

if [[ ":$PATH:" != *":$NPM_PACKAGES/bin:"* ]]; then
  export PATH="$PATH:$NPM_PACKAGES/bin"
fi
