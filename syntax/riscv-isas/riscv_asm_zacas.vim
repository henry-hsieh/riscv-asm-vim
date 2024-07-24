if exists("b:riscv_asm_defined_zacas")
    finish
endif

" Instructions
" Atomic Compare and Swap
syn keyword riscvAInstruction          amocas.w amocas.d

if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    " Atomic Compare and Swap
    syn keyword riscvAInstruction          amocas.q
endif

if !exists("b:riscv_asm_zaamo")
    let b:riscv_asm_zaamo = b:riscv_asm_zaamo_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zaamo"
    runtime! syntax/riscv-isas/riscv_asm_zaamo.vim
endif

let b:riscv_asm_defined_zacas = 0
