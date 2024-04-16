if exists("b:riscv_asm_defined_zksed")
    finish
endif

" Instructions
" ShangMi Suite: SM4 Block Cipher Instructions
syn keyword riscvKInstruction          sm4ed sm4ks

let b:riscv_asm_defined_zksed = 0
