#!/bin/bash

# Check if the file argument is passed
if [ -z "$1" ]; then
  echo "Usage: $0 <file>"
  exit 1
fi

# File name provided by the user
INPUT_FILE="$1"

# Extract the base name of the file (without extension)
BASE_NAME="${INPUT_FILE%.*}"

# Create the hash output file name
HASH_FILE="${BASE_NAME}_hash.txt"

# Generate the SHA-256 hash and save it to a file
sha256sum "$INPUT_FILE" | awk '{ print $1 }' > "$HASH_FILE"

if [ $? -eq 0 ]; then
  echo "SHA-256 hash saved to $HASH_FILE"
else
  echo "Error in generating SHA-256 hash"
fi
