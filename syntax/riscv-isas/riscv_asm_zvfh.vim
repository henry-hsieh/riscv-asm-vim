if exists("b:riscv_asm_defined_zvfh")
    finish
endif

if !exists("b:riscv_asm_zvfhmin")
    let b:riscv_asm_zvfhmin = b:riscv_asm_zvfhmin_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zvfhmin"
    runtime! syntax/riscv-isas/riscv_asm_zvfhmin.vim
endif
if !exists("b:riscv_asm_zve32f")
    let b:riscv_asm_zve32f = b:riscv_asm_zve32f_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zve32f"
    runtime! syntax/riscv-isas/riscv_asm_zve32f.vim
endif
if !exists("b:riscv_asm_zfhmin")
    let b:riscv_asm_zfhmin = b:riscv_asm_zfhmin_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zfhmin"
    runtime! syntax/riscv-isas/riscv_asm_zfhmin.vim
endif

let b:riscv_asm_defined_zvfh = 0
