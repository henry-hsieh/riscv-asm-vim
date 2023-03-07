if exists("b:riscv_asm_defined_zfa")
    finish
endif

" Instructions
" I-type: load-immediate
syn keyword riscvZfaInstruction        fli.s
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_d")
    syn keyword riscvZfaInstruction        fli.d
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_q")
    syn keyword riscvZfaInstruction        fli.q
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zfh")
    syn keyword riscvZfaInstruction        fli.h
endif
" R-type: min/max
syn keyword riscvZfaInstruction        fminm.s fmaxm.s
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_d")
    syn keyword riscvZfaInstruction        fminm.d fmaxm.d
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_q")
    syn keyword riscvZfaInstruction        fminm.q fmaxm.q
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zfh")
    syn keyword riscvZfaInstruction        fminm.h fmaxm.h
endif
" I-type: round-to-integer
syn keyword riscvZfaInstruction        fround.s froundnx.s
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_d")
    syn keyword riscvZfaInstruction        fround.d froundnx.d
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_q")
    syn keyword riscvZfaInstruction        fround.q froundnx.q
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zfh")
    syn keyword riscvZfaInstruction        fround.h froundnx.h
endif
" I-type: modular convert-to-integer
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_d")
    syn keyword riscvZfaInstruction        fcvtmod.w.d
endif
" I-type: move
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32 && exists("b:riscv_asm_d")
    syn keyword riscvZfaInstruction        fmvh.x.d fmvp.d.x
endif
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 64 && exists("b:riscv_asm_q")
    syn keyword riscvZfaInstruction        fmvh.x.q fmvp.q.x
endif
" R-type: comparison
syn keyword riscvZfaInstruction        fleq.s fltq.s
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_d")
    syn keyword riscvZfaInstruction        fleq.d fltq.d
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_q")
    syn keyword riscvZfaInstruction        fleq.q fltq.q
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zfh")
    syn keyword riscvZfaInstruction        fleq.h fltq.h
endif

if !exists("b:riscv_asm_f")
    let b:riscv_asm_f = b:riscv_asm_f_max
    runtime! syntax/riscv_asm_f.vim
endif

let b:riscv_asm_defined_zfa = 0
