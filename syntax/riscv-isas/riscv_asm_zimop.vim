if exists("b:riscv_asm_defined_zimop")
    finish
endif

" Instructions
" May Be Operations
syn keyword riscvIInstruction          mop.r.0 mop.r.1 mop.r.2 mop.r.3 mop.r.4 mop.r.5 mop.r.6 mop.r.7
syn keyword riscvIInstruction          mop.r.8 mop.r.9 mop.r.10 mop.r.11 mop.r.12 mop.r.13 mop.r.14 mop.r.15
syn keyword riscvIInstruction          mop.r.16 mop.r.17 mop.r.18 mop.r.19 mop.r.20 mop.r.21 mop.r.22 mop.r.23
syn keyword riscvIInstruction          mop.r.24 mop.r.25 mop.r.26 mop.r.27 mop.r.28 mop.r.29 mop.r.30 mop.r.31
syn keyword riscvIInstruction          mop.rr.0 mop.rr.1 mop.rr.2 mop.rr.3 mop.rr.4 mop.rr.5 mop.rr.6 mop.rr.7

let b:riscv_asm_defined_zimop = 0
