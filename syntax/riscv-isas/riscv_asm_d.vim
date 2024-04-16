if exists("b:riscv_asm_defined_d")
    finish
endif

runtime! syntax/riscv-isas/riscv_asm_zdinx.vim
" Instructions
" I-type: load
syn keyword riscvDInstruction          fld
" S-type
syn keyword riscvDInstruction          fsd
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    " I-type: conversion and movement
    syn keyword riscvDInstruction          fmv.x.d fmv.d.x
endif

if !exists("b:riscv_asm_f")
    let b:riscv_asm_f = b:riscv_asm_f_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_f"
    runtime! syntax/riscv-isas/riscv_asm_f.vim
endif

let b:riscv_asm_defined_d = 0
