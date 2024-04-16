if exists("b:riscv_asm_defined_svinval")
    finish
endif

" Instructions
" Fine-Grained Address-Translation Cache Invalidation
syn keyword riscvSvInstruction         sinval.vma sfence.w.inval sfence.inval.ir
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_h")
    syn keyword riscvSvInstruction         hinval.vvma hinval.gvma
endif

if !exists("b:riscv_asm_ss")
    let b:riscv_asm_ss = b:riscv_asm_ss_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_ss"
    runtime! syntax/riscv-isas/riscv_asm_ss.vim
endif

let b:riscv_asm_defined_svinval = 0
