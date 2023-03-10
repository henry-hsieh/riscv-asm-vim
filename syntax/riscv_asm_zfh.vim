if exists("b:riscv_asm_defined_zfh")
    finish
endif

runtime! syntax/riscv_asm_zhinx.vim
if !exists("b:riscv_asm_zfhmin")
    let b:riscv_asm_zfhmin = b:riscv_asm_zfhmin_max
    runtime! syntax/riscv_asm_zfhmin.vim
endif

let b:riscv_asm_defined_zfh = 0
