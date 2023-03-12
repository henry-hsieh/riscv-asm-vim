if exists("b:riscv_asm_defined_sscofpmf")
    finish
endif

" Control Status Register
" Supervisor Count Overflow
syn keyword riscvSCSRegister           scountovf

if !exists("b:riscv_asm_ss")
    let b:riscv_asm_ss = b:riscv_asm_ss_max
    runtime! syntax/riscv_asm_ss.vim
endif

let b:riscv_asm_defined_sscofpmf = 0
