if exists("b:riscv_asm_defined_zvbb")
    finish
endif

" Instructions
" Vector Reverse Bits in Elements/Bytes
syn keyword riscvVInstruction          vbrev.v
" Vector Count Leading/Trailing Zeros
syn keyword riscvVInstruction          vclz.v vctz.v
" Vector Count Number of Bits Set in Each Element
syn keyword riscvVInstruction          vcpop.v
" Vector Widening Logical Shift Left
syn keyword riscvVInstruction          vwsll.vv vwsll.vx vwsll.vi

if !exists("b:riscv_asm_zvkb")
    let b:riscv_asm_zvkb = b:riscv_asm_zvkb_max
    runtime! syntax/riscv_asm_zvkb.vim
endif

let b:riscv_asm_defined_zvbb = 0
