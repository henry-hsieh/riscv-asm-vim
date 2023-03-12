if exists("b:riscv_asm_defined_zicbom")
    finish
endif

" Instructions
" Cache-Block Management Instructions
syn keyword riscvIInstruction          cbo.clean cbo.flush cbo.inval

let b:riscv_asm_defined_zicbom = 0
