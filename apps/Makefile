CFLAGS = -Wall -Wextra -nostdinc -nostdlib -fno-builtin -fno-common
LDFLAGS = -s -x

all: app1 app2 app3

app1: app1.o
	ld $(LDFLAGS) -T app1.ld -o $@ $+

app2: app2.o
	ld $(LDFLAGS) -T app2.ld -o $@ $+

app3: app3.o
	ld $(LDFLAGS) -T app3.ld -o $@ $+

%.o: %.c
	gcc $(CFLAGS) -c -o $@ $<

%.o:%.s
	gcc $(CFLAGS) -c -o $@ $<

clean:
	rm -f *.o app1 app2 app3
