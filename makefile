CC = @gcc -m32 -nostdlib -nodefaultlibs -nostartfiles -I./include -c -o
AC = @nasm -f elf -o

all: clear objs
	@mkdir -p bin
	@echo "Linking..."
	@gcc -m32 -nostdlib -nodefaultlibs -nostartfiles -I./include -o bin/main obj/*.o
	@echo "Done!"

clear:
	@echo "Cleaning..."
	@rm -rf obj
	@rm -rf bin

objs:
	@echo "Building..."
	@mkdir -p obj
	
	$(AC) obj/start.o src/asm/start.asm
	$(AC) obj/syscall.o src/asm/syscall.asm

	$(CC) obj/src_syscall.o src/syscall.c
	$(CC) obj/src_io.o src/io.c
	$(CC) obj/src_main.o src/main.c

run: all
	@./bin/main