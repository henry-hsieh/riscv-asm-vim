if exists("b:riscv_asm_defined_zvks")
    finish
endif

if !exists("b:riscv_asm_zvkb")
    let b:riscv_asm_zvkb = b:riscv_asm_zvkb_max
    runtime! syntax/riscv_asm_zvkb.vim
endif
if !exists("b:riscv_asm_zvksed")
    let b:riscv_asm_zvksed = b:riscv_asm_zvksed_max
    runtime! syntax/riscv_asm_zvksed.vim
endif
if !exists("b:riscv_asm_zvksh")
    let b:riscv_asm_zvksh = b:riscv_asm_zvksh_max
    runtime! syntax/riscv_asm_zvksh.vim
endif

let b:riscv_asm_defined_zvks = 0
