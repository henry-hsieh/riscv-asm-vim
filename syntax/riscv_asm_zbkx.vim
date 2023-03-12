if exists("b:riscv_asm_defined_zbkx")
    finish
endif

" Instructions
" Crossbar Permutation Instructions
syn keyword riscvBInstruction          xperm8 xperm4

let b:riscv_asm_defined_zbkx = 0
