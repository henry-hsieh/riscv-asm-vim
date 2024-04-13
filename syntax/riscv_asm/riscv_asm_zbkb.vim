if exists("b:riscv_asm_defined_zbkb")
    finish
endif

" Instructions
" Bitwise Rotation
syn keyword riscvBInstruction          rol ror rori
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
  syn keyword riscvBInstruction          rolw roriw rorw
endif
" Logical With Negate
syn keyword riscvBInstruction          andn orn xnor
" Pack
syn keyword riscvBInstruction          pack packh
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen > 32
    syn keyword riscvBInstruction          packw
endif
" Bit-Reverse in Byte
syn keyword riscvBInstruction          brev8
" Byte-Reverse
syn keyword riscvBInstruction          rev8
" Zip/Unzip
if exists("b:riscv_asm_all_enable") || b:riscv_asm_xlen == 32
    syn keyword riscvBInstruction          zip unzip
endif

let b:riscv_asm_defined_zbkb = 0
