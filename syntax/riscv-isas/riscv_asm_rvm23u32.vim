if exists("b:riscv_asm_defined_rvm23u32")
    finish
endif

runtime! syntax/riscv-isas/riscv_asm_rv32i.vim
if !exists("b:riscv_asm_m")
    let b:riscv_asm_m = b:riscv_asm_m_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_m"
    runtime! syntax/riscv-isas/riscv_asm_m.vim
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
if !exists("b:riscv_asm_zicond")
    let b:riscv_asm_zicond = b:riscv_asm_zicond_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zicond"
    runtime! syntax/riscv-isas/riscv_asm_zicond.vim
endif
if !exists("b:riscv_asm_zihintpause")
    let b:riscv_asm_zihintpause = b:riscv_asm_zihintpause_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zihintpause"
    runtime! syntax/riscv-isas/riscv_asm_zihintpause.vim
endif
if !exists("b:riscv_asm_zihintntl")
    let b:riscv_asm_zihintntl = b:riscv_asm_zihintntl_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zihintntl"
    runtime! syntax/riscv-isas/riscv_asm_zihintntl.vim
endif
if !exists("b:riscv_asm_zce")
    let b:riscv_asm_zce = b:riscv_asm_zce_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zce"
    runtime! syntax/riscv-isas/riscv_asm_zce.vim
endif
if !exists("b:riscv_asm_zicbop")
    let b:riscv_asm_zicbop = b:riscv_asm_zicbop_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zicbop"
    runtime! syntax/riscv-isas/riscv_asm_zicbop.vim
endif
if !exists("b:riscv_asm_zimop")
    let b:riscv_asm_zimop = b:riscv_asm_zimop_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zimop"
    runtime! syntax/riscv-isas/riscv_asm_zimop.vim
endif
if !exists("b:riscv_asm_zcmop")
    let b:riscv_asm_zcmop = b:riscv_asm_zcmop_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zcmop"
    runtime! syntax/riscv-isas/riscv_asm_zcmop.vim
endif

let b:riscv_asm_defined_rvm23u32 = 0
