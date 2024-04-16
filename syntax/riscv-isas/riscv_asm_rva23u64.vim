if exists("b:riscv_asm_defined_rva23u64")
    finish
endif

runtime! syntax/riscv-isas/riscv_asm_rv64i.vim
if !exists("b:riscv_asm_m")
    let b:riscv_asm_m = b:riscv_asm_m_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_m"
    runtime! syntax/riscv-isas/riscv_asm_m.vim
endif
if !exists("b:riscv_asm_a")
    let b:riscv_asm_a = b:riscv_asm_a_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_a"
    runtime! syntax/riscv-isas/riscv_asm_a.vim
endif
if !exists("b:riscv_asm_f")
    let b:riscv_asm_f = b:riscv_asm_f_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_f"
    runtime! syntax/riscv-isas/riscv_asm_f.vim
endif
if !exists("b:riscv_asm_d")
    let b:riscv_asm_d = b:riscv_asm_d_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_d"
    runtime! syntax/riscv-isas/riscv_asm_d.vim
endif
if !exists("b:riscv_asm_c")
    let b:riscv_asm_c = b:riscv_asm_c_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_c"
    runtime! syntax/riscv-isas/riscv_asm_c.vim
endif
if !exists("b:riscv_asm_zicsr")
    let b:riscv_asm_zicsr = b:riscv_asm_zicsr_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zicsr"
    runtime! syntax/riscv-isas/riscv_asm_zicsr.vim
endif
if !exists("b:riscv_asm_zicntr")
    let b:riscv_asm_zicntr = b:riscv_asm_zicntr_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zicntr"
    runtime! syntax/riscv-isas/riscv_asm_zicntr.vim
endif
if !exists("b:riscv_asm_zihpm")
    let b:riscv_asm_zihpm = b:riscv_asm_zihpm_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zihpm"
    runtime! syntax/riscv-isas/riscv_asm_zihpm.vim
endif
if !exists("b:riscv_asm_zihintpause")
    let b:riscv_asm_zihintpause = b:riscv_asm_zihintpause_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zihintpause"
    runtime! syntax/riscv-isas/riscv_asm_zihintpause.vim
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
if !exists("b:riscv_asm_zicbom")
    let b:riscv_asm_zicbom = b:riscv_asm_zicbom_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zicbom"
    runtime! syntax/riscv-isas/riscv_asm_zicbom.vim
endif
if !exists("b:riscv_asm_zicbop")
    let b:riscv_asm_zicbop = b:riscv_asm_zicbop_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zicbop"
    runtime! syntax/riscv-isas/riscv_asm_zicbop.vim
endif
if !exists("b:riscv_asm_zicboz")
    let b:riscv_asm_zicboz = b:riscv_asm_zicboz_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zicboz"
    runtime! syntax/riscv-isas/riscv_asm_zicboz.vim
endif
if !exists("b:riscv_asm_zfhmin")
    let b:riscv_asm_zfhmin = b:riscv_asm_zfhmin_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zfhmin"
    runtime! syntax/riscv-isas/riscv_asm_zfhmin.vim
endif
if !exists("b:riscv_asm_v")
    let b:riscv_asm_v = b:riscv_asm_v_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_v"
    runtime! syntax/riscv-isas/riscv_asm_v.vim
endif
if !exists("b:riscv_asm_zvfhmin")
    let b:riscv_asm_zvfhmin = b:riscv_asm_zvfhmin_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zvfhmin"
    runtime! syntax/riscv-isas/riscv_asm_zvfhmin.vim
endif
if !exists("b:riscv_asm_zvbb")
    let b:riscv_asm_zvbb = b:riscv_asm_zvbb_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zvbb"
    runtime! syntax/riscv-isas/riscv_asm_zvbb.vim
endif
if !exists("b:riscv_asm_zihintntl")
    let b:riscv_asm_zihintntl = b:riscv_asm_zihintntl_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zihintntl"
    runtime! syntax/riscv-isas/riscv_asm_zihintntl.vim
endif
if !exists("b:riscv_asm_zicond")
    let b:riscv_asm_zicond = b:riscv_asm_zicond_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zicond"
    runtime! syntax/riscv-isas/riscv_asm_zicond.vim
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
if !exists("b:riscv_asm_zcb")
    let b:riscv_asm_zcb = b:riscv_asm_zcb_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zcb"
    runtime! syntax/riscv-isas/riscv_asm_zcb.vim
endif
if !exists("b:riscv_asm_zfa")
    let b:riscv_asm_zfa = b:riscv_asm_zfa_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zfa"
    runtime! syntax/riscv-isas/riscv_asm_zfa.vim
endif
if !exists("b:riscv_asm_zawrs")
    let b:riscv_asm_zawrs = b:riscv_asm_zawrs_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zawrs"
    runtime! syntax/riscv-isas/riscv_asm_zawrs.vim
endif

let b:riscv_asm_defined_rva23u64 = 0
