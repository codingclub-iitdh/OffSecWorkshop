#!/bin/bash

# Check if the file argument is passed
if [ -z "$1" ]; then
  echo "Usage: $0 <file>"
  exit 1
fi

# File name provided by the user
INPUT_FILE="$1"

# Create the hash output file name
HASH_FILE="${INPUT_FILE%.*}_hash.txt"

# Generate the MD5 hash and save it to a file, excluding the filename
md5sum "$INPUT_FILE" | awk '{ print $1 }' > "$HASH_FILE"

if [ $? -eq 0 ]; then
  echo "MD5 hash saved to $HASH_FILE"
else
  echo "Error in generating MD5 hash"
fi
