if exists("b:riscv_asm_defined_zbkc")
    finish
endif

" Instructions
" Carry-Less Multiplication
syn keyword riscvBInstruction          clmul clmulh

let b:riscv_asm_defined_zbkc = 0
