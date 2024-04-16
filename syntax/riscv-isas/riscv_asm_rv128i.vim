if exists("b:riscv_asm_defined_rv128i")
    finish
endif

runtime! syntax/riscv-isas/riscv_asm_rv64i.vim
" Instructions
" I-type: load
syn keyword riscvIInstruction          ldu lq
" S-type
syn keyword riscvIInstruction          sq
" I-type
syn keyword riscvIInstruction          addid sllid srlid sraid
" R-type
syn keyword riscvIInstruction          addd subd slld srld srad

let b:riscv_asm_defined_rv128i = 0
