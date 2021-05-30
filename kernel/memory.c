#include "memory.h"
#include "sched.h"

struct Entry {
  unsigned int present : 1;
  unsigned int writable : 1;
  unsigned int user_accessible : 1;
  unsigned int write_through_caching : 1;
  unsigned int disable_cache : 1;
  unsigned int accessed : 1;
  unsigned int dirty : 1;
  unsigned int huge_page : 1;
  unsigned int global : 1;
  unsigned int available1 : 3;
  unsigned long long physical_address : 40;
  unsigned int available2 : 11;
  unsigned int no_execute : 1;
} __attribute__((packed));

unsigned long long kernel_cr3;

void init_virtual_memory() {
  // Save kernel cr3 register value
  asm volatile ("mov %%cr3, %0" : "=r"(kernel_cr3));

  // Page mapping
  //
  // Here 10
  //

}
