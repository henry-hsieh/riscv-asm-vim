if exists("b:riscv_asm_defined_b")
    finish
endif

if !exists("b:riscv_asm_zba")
    let b:riscv_asm_zba = b:riscv_asm_zba_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zba"
    runtime! syntax/riscv-isas/riscv_asm_zba.vim
endif
if !exists("b:riscv_asm_zbb")
    let b:riscv_asm_zbb = b:riscv_asm_zbb_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zbb"
    runtime! syntax/riscv-isas/riscv_asm_zbb.vim
endif
if !exists("b:riscv_asm_zbs")
    let b:riscv_asm_zbs = b:riscv_asm_zbs_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zbs"
    runtime! syntax/riscv-isas/riscv_asm_zbs.vim
endif

let b:riscv_asm_defined_b = 0
