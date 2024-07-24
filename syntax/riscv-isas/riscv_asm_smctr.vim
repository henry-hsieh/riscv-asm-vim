if exists("b:riscv_asm_defined_smctr")
    finish
endif

" Control Status Register
" Machine Control Transfer Records Registers
syn keyword riscvMCSRegister           mctrctl

if !exists("b:riscv_asm_ssctr")
    let b:riscv_asm_ssctr = b:riscv_asm_ssctr_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_ssctr"
    runtime! syntax/riscv-isas/riscv_asm_ssctr.vim
endif

let b:riscv_asm_defined_smctr = 0
