if exists("b:riscv_asm_defined_zfhmin")
    finish
endif

runtime! syntax/riscv_asm_zhinxmin.vim
" Instructions
" I-type: load
syn keyword riscvFInstruction          flh
" S-type
syn keyword riscvFInstruction          fsh
" I-type: conversion and movement
syn keyword riscvFInstruction          fmv.x.h fmv.h.x
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_q")
    " I-type: conversion
    syn keyword riscvFInstruction          fcvt.q.h fcvt.h.q
endif

if !exists("b:riscv_asm_f")
    let b:riscv_asm_f = b:riscv_asm_f_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_f"
    runtime! syntax/riscv_asm_f.vim
endif

let b:riscv_asm_defined_zfhmin = 0
