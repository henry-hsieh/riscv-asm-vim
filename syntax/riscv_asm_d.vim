if exists("b:riscv_asm_defined_d")
    finish
endif

" Instructions
" I-type: load
syn keyword riscvDInstruction          fld
" S-type
syn keyword riscvDInstruction          fsd
" R4-type
syn keyword riscvDInstruction          fmadd.d fmsub.d fnmsub.d fnmadd.d
" R-type: arithmetic
syn keyword riscvDInstruction          fadd.d fsub.d fmul.d fdiv.d
" I-type: square root
syn keyword riscvDInstruction          fsqrt.d
" R-type: sign inject and min/max
syn keyword riscvDInstruction          fsgnj.d fsgnjn.d fsgnjx.d fmin.d fmax.d
" I-type: conversion
syn keyword riscvDInstruction          fcvt.s.d fcvt.d.s
" R-type: comparison
syn keyword riscvDInstruction          feq.d flt.d fle.d
" I-type: classfication and conversion
syn keyword riscvDInstruction          fclass.d fcvt.w.d fcvt.wu.d fcvt.d.w fcvt.d.wu
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    " I-type: conversion and movement
    syn keyword riscvDInstruction          fcvt.l.d fcvt.lu.d fmv.x.d fcvt.d.l fcvt.d.lu fmv.d.x
endif

" Pseudo-instructions
syn keyword riscvDInstruction          fmv.d fabs.d fneg.d

if !exists("b:riscv_asm_f")
    let b:riscv_asm_f = b:riscv_asm_f_max
    runtime! syntax/riscv_asm_f.vim
endif

let b:riscv_asm_defined_d = 0
