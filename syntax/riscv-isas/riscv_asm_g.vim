if exists("b:riscv_asm_defined_g")
    finish
endif

if b:riscv_asm_xlen == 32
    runtime! syntax/riscv-isas/riscv_asm_rv32g.vim
elseif b:riscv_asm_xlen == 64
    runtime! syntax/riscv-isas/riscv_asm_rv64g.vim
endif

let b:riscv_asm_defined_g = 0
