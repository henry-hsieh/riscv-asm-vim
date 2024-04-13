if exists("b:riscv_asm_defined_zkn")
    finish
endif

if !exists("b:riscv_asm_zbkb")
    let b:riscv_asm_zbkb = b:riscv_asm_zbkb_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zbkb"
    runtime! syntax/riscv_asm_zbkb.vim
endif
if !exists("b:riscv_asm_zbkc")
    let b:riscv_asm_zbkc = b:riscv_asm_zbkc_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zbkc"
    runtime! syntax/riscv_asm_zbkc.vim
endif
if !exists("b:riscv_asm_zbkx")
    let b:riscv_asm_zbkx = b:riscv_asm_zbkx_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zbkx"
    runtime! syntax/riscv_asm_zbkx.vim
endif
if !exists("b:riscv_asm_zkne")
    let b:riscv_asm_zkne = b:riscv_asm_zkne_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zkne"
    runtime! syntax/riscv_asm_zkne.vim
endif
if !exists("b:riscv_asm_zknd")
    let b:riscv_asm_zknd = b:riscv_asm_zknd_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zknd"
    runtime! syntax/riscv_asm_zknd.vim
endif
if !exists("b:riscv_asm_zknh")
    let b:riscv_asm_zknh = b:riscv_asm_zknh_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zknh"
    runtime! syntax/riscv_asm_zknh.vim
endif

let b:riscv_asm_defined_zkn = 0
