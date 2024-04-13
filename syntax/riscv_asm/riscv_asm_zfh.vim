if exists("b:riscv_asm_defined_zfh")
    finish
endif

runtime! syntax/riscv_asm_zhinx.vim
if !exists("b:riscv_asm_zfhmin")
    let b:riscv_asm_zfhmin = b:riscv_asm_zfhmin_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zfhmin"
    runtime! syntax/riscv_asm_zfhmin.vim
endif

let b:riscv_asm_defined_zfh = 0
