if exists("b:riscv_asm_defined_ss")
    finish
endif

" Control Status Register
" Supervisor Trap Setup
syn keyword riscvSCSRegister           sstatus sie stvec scounteren
" Supervisor Configuration
syn keyword riscvSCSRegister           senvcfg
" Supervisor Trap Handling
syn keyword riscvSCSRegister           sscratch sepc scause stval sip
" Supervisor Protection and Translation
syn keyword riscvSCSRegister           satp

" Instructions
syn keyword riscvSsInstruction         sfence.vma sret

if !exists("b:riscv_asm_sm")
    let b:riscv_asm_sm = b:riscv_asm_sm_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_sm"
    runtime! syntax/riscv_asm_sm.vim
endif
if !exists("b:riscv_asm_zicsr")
    let b:riscv_asm_zicsr = b:riscv_asm_zicsr_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zicsr"
    runtime! syntax/riscv_asm_zicsr.vim
endif

let b:riscv_asm_defined_ss = 0
