if exists("b:riscv_asm_defined_rv64e")
    finish
endif

runtime! syntax/riscv_asm_rv32e.vim
" Instructions
" I-type: load
syn keyword riscvIInstruction          lwu ld
" S-type
syn keyword riscvIInstruction          sd
" I-type
syn keyword riscvIInstruction          addiw slliw srliw sraiw
" R-type
syn keyword riscvIInstruction          addw subw sllw srlw sraw

let b:riscv_asm_defined_rv64e = 0
