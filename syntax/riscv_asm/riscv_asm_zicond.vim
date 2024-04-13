if exists("b:riscv_asm_defined_zicond")
    finish
endif

" Instructions
" Conditional Operation
syn keyword riscvIInstruction          czero.eqz czero.nez

let b:riscv_asm_defined_zicond = 0
