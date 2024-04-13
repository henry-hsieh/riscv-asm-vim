if exists("b:riscv_asm_defined_zihintntl")
    finish
endif

" Instructions
syn keyword riscvIInstruction          ntl.p1 ntl.pall ntl.s1 ntl.all

let b:riscv_asm_defined_zihintntl = 0
