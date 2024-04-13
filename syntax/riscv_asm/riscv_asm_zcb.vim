if exists("b:riscv_asm_defined_zcb")
    finish
endif

" Instructions
" Load
syn keyword riscvCInstruction          c.lbu c.lhu c.lh
" Store
syn keyword riscvCInstruction          c.sb c.sh
" Sign/Zero Extend
syn keyword riscvCInstruction          c.zext.b
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zbb")
    syn keyword riscvCInstruction          c.sext.b c.zext.h c.sext.h
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zba") && b:riscv_asm_xlen > 32
    syn keyword riscvCInstruction          c.zext.w
endif
" Bitwise Not
syn keyword riscvCInstruction          c.not
" Multiply
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_m") || exists("b:riscv_asm_zmmul")
    syn keyword riscvCInstruction          c.mul
endif

if !exists("b:riscv_asm_zca")
    let b:riscv_asm_zca = b:riscv_asm_zca_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zca"
    runtime! syntax/riscv_asm_zca.vim
endif

let b:riscv_asm_defined_zcb = 0
