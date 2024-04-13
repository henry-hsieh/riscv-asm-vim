if exists("b:riscv_asm_defined_zifencei")
    finish
endif

syn keyword riscvIInstruction          fence.i

let b:riscv_asm_defined_zifencei = 0
