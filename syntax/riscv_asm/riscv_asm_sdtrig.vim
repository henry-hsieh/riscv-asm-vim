if exists("b:riscv_asm_defined_sdtrig")
    finish
endif

" Control Status Register
" Trigger Select
syn keyword riscvDCSRegister           tselect
" Trigger Data
syn keyword riscvDCSRegister           tdata1 tdata2 tdata3
" Trigger Info
syn keyword riscvDCSRegister           tinfo
" Trigger Control
syn keyword riscvDCSRegister           tcontrol
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_h")
    " Hypervisor Context
    syn keyword riscvDCSRegister           hcontext
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_ss")
    " Supervisor Context
    syn keyword riscvDCSRegister           scontext
endif
" Machine Context
syn keyword riscvDCSRegister           mcontext
" Machine Supervisor Context
syn keyword riscvDCSRegister           mscontext
" Match Control
syn keyword riscvDCSRegister           mcontrol mcontrol6
" Instruction Count
syn keyword riscvDCSRegister           icount
" Interrupt/Exception/External Trigger
syn keyword riscvDCSRegister           itrigger etrigger tmexttrigger
" Trigger Extra
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
    syn keyword riscvDCSRegister           textra32
endif
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 64
    syn keyword riscvDCSRegister           textra64
endif

if !exists("b:riscv_asm_sm")
    let b:riscv_asm_sm = b:riscv_asm_sm_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_sm"
    runtime! syntax/riscv_asm_sm.vim
endif

let b:riscv_asm_defined_sdtrig = 0
