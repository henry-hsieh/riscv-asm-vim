if exists("b:riscv_asm_defined_smcsrind")
    finish
endif

" Control Status Register
" Machine-Level Indirect CSR Access Registers
syn keyword riscvMCSRegister           miselect mireg mireg2 mireg3 mireg4 mireg5 mireg6

if !exists("b:riscv_asm_sm")
    let b:riscv_asm_sm = b:riscv_asm_sm_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_sm"
    runtime! syntax/riscv_asm/riscv_asm_sm.vim
endif

let b:riscv_asm_defined_smcsrind = 0
