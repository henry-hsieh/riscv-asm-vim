if exists("b:riscv_asm_defined_m")
    finish
endif

" Instructions
syn keyword riscvMInstruction          mul mulh mulhsu mulhu div divu rem remu
if exists("b:riscv_asm_all_enable") || b:riscv_asm_addr_bit > 32
    syn keyword riscvMInstruction          mulw divw divuw remw remuw
endif

let b:riscv_asm_defined_m = 0
