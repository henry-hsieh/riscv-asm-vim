if exists("b:riscv_asm_defined_v")
    finish
endif

if !exists("b:riscv_asm_zve64f")
    let b:riscv_asm_zve64f = b:riscv_asm_zve64f_max
    runtime! syntax/riscv_asm_zve64f.vim
endif

let b:riscv_asm_defined_v = 0
