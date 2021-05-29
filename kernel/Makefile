CC = gcc
CFLAGS = -Wall -Wextra -nostdinc -nostdlib -fno-builtin -fno-common
LDFLAGS = -s -x

all: kernel

kernel: kernel.o  segmentation.o hardware.o load_gdt.o font.o sched.o interrupt.o interrupt_handler.o lapic_timer.o syscall.o
	ld $(LDFLAGS) -T kernel.ld -o $@ $+

%.o: %.c
	gcc $(CFLAGS) -c -o $@ $<

%.o:%.s
	gcc $(CFLAGS) -c -o $@ $<

clean:
	rm -f *.o kernel

.PHONY: all clean
