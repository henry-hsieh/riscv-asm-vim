if exists("b:riscv_asm_defined_zks")
    finish
endif

if !exists("b:riscv_asm_zbkb")
    let b:riscv_asm_zbkb = b:riscv_asm_zbkb_max
    runtime! syntax/riscv_asm_zbkb.vim
endif
if !exists("b:riscv_asm_zbkc")
    let b:riscv_asm_zbkc = b:riscv_asm_zbkc_max
    runtime! syntax/riscv_asm_zbkc.vim
endif
if !exists("b:riscv_asm_zbkx")
    let b:riscv_asm_zbkx = b:riscv_asm_zbkx_max
    runtime! syntax/riscv_asm_zbkx.vim
endif
if !exists("b:riscv_asm_zksed")
    let b:riscv_asm_zksed = b:riscv_asm_zksed_max
    runtime! syntax/riscv_asm_zksed.vim
endif
if !exists("b:riscv_asm_zksh")
    let b:riscv_asm_zksh = b:riscv_asm_zksh_max
    runtime! syntax/riscv_asm_zksh.vim
endif

let b:riscv_asm_defined_zks = 0
