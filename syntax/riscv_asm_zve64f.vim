if exists("b:riscv_asm_defined_zve64f")
    finish
endif

if !exists("b:riscv_asm_zve32f")
    let b:riscv_asm_zve32f = b:riscv_asm_zve32f_max
    runtime! syntax/riscv_asm_zve32f.vim
endif

let b:riscv_asm_defined_zve64f = 0
