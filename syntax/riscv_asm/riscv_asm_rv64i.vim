if exists("b:riscv_asm_defined_rv64i")
    finish
endif

runtime! syntax/riscv_asm_rv64e.vim
runtime! syntax/riscv_asm_rv32i.vim

let b:riscv_asm_defined_rv64i = 0
