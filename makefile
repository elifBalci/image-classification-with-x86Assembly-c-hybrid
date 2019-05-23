CC=g++
ASMBIN=nasm

all : asm cc link
asm : 
	$(ASMBIN) -o food.o -f elf -g -l food.lst food.asm
cc :
	$(CC) -m32 -c -g -O0 main.cpp &> errors.txt
link :
	$(CC) -m32 -g -o test main.o food.o
clean :
	rm *.o
	rm test
	rm errors.txt	
	rm func.lst
