if exists("b:riscv_asm_defined_zksh")
    finish
endif

" Instructions
" ShangMi Suite: SM3 Hash Function Instruction
syn keyword riscvKInstruction          sm3p0 sm3p1

let b:riscv_asm_defined_zksh = 0
