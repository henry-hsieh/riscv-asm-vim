if exists("b:riscv_asm_defined_ssqosid")
    finish
endif

" Control Status Register
" Supervisor Resource Management Configuration Register
syn keyword riscvSCSRegister           srmcfg

if !exists("b:riscv_asm_ss")
    let b:riscv_asm_ss = b:riscv_asm_ss_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_ss"
    runtime! syntax/riscv_asm/riscv_asm_ss.vim
endif

let b:riscv_asm_defined_ssqosid = 0
