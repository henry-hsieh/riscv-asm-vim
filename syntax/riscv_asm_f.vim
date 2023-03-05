if exists("b:riscv_asm_defined_f")
    finish
endif

" Floating-Point Register
syn keyword riscvFPRegister            f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14 f15
syn keyword riscvFPRegister            f16 f17 f18 f19 f20 f21 f22 f23 f24 f25 f26 f27 f28 f29 f30 f31
syn keyword riscvFPRegister            ft0 ft1 ft2 ft3 ft4 ft5 ft6 ft7 ft8 ft9 ft10 ft11
syn keyword riscvFPRegister            fs0 fs1 fs2 fs3 fs4 fs5 fs6 fs7 fs8 fs9 fs10 fs11
syn keyword riscvFPRegister            fa0 fa1 fa2 fa3 fa4 fa5 fa6 fa7

" Control-Status Register
syn keyword riscvUCSRegister           fflags frm fcsr

" Instructions
" I-type: load
syn keyword riscvFInstruction          flw
" S-type
syn keyword riscvFInstruction          fsw
" R4-type
syn keyword riscvFInstruction          fmadd.s fmsub.s fnmsub.s fnmadd.s
" R-type: arithmetic
syn keyword riscvFInstruction          fadd.s fsub.s fmul.s fdiv.s
" I-type: square root
syn keyword riscvFInstruction          fsqrt.s
" R-type: sign inject and min/max
syn keyword riscvFInstruction          fsgnj.s fsgnjn.s fsgnjx.s fmin.s fmax.s
" I-type: conversion
syn keyword riscvFInstruction          fcvt.w.s fcvt.wu.s fmv.x.w
" R-type: comparison
syn keyword riscvFInstruction          feq.s flt.s fle.s
" I-type: classfication, conversion
syn keyword riscvFInstruction          fclass.s fcvt.s.w fcvt.s.wu fmv.w.x
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    " I-type: conversion
    syn keyword riscvFInstruction          fcvt.l.s fcvt.lu.s fcvt.s.l fcvt.s.lu
endif

" Pseudo-instructions
syn keyword riscvFInstruction          fmv.s fabs.s fneg.s
syn keyword riscvZicsrInstruction      frcsr fscsr frrm fsrm frflags fsflags

if !exists("b:riscv_asm_zicsr")
    let b:riscv_asm_zicsr = b:riscv_asm_zicsr_max
    runtime! syntax/riscv_asm_zicsr.vim
endif

let b:riscv_asm_defined_f = 0
