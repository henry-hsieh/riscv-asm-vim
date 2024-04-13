if exists("b:riscv_asm_defined_zcd")
    finish
endif

" Instructions
" CL-type
syn keyword riscvCInstruction          c.fld
" CS-type
syn keyword riscvCInstruction          c.fsd
" CI-type
syn keyword riscvCInstruction          c.fldsp
" CSS-type
syn keyword riscvCInstruction          c.fsdsp

if !exists("b:riscv_asm_zca")
    let b:riscv_asm_zca = b:riscv_asm_zca_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zca"
    runtime! syntax/riscv_asm_zca.vim
endif
if !exists("b:riscv_asm_d")
    let b:riscv_asm_d = b:riscv_asm_d_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_d"
    runtime! syntax/riscv_asm_d.vim
endif

let b:riscv_asm_defined_zcd = 0
