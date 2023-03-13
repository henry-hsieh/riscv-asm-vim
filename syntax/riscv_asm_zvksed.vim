if exists("b:riscv_asm_defined_zvksed")
    finish
endif

" Instructions
" Vector SM4 Key Expansion
syn keyword riscvVInstruction          vsm4k.vi
" Vector SM4 Block Cipher Rounds
syn keyword riscvVInstruction          vsm4r.vv vsm4r.vs

if !exists("b:riscv_asm_zve32x")
    let b:riscv_asm_zve32x = b:riscv_asm_zve32x_max
    runtime! syntax/riscv_asm_zve32x.vim
endif

let b:riscv_asm_defined_zvksed = 0
