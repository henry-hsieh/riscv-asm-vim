if exists("b:riscv_asm_defined_zvks")
    finish
endif

if !exists("b:riscv_asm_zvbb")
    let b:riscv_asm_zvbb = b:riscv_asm_zvbb_max
    runtime! syntax/riscv_asm_zvbb.vim
endif
if !exists("b:riscv_asm_zvbc")
    let b:riscv_asm_zvbc = b:riscv_asm_zvbc_max
    runtime! syntax/riscv_asm_zvbc.vim
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
