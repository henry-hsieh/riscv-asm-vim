if exists("b:riscv_asm_defined_zce")
    finish
endif

if !exists("b:riscv_asm_zca")
    let b:riscv_asm_zca = b:riscv_asm_zca_max
    runtime! syntax/riscv_asm_zca.vim
endif
if !exists("b:riscv_asm_zcb")
    let b:riscv_asm_zcb = b:riscv_asm_zcb_max
    runtime! syntax/riscv_asm_zcb.vim
endif
if !exists("b:riscv_asm_zcmp")
    let b:riscv_asm_zcmp = b:riscv_asm_zcmp_max
    runtime! syntax/riscv_asm_zcmp.vim
endif
if !exists("b:riscv_asm_zcmt")
    let b:riscv_asm_zcmt = b:riscv_asm_zcmt_max
    runtime! syntax/riscv_asm_zcmt.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_f") && b:riscv_asm_xlen == 32 && !exists("b:riscv_asm_zcf")
    let b:riscv_asm_zcf = b:riscv_asm_zcf_max
    runtime! syntax/riscv_asm_zcf.vim
endif

let b:riscv_asm_defined_zce = 0
