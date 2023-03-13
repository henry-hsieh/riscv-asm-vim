if exists("b:riscv_asm_defined_zvknha")
    finish
endif

" Instructions
" Vector SHA-2 Message Schedule
syn keyword riscvVInstruction          vsha2ms.vv
" Vector SHA-2 Compression
syn keyword riscvVInstruction          vsha2ch.vv vsha2cl.vv

if !exists("b:riscv_asm_zve32x")
    let b:riscv_asm_zve32x = b:riscv_asm_zve32x_max
    runtime! syntax/riscv_asm_zve32x.vim
endif

let b:riscv_asm_defined_zvknha = 0
