if exists("b:riscv_asm_defined_zvkb")
    finish
endif

" Instructions
" Vector Carry-Less Multiply
syn keyword riscvVInstruction          vclmul.vv vclmul.vx
" Vector Carry-Less Multiply Return High Half
syn keyword riscvVInstruction          vclmulh.vv vclmulh.vx
" Vector Rotate Left
syn keyword riscvVInstruction          vrol.vv vrol.vx
" Vector Rotate Right
syn keyword riscvVInstruction          vror.vv vror.vx vror.vi
" Vector Reverse Bits in Bytes
syn keyword riscvVInstruction          vbrev8.v
" Vector Reverse Bytes
syn keyword riscvVInstruction          vrev8.v
" Vector And-Not
syn keyword riscvVInstruction          vandn.vv vandn.vx

if !exists("b:riscv_asm_zve32x")
    let b:riscv_asm_zve32x = b:riscv_asm_zve32x_max
    runtime! syntax/riscv_asm_zve32x.vim
endif

let b:riscv_asm_defined_zvkb = 0
