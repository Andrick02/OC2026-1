
build: 
	nasm -f elf p5.asm
	nasm -f elf p5_b.asm
	nasm -f elf p5_c.asm
	nasm -f elf p5_d.asm
	nasm -f elf p5_e.asm
	nasm -f elf p5_f.asm

	ld -m elf_i386 p5.o -o ../../bin/p5.exe ../../lib/libpc_io.a
	ld -m elf_i386 p5_b.o -o ../../bin/p5_b.exe ../../lib/libpc_io.a
	ld -m elf_i386 p5_c.o -o ../../bin/p5_c.exe ../../lib/libpc_io.a
	ld -m elf_i386 p5_d.o -o ../../bin/p5_d.exe ../../lib/libpc_io.a
	ld -m elf_i386 p5_e.o -o ../../bin/p5_e.exe ../../lib/libpc_io.a
	ld -m elf_i386 p5_f.o -o ../../bin/p5_f.exe ../../lib/libpc_io.a

run:
	./../../bin/p5.exe
	./../../bin/p5_b.exe
	./../../bin/p5_c.exe
	./../../bin/p5_d.exe
	./../../bin/p5_e.exe
	./../../bin/p5_f.exe