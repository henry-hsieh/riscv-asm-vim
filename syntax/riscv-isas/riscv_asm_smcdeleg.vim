if exists("b:riscv_asm_defined_smcdeleg")
    finish
endif

if !exists("b:riscv_asm_sm")
    let b:riscv_asm_sm = b:riscv_asm_sm_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_sm"
    runtime! syntax/riscv-isas/riscv_asm_sm.vim
endif
if !exists("b:riscv_asm_ssccfg")
    let b:riscv_asm_ssccfg = b:riscv_asm_ssccfg_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_ssccfg"
    runtime! syntax/riscv-isas/riscv_asm_ssccfg.vim
endif

let b:riscv_asm_defined_smcdeleg = 0
