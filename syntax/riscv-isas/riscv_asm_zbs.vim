if exists("b:riscv_asm_defined_zbs")
    finish
endif

" Instructions
" Single-Bit Instructions
syn keyword riscvBInstruction          bclr bclri bext bexti binv binvi bset bseti

let b:riscv_asm_defined_zbs = 0
