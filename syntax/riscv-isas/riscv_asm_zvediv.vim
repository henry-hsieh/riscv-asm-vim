if exists("b:riscv_asm_defined_zvediv")
    finish
endif

" Instructions
" Vector Integer Dot-Product Instruction
syn keyword riscvVInstruction          vdot.vv vdotu.vv
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_v") || exists("b:riscv_asm_zve32f") || exists("b:riscv_asm_zve64f") || exists("b:riscv_asm_zve64d")
    " Vector Floating-Point Dot Product Instruction
    syn keyword riscvVInstruction          vfdot.vv
endif

if !exists("b:riscv_asm_zve32x")
    let b:riscv_asm_zve32x = b:riscv_asm_zve32x_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zve32x"
    runtime! syntax/riscv-isas/riscv_asm_zve32x.vim
endif

let b:riscv_asm_defined_zvediv = 0
