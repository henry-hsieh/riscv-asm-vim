if exists("b:riscv_asm_defined_zk")
    finish
endif

if !exists("b:riscv_asm_zkn")
    let b:riscv_asm_zkn = b:riscv_asm_zkn_max
    runtime! syntax/riscv_asm_zkn.vim
endif
if !exists("b:riscv_asm_zkr")
    let b:riscv_asm_zkr = b:riscv_asm_zkr_max
    runtime! syntax/riscv_asm_zkr.vim
endif

let b:riscv_asm_defined_zk = 0
