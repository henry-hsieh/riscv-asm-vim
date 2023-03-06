if exists("b:riscv_asm_defined_m")
    finish
endif

runtime! syntax/riscv_asm_zmmul.vim
" Instructions
syn keyword riscvMInstruction          div divu rem remu
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    syn keyword riscvMInstruction          divw divuw remw remuw
endif

let b:riscv_asm_defined_m = 0
