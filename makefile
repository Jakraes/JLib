CC = @gcc -m32 -nostdlib -nodefaultlibs -nostartfiles -I./include -c -o
AC = @nasm -f elf -o

all: clear objs
	@gcc -m32 -nostdlib -nodefaultlibs -nostartfiles -I./include -o bin/main obj/*.o

clear:
	@echo "Cleaning..."
	@rm -rf obj

objs:
	@echo "Building..."
	@mkdir -p obj
	
	$(AC) obj/start.o src/asm/start.asm
	
	$(CC) obj/src_main.o src/main.c

run: all
	@./bin/main