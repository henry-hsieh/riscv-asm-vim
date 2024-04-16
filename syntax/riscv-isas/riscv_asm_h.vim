if exists("b:riscv_asm_defined_h")
    finish
endif

" Control Status Register
" Hypervisor Trap Setup
syn keyword riscvHCSRegister           hstatus hedeleg hideleg hie hcounteren hgeie
" Hypervisor Trap Handling
syn keyword riscvHCSRegister           htval hip hvip htinst hgeip
" Hypervisor Configuration
syn keyword riscvHCSRegister           henvcfg
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
    syn keyword riscvHCSRegister           henvcfgh
endif
" Hypervisor Protection and Translation
syn keyword riscvHCSRegister           hgatp
" Hypervisor Counter/Timers Virtualization Registers
syn keyword riscvHCSRegister           htimedelta
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
    syn keyword riscvHCSRegister           htimedeltah
endif
" Virtual Supervisor Registers
syn keyword riscvHCSRegister           vsstatus vsie vstvec vsscratch vsepc vscause vstval vsip vsatp

" Instructions
syn keyword riscvHInstruction          hfence.vvma hfence.gvma
syn keyword riscvHInstruction          hlv.b hlv.bu hlv.h hlv.hu hlvx.hu hlv.w hlvx.wu hsv.b hsv.h hsv.w
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    syn keyword riscvHInstruction          hlv.wu hlv.d hsv.d
endif

if !exists("b:riscv_asm_ss")
    let b:riscv_asm_ss = b:riscv_asm_ss_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_ss"
    runtime! syntax/riscv-isas/riscv_asm_ss.vim
endif
if !exists("b:riscv_asm_zicsr")
    let b:riscv_asm_zicsr = b:riscv_asm_zicsr_max
    let b:undo_ftplugin .= "| unlet! b:riscv_asm_zicsr"
    runtime! syntax/riscv-isas/riscv_asm_zicsr.vim
endif

let b:riscv_asm_defined_h = 0
