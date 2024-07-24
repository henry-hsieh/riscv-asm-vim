if exists("b:riscv_asm_defined_ssccfg")
    finish
endif

" Control Status Register
" Supervisor-Level Counter Inhibition
syn keyword riscvSCSRegister           scountinhibit

if !exists("b:riscv_asm_zicntr")
    let b:riscv_asm_zicntr = b:riscv_asm_zicntr_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zicntr"
    runtime! syntax/riscv-isas/riscv_asm_zicntr.vim
endif
if !exists("b:riscv_asm_zihpm")
    let b:riscv_asm_zihpm = b:riscv_asm_zihpm_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zihpm"
    runtime! syntax/riscv-isas/riscv_asm_zihpm.vim
endif
if !exists("b:riscv_asm_ss")
    let b:riscv_asm_ss = b:riscv_asm_ss_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_ss"
    runtime! syntax/riscv-isas/riscv_asm_ss.vim
endif
if !exists("b:riscv_asm_sscsrind")
    let b:riscv_asm_sscsrind = b:riscv_asm_sscsrind_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_sscsrind"
    runtime! syntax/riscv-isas/riscv_asm_sscsrind.vim
endif
if !exists("b:riscv_asm_smcdeleg")
    let b:riscv_asm_smcdeleg = b:riscv_asm_smcdeleg_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_smcdeleg"
    runtime! syntax/riscv-isas/riscv_asm_smcdeleg.vim
endif

let b:riscv_asm_defined_ssccfg = 0
