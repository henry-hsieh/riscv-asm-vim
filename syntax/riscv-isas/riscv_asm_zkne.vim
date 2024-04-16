if exists("b:riscv_asm_defined_zkne")
    finish
endif

" Instructions
" NIST Suite: AES Encryption
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
    syn keyword riscvKInstruction          aes32esi aes32esmi
endif
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    syn keyword riscvKInstruction          aes64es aes64esm aes64ks1i aes64ks2
endif

let b:riscv_asm_defined_zkne = 0
