if exists("b:riscv_asm_defined_smrnmi")
    finish
endif

" Control Status Register
" RNMI Trap Handling
syn keyword riscvMCSRegister           mnepc mncause mnstatus mnscratch

" Instructions
syn keyword riscvSmInstruction         mnret

if !exists("b:riscv_asm_sm")
    let b:riscv_asm_sm = b:riscv_asm_sm_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_sm"
    runtime! syntax/riscv-isas/riscv_asm_sm.vim
endif

let b:riscv_asm_defined_smrnmi = 0
