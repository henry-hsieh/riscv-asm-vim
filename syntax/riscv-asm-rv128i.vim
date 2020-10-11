if exists("b:riscv_asm_defined_rv128i")
    finish
endif

runtime! syntax/riscv-asm-rv64i.vim
" Instructions
" I-type: load
syn keyword riscvBaseInstruction       ldu lq
" S-type
syn keyword riscvBaseInstruction       sq
" I-type
syn keyword riscvBaseInstruction       addid sllid srlid sraid
" R-type
syn keyword riscvBaseInstruction       addd subd slld srld srad

let b:riscv_asm_defined_rv128i = 0
