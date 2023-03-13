if exists("b:riscv_asm_defined_zvkg")
    finish
endif

" Instructions
" Vector GHASH Add-Multiply
syn keyword riscvVInstruction          vghsh.vv
" Vector GHASH Multiply
syn keyword riscvVInstruction          vgmul.vv

if !exists("b:riscv_asm_zve32x")
    let b:riscv_asm_zve32x = b:riscv_asm_zve32x_max
    runtime! syntax/riscv_asm_zve32x.vim
endif

let b:riscv_asm_defined_zvkg = 0
