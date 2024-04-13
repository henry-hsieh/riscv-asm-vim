if exists("b:riscv_asm_defined_zvknhb")
    finish
endif

" Instructions
" Vector SHA-2 Message Schedule
syn keyword riscvVInstruction          vsha2ms.vv
" Vector SHA-2 Compression
syn keyword riscvVInstruction          vsha2ch.vv vsha2cl.vv

if !exists("b:riscv_asm_zve64x")
    let b:riscv_asm_zve64x = b:riscv_asm_zve64x_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zve64x"
    runtime! syntax/riscv_asm_zve64x.vim
endif

let b:riscv_asm_defined_zvknhb = 0
