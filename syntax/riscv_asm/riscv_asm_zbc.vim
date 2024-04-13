if exists("b:riscv_asm_defined_zbc")
    finish
endif

" Instructions
" Carry-Less Multiplication
syn keyword riscvBInstruction          clmul clmulh clmulr

let b:riscv_asm_defined_zbc = 0
