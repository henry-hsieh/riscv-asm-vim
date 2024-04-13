if exists("b:riscv_asm_defined_zba")
    finish
endif

" Instructions
" Address Generation Instructions
syn keyword riscvBInstruction          sh1add sh2add sh3add
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    syn keyword riscvBInstruction          add.uw sh1add.uw sh2add.uw sh3add.uw slli.uw
endif

let b:riscv_asm_defined_zba = 0
