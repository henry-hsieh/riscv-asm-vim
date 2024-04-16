if exists("b:riscv_asm_defined_sscsrind")
    finish
endif

" Control Status Register
" Supervisor-Level Indirect CSR Access Registers
syn keyword riscvSCSRegister           siselect sireg sireg2 sireg3 sireg4 sireg5 sireg6

if !exists("b:riscv_asm_ss")
    let b:riscv_asm_ss = b:riscv_asm_ss_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_ss"
    runtime! syntax/riscv-isas/riscv_asm_ss.vim
endif

let b:riscv_asm_defined_sscsrind = 0
