all: bootloader kernel apps OVMF.fd OVMF.fd copy

OVMF.fd:
	cp /usr/share/ovmf/OVMF.fd $(CURDIR)

bootloader:
	make all -C bootloader

kernel:
	make all -C kernel

apps:
	make all -C apps

qemu:
	qemu-system-x86_64 -m 4G -bios ./OVMF.fd -hda fat:rw:./fs \
		-netdev user,id=u1,hostfwd=tcp::8080-:80 -device e1000,netdev=u1 \
		-object filter-dump,id=f1,netdev=u1,file=dump.pcap \
		-monitor unix:qemu-monitor-socket,server,nowait

copy: bootloader kernel apps
	mkdir -p fs/EFI/BOOT
	cp bootloader/BOOTX64.EFI fs/EFI/BOOT/
	cp kernel/kernel ./fs/
	cp apps/app1 ./fs/
	cp apps/app2 ./fs/
	cp apps/app3 ./fs/

monitor:
	socat - unix:qemu-monitor-socket

clean:
	make clean -C bootloader
	make clean -C kernel
	make clean -C apps

.PHONY: all bootloader kernel apps copy qemu clean
