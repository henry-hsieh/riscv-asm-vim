if exists("b:riscv_asm_defined_zaamo")
    finish
endif

" Instructions
" Relaxed
syn keyword riscvAInstruction          amoswap.w amoadd.w amoxor.w amoand.w amoor.w amomin.w amomax.w amominu.w amomaxu.w
" Acquire
syn keyword riscvAInstruction          amoswap.w.aq amoadd.w.aq amoxor.w.aq amoand.w.aq amoor.w.aq amomin.w.aq amomax.w.aq amominu.w.aq amomaxu.w.aq
" Release
syn keyword riscvAInstruction          amoswap.w.rl amoadd.w.rl amoxor.w.rl amoand.w.rl amoor.w.rl amomin.w.rl amomax.w.rl amominu.w.rl amomaxu.w.rl
" Acquire and Release
syn keyword riscvAInstruction          amoswap.w.aqrl amoadd.w.aqrl amoxor.w.aqrl amoand.w.aqrl amoor.w.aqrl amomin.w.aqrl amomax.w.aqrl amominu.w.aqrl amomaxu.w.aqrl
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    " Relaxed
    syn keyword riscvAInstruction          amoswap.d amoadd.d amoxor.d amoand.d amoor.d amomin.d amomax.d amominu.d amomaxu.d
    " Acquire
    syn keyword riscvAInstruction          amoswap.d.aq amoadd.d.aq amoxor.d.aq amoand.d.aq amoor.d.aq amomin.d.aq amomax.d.aq amominu.d.aq amomaxu.d.aq
    " Release
    syn keyword riscvAInstruction          amoswap.d.rl amoadd.d.rl amoxor.d.rl amoand.d.rl amoor.d.rl amomin.d.rl amomax.d.rl amominu.d.rl amomaxu.d.rl
    " Acquire and Release
    syn keyword riscvAInstruction          amoswap.d.aqrl amoadd.d.aqrl amoxor.d.aqrl amoand.d.aqrl amoor.d.aqrl amomin.d.aqrl amomax.d.aqrl amominu.d.aqrl amomaxu.d.aqrl
endif

let b:riscv_asm_defined_zaamo = 0
