if exists("b:riscv_asm_defined_zihintpause")
    finish
endif

" Instructions
syn keyword riscvIInstruction          pause

let b:riscv_asm_defined_zihintpause = 0
