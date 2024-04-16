if exists("b:riscv_asm_defined_f")
    finish
endif

runtime! syntax/riscv-isas/riscv_asm_zfinx.vim
" Floating-Point Register
syn keyword riscvFPRegister            f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14 f15
syn keyword riscvFPRegister            f16 f17 f18 f19 f20 f21 f22 f23 f24 f25 f26 f27 f28 f29 f30 f31
syn keyword riscvFPRegister            ft0 ft1 ft2 ft3 ft4 ft5 ft6 ft7 ft8 ft9 ft10 ft11
syn keyword riscvFPRegister            fs0 fs1 fs2 fs3 fs4 fs5 fs6 fs7 fs8 fs9 fs10 fs11
syn keyword riscvFPRegister            fa0 fa1 fa2 fa3 fa4 fa5 fa6 fa7

" Instructions
" I-type: load
syn keyword riscvFInstruction          flw
" S-type
syn keyword riscvFInstruction          fsw
" I-type: conversion
syn keyword riscvFInstruction          fmv.x.w
" I-type: classfication, conversion
syn keyword riscvFInstruction          fmv.w.x
" Alias
syn keyword riscvFInstruction          fmv.x.s fmv.s.x

let b:riscv_asm_defined_f = 0
