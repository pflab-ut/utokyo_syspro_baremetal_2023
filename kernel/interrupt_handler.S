.global lapic_intr_handler
lapic_intr_handler:
  push %rax
  push %rbx
  push %rcx
  push %rdx
  push %rdi
  push %rsi
  push %rbp
  mov %rsp, %rdi
  call lapic_intr_handler_internal
  pop %rbp
  pop %rsi
  pop %rdi
  pop %rdx
  pop %rcx
  pop %rbx
  pop %rax
  iretq

.global syscall_handler
syscall_handler:
  // Save Registers
  //
  // Here (9-A)
  //

  // Call syscall_handler_internal
  //
  // Here (9-A)
  //

  // Resume
  //
  // Here (9-A)
  //

  iretq
