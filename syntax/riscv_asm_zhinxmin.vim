if exists("b:riscv_asm_defined_zhinxmin")
    finish
endif

" Instructions
" I-type: conversion and movement
syn keyword riscvFInstruction          fcvt.s.h fcvt.h.s
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zdinx") || exists("b:riscv_asm_d")
    " I-type: conversion
    syn keyword riscvFInstruction          fcvt.d.h fcvt.h.d
endif

if !exists("b:riscv_asm_zfinx")
    let b:riscv_asm_zfinx = b:riscv_asm_zfinx_max
    runtime! syntax/riscv_asm_zfinx.vim
endif

let b:riscv_asm_defined_zhinxmin = 0
