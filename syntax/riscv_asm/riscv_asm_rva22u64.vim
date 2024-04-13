if exists("b:riscv_asm_defined_rva22u64")
    finish
endif

runtime! syntax/riscv_asm/riscv_asm_rv64i.vim
if !exists("b:riscv_asm_m")
    let b:riscv_asm_m = b:riscv_asm_m_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_m"
    runtime! syntax/riscv_asm/riscv_asm_m.vim
endif
if !exists("b:riscv_asm_a")
    let b:riscv_asm_a = b:riscv_asm_a_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_a"
    runtime! syntax/riscv_asm/riscv_asm_a.vim
endif
if !exists("b:riscv_asm_f")
    let b:riscv_asm_f = b:riscv_asm_f_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_f"
    runtime! syntax/riscv_asm/riscv_asm_f.vim
endif
if !exists("b:riscv_asm_d")
    let b:riscv_asm_d = b:riscv_asm_d_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_d"
    runtime! syntax/riscv_asm/riscv_asm_d.vim
endif
if !exists("b:riscv_asm_c")
    let b:riscv_asm_c = b:riscv_asm_c_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_c"
    runtime! syntax/riscv_asm/riscv_asm_c.vim
endif
if !exists("b:riscv_asm_zicsr")
    let b:riscv_asm_zicsr = b:riscv_asm_zicsr_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zicsr"
    runtime! syntax/riscv_asm/riscv_asm_zicsr.vim
endif
if !exists("b:riscv_asm_zicntr")
    let b:riscv_asm_zicntr = b:riscv_asm_zicntr_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zicntr"
    runtime! syntax/riscv_asm/riscv_asm_zicntr.vim
endif
if !exists("b:riscv_asm_zihpm")
    let b:riscv_asm_zihpm = b:riscv_asm_zihpm_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zihpm"
    runtime! syntax/riscv_asm/riscv_asm_zihpm.vim
endif
if !exists("b:riscv_asm_zihintpause")
    let b:riscv_asm_zihintpause = b:riscv_asm_zihintpause_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zihintpause"
    runtime! syntax/riscv_asm/riscv_asm_zihintpause.vim
endif
if !exists("b:riscv_asm_zba")
    let b:riscv_asm_zba = b:riscv_asm_zba_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zba"
    runtime! syntax/riscv_asm/riscv_asm_zba.vim
endif
if !exists("b:riscv_asm_zbb")
    let b:riscv_asm_zbb = b:riscv_asm_zbb_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zbb"
    runtime! syntax/riscv_asm/riscv_asm_zbb.vim
endif
if !exists("b:riscv_asm_zbs")
    let b:riscv_asm_zbs = b:riscv_asm_zbs_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zbs"
    runtime! syntax/riscv_asm/riscv_asm_zbs.vim
endif
if !exists("b:riscv_asm_zicbom")
    let b:riscv_asm_zicbom = b:riscv_asm_zicbom_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zicbom"
    runtime! syntax/riscv_asm/riscv_asm_zicbom.vim
endif
if !exists("b:riscv_asm_zicbop")
    let b:riscv_asm_zicbop = b:riscv_asm_zicbop_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zicbop"
    runtime! syntax/riscv_asm/riscv_asm_zicbop.vim
endif
if !exists("b:riscv_asm_zicboz")
    let b:riscv_asm_zicboz = b:riscv_asm_zicboz_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zicboz"
    runtime! syntax/riscv_asm/riscv_asm_zicboz.vim
endif
if !exists("b:riscv_asm_zfhmin")
    let b:riscv_asm_zfhmin = b:riscv_asm_zfhmin_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zfhmin"
    runtime! syntax/riscv_asm/riscv_asm_zfhmin.vim
endif

let b:riscv_asm_defined_rva22u64 = 0
