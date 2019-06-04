rm food.o
rm main
nasm -f elf -o food.o food.asm
gcc -m32 -o main main.c food.o
./main
