if exists("b:riscv_asm_defined_rv32i")
    finish
endif

runtime! syntax/riscv-isas/riscv_asm_rv32e.vim
" General Purpose Register
syn keyword riscvGPRegister            x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31
syn keyword riscvGPRegister            a4 a5 a6 a7
syn keyword riscvGPRegister            t2 t3 t4 t5 t6
syn keyword riscvGPRegister            s3 s4 s5 s6 s7 s8 s9 s10 s11

let b:riscv_asm_defined_rv32i = 0
