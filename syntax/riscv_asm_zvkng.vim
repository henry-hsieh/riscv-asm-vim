if exists("b:riscv_asm_defined_zvkng")
    finish
endif

if !exists("b:riscv_asm_zvkn")
    let b:riscv_asm_zvkn = b:riscv_asm_zvkn_max
    runtime! syntax/riscv_asm_zvkn.vim
endif
if !exists("b:riscv_asm_zvkg")
    let b:riscv_asm_zvkg = b:riscv_asm_zvkg_max
    runtime! syntax/riscv_asm_zvkg.vim
endif

let b:riscv_asm_defined_zvkng = 0
