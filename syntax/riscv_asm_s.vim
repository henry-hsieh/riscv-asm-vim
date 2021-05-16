if exists("b:riscv_asm_defined_s")
    finish
endif

" Control Status Register
" Supervisor Trap Setup
syn keyword riscvSCSRegister           sstatus sedeleg sideleg sie stvec scounteren
" Supervisor Trap Handling
syn keyword riscvSCSRegister           sscratch sepc scause stval sip
" Supervisor Protection and Translation
syn keyword riscvSCSRegister           satp

" Instructions
syn keyword riscvSInstruction          sfence.vma sret

let b:riscv_asm_defined_s = 0
