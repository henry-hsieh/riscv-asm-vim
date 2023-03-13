if exists("b:riscv_asm_defined_zvksh")
    finish
endif

" Instructions
" Vector SM3 Message Expansion
syn keyword riscvVInstruction          vsm3me.vv
" Vector SM3 Compression
syn keyword riscvVInstruction          vsm3c.vi

if !exists("b:riscv_asm_zve32x")
    let b:riscv_asm_zve32x = b:riscv_asm_zve32x_max
    runtime! syntax/riscv_asm_zve32x.vim
endif

let b:riscv_asm_defined_zvksh = 0
