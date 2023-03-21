if exists("b:riscv_asm_defined_zvbb")
    finish
endif

" Instructions
" Vector And-Not
syn keyword riscvVInstruction          vandn.vv vandn.vx
" Vector Reverse Bits in Elements/Bytes
syn keyword riscvVInstruction          vbrev.v vbrev8.v
" Vector Reverse Bytes
syn keyword riscvVInstruction          vrev8.v
" Vector Count Leading/Trailing Zeros
syn keyword riscvVInstruction          vclz.v vctz.v
" Vector Count Number of Bits Set in Each Element
syn keyword riscvVInstruction          vcpop.v
" Vector Rotate Left
syn keyword riscvVInstruction          vrol.vv vrol.vx
" Vector Rotate Right
syn keyword riscvVInstruction          vror.vv vror.vx vror.vi
" Vector Widening Logical Shift Left
syn keyword riscvVInstruction          vwsll.vv vwsll.vx vwsll.vi

if !exists("b:riscv_asm_zve32x")
    let b:riscv_asm_zve32x = b:riscv_asm_zve32x_max
    runtime! syntax/riscv_asm_zve32x.vim
endif

let b:riscv_asm_defined_zvbb = 0
