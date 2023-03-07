if exists("b:riscv_asm_defined_zfh")
    finish
endif

runtime! syntax/riscv_asm_zhinx.vim
runtime! syntax/riscv_asm_zfhmin.vim

let b:riscv_asm_defined_zfh = 0
