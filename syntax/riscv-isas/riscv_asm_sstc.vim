if exists("b:riscv_asm_defined_sstc")
    finish
endif

" Control Status Register
" Supervisor Timer Register
syn keyword riscvSCSRegister           stimecmp
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
    syn keyword riscvSCSRegister           stimecmph
endif
" Virtual Supervisor Timer Register
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_h")
    syn keyword riscvSCSRegister           vstimecmp
endif
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32 && exists("b:riscv_asm_h")
    syn keyword riscvSCSRegister           vstimecmph
endif

if !exists("b:riscv_asm_ss")
    let b:riscv_asm_ss = b:riscv_asm_ss_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_ss"
    runtime! syntax/riscv-isas/riscv_asm_ss.vim
endif

let b:riscv_asm_defined_sstc = 0
