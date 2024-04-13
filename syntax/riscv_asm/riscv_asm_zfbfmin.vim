if exists("b:riscv_asm_defined_zfbfmin")
    finish
endif

" Instructions
" I-type: load
syn keyword riscvFInstruction          flh
" S-type
syn keyword riscvFInstruction          fsh
" I-type: conversion and movement
syn keyword riscvFInstruction          fmv.x.h fmv.h.x fcvt.bf16.s fcvt.s.bf16

if !exists("b:riscv_asm_f")
    let b:riscv_asm_f = b:riscv_asm_f_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_f"
    runtime! syntax/riscv_asm_f.vim
endif

let b:riscv_asm_defined_zfbfmin = 0
