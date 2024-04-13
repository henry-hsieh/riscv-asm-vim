if exists("b:riscv_asm_defined_c")
    finish
endif

if !exists("b:riscv_asm_zca")
    let b:riscv_asm_zca = b:riscv_asm_zca_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zca"
    runtime! syntax/riscv_asm_zca.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_f") && b:riscv_asm_xlen == 32 && !exists("b:riscv_asm_zcf")
    let b:riscv_asm_zcf = b:riscv_asm_zcf_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zcf"
    runtime! syntax/riscv_asm_zcf.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_d") && b:riscv_asm_xlen <= 64 && !exists("b:riscv_asm_zcd")
    let b:riscv_asm_zcd = b:riscv_asm_zcd_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zcd"
    runtime! syntax/riscv_asm_zcd.vim
endif

let b:riscv_asm_defined_c = 0
