if exists("b:riscv_asm_defined_smepmp")
    finish
endif

if !exists("b:riscv_asm_sm")
    let b:riscv_asm_sm = b:riscv_asm_sm_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_sm"
    runtime! syntax/riscv_asm_sm.vim
endif

let b:riscv_asm_defined_smepmp = 0
