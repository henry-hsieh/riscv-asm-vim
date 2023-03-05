if exists("b:riscv_asm_defined_zxm")
    finish
endif

" Control Status Register
" Machine Information Registers
syn keyword riscvMCSRegister           mvendorid marchid mimpid mhartid
" Machine Trap Setup
syn keyword riscvMCSRegister           mstatus misa medeleg mideleg mie mtvec mcounteren
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
    syn keyword riscvMCSRegister           mstatush
endif
" Machine Trap Handling
syn keyword riscvMCSRegister           mscratch mepc mcause mtval mip mtinst mtval2
" Machine Memory Protection
syn keyword riscvMCSRegister           pmpcfg0 pmpcfg2 pmpcfg4 pmpcfg6 pmpcfg8 pmpcfg10 pmpcfg12 pmpcfg14
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
    syn keyword riscvMCSRegister           pmpcfg1 pmpcfg3 pmpcfg5 pmpcfg7 pmpcfg9 pmpcfg11 pmpcfg13 pmpcfg15
endif
syn keyword riscvMCSRegister           pmpaddr0 pmpaddr1 pmpaddr2 pmpaddr3 pmpaddr4 pmpaddr5 pmpaddr6 pmpaddr7 pmpaddr8 pmpaddr9 pmpaddr10 pmpaddr11 pmpaddr12 pmpaddr13 pmpaddr14 pmpaddr15
syn keyword riscvMCSRegister           pmpaddr16 pmpaddr17 pmpaddr18 pmpaddr19 pmpaddr20 pmpaddr21 pmpaddr22 pmpaddr23 pmpaddr24 pmpaddr25 pmpaddr26 pmpaddr27 pmpaddr28 pmpaddr29 pmpaddr30 pmpaddr31
syn keyword riscvMCSRegister           pmpaddr32 pmpaddr33 pmpaddr34 pmpaddr35 pmpaddr36 pmpaddr37 pmpaddr38 pmpaddr39 pmpaddr40 pmpaddr41 pmpaddr42 pmpaddr43 pmpaddr44 pmpaddr45 pmpaddr46 pmpaddr47
syn keyword riscvMCSRegister           pmpaddr48 pmpaddr49 pmpaddr50 pmpaddr51 pmpaddr52 pmpaddr53 pmpaddr54 pmpaddr55 pmpaddr56 pmpaddr57 pmpaddr58 pmpaddr59 pmpaddr60 pmpaddr61 pmpaddr62 pmpaddr63
" Machine Counter/Timers
syn keyword riscvMCSRegister           mcycle minstret mhpmcounter3 mhpmcounter4 mhpmcounter5 mhpmcounter6 mhpmcounter7 mhpmcounter8 mhpmcounter9 mhpmcounter10 mhpmcounter11 mhpmcounter12 mhpmcounter13 mhpmcounter14 mhpmcounter15 mhpmcounter16
syn keyword riscvMCSRegister           mhpmcounter17 mhpmcounter18 mhpmcounter19 mhpmcounter20 mhpmcounter21 mhpmcounter22 mhpmcounter23 mhpmcounter24 mhpmcounter25 mhpmcounter26 mhpmcounter27 mhpmcounter28 mhpmcounter29 mhpmcounter30 mhpmcounter31
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
    syn keyword riscvMCSRegister           mcycleh minstreth mhpmcounter3h mhpmcounter4h mhpmcounter5h mhpmcounter6h mhpmcounter7h mhpmcounter8h mhpmcounter9h mhpmcounter10h mhpmcounter11h mhpmcounter12h mhpmcounter13h mhpmcounter14h mhpmcounter15h mhpmcounter16h
    syn keyword riscvMCSRegister           mhpmcounter17h mhpmcounter18h mhpmcounter19h mhpmcounter20h mhpmcounter21h mhpmcounter22h mhpmcounter23h mhpmcounter24h mhpmcounter25h mhpmcounter26h mhpmcounter27h mhpmcounter28h mhpmcounter29h mhpmcounter30h mhpmcounter31h
endif
" Machine Counter Setup
syn keyword riscvMCSRegister           mcountinhibit mhpmevent3 mhpmevent4 mhpmevent5 mhpmevent6 mhpmevent7 mhpmevent8 mhpmevent9 mhpmevent10 mhpmevent11 mhpmevent12 mhpmevent13 mhpmevent14 mhpmevent15 mhpmevent16
syn keyword riscvMCSRegister           mhpmevent17 mhpmevent18 mhpmevent19 mhpmevent20 mhpmevent21 mhpmevent22 mhpmevent23 mhpmevent24 mhpmevent25 mhpmevent26 mhpmevent27 mhpmevent28 mhpmevent29 mhpmevent30 mhpmevent31

" Instructions
syn keyword riscvZxmInstruction        mret wfi

let b:riscv_asm_defined_zxm = 0
