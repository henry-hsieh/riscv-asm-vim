if exists("b:riscv_asm_defined_zfhmin")
    finish
endif

" Instructions
" I-type: load
syn keyword riscvZfhminInstruction     flh
" S-type
syn keyword riscvZfhminInstruction     fsh
" I-type: conversion and movement
syn keyword riscvZfhminInstruction     fmv.x.h fmv.h.x fcvt.s.h fcvt.h.s
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_d")
    " I-type: conversion
    syn keyword riscvZfhminInstruction     fcvt.d.h fcvt.h.d
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_q")
    " I-type: conversion
    syn keyword riscvZfhminInstruction     fcvt.q.h fcvt.h.q
endif

if !exists("b:riscv_asm_f")
    let b:riscv_asm_f = b:riscv_asm_f_max
    runtime! syntax/riscv_asm_f.vim
endif

let b:riscv_asm_defined_zfhmin = 0
