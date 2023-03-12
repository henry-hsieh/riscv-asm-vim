if exists("b:riscv_asm_defined_zknh")
    finish
endif

" Instructions
" NIST Suite: Hash Function Instructions
syn keyword riscvKInstruction          sha256sig0 sha256sig1 sha256sum0 sha256sum1
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
    syn keyword riscvKInstruction          sha512sig0h sha512sig0l sha512sig1h sha512sig1l sha512sum0r sha512sum1r
endif
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    syn keyword riscvKInstruction          sha512sig0 sha512sig1 sha512sum0 sha512sum1
endif

let b:riscv_asm_defined_zknh = 0
