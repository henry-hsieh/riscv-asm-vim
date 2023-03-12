if exists("b:riscv_asm_defined_zicboz")
    finish
endif

" Instructions
" Cache-Block Zero Instructions
syn keyword riscvIInstruction          cbo.zero

let b:riscv_asm_defined_zicboz = 0
