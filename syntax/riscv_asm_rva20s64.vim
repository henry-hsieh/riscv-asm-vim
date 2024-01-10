if exists("b:riscv_asm_defined_rva20s64")
    finish
endif

runtime! syntax/riscv_asm_rva20u64.vim
if !exists("b:riscv_asm_zifencei")
    let b:riscv_asm_zifencei = b:riscv_asm_zifencei_max
    runtime! syntax/riscv_asm_zifencei.vim
endif
if !exists("b:riscv_asm_ss")
    let b:riscv_asm_ss = 1.11
    runtime! syntax/riscv_asm_ss.vim
endif

let b:riscv_asm_defined_rva20s64 = 0
