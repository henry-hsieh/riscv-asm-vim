if exists("b:riscv_asm_defined_zvkn")
    finish
endif

if !exists("b:riscv_asm_zvkned")
    let b:riscv_asm_zvkned = b:riscv_asm_zvkned_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zvkned"
    runtime! syntax/riscv_asm/riscv_asm_zvkned.vim
endif
if !exists("b:riscv_asm_zvknhb")
    let b:riscv_asm_zvknhb = b:riscv_asm_zvknhb_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zvknhb"
    runtime! syntax/riscv_asm/riscv_asm_zvknhb.vim
endif
if !exists("b:riscv_asm_zvkb")
    let b:riscv_asm_zvkb = b:riscv_asm_zvkb_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zvkb"
    runtime! syntax/riscv_asm/riscv_asm_zvkb.vim
endif

let b:riscv_asm_defined_zvkn = 0
