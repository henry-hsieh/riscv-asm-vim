if exists("b:riscv_asm_defined_zvbc")
    finish
endif

" Instructions
" Vector Carry-Less Multiply
syn keyword riscvVInstruction          vclmul.vv vclmul.vx
" Vector Carry-Less Multiply Return High Half
syn keyword riscvVInstruction          vclmulh.vv vclmulh.vx

if !exists("b:riscv_asm_zve32x")
    let b:riscv_asm_zve32x = b:riscv_asm_zve32x_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zve32x"
    runtime! syntax/riscv_asm_zve32x.vim
endif

let b:riscv_asm_defined_zvbc = 0
