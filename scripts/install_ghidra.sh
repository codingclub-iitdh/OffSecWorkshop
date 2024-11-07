#!/bin/bash


sudo apt update
sudo apt install openjdk-23-jdk 
wget https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_11.2.1_build/ghidra_11.2.1_PUBLIC_20241105.zip
unzip ghidra_11.2.1_PUBLIC_20241105.zip
rm ghidra_11.2.1_PUBLIC_20241105.zip
mv ghidra_11.2.1_PUBLIC /opt/ghidra
./opt/ghidra/ghidraRun
