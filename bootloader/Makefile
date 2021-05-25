CC = x86_64-w64-mingw32-gcc
CFLAGS = -Wall -Wextra
CFLAGS += -nostdinc -nostdlib -fno-builtin -fno-common
# https://forum.osdev.org/viewtopic.php?f=1&t=28307
CFLAGS += -fno-stack-check -fno-stack-protector -mno-stack-arg-probe
CFLAGS += -Wl,--subsystem,10

all: BOOTX64.EFI

BOOTX64.EFI: bootloader.o efi.o file.o hardware_info.o memory.o util.o
	$(CC) $(CFLAGS) -e efi_main -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -I./include -c -o $@ $<

clean:
	rm *.o BOOTX64.EFI

.PHONY: clean
