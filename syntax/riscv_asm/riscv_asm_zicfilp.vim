if exists("b:riscv_asm_defined_zicfilp")
    finish
endif

" Instructions
" Landing Pad Instructions
syn keyword riscvIInstruction          lpad

if !exists("b:riscv_asm_zicsr")
    let b:riscv_asm_zicsr = b:riscv_asm_zicsr_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zicsr"
    runtime! syntax/riscv_asm/riscv_asm_zicsr.vim
endif

let b:riscv_asm_defined_zicfilp = 0
