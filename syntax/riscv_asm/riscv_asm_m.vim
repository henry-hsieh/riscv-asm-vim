if exists("b:riscv_asm_defined_m")
    finish
endif

" Instructions
syn keyword riscvMInstruction          div divu rem remu
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    syn keyword riscvMInstruction          divw divuw remw remuw
endif

if !exists("b:riscv_asm_zmmul")
    let b:riscv_asm_zmmul = b:riscv_asm_zmmul_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zmmul"
    runtime! syntax/riscv_asm/riscv_asm_zmmul.vim
endif

let b:riscv_asm_defined_m = 0
