if exists("b:riscv_asm_defined_zknd")
    finish
endif

" Instructions
" NIST Suite: AES Decryption
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
    syn keyword riscvKInstruction          aes32dsi aes32dsmi
endif
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    syn keyword riscvKInstruction          aes64ds aes64dsm aes64im aes64ks1i aes64ks2
endif

let b:riscv_asm_defined_zknd = 0
