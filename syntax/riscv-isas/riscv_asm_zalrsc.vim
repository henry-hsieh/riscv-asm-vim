if exists("b:riscv_asm_defined_zalrsc")
    finish
endif

" Instructions
" Relaxed
syn keyword riscvAInstruction          lr.w sc.w
" Acquire
syn keyword riscvAInstruction          lr.w.aq sc.w.aq
" Release
syn keyword riscvAInstruction          lr.w.rl sc.w.rl
" Acquire and Release
syn keyword riscvAInstruction          lr.w.aqrl sc.w.aqrl
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    " Relaxed
    syn keyword riscvAInstruction          lr.d sc.d
    " Acquire
    syn keyword riscvAInstruction          lr.d.aq sc.d.aq
    " Release
    syn keyword riscvAInstruction          lr.d.rl sc.d.rl
    " Acquire and Release
    syn keyword riscvAInstruction          lr.d.aqrl sc.d.aqrl
endif

let b:riscv_asm_defined_zalrsc = 0
