if exists("b:riscv_asm_defined_rvi20u32")
    finish
endif

runtime! syntax/riscv-isas/riscv_asm_rv32i.vim

let b:riscv_asm_defined_rvi20u32 = 0
