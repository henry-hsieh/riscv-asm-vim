if exists("b:riscv_asm_defined_zvfbfmin")
    finish
endif

" Instructions
" Vector BF16 Coversion
syn keyword riscvVInstruction          vfncvtbf16.f.f.w vfwcvtbf16.f.f.v

if !exists("b:riscv_asm_zve32f")
    let b:riscv_asm_zve32f = b:riscv_asm_zve32f_max
    runtime! syntax/riscv_asm_zve32f.vim
endif

let b:riscv_asm_defined_zvfbfmin = 0
