if exists("b:riscv_asm_defined_zacas")
    finish
endif

" Instructions
" Atomic Compare and Swap
syn keyword riscvAInstruction          amocas.w amocas.d

if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    " Atomic Compare and Swap
    syn keyword riscvAInstruction          amocas.q
endif

if !exists("b:riscv_asm_a")
    let b:riscv_asm_a = b:riscv_asm_a_max
    runtime! syntax/riscv_asm_a.vim
endif

let b:riscv_asm_defined_zacas = 0
