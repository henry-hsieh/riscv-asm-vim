if exists("b:riscv_asm_defined_zicfiss")
    finish
endif

" Control Status Register
" Shadow Stack Pointer
syn keyword riscvUCSRegister           ssp

" Instructions
" Shadow Stack Instructions
syn keyword riscvIInstruction          sspush c.sspush sspopchk c.sspopchk ssrdp ssamoswap.w
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    syn keyword riscvIInstruction          ssamoswap.d
endif

if !exists("b:riscv_asm_zicsr")
    let b:riscv_asm_zicsr = b:riscv_asm_zicsr_max
    runtime! syntax/riscv_asm_zicsr.vim
endif
if !exists("b:riscv_asm_zimop")
    let b:riscv_asm_zimop = b:riscv_asm_zimop_max
    runtime! syntax/riscv_asm_zimop.vim
endif
if !exists("b:riscv_asm_zcmop")
    let b:riscv_asm_zcmop = b:riscv_asm_zcmop_max
    runtime! syntax/riscv_asm_zcmop.vim
endif

let b:riscv_asm_defined_zicfiss = 0
