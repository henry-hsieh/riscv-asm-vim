if exists("b:riscv_asm_defined_zvfbfwma")
    finish
endif

" Instructions
" Vector BF16 Widening Multiply-Accumulate
syn keyword riscvVInstruction          vfwmaccbf16.vv vfwmaccbf16.vf

if !exists("b:riscv_asm_zvfbfmin")
    let b:riscv_asm_zvfbfmin = b:riscv_asm_zvfbfmin_max
    runtime! syntax/riscv_asm_zvfbfmin.vim
endif

let b:riscv_asm_defined_zvfbfwma = 0
