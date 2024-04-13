if exists("b:riscv_asm_defined_zve64f")
    finish
endif

if !exists("b:riscv_asm_d")
    let b:riscv_asm_d = b:riscv_asm_d_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_d"
    runtime! syntax/riscv_asm/riscv_asm_d.vim
endif
if !exists("b:riscv_asm_zve64f")
    let b:riscv_asm_zve64f = b:riscv_asm_zve64f_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zve64f"
    runtime! syntax/riscv_asm/riscv_asm_zve64f.vim
endif

let b:riscv_asm_defined_zve64f = 0
