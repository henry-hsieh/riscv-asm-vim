if exists("b:riscv_asm_defined_zihpm")
    finish
endif

" Control Status Register
" User Counter/Timers
syn keyword riscvUCSRegister           hpmcounter3 hpmcounter4 hpmcounter5 hpmcounter6 hpmcounter7 hpmcounter8 hpmcounter9 hpmcounter10 hpmcounter11 hpmcounter12 hpmcounter13 hpmcounter14 hpmcounter15 hpmcounter16
syn keyword riscvUCSRegister           hpmcounter17 hpmcounter18 hpmcounter19 hpmcounter20 hpmcounter21 hpmcounter22 hpmcounter23 hpmcounter24 hpmcounter25 hpmcounter26 hpmcounter27 hpmcounter28 hpmcounter29 hpmcounter30 hpmcounter31
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
    syn keyword riscvUCSRegister           hpmcounter3h hpmcounter4h hpmcounter5h hpmcounter6h hpmcounter7h hpmcounter8h hpmcounter9h hpmcounter10h hpmcounter11h hpmcounter12h hpmcounter13h hpmcounter14h hpmcounter15h hpmcounter16h
    syn keyword riscvUCSRegister           hpmcounter17h hpmcounter18h hpmcounter19h hpmcounter20h hpmcounter21h hpmcounter22h hpmcounter23h hpmcounter24h hpmcounter25h hpmcounter26h hpmcounter27h hpmcounter28h hpmcounter29h hpmcounter30h hpmcounter31h
endif

if !exists("b:riscv_asm_zicsr")
    let b:riscv_asm_zicsr = b:riscv_asm_zicsr_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zicsr"
    runtime! syntax/riscv_asm_zicsr.vim
endif

let b:riscv_asm_defined_zihpm = 0
