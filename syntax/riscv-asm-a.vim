if exists("b:riscv_asm_defined_a")
    finish
endif

" Instructions
syn keyword riscvAInstruction          lr.w sc.w amoswap.w amoadd.w amoxor.w amoand.w amoor.w amomin.w amomax.w maominu.w amomaxu.w
if exists("b:riscv_asm_all_enable") || b:riscv_asm_addr_bit > 32
    syn keyword riscvAInstruction          lr.d sc.d amoswap.d amoadd.d amoxor.d amoand.d amoor.d amomin.d amomax.d maominu.d amomaxu.d
endif

let b:riscv_asm_defined_a = 0
