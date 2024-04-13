if exists("b:riscv_asm_defined_smaia")
    finish
endif

" Control Status Register
" Machine-Level Window to Indirectly Accessed Registers
syn keyword riscvMCSRegister           miselect mireg
" Machine-Level Interrupts
syn keyword riscvMCSRegister           mtopei mtopi
" Virtual Interrupts for Supervisor Level
syn keyword riscvMCSRegister           mvien mvip
" Machine-Level High-Half CSRs for Interrupts 32–63
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
    syn keyword riscvMCSRegister           midelegh mieh mvienh mviph miph
endif

if !exists("b:riscv_asm_ssaia")
    let b:riscv_asm_ssaia = b:riscv_asm_ssaia_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_ssaia"
    runtime! syntax/riscv_asm_ssaia.vim
endif
if !exists("b:riscv_asm_sm")
    let b:riscv_asm_sm = b:riscv_asm_sm_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_sm"
    runtime! syntax/riscv_asm_sm.vim
endif

let b:riscv_asm_defined_smaia = 0
