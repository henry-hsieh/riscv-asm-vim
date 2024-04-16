if exists("b:riscv_asm_defined_zmmul")
    finish
endif

" Instructions
syn keyword riscvMInstruction          mul mulh mulhsu mulhu
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    syn keyword riscvMInstruction          mulw
endif

let b:riscv_asm_defined_zmmul = 0
