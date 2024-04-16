if exists("b:riscv_asm_defined_v")
    finish
endif

if !exists("b:riscv_asm_zve64d")
    let b:riscv_asm_zve64d = b:riscv_asm_zve64d_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zve64d"
    runtime! syntax/riscv-isas/riscv_asm_zve64d.vim
endif

let b:riscv_asm_defined_v = 0
