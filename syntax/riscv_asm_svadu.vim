if exists("b:riscv_asm_defined_svadu")
    finish
endif

if !exists("b:riscv_asm_ss")
    let b:riscv_asm_ss = b:riscv_asm_ss_max
    runtime! syntax/riscv_asm_ss.vim
endif

let b:riscv_asm_defined_svadu = 0
