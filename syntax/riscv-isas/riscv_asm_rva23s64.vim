if exists("b:riscv_asm_defined_rva23s64")
    finish
endif

runtime! syntax/riscv-isas/riscv_asm_rva23u64.vim
if !exists("b:riscv_asm_zifencei")
    let b:riscv_asm_zifencei = b:riscv_asm_zifencei_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zifencei"
    runtime! syntax/riscv-isas/riscv_asm_zifencei.vim
endif
if !exists("b:riscv_asm_ss")
    let b:riscv_asm_ss = 1.13
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_ss"
    runtime! syntax/riscv-isas/riscv_asm_ss.vim
endif
if !exists("b:riscv_asm_svinval")
    let b:riscv_asm_svinval = b:riscv_asm_svinval_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_svinval"
    runtime! syntax/riscv-isas/riscv_asm_svinval.vim
endif
if !exists("b:riscv_asm_sstc")
    let b:riscv_asm_sstc = b:riscv_asm_sstc_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_sstc"
    runtime! syntax/riscv-isas/riscv_asm_sstc.vim
endif
if !exists("b:riscv_asm_sscofpmf")
    let b:riscv_asm_sscofpmf = b:riscv_asm_sscofpmf_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_sscofpmf"
    runtime! syntax/riscv-isas/riscv_asm_sscofpmf.vim
endif
if !exists("b:riscv_asm_ssnpm")
    let b:riscv_asm_ssnpm = b:riscv_asm_ssnpm_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_ssnpm"
    runtime! syntax/riscv-isas/riscv_asm_ssnpm.vim
endif
if !exists("b:riscv_asm_h")
    let b:riscv_asm_h = b:riscv_asm_h_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_h"
    runtime! syntax/riscv-isas/riscv_asm_h.vim
endif
if !exists("b:riscv_asm_ssstateen")
    let b:riscv_asm_ssstateen = b:riscv_asm_ssstateen_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_ssstateen"
    runtime! syntax/riscv-isas/riscv_asm_ssstateen.vim
endif

let b:riscv_asm_defined_rva23s64 = 0
