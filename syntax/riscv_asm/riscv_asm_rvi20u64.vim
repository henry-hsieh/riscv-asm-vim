if exists("b:riscv_asm_defined_rvi20u64")
    finish
endif

runtime! syntax/riscv_asm/riscv_asm_rv64i.vim

let b:riscv_asm_defined_rvi20u64 = 0
