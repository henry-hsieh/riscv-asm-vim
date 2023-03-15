if exists("b:riscv_asm_defined_zcmt")
    finish
endif

" Control-Status Register
syn keyword riscvUCSRegister           jvt

" Instructions
" Table Jump
syn keyword riscvCInstruction          cm.jt cm.jalt

if !exists("b:riscv_asm_zca")
    let b:riscv_asm_zca = b:riscv_asm_zca_max
    runtime! syntax/riscv_asm_zca.vim
endif
if !exists("b:riscv_asm_zicsr")
    let b:riscv_asm_zicsr = b:riscv_asm_zicsr_max
    runtime! syntax/riscv_asm_zicsr.vim
endif

let b:riscv_asm_defined_zcmt = 0
