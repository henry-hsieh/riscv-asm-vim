if exists("b:riscv_asm_defined_v")
    finish
endif

if !exists("b:riscv_asm_zve64d")
    let b:riscv_asm_zve64d = b:riscv_asm_zve64d_max
    runtime! syntax/riscv_asm_zve64d.vim
endif

let b:riscv_asm_defined_v = 0
