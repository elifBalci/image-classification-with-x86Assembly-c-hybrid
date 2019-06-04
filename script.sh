rm -f main
rm -f food.o
nasm -f elf -o food.o food.asm
gcc -m32 -o main main.c food.o
./main
