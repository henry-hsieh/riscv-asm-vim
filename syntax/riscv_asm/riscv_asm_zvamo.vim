if exists("b:riscv_asm_defined_zvamo")
    finish
endif

" Instructions
" Vector AMO Instructions
syn keyword riscvVInstruction          vamoswapei8.v vamoaddei8.v vamoxorei8.v vamoandei8.v vamoorei8.v vamominei8.v vamomaxei8.v vamominuei8.v vamomaxuei8.v
syn keyword riscvVInstruction          vamoswapei16.v vamoaddei16.v vamoxorei16.v vamoandei16.v vamoorei16.v vamominei16.v vamomaxei16.v vamominuei16.v vamomaxuei16.v
syn keyword riscvVInstruction          vamoswapei32.v vamoaddei32.v vamoxorei32.v vamoandei32.v vamoorei32.v vamominei32.v vamomaxei32.v vamominuei32.v vamomaxuei32.v
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_v") || exists("b:riscv_asm_zve64x") || exists("b:riscv_asm_zve64f") || exists("b:riscv_asm_zve64d")
    syn keyword riscvVInstruction          vamoswapei64.v vamoaddei64.v vamoxorei64.v vamoandei64.v vamoorei64.v vamominei64.v vamomaxei64.v vamominuei64.v vamomaxuei64.v
endif

if !exists("b:riscv_asm_zve32x")
    let b:riscv_asm_zve32x = b:riscv_asm_zve32x_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zve32x"
    runtime! syntax/riscv_asm/riscv_asm_zve32x.vim
endif

let b:riscv_asm_defined_zvamo = 0
