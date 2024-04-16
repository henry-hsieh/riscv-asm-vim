if exists("b:riscv_asm_defined_zicsr")
    finish
endif

" Instructions
syn keyword riscvIInstruction          csrrw csrrs csrrc csrrwi csrrsi csrrci

" Pseudo-instructions
syn keyword riscvIInstruction          csrr csrw csrs csrc
syn keyword riscvIInstruction          csrwi csrsi csrci

let b:riscv_asm_defined_zicsr = 0
