if exists("b:riscv_asm_defined_ssnpm")
    finish
endif

if !exists("b:riscv_asm_ss")
    let b:riscv_asm_ss = b:riscv_asm_ss_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_ss"
    runtime! syntax/riscv-isas/riscv_asm_ss.vim
endif

let b:riscv_asm_defined_ssnpm = 0
