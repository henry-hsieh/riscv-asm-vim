if exists("b:riscv_asm_defined_zhinx")
    finish
endif

runtime! syntax/riscv-isas/riscv_asm_zhinxmin.vim
" Instructions
" R4-type
syn keyword riscvFInstruction          fmadd.h fmsub.h fnmsub.h fnmadd.h
" R-type: arithmetic
syn keyword riscvFInstruction          fadd.h fsub.h fmul.h fdiv.h
" I-type: square root
syn keyword riscvFInstruction          fsqrt.h
" R-type: sign inject and min/max
syn keyword riscvFInstruction          fsgnj.h fsgnjn.h fsgnjx.h fmin.h fmax.h
" I-type: conversion
syn keyword riscvFInstruction          fcvt.w.h fcvt.wu.h
" R-type: comparison
syn keyword riscvFInstruction          feq.h flt.h fle.h
" I-type: classfication, conversion
syn keyword riscvFInstruction          fclass.h fcvt.h.w fcvt.h.wu
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    " I-type: conversion
    syn keyword riscvFInstruction          fcvt.l.h fcvt.lu.h fcvt.h.l fcvt.h.lu
endif

let b:riscv_asm_defined_zhinx = 0
