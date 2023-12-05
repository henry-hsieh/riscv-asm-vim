if exists("b:riscv_asm_defined_zcmop")
    finish
endif

" Instructions
" May Be Operations
syn keyword riscvCInstruction          c.mop.1 c.mop.3 c.mop.5 c.mop.7 c.mop.9 c.mop.11 c.mop.13 c.mop.15

if !exists("b:riscv_asm_zca")
    let b:riscv_asm_zca = b:riscv_asm_zca_max
    runtime! syntax/riscv_asm_zca.vim
endif

let b:riscv_asm_defined_zcmop = 0
