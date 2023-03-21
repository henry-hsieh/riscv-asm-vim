if exists("b:riscv_asm_defined_sdext")
    finish
endif

" Control Status Register
" Debug Control and Status
syn keyword riscvDCSRegister           dcsr
" Debug PC
syn keyword riscvDCSRegister           dpc
" Debug Scratch Registers
syn keyword riscvDCSRegister           dscratch0 dscratch1

if !exists("b:riscv_asm_sm")
    let b:riscv_asm_sm = b:riscv_asm_sm_max
    runtime! syntax/riscv_asm_sm.vim
endif

let b:riscv_asm_defined_sdext = 0
