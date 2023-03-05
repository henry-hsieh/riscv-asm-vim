if exists("b:riscv_asm_defined_q")
    finish
endif

" Instructions
" I-type: load
syn keyword riscvQInstruction          flq
" S-type
syn keyword riscvQInstruction          fsq
" R4-type
syn keyword riscvQInstruction          fmadd.q fmsub.q fnmsub.q fnmadd.q
" R-type: arithmetic
syn keyword riscvQInstruction          fadd.q fsub.q fmul.q fdiv.q
" I-type: square root
syn keyword riscvQInstruction          fsqrt.q
" R-type: sign inject and min/max
syn keyword riscvQInstruction          fsgnj.q fsgnjn.q fsgnjx.q fmin.q fmax.q
" I-type: conversion
syn keyword riscvQInstruction          fcvt.s.q fcvt.q.s fcvt.d.q fcvt.q.d
" R-type: comparison
syn keyword riscvQInstruction          feq.q flt.q fle.q
" I-type: classfication and conversion
syn keyword riscvQInstruction          fclass.q fcvt.w.q fcvt.wu.q fcvt.q.w fcvt.q.wu
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    " I-type: conversion
    syn keyword riscvQInstruction          fcvt.l.q fcvt.lu.q fcvt.q.l fcvt.q.lu
endif
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 64
    " I-type: conversion
    syn keyword riscvQInstruction          fmv.x.q fmv.q.x
endif

if !exists("b:riscv_asm_d")
    let b:riscv_asm_d = b:riscv_asm_d_max
    runtime! syntax/riscv_asm_d.vim
endif

let b:riscv_asm_defined_q = 0
