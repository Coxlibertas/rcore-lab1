OUTPUT_ARCH(riscv)  /*输出架构为riscv*/
ENTRY(_start) /*入口程序地址*/
BASE_ADDRESS = 0x80200000;

SECTIONS
{
    /*‘.’ 是一个特殊的符号，它是定位器，一个位置指针，指向程序地址空间内的某位置*/
    . = BASE_ADDRESS; /*定位器指向0x80200000*/
    skernel = .; /*skernel指向0x80200000*/

    stext = .; /*stext指向0x80200000*/

    .text : {
        *(.text.entry) /*匹配以.text.entry为后缀的段*/
        *(.text .text.*) /*匹配文件名中含有.text.text的段*/
    }
定位器定位到下一个4字节对齐的地址点
    . = ALIGN(4K); /*定位器定位到下一个4k字节对齐的地址点*/
    etext = .;
    srodata = .;
    .rodata : {
        *(.rodata .rodata.*)
        *(.srodata .srodata.*)
    }

    . = ALIGN(4K);
    erodata = .;
    sdata = .;
    .data : {
        *(.data .data.*)
        *(.sdata .sdata.*)
    }

    . = ALIGN(4K);
    edata = .;
    .bss : {
        *(.bss.stack)
        sbss = .;
        *(.bss .bss.*)
        *(.sbss .sbss.*)
    }

    . = ALIGN(4K);
    ebss = .;
    ekernel = .;

    /DISCARD/ : { /* /DISCARD/段中的文件会被抛弃，不会链接到目标文件 */
        *(.eh_frame) /*.eh_frame段用于处理异常，它产生描述如何展开堆栈的表 */
    }
}