if exists("b:riscv_asm_defined_zkr")
    finish
endif

" Control Status Register
" Entropy Source Register
syn keyword riscvUCSRegister           seed

let b:riscv_asm_defined_zkr = 0
