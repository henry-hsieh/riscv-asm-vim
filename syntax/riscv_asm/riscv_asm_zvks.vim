if exists("b:riscv_asm_defined_zvks")
    finish
endif

if !exists("b:riscv_asm_zvksed")
    let b:riscv_asm_zvksed = b:riscv_asm_zvksed_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zvksed"
    runtime! syntax/riscv_asm/riscv_asm_zvksed.vim
endif
if !exists("b:riscv_asm_zvksh")
    let b:riscv_asm_zvksh = b:riscv_asm_zvksh_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zvksh"
    runtime! syntax/riscv_asm/riscv_asm_zvksh.vim
endif
if !exists("b:riscv_asm_zvkb")
    let b:riscv_asm_zvkb = b:riscv_asm_zvkb_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zvkb"
    runtime! syntax/riscv_asm/riscv_asm_zvkb.vim
endif

let b:riscv_asm_defined_zvks = 0
