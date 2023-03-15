if exists("b:riscv_asm_defined_zca")
    finish
endif

" Instructions
" CIW-type
syn keyword riscvCInstruction          c.addi4spn
" CL-type
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 128
    syn keyword riscvCInstruction          c.lq
endif
syn keyword riscvCInstruction          c.lw
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen >= 64
    syn keyword riscvCInstruction          c.ld
endif
" CS-type
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 128
    syn keyword riscvCInstruction          c.sq
endif
syn keyword riscvCInstruction          c.sw
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen >= 64
    syn keyword riscvCInstruction          c.sd
endif
" CI-type
syn keyword riscvCInstruction          c.nop c.addi
" CJ-type
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
    syn keyword riscvCInstruction          c.jal
endif
" CI-type
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen >= 64
    syn keyword riscvCInstruction          c.addiw
endif
syn keyword riscvCInstruction          c.li c.addi16sp c.lui
" CB-type
syn keyword riscvCInstruction          c.srli
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 128
    syn keyword riscvCInstruction          c.srli64
endif
syn keyword riscvCInstruction          c.srai
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 128
    syn keyword riscvCInstruction          c.srai64
endif
syn keyword riscvCInstruction          c.andi
" CA-type
syn keyword riscvCInstruction          c.sub c.xor c.or c.and
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen >= 64
    syn keyword riscvCInstruction          c.subw c.addw
endif
" CJ-type
syn keyword riscvCInstruction          c.j
" CB-type
syn keyword riscvCInstruction          c.beqz c.bnez
" CI-type
syn keyword riscvCInstruction          c.slli
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 128
    syn keyword riscvCInstruction          c.slli64
endif
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 128
    syn keyword riscvCInstruction          c.lqsp
endif
syn keyword riscvCInstruction          c.lwsp
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen >= 64
    syn keyword riscvCInstruction          c.ldsp
endif
syn keyword riscvCInstruction          c.jr
" CR-type
syn keyword riscvCInstruction          c.mv
" CI-type
syn keyword riscvCInstruction          c.ebreak c.jalr
" CR-type
syn keyword riscvCInstruction          c.add
" CSS-type
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 128
    syn keyword riscvCInstruction          c.sqsp
endif
syn keyword riscvCInstruction          c.swsp
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen >= 64
    syn keyword riscvCInstruction          c.sdsp
endif

let b:riscv_asm_defined_zca = 0
