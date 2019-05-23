echo "program will be executed."
nasm -f elf -o food.o food.asm
gcc -m32 -o main main.c food.o
./main
