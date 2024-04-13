if exists("b:riscv_asm_defined_ssstateen")
    finish
endif

" Control Status Register
" Supervisor State Enable
syn keyword riscvSCSRegister           sstateen0 sstateen1 sstateen2 sstateen3
" Hypervisor State Enable
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_h")
    syn keyword riscvHCSRegister           hstateen0 hstateen1 hstateen2 hstateen3
    if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
        syn keyword riscvHCSRegister           hstateen0h hstateen1h hstateen2h hstateen3h
    endif
endif

if !exists("b:riscv_asm_ss")
    let b:riscv_asm_ss = b:riscv_asm_ss_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_ss"
    runtime! syntax/riscv_asm/riscv_asm_ss.vim
endif

let b:riscv_asm_defined_ssstateen = 0
