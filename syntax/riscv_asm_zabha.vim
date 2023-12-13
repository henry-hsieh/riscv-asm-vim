if exists("b:riscv_asm_defined_zabha")
    finish
endif

" Instructions
" Relaxed
syn keyword riscvAInstruction          amoswap.b amoadd.b amoxor.b amoand.b amoor.b amomin.b amomax.b amominu.b amomaxu.b
" Acquire
syn keyword riscvAInstruction          amoswap.b.aq amoadd.b.aq amoxor.b.aq amoand.b.aq amoor.b.aq amomin.b.aq amomax.b.aq amominu.b.aq amomaxu.b.aq
" Release
syn keyword riscvAInstruction          amoswap.b.rl amoadd.b.rl amoxor.b.rl amoand.b.rl amoor.b.rl amomin.b.rl amomax.b.rl amominu.b.rl amomaxu.b.rl
" Acquire and Release
syn keyword riscvAInstruction          amoswap.b.aqrl amoadd.b.aqrl amoxor.b.aqrl amoand.b.aqrl amoor.b.aqrl amomin.b.aqrl amomax.b.aqrl amominu.b.aqrl amomaxu.b.aqrl
" Relaxed
syn keyword riscvAInstruction          amoswap.h amoadd.h amoxor.h amoand.h amoor.h amomin.h amomax.h amominu.h amomaxu.h
" Acquire
syn keyword riscvAInstruction          amoswap.h.aq amoadd.h.aq amoxor.h.aq amoand.h.aq amoor.h.aq amomin.h.aq amomax.h.aq amominu.h.aq amomaxu.h.aq
" Release
syn keyword riscvAInstruction          amoswap.h.rl amoadd.h.rl amoxor.h.rl amoand.h.rl amoor.h.rl amomin.h.rl amomax.h.rl amominu.h.rl amomaxu.h.rl
" Acquire and Release
syn keyword riscvAInstruction          amoswap.h.aqrl amoadd.h.aqrl amoxor.h.aqrl amoand.h.aqrl amoor.h.aqrl amomin.h.aqrl amomax.h.aqrl amominu.h.aqrl amomaxu.h.aqrl

if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zacas")
    " Relaxed
    syn keyword riscvAInstruction          amocas.b
    " Acquire
    syn keyword riscvAInstruction          amocas.b.aq
    " Release
    syn keyword riscvAInstruction          amocas.b.rl
    " Acquire and Release
    syn keyword riscvAInstruction          amocas.b.aqrl
    " Relaxed
    syn keyword riscvAInstruction          amocas.h
    " Acquire
    syn keyword riscvAInstruction          amocas.h.aq
    " Release
    syn keyword riscvAInstruction          amocas.h.rl
    " Acquire and Release
    syn keyword riscvAInstruction          amocas.h.aqrl
endif

if !exists("b:riscv_asm_a")
    let b:riscv_asm_a = b:riscv_asm_a_max
    runtime! syntax/riscv_asm_a.vim
endif

let b:riscv_asm_defined_zabha = 0
