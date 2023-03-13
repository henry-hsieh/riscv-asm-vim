if exists("b:riscv_asm_defined_zvkn")
    finish
endif

if !exists("b:riscv_asm_zvkb")
    let b:riscv_asm_zvkb = b:riscv_asm_zvkb_max
    runtime! syntax/riscv_asm_zvkb.vim
endif
if !exists("b:riscv_asm_zvkned")
    let b:riscv_asm_zvkned = b:riscv_asm_zvkned_max
    runtime! syntax/riscv_asm_zvkned.vim
endif
if !exists("b:riscv_asm_zvknhb")
    let b:riscv_asm_zvknhb = b:riscv_asm_zvknhb_max
    runtime! syntax/riscv_asm_zvknhb.vim
endif

let b:riscv_asm_defined_zvkn = 0
