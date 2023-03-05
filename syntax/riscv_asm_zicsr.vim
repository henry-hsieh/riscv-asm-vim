if exists("b:riscv_asm_defined_zicsr")
    finish
endif

" Instructions
syn keyword riscvZicsrInstruction      csrrw csrrs csrrc csrrwi csrrsi csrrci

" Pseudo-instructions
syn keyword riscvZicsrInstruction      csrr csrw csrs csrc
syn keyword riscvZicsrInstruction      csrwi csrsi csrci

if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_n")
    runtime! syntax/riscv_asm_n.vim
endif

if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_s")
    runtime! syntax/riscv_asm_s.vim
endif

if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_h")
    runtime! syntax/riscv_asm_h.vim
endif

if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zxm")
    runtime! syntax/riscv_asm_zxm.vim
endif

let b:riscv_asm_defined_zicsr = 0
