if exists("b:riscv_asm_defined_zicsr")
    finish
endif

" Control Status Register
" User Counter/Timers
syn keyword riscvUCSRegister           cycle time instret hpmcounter3 hpmcounter4 hpmcounter5 hpmcounter6 hpmcounter7 hpmcounter8 hpmcounter9 hpmcounter10 hpmcounter11 hpmcounter12 hpmcounter13 hpmcounter14 hpmcounter15 hpmcounter16
syn keyword riscvUCSRegister           hpmcounter17 hpmcounter18 hpmcounter19 hpmcounter20 hpmcounter21 hpmcounter22 hpmcounter23 hpmcounter24 hpmcounter25 hpmcounter26 hpmcounter27 hpmcounter28 hpmcounter29 hpmcounter30 hpmcounter31
if exists("b:riscv_asm_all_enable") || b:riscv_asm_addr_bit == 32
    syn keyword riscvUCSRegister           cycleh timeh instreth hpmcounter3h hpmcounter4h hpmcounter5h hpmcounter6h hpmcounter7h hpmcounter8h hpmcounter9h hpmcounter10h hpmcounter11h hpmcounter12h hpmcounter13h hpmcounter14h hpmcounter15h hpmcounter16h
    syn keyword riscvUCSRegister           hpmcounter17h hpmcounter18h hpmcounter19h hpmcounter20h hpmcounter21h hpmcounter22h hpmcounter23h hpmcounter24h hpmcounter25h hpmcounter26h hpmcounter27h hpmcounter28h hpmcounter29h hpmcounter30h hpmcounter31h
endif

" Instructions
syn keyword riscvZicsrInstruction      csrrw csrrs csrrc csrrwi csrrsi csrrci

" Pseudo-instructions
syn keyword riscvZicsrInstruction      rdinstret rdcycle rdtime
if exists("b:riscv_asm_all_enable") || b:riscv_asm_addr_bit == 32
    syn keyword riscvZicsrInstruction      rdinstreth rdcycleh rdtimeh
endif
syn keyword riscvZicsrInstruction      csrr csrw csrs csrc
syn keyword riscvZicsrInstruction      csrwi csrsi csrci

if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_n")
    runtime! syntax/riscv_asm_n.vim
endif

if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_s")
    runtime! syntax/riscv_asm_s.vim
endif

if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_h")
    runtime! syntax/riscv_asm_h.vim
endif

if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zxm")
    runtime! syntax/riscv_asm_zxm.vim
endif

let b:riscv_asm_defined_zicsr = 0
