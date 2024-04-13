if exists("b:riscv_asm_defined_zawrs")
    finish
endif

" Instructions
" Wait on Reservation Set
syn keyword riscvAInstruction          wrs.nto wrs.sto

if !exists("b:riscv_asm_a")
    let b:riscv_asm_a = b:riscv_asm_a_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_a"
    runtime! syntax/riscv_asm_a.vim
endif

let b:riscv_asm_defined_zawrs = 0
