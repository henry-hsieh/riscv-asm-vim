if exists("b:riscv_asm_defined_zicbop")
    finish
endif

" Instructions
" Cache-Block Prefetch Instructions
syn keyword riscvIInstruction          prefetch.i prefetch.r prefetch.w

let b:riscv_asm_defined_zicbop = 0
