commit:
	./commit.sh

compile:
	nasm -f bin ./boot.asm -o ./boot.bin
	dd if=./message.txt >> ./boot.bin
	qemu-system-x86_64 -hda ./boot.bin

view_hex:
	ghex ./boot.bin