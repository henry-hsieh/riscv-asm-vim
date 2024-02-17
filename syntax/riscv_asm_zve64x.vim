if exists("b:riscv_asm_defined_zve64x")
    finish
endif

" Instructions
" Vector Unit-Stride Instructions
syn keyword riscvVInstruction          vle64.v vse64.v
" Vector Strided Instructions
syn keyword riscvVInstruction          vlse64.v vsse64.v
" Vector Indexed Instructions
syn keyword riscvVInstruction          vluxei64.v vloxei64.v vsuxei64.v vsoxei64.v
" Unit-stride Fault-Only-First Loads
syn keyword riscvVInstruction          vle64ff.v
" Vector Load/Store Segment Instructions
" Vector Unit-Stride Segment Loads and Stores
syn keyword riscvVInstruction          vlseg2e64.v vlseg3e64.v vlseg4e64.v vlseg5e64.v vlseg6e64.v vlseg7e64.v vlseg8e64.v
syn keyword riscvVInstruction          vsseg2e64.v vsseg3e64.v vsseg4e64.v vsseg5e64.v vsseg6e64.v vsseg7e64.v vsseg8e64.v
" Vector Strided Segment Loads and Stores
syn keyword riscvVInstruction          vlsseg2e64.v vlsseg3e64.v vlsseg4e64.v vlsseg5e64.v vlsseg6e64.v vlsseg7e64.v vlsseg8e64.v
syn keyword riscvVInstruction          vssseg2e64.v vssseg3e64.v vssseg4e64.v vssseg5e64.v vssseg6e64.v vssseg7e64.v vssseg8e64.v
" Vector Indexed Segment Loads and Stores
syn keyword riscvVInstruction          vluxseg2e64.v vluxseg3e64.v vluxseg4e64.v vluxseg5e64.v vluxseg6e64.v vluxseg7e64.v vluxseg8e64.v
syn keyword riscvVInstruction          vloxseg2e64.v vloxseg3e64.v vloxseg4e64.v vloxseg5e64.v vloxseg6e64.v vloxseg7e64.v vloxseg8e64.v
syn keyword riscvVInstruction          vsuxseg2e64.v vsuxseg3e64.v vsuxseg4e64.v vsuxseg5e64.v vsuxseg6e64.v vsuxseg7e64.v vsuxseg8e64.v
syn keyword riscvVInstruction          vsoxseg2e64.v vsoxseg3e64.v vsoxseg4e64.v vsoxseg5e64.v vsoxseg6e64.v vsoxseg7e64.v vsoxseg8e64.v
" Vector Load Whole Register Instructions
syn keyword riscvVInstruction          vl1re64.v vl2re64.v vl4re64.v vl8re64.v

if !exists("b:riscv_asm_zve32x")
    let b:riscv_asm_zve32x = b:riscv_asm_zve32x_max
    runtime! syntax/riscv_asm_zve32x.vim
endif

let b:riscv_asm_defined_zve64x = 0
