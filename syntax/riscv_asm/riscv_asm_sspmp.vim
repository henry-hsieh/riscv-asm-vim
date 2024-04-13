if exists("b:riscv_asm_defined_sspmp")
    finish
endif

" Control Status Register
" Supervisor Memory Protection
syn keyword riscvSCSRegister           spmpcfg0 spmpcfg2 spmpcfg4 spmpcfg6 spmpcfg8 spmpcfg10 spmpcfg12 spmpcfg14
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
    syn keyword riscvSCSRegister           spmpcfg1 spmpcfg3 spmpcfg5 spmpcfg7 spmpcfg9 spmpcfg11 spmpcfg13 spmpcfg15
endif
syn keyword riscvSCSRegister           spmpaddr0 spmpaddr1 spmpaddr2 spmpaddr3 spmpaddr4 spmpaddr5 spmpaddr6 spmpaddr7 spmpaddr8 spmpaddr9 spmpaddr10 spmpaddr11 spmpaddr12 spmpaddr13 spmpaddr14 spmpaddr15
syn keyword riscvSCSRegister           spmpaddr16 spmpaddr17 spmpaddr18 spmpaddr19 spmpaddr20 spmpaddr21 spmpaddr22 spmpaddr23 spmpaddr24 spmpaddr25 spmpaddr26 spmpaddr27 spmpaddr28 spmpaddr29 spmpaddr30 spmpaddr31
syn keyword riscvSCSRegister           spmpaddr32 spmpaddr33 spmpaddr34 spmpaddr35 spmpaddr36 spmpaddr37 spmpaddr38 spmpaddr39 spmpaddr40 spmpaddr41 spmpaddr42 spmpaddr43 spmpaddr44 spmpaddr45 spmpaddr46 spmpaddr47
syn keyword riscvSCSRegister           spmpaddr48 spmpaddr49 spmpaddr50 spmpaddr51 spmpaddr52 spmpaddr53 spmpaddr54 spmpaddr55 spmpaddr56 spmpaddr57 spmpaddr58 spmpaddr59 spmpaddr60 spmpaddr61 spmpaddr62 spmpaddr63
syn keyword riscvSCSRegister           spmpswitch0
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
    syn keyword riscvSCSRegister           spmpswitch1
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_h")
    " Virtual Supervisor Memory Protection
    syn keyword riscvHCSRegister           vspmpcfg0 vspmpcfg2 vspmpcfg4 vspmpcfg6 vspmpcfg8 vspmpcfg10 vspmpcfg12 vspmpcfg14
    if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
        syn keyword riscvHCSRegister           vspmpcfg1 vspmpcfg3 vspmpcfg5 vspmpcfg7 vspmpcfg9 vspmpcfg11 vspmpcfg13 vspmpcfg15
    endif
    syn keyword riscvHCSRegister           vspmpaddr0 vspmpaddr1 vspmpaddr2 vspmpaddr3 vspmpaddr4 vspmpaddr5 vspmpaddr6 vspmpaddr7 vspmpaddr8 vspmpaddr9 vspmpaddr10 vspmpaddr11 vspmpaddr12 vspmpaddr13 vspmpaddr14 vspmpaddr15
    syn keyword riscvHCSRegister           vspmpaddr16 vspmpaddr17 vspmpaddr18 vspmpaddr19 vspmpaddr20 vspmpaddr21 vspmpaddr22 vspmpaddr23 vspmpaddr24 vspmpaddr25 vspmpaddr26 vspmpaddr27 vspmpaddr28 vspmpaddr29 vspmpaddr30 vspmpaddr31
    syn keyword riscvHCSRegister           vspmpaddr32 vspmpaddr33 vspmpaddr34 vspmpaddr35 vspmpaddr36 vspmpaddr37 vspmpaddr38 vspmpaddr39 vspmpaddr40 vspmpaddr41 vspmpaddr42 vspmpaddr43 vspmpaddr44 vspmpaddr45 vspmpaddr46 vspmpaddr47
    syn keyword riscvHCSRegister           vspmpaddr48 vspmpaddr49 vspmpaddr50 vspmpaddr51 vspmpaddr52 vspmpaddr53 vspmpaddr54 vspmpaddr55 vspmpaddr56 vspmpaddr57 vspmpaddr58 vspmpaddr59 vspmpaddr60 vspmpaddr61 vspmpaddr62 vspmpaddr63
    " Hypervisor Memory Protection from Guest
    syn keyword riscvHCSRegister           hgpmpcfg0 hgpmpcfg2 hgpmpcfg4 hgpmpcfg6 hgpmpcfg8 hgpmpcfg10 hgpmpcfg12 hgpmpcfg14
    if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
        syn keyword riscvHCSRegister           hgpmpcfg1 hgpmpcfg3 hgpmpcfg5 hgpmpcfg7 hgpmpcfg9 hgpmpcfg11 hgpmpcfg13 hgpmpcfg15
    endif
    syn keyword riscvHCSRegister           hgpmpaddr0 hgpmpaddr1 hgpmpaddr2 hgpmpaddr3 hgpmpaddr4 hgpmpaddr5 hgpmpaddr6 hgpmpaddr7 hgpmpaddr8 hgpmpaddr9 hgpmpaddr10 hgpmpaddr11 hgpmpaddr12 hgpmpaddr13 hgpmpaddr14 hgpmpaddr15
    syn keyword riscvHCSRegister           hgpmpaddr16 hgpmpaddr17 hgpmpaddr18 hgpmpaddr19 hgpmpaddr20 hgpmpaddr21 hgpmpaddr22 hgpmpaddr23 hgpmpaddr24 hgpmpaddr25 hgpmpaddr26 hgpmpaddr27 hgpmpaddr28 hgpmpaddr29 hgpmpaddr30 hgpmpaddr31
    syn keyword riscvHCSRegister           hgpmpaddr32 hgpmpaddr33 hgpmpaddr34 hgpmpaddr35 hgpmpaddr36 hgpmpaddr37 hgpmpaddr38 hgpmpaddr39 hgpmpaddr40 hgpmpaddr41 hgpmpaddr42 hgpmpaddr43 hgpmpaddr44 hgpmpaddr45 hgpmpaddr46 hgpmpaddr47
    syn keyword riscvHCSRegister           hgpmpaddr48 hgpmpaddr49 hgpmpaddr50 hgpmpaddr51 hgpmpaddr52 hgpmpaddr53 hgpmpaddr54 hgpmpaddr55 hgpmpaddr56 hgpmpaddr57 hgpmpaddr58 hgpmpaddr59 hgpmpaddr60 hgpmpaddr61 hgpmpaddr62 hgpmpaddr63
    syn keyword riscvHCSRegister           hgpmpswitch0
    if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
        syn keyword riscvHCSRegister           hgpmpswitch1
    endif
endif

if !exists("b:riscv_asm_ss")
    let b:riscv_asm_ss = b:riscv_asm_ss_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_ss"
    runtime! syntax/riscv_asm/riscv_asm_ss.vim
endif

let b:riscv_asm_defined_sspmp = 0
