if exists("b:riscv_asm_defined_zvksg")
    finish
endif

if !exists("b:riscv_asm_zvks")
    let b:riscv_asm_zvks = b:riscv_asm_zvks_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zvks"
    runtime! syntax/riscv_asm/riscv_asm_zvks.vim
endif
if !exists("b:riscv_asm_zvkg")
    let b:riscv_asm_zvkg = b:riscv_asm_zvkg_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zvkg"
    runtime! syntax/riscv_asm/riscv_asm_zvkg.vim
endif

let b:riscv_asm_defined_zvksg = 0
