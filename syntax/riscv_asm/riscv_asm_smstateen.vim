if exists("b:riscv_asm_defined_smstateen")
    finish
endif

" Control Status Register
" Machine State Enable
syn keyword riscvMCSRegister           mstateen0 mstateen1 mstateen2 mstateen3
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
    syn keyword riscvMCSRegister           mstateen0h mstateen1h mstateen2h mstateen3h
endif

if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_ss") && !exists("b:riscv_asm_ssstateen")
    let b:riscv_asm_ssstateen = b:riscv_asm_ssstateen_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_ssstateen"
    runtime! syntax/riscv_asm_ssstateen.vim
endif
if !exists("b:riscv_asm_sm")
    let b:riscv_asm_sm = b:riscv_asm_sm_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_sm"
    runtime! syntax/riscv_asm_sm.vim
endif

let b:riscv_asm_defined_smstateen = 0
