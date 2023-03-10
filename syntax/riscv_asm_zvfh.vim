if exists("b:riscv_asm_defined_zvfh")
    finish
endif

if !exists("b:riscv_asm_zvfhmin")
    let b:riscv_asm_zvfhmin = b:riscv_asm_zvfhmin_max
    runtime! syntax/riscv_asm_zvfhmin.vim
endif
if !exists("b:riscv_asm_zve32f")
    let b:riscv_asm_zve32f = b:riscv_asm_zve32f_max
    runtime! syntax/riscv_asm_zve32f.vim
endif
if !exists("b:riscv_asm_zfhmin")
    let b:riscv_asm_zfhmin = b:riscv_asm_zfhmin_max
    runtime! syntax/riscv_asm_zfhmin.vim
endif

let b:riscv_asm_defined_zvfh = 0
