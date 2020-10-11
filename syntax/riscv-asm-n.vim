if exists("b:riscv_asm_defined_n")
    finish
endif

" Control Status Register
" User Trap Setup
syn keyword riscvUCSRegister           ustatus uie utvec
" User Trap Handling
syn keyword riscvUCSRegister           uscratch uepc ucause utval uip

" Instructions
syn keyword riscvNInstruction          uret

let b:riscv_asm_defined_n = 0
