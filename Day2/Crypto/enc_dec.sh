#!/bin/bash

# Fixed password (you can change it to whatever you'd like)
PASSWORD="p@ssw0rd"

# Check if the file argument is passed
if [ -z "$1" ]; then
  echo "Usage: $0 <file> [--decrypt]"
  exit 1
fi

# Check if the second argument is for decryption
if [ "$2" == "--decrypt" ]; then
  # Decrypt the file
  openssl aes-256-cbc -d -in "$1" -out "${1%.enc}" -k "$PASSWORD"
  if [ $? -eq 0 ]; then
    echo "File decrypted successfully: ${1%.enc}"
  else
    echo "Error in decryption"
  fi
else
  # Encrypt the file
  openssl aes-256-cbc -salt -in "$1" -out "${1}.enc" -k "$PASSWORD"
  if [ $? -eq 0 ]; then
    echo "File encrypted successfully: ${1}.enc"
  else
    echo "Error in encryption"
  fi
fi
