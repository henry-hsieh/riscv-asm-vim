if exists("b:riscv_asm_defined_zfinx")
    finish
endif

" Control-Status Register
syn keyword riscvUCSRegister           fflags frm fcsr

" Instructions
" R4-type
syn keyword riscvFInstruction          fmadd.s fmsub.s fnmsub.s fnmadd.s
" R-type: arithmetic
syn keyword riscvFInstruction          fadd.s fsub.s fmul.s fdiv.s
" I-type: square root
syn keyword riscvFInstruction          fsqrt.s
" R-type: sign inject and min/max
syn keyword riscvFInstruction          fsgnj.s fsgnjn.s fsgnjx.s fmin.s fmax.s
" I-type: conversion
syn keyword riscvFInstruction          fcvt.w.s fcvt.wu.s
" R-type: comparison
syn keyword riscvFInstruction          feq.s flt.s fle.s
" I-type: classfication, conversion
syn keyword riscvFInstruction          fclass.s fcvt.s.w fcvt.s.wu
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    " I-type: conversion
    syn keyword riscvFInstruction          fcvt.l.s fcvt.lu.s fcvt.s.l fcvt.s.lu
endif

" Pseudo-instructions
syn keyword riscvFInstruction          fmv.s fabs.s fneg.s
syn keyword riscvFInstruction          frcsr fscsr frrm fsrm fsrmi frflags fsflags fsflagsi

if !exists("b:riscv_asm_zicsr")
    let b:riscv_asm_zicsr = b:riscv_asm_zicsr_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zicsr"
    runtime! syntax/riscv_asm/riscv_asm_zicsr.vim
endif

let b:riscv_asm_defined_zfinx = 0
