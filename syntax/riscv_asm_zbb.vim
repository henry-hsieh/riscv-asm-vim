if exists("b:riscv_asm_defined_zbb")
    finish
endif

" Instructions
" Logical With Negate
syn keyword riscvBInstruction          andn orn xnor
" Count Leading/Trailing Zero Bits
syn keyword riscvBInstruction          clz ctz
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    syn keyword riscvBInstruction          clzw ctzw
endif
" Count Population
syn keyword riscvBInstruction          cpop
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    syn keyword riscvBInstruction          cpopw
endif
" Integer Minimum/Maximum
syn keyword riscvBInstruction          max maxu min minu
" Sign- and Zero-Extension
syn keyword riscvBInstruction          sext.b sext.h zext.h
" Bitwise Rotation
syn keyword riscvBInstruction          rol ror rori
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    syn keyword riscvBInstruction          rolw roriw rorw
endif
" OR Combine
syn keyword riscvBInstruction          orc.b
" Byte-Reverse
syn keyword riscvBInstruction          rev8

let b:riscv_asm_defined_zbb = 0
