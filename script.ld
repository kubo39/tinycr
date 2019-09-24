ENTRY(main)

SECTIONS {
    . = 0x400060;

    combined . : AT(0x400060) ALIGN(1) SUBALIGN(1) {
        *(.text*)
    }
}
