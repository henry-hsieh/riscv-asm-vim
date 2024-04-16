if exists("b:riscv_asm_defined_rva20u64")
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

let b:riscv_asm_defined_rva20u64 = 0
