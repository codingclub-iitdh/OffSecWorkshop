# Compile instructions

gcc --static -fno-stack-protector bover.c -o static-bover.out

# Disassembly instructions

objdump -d static-bover.out > bover.asm

# Run instructions

chmod +x exploit_bover.sh
./exploit_bover.sh
