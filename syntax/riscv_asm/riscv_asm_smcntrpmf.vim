if exists("b:riscv_asm_defined_smcntrpmf")
    finish
endif

" Control Status Register
" Machine-Level Counter Configuration Registers
syn keyword riscvMCSRegister           mcyclecfg minstretcfg
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
    syn keyword riscvMCSRegister           mcyclecfgh minstretcfgh
endif

if !exists("b:riscv_asm_sm")
    let b:riscv_asm_sm = b:riscv_asm_sm_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_sm"
    runtime! syntax/riscv_asm/riscv_asm_sm.vim
endif

let b:riscv_asm_defined_smcntrpmf = 0
