if exists("b:riscv_asm_defined_zvknc")
    finish
endif

if !exists("b:riscv_asm_zvkn")
    let b:riscv_asm_zvkn = b:riscv_asm_zvkn_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zvkn"
    runtime! syntax/riscv-isas/riscv_asm_zvkn.vim
endif
if !exists("b:riscv_asm_zvbc")
    let b:riscv_asm_zvbc = b:riscv_asm_zvbc_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zvbc"
    runtime! syntax/riscv-isas/riscv_asm_zvbc.vim
endif

let b:riscv_asm_defined_zvknc = 0
