if exists("b:riscv_asm_defined_h")
    finish
endif

" Control Status Register
" Hypervisor Trap Setup
syn keyword riscvHCSRegister           hstatus hedeleg hideleg hie hcounteren hgeie
" Hypervisor Trap Handling
syn keyword riscvHCSRegister           htval hip hvip htinst hgeip
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
syn keyword riscvHInstruction          hfence.vvma hfencs.gvma
syn keyword riscvHInstruction          hlv.b hlv.bu hlv.h hlv.hu hlvx.hu hlv.w hlvx.wu hsv.b hsv.h hsv.w
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    syn keyword riscvHInstruction          hlv.wu hlv.d hsv.d
endif

let b:riscv_asm_defined_h = 0
