if exists("b:riscv_asm_defined_zvkb")
    finish
endif

" Instructions
" Vector And-Not
syn keyword riscvVInstruction          vandn.vv vandn.vx
" Vector Reverse Bits in Elements/Bytes
syn keyword riscvVInstruction          vbrev8.v
" Vector Reverse Bytes
syn keyword riscvVInstruction          vrev8.v
" Vector Rotate Left
syn keyword riscvVInstruction          vrol.vv vrol.vx
" Vector Rotate Right
syn keyword riscvVInstruction          vror.vv vror.vx vror.vi

if !exists("b:riscv_asm_zve32x")
    let b:riscv_asm_zve32x = b:riscv_asm_zve32x_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zve32x"
    runtime! syntax/riscv_asm/riscv_asm_zve32x.vim
endif

let b:riscv_asm_defined_zvkb = 0
