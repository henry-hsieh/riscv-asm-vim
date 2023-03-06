if exists("b:riscv_asm_defined_zicsr")
    finish
endif

" Instructions
syn keyword riscvZicsrInstruction      csrrw csrrs csrrc csrrwi csrrsi csrrci

" Pseudo-instructions
syn keyword riscvZicsrInstruction      csrr csrw csrs csrc
syn keyword riscvZicsrInstruction      csrwi csrsi csrci

let b:riscv_asm_defined_zicsr = 0
