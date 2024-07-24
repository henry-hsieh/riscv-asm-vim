if exists("b:riscv_asm_defined_a")
    finish
endif

if !exists("b:riscv_asm_zalrsc")
    let b:riscv_asm_zalrsc = b:riscv_asm_zalrsc_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zalrsc"
    runtime! syntax/riscv-isas/riscv_asm_zalrsc.vim
endif
if !exists("b:riscv_asm_zaamo")
    let b:riscv_asm_zaamo = b:riscv_asm_zaamo_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zaamo"
    runtime! syntax/riscv-isas/riscv_asm_zaamo.vim
endif

let b:riscv_asm_defined_a = 0
