if exists("b:riscv_asm_defined_ssctr")
    finish
endif

" Control Status Register
" Supervisor Control Transfer Records Registers
syn keyword riscvSCSRegister           sctrctl sctrdepth sctrstatus
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_h")
    " Virtual Supervisor Control Transfer Records Registers
    syn keyword riscvHCSRegister           vsctrctl
endif

" Instructions
syn keyword riscvSsInstruction         sctrclr

if !exists("b:riscv_asm_sscsrind")
    let b:riscv_asm_sscsrind = b:riscv_asm_sscsrind_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_sscsrind"
    runtime! syntax/riscv-isas/riscv_asm_sscsrind.vim
endif

let b:riscv_asm_defined_ssctr = 0
