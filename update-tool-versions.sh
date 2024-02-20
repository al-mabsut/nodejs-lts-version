#!/bin/bash

# The new Node.js version to set
NODE_VERSION="$1"

# The .tool-versions file
FILE=".tool-versions"

# Determine OS type for sed in-place flag
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS requires an empty string with the -i flag
  SED_IN_PLACE=(-i '')
else
  # Linux
  SED_IN_PLACE=(-i)
fi

# Check if the .tool-versions file exists and has a nodejs entry
if grep -q "nodejs " "$FILE"; then
  # Node.js entry exists, update it
  sed "${SED_IN_PLACE[@]}" "s/nodejs .*/nodejs $NODE_VERSION/" "$FILE"
else
  # No Node.js entry, append it
  echo "nodejs $NODE_VERSION" >> "$FILE"
fi
