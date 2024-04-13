if exists("b:riscv_asm_defined_zve64f")
    finish
endif

if !exists("b:riscv_asm_zve32f")
    let b:riscv_asm_zve32f = b:riscv_asm_zve32f_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zve32f"
    runtime! syntax/riscv_asm/riscv_asm_zve32f.vim
endif

let b:riscv_asm_defined_zve64f = 0
