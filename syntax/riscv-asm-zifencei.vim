if exists("b:riscv_asm_defined_zifencei")
    finish
endif

syn keyword riscvZifenceiInstruction   fence.i

let b:riscv_asm_defined_zifencei = 0
