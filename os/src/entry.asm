    .section .text.entry
    .globl _start /*.global关键字用来让一个符号对链接器可见*/
_start:
    la sp, boot_stack_top
    call rust_main

    .section .bss.stack
    .globl boot_stack
boot_stack: /*栈底*/
    .space 4096 * 16 /*预留的栈空间*/
    .globl boot_stack_top
boot_stack_top:/*栈顶*/