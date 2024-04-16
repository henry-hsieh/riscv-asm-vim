if exists("b:riscv_asm_defined_zfa")
    finish
endif

" Instructions
" I-type: load-immediate
syn keyword riscvFInstruction          fli.s
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_d")
    syn keyword riscvFInstruction          fli.d
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_q")
    syn keyword riscvFInstruction          fli.q
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zfh")
    syn keyword riscvFInstruction          fli.h
endif
" R-type: min/max
syn keyword riscvFInstruction          fminm.s fmaxm.s
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_d")
    syn keyword riscvFInstruction          fminm.d fmaxm.d
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_q")
    syn keyword riscvFInstruction          fminm.q fmaxm.q
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zfh")
    syn keyword riscvFInstruction          fminm.h fmaxm.h
endif
" I-type: round-to-integer
syn keyword riscvFInstruction          fround.s froundnx.s
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_d")
    syn keyword riscvFInstruction          fround.d froundnx.d
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_q")
    syn keyword riscvFInstruction          fround.q froundnx.q
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zfh")
    syn keyword riscvFInstruction          fround.h froundnx.h
endif
" I-type: modular convert-to-integer
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_d")
    syn keyword riscvFInstruction          fcvtmod.w.d
endif
" I-type: move
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32 && exists("b:riscv_asm_d")
    syn keyword riscvFInstruction          fmvh.x.d fmvp.d.x
endif
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 64 && exists("b:riscv_asm_q")
    syn keyword riscvFInstruction          fmvh.x.q fmvp.q.x
endif
" R-type: comparison
syn keyword riscvFInstruction          fleq.s fltq.s
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_d")
    syn keyword riscvFInstruction          fleq.d fltq.d
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_q")
    syn keyword riscvFInstruction          fleq.q fltq.q
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zfh")
    syn keyword riscvFInstruction          fleq.h fltq.h
endif

if !exists("b:riscv_asm_f")
    let b:riscv_asm_f = b:riscv_asm_f_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_f"
    runtime! syntax/riscv-isas/riscv_asm_f.vim
endif

let b:riscv_asm_defined_zfa = 0
