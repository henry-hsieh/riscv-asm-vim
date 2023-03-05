if exists("b:riscv_asm_defined_a")
    finish
endif

" Instructions
" Relaxed
syn keyword riscvAInstruction          lr.w sc.w amoswap.w amoadd.w amoxor.w amoand.w amoor.w amomin.w amomax.w maominu.w amomaxu.w
" Acquire
syn keyword riscvAInstruction          lr.w.aq sc.w.aq amoswap.w.aq amoadd.w.aq amoxor.w.aq amoand.w.aq amoor.w.aq amomin.w.aq amomax.w.aq maominu.w.aq amomaxu.w.aq
" Release
syn keyword riscvAInstruction          lr.w.rl sc.w.rl amoswap.w.rl amoadd.w.rl amoxor.w.rl amoand.w.rl amoor.w.rl amomin.w.rl amomax.w.rl maominu.w.rl amomaxu.w.rl
" Acquire and Release
syn keyword riscvAInstruction          lr.w.aqrl sc.w.aqrl amoswap.w.aqrl amoadd.w.aqrl amoxor.w.aqrl amoand.w.aqrl amoor.w.aqrl amomin.w.aqrl amomax.w.aqrl maominu.w.aqrl amomaxu.w.aqrl
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    " Relaxed
    syn keyword riscvAInstruction          lr.d sc.d amoswap.d amoadd.d amoxor.d amoand.d amoor.d amomin.d amomax.d maominu.d amomaxu.d
    " Acquire
    syn keyword riscvAInstruction          lr.d.aq sc.d.aq amoswap.d.aq amoadd.d.aq amoxor.d.aq amoand.d.aq amoor.d.aq amomin.d.aq amomax.d.aq maominu.d.aq amomaxu.d.aq
    " Release
    syn keyword riscvAInstruction          lr.d.rl sc.d.rl amoswap.d.rl amoadd.d.rl amoxor.d.rl amoand.d.rl amoor.d.rl amomin.d.rl amomax.d.rl maominu.d.rl amomaxu.d.rl
    " Acquire and Release
    syn keyword riscvAInstruction          lr.d.aqrl sc.d.aqrl amoswap.d.aqrl amoadd.d.aqrl amoxor.d.aqrl amoand.d.aqrl amoor.d.aqrl amomin.d.aqrl amomax.d.aqrl maominu.d.aqrl amomaxu.d.aqrl
endif

let b:riscv_asm_defined_a = 0
