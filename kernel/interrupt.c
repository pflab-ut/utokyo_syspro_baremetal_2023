#include "interrupt.h"
#include "lapic_timer.h"

struct InterruptDescriptor {
  unsigned short offset_lo;
  unsigned short segment;
  unsigned short attribute;
  unsigned short offset_mid;
  unsigned int offset_hi;
  unsigned int reserved;
} __attribute__((packed));

struct InterruptDescriptor IDT[256];

void lapic_intr_handler();

static void load_idt_to_idtr() {
  // Set idtr
  //
  // Here (8-B)
  //
}

void init_intr() {
  // Get segment register value
  unsigned short cs;
  asm volatile ("mov %%cs, %0" : "=r"(cs));

  void* handler;
  asm volatile ("lea lapic_intr_handler(%%rip), %0" : "=r"(handler));

  // Register Local APIC handler
  //
  // Here (8-B)
  //

  // Tell CPU the location of IDT
  load_idt_to_idtr();

  // Set IF bit in RFLAGS register
  asm volatile ("sti");
}
