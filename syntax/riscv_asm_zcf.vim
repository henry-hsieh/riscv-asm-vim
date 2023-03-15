if exists("b:riscv_asm_defined_zcf")
    finish
endif

" Instructions
" CL-type
syn keyword riscvCInstruction          c.flw
" CS-type
syn keyword riscvCInstruction          c.fsw
" CI-type
syn keyword riscvCInstruction          c.flwsp
" CSS-type
syn keyword riscvCInstruction          c.fswsp

if !exists("b:riscv_asm_zca")
    let b:riscv_asm_zca = b:riscv_asm_zca_max
    runtime! syntax/riscv_asm_zca.vim
endif
if !exists("b:riscv_asm_f")
    let b:riscv_asm_f = b:riscv_asm_f_max
    runtime! syntax/riscv_asm_f.vim
endif

let b:riscv_asm_defined_zcf = 0
