if exists("b:riscv_asm_defined_zicntr")
    finish
endif

" Control Status Register
" User Counter/Timers
syn keyword riscvUCSRegister           cycle time instret
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
    syn keyword riscvUCSRegister           cycleh timeh instreth
endif

" Pseudo-instructions
syn keyword riscvIInstruction          rdinstret rdcycle rdtime
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
    syn keyword riscvIInstruction          rdinstreth rdcycleh rdtimeh
endif

if !exists("b:riscv_asm_zicsr")
    let b:riscv_asm_zicsr = b:riscv_asm_zicsr_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zicsr"
    runtime! syntax/riscv-isas/riscv_asm_zicsr.vim
endif

let b:riscv_asm_defined_zicntr = 0
