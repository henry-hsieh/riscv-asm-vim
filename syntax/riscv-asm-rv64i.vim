if exists("b:riscv_asm_defined_rv64i")
    finish
endif

runtime! syntax/riscv-asm-rv32i.vim
" Instructions
" I-type: load
syn keyword riscvBaseInstruction       lwu ld
" S-type
syn keyword riscvBaseInstruction       sd
" I-type
syn keyword riscvBaseInstruction       addiw slliw srliw sraiw
" R-type
syn keyword riscvBaseInstruction       addw subw sllw srlw sraw

let b:riscv_asm_defined_rv64i = 0
