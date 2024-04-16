if exists("b:riscv_asm_defined_zvkned")
    finish
endif

" Instructions
" Vector AES Encrypt Final Round
syn keyword riscvVInstruction          vaesef.vv vaesef.vs
" Vector AES Encrypt Middle Round
syn keyword riscvVInstruction          vaesem.vv vaesem.vs
" Vector AES Decrypt Final Round
syn keyword riscvVInstruction          vaesdf.vv vaesdf.vs
" Vector AES Decrypt Middle Round
syn keyword riscvVInstruction          vaesdm.vv vaesdm.vs
" Vector AES-128 Forward KeySchedule
syn keyword riscvVInstruction          vaeskf1.vi
" Vector AES-256 Forward KeySchedule
syn keyword riscvVInstruction          vaeskf2.vi
" Vector AES Round Zero
syn keyword riscvVInstruction          vaesz.vs

if !exists("b:riscv_asm_zve32x")
    let b:riscv_asm_zve32x = b:riscv_asm_zve32x_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zve32x"
    runtime! syntax/riscv-isas/riscv_asm_zve32x.vim
endif

let b:riscv_asm_defined_zvkned = 0
