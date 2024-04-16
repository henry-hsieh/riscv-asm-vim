if exists("b:riscv_asm_defined_ssaia")
    finish
endif

" Control Status Register
" Supervisor-Level Window to Indirectly Accessed Registers
syn keyword riscvSCSRegister           siselect sireg
" Supervisor-Level Interrupts
syn keyword riscvSCSRegister           stopei stopi
" Supervisor-Level High-Half CSRs for Interrupts 32–63
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
    syn keyword riscvSCSRegister           sieh siph
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_h")
    " Virtual Interrupts and Interrupt Priorities for VS Level
    syn keyword riscvHCSRegister           hvien hvictl hviprio1 hviprio2
    " VS-Level Window to Indirectly Accessed Registers
    syn keyword riscvHCSRegister           vsiselect vsireg
    " VS-Level Interrupts
    syn keyword riscvHCSRegister           vstopei vstopi
    " Hypervisor and VS-Level High-Half CSRs
    if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
        syn keyword riscvHCSRegister           hidelegh hvienh hviph hviprio1h hviprio2h vsieh vsiph
    endif
endif

if !exists("b:riscv_asm_ss")
    let b:riscv_asm_ss = b:riscv_asm_ss_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_ss"
    runtime! syntax/riscv-isas/riscv_asm_ss.vim
endif

let b:riscv_asm_defined_ssaia = 0
