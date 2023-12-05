if exists("b:riscv_asm_defined_zvksc")
    finish
endif

if !exists("b:riscv_asm_zvks")
    let b:riscv_asm_zvks = b:riscv_asm_zvks_max
    runtime! syntax/riscv_asm_zvks.vim
endif
if !exists("b:riscv_asm_zvbc")
    let b:riscv_asm_zvbc = b:riscv_asm_zvbc_max
    runtime! syntax/riscv_asm_zvbc.vim
endif

let b:riscv_asm_defined_zvksc = 0
