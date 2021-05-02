if exists("b:riscv_asm_defined_v")
    finish
endif

" Vector Register
syn keyword riscvVRegister             v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15
syn keyword riscvVRegister             v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30 v31

" Vector Mask Register
syn keyword riscvVRegister             v0.t

" Control-Status Register
syn keyword riscvUCSRegister           vstart vxsat vxrm vcsr vl vtype vlenb

" Instructions
" Configuration-Setting Instructions
syn keyword riscvVInstruction          vsetvli vsetvl
if exists("b:riscv_asm_all_enable") || b:riscv_asm_v_eew >= 8
    " Vector Unit-Stride Instructions
    syn keyword riscvVInstruction          vle8.v vse8.v
    " Vector Strided Instructions
    syn keyword riscvVInstruction          vlse8.v vsse8.v
    " Vector Indexed Instructions
    syn keyword riscvVInstruction          vluxei8.v vloxei8.v vsuxei8.v vsoxei8.v
    " Unit-stride Fault-Only-First Loads
    syn keyword riscvVInstruction          vle8ff.v
    " Vector Load/Store Segment Instructions (Zvlsseg)
    " Vector Unit-Stride Segment Loads and Stores
    syn keyword riscvVInstruction          vlseg1e8.v vlseg2e8.v vlseg3e8.v vlseg4e8.v vlseg5e8.v vlseg6e8.v vlseg7e8.v vlseg8e8.v
    syn keyword riscvVInstruction          vsseg1e8.v vsseg2e8.v vsseg3e8.v vsseg4e8.v vsseg5e8.v vsseg6e8.v vsseg7e8.v vsseg8e8.v
    " Vector Strided Segment Loads and Stores
    syn keyword riscvVInstruction          vlsseg1e8.v vlsseg2e8.v vlsseg3e8.v vlsseg4e8.v vlsseg5e8.v vlsseg6e8.v vlsseg7e8.v vlsseg8e8.v
    syn keyword riscvVInstruction          vssseg1e8.v vssseg2e8.v vssseg3e8.v vssseg4e8.v vssseg5e8.v vssseg6e8.v vssseg7e8.v vssseg8e8.v
    " Vector Indexed Segment Loads and Stores
    syn keyword riscvVInstruction          vluxseg1e8.v vluxseg2e8.v vluxseg3e8.v vluxseg4e8.v vluxseg5e8.v vluxseg6e8.v vluxseg7e8.v vluxseg8e8.v
    syn keyword riscvVInstruction          vloxseg1e8.v vloxseg2e8.v vloxseg3e8.v vloxseg4e8.v vloxseg5e8.v vloxseg6e8.v vloxseg7e8.v vloxseg8e8.v
    syn keyword riscvVInstruction          vsuxseg1e8.v vsuxseg2e8.v vsuxseg3e8.v vsuxseg4e8.v vsuxseg5e8.v vsuxseg6e8.v vsuxseg7e8.v vsuxseg8e8.v
    syn keyword riscvVInstruction          vsoxseg1e8.v vsoxseg2e8.v vsoxseg3e8.v vsoxseg4e8.v vsoxseg5e8.v vsoxseg6e8.v vsoxseg7e8.v vsoxseg8e8.v
    " Vector Load Whole Register Instructions
    syn keyword riscvVInstruction          vl1re8.v vl2re8.v vl4re8.v vl8re8.v
    " Vector AMO Instructions (zvamo)
    syn keyword riscvVInstruction          vamoswapei8.v vamoaddei8.v vamoxorei8.v vamoandei8.v vamoorei8.v vamominei8.v vamomaxei8.v vamominuei8.v vamomaxuei8.v
endif
if exists("b:riscv_asm_all_enable") || b:riscv_asm_v_eew >= 16
    " Vector Unit-Stride Instructions
    syn keyword riscvVInstruction          vle16.v vse16.v
    " Vector Strided Instructions
    syn keyword riscvVInstruction          vlse16.v vsse16.v
    " Vector Indexed Instructions
    syn keyword riscvVInstruction          vluxei16.v vloxei16.v vsuxei16.v vsoxei16.v
    " Unit-stride Fault-Only-First Loads
    syn keyword riscvVInstruction          vle16ff.v
    " Vector Load/Store Segment Instructions (Zvlsseg)
    " Vector Unit-Stride Segment Loads and Stores
    syn keyword riscvVInstruction          vlseg1e16.v vlseg2e16.v vlseg3e16.v vlseg4e16.v vlseg5e16.v vlseg6e16.v vlseg7e16.v vlseg8e16.v
    syn keyword riscvVInstruction          vsseg1e16.v vsseg2e16.v vsseg3e16.v vsseg4e16.v vsseg5e16.v vsseg6e16.v vsseg7e16.v vsseg8e16.v
    " Vector Strided Segment Loads and Stores
    syn keyword riscvVInstruction          vlsseg1e16.v vlsseg2e16.v vlsseg3e16.v vlsseg4e16.v vlsseg5e16.v vlsseg6e16.v vlsseg7e16.v vlsseg8e16.v
    syn keyword riscvVInstruction          vssseg1e16.v vssseg2e16.v vssseg3e16.v vssseg4e16.v vssseg5e16.v vssseg6e16.v vssseg7e16.v vssseg8e16.v
    " Vector Indexed Segment Loads and Stores
    syn keyword riscvVInstruction          vluxseg1e16.v vluxseg2e16.v vluxseg3e16.v vluxseg4e16.v vluxseg5e16.v vluxseg6e16.v vluxseg7e16.v vluxseg8e16.v
    syn keyword riscvVInstruction          vloxseg1e16.v vloxseg2e16.v vloxseg3e16.v vloxseg4e16.v vloxseg5e16.v vloxseg6e16.v vloxseg7e16.v vloxseg8e16.v
    syn keyword riscvVInstruction          vsuxseg1e16.v vsuxseg2e16.v vsuxseg3e16.v vsuxseg4e16.v vsuxseg5e16.v vsuxseg6e16.v vsuxseg7e16.v vsuxseg8e16.v
    syn keyword riscvVInstruction          vsoxseg1e16.v vsoxseg2e16.v vsoxseg3e16.v vsoxseg4e16.v vsoxseg5e16.v vsoxseg6e16.v vsoxseg7e16.v vsoxseg8e16.v
    " Vector Load Whole Register Instructions
    syn keyword riscvVInstruction          vl1re16.v vl2re16.v vl4re16.v vl8re16.v
    " Vector AMO Instructions (zvamo)
    syn keyword riscvVInstruction          vamoswapei16.v vamoaddei16.v vamoxorei16.v vamoandei16.v vamoorei16.v vamominei16.v vamomaxei16.v vamominuei16.v vamomaxuei16.v
endif
if exists("b:riscv_asm_all_enable") || b:riscv_asm_v_eew >= 32
    " Vector Unit-Stride Instructions
    syn keyword riscvVInstruction          vle32.v vse32.v
    " Vector Strided Instructions
    syn keyword riscvVInstruction          vlse32.v vsse32.v
    " Vector Indexed Instructions
    syn keyword riscvVInstruction          vluxei32.v vloxei32.v vsuxei32.v vsoxei32.v
    " Unit-stride Fault-Only-First Loads
    syn keyword riscvVInstruction          vle32ff.v
    " Vector Load/Store Segment Instructions (Zvlsseg)
    " Vector Unit-Stride Segment Loads and Stores
    syn keyword riscvVInstruction          vlseg1e32.v vlseg2e32.v vlseg3e32.v vlseg4e32.v vlseg5e32.v vlseg6e32.v vlseg7e32.v vlseg8e32.v
    syn keyword riscvVInstruction          vsseg1e32.v vsseg2e32.v vsseg3e32.v vsseg4e32.v vsseg5e32.v vsseg6e32.v vsseg7e32.v vsseg8e32.v
    " Vector Strided Segment Loads and Stores
    syn keyword riscvVInstruction          vlsseg1e32.v vlsseg2e32.v vlsseg3e32.v vlsseg4e32.v vlsseg5e32.v vlsseg6e32.v vlsseg7e32.v vlsseg8e32.v
    syn keyword riscvVInstruction          vssseg1e32.v vssseg2e32.v vssseg3e32.v vssseg4e32.v vssseg5e32.v vssseg6e32.v vssseg7e32.v vssseg8e32.v
    " Vector Indexed Segment Loads and Stores
    syn keyword riscvVInstruction          vluxseg1e32.v vluxseg2e32.v vluxseg3e32.v vluxseg4e32.v vluxseg5e32.v vluxseg6e32.v vluxseg7e32.v vluxseg8e32.v
    syn keyword riscvVInstruction          vloxseg1e32.v vloxseg2e32.v vloxseg3e32.v vloxseg4e32.v vloxseg5e32.v vloxseg6e32.v vloxseg7e32.v vloxseg8e32.v
    syn keyword riscvVInstruction          vsuxseg1e32.v vsuxseg2e32.v vsuxseg3e32.v vsuxseg4e32.v vsuxseg5e32.v vsuxseg6e32.v vsuxseg7e32.v vsuxseg8e32.v
    syn keyword riscvVInstruction          vsoxseg1e32.v vsoxseg2e32.v vsoxseg3e32.v vsoxseg4e32.v vsoxseg5e32.v vsoxseg6e32.v vsoxseg7e32.v vsoxseg8e32.v
    " Vector Load Whole Register Instructions
    syn keyword riscvVInstruction          vl1re32.v vl2re32.v vl4re32.v vl8re32.v
    " Vector AMO Instructions (zvamo)
    syn keyword riscvVInstruction          vamoswapei32.v vamoaddei32.v vamoxorei32.v vamoandei32.v vamoorei32.v vamominei32.v vamomaxei32.v vamominuei32.v vamomaxuei32.v
endif
if exists("b:riscv_asm_all_enable") || b:riscv_asm_v_eew >= 64
    " Vector Unit-Stride Instructions
    syn keyword riscvVInstruction          vle64.v vse64.v
    " Vector Strided Instructions
    syn keyword riscvVInstruction          vlse64.v vsse64.v
    " Vector Indexed Instructions
    syn keyword riscvVInstruction          vluxei64.v vloxei64.v vsuxei64.v vsoxei64.v
    " Unit-stride Fault-Only-First Loads
    syn keyword riscvVInstruction          vle64ff.v
    " Vector Load/Store Segment Instructions (Zvlsseg)
    " Vector Unit-Stride Segment Loads and Stores
    syn keyword riscvVInstruction          vlseg1e64.v vlseg2e64.v vlseg3e64.v vlseg4e64.v vlseg5e64.v vlseg6e64.v vlseg7e64.v vlseg8e64.v
    syn keyword riscvVInstruction          vsseg1e64.v vsseg2e64.v vsseg3e64.v vsseg4e64.v vsseg5e64.v vsseg6e64.v vsseg7e64.v vsseg8e64.v
    " Vector Strided Segment Loads and Stores
    syn keyword riscvVInstruction          vlsseg1e64.v vlsseg2e64.v vlsseg3e64.v vlsseg4e64.v vlsseg5e64.v vlsseg6e64.v vlsseg7e64.v vlsseg8e64.v
    syn keyword riscvVInstruction          vssseg1e64.v vssseg2e64.v vssseg3e64.v vssseg4e64.v vssseg5e64.v vssseg6e64.v vssseg7e64.v vssseg8e64.v
    " Vector Indexed Segment Loads and Stores
    syn keyword riscvVInstruction          vluxseg1e64.v vluxseg2e64.v vluxseg3e64.v vluxseg4e64.v vluxseg5e64.v vluxseg6e64.v vluxseg7e64.v vluxseg8e64.v
    syn keyword riscvVInstruction          vloxseg1e64.v vloxseg2e64.v vloxseg3e64.v vloxseg4e64.v vloxseg5e64.v vloxseg6e64.v vloxseg7e64.v vloxseg8e64.v
    syn keyword riscvVInstruction          vsuxseg1e64.v vsuxseg2e64.v vsuxseg3e64.v vsuxseg4e64.v vsuxseg5e64.v vsuxseg6e64.v vsuxseg7e64.v vsuxseg8e64.v
    syn keyword riscvVInstruction          vsoxseg1e64.v vsoxseg2e64.v vsoxseg3e64.v vsoxseg4e64.v vsoxseg5e64.v vsoxseg6e64.v vsoxseg7e64.v vsoxseg8e64.v
    " Vector Load Whole Register Instructions
    syn keyword riscvVInstruction          vl1re64.v vl2re64.v vl4re64.v vl8re64.v
    " Vector AMO Instructions (zvamo)
    syn keyword riscvVInstruction          vamoswapei64.v vamoaddei64.v vamoxorei64.v vamoandei64.v vamoorei64.v vamominei64.v vamomaxei64.v vamominuei64.v vamomaxuei64.v
endif
if exists("b:riscv_asm_all_enable") || b:riscv_asm_v_eew >= 128
    " Vector Unit-Stride Instructions
    syn keyword riscvVInstruction          vle128.v vse128.v
    " Vector Strided Instructions
    syn keyword riscvVInstruction          vlse128.v vsse128.v
    " Vector Indexed Instructions
    syn keyword riscvVInstruction          vluxei128.v vloxei128.v vsuxei128.v vsoxei128.v
    " Unit-stride Fault-Only-First Loads
    syn keyword riscvVInstruction          vle128ff.v
    " Vector Load/Store Segment Instructions (Zvlsseg)
    " Vector Unit-Stride Segment Loads and Stores
    syn keyword riscvVInstruction          vlseg1e128.v vlseg2e128.v vlseg3e128.v vlseg4e128.v vlseg5e128.v vlseg6e128.v vlseg7e128.v vlseg8e128.v
    syn keyword riscvVInstruction          vsseg1e128.v vsseg2e128.v vsseg3e128.v vsseg4e128.v vsseg5e128.v vsseg6e128.v vsseg7e128.v vsseg8e128.v
    " Vector Strided Segment Loads and Stores
    syn keyword riscvVInstruction          vlsseg1e128.v vlsseg2e128.v vlsseg3e128.v vlsseg4e128.v vlsseg5e128.v vlsseg6e128.v vlsseg7e128.v vlsseg8e128.v
    syn keyword riscvVInstruction          vssseg1e128.v vssseg2e128.v vssseg3e128.v vssseg4e128.v vssseg5e128.v vssseg6e128.v vssseg7e128.v vssseg8e128.v
    " Vector Indexed Segment Loads and Stores
    syn keyword riscvVInstruction          vluxseg1e128.v vluxseg2e128.v vluxseg3e128.v vluxseg4e128.v vluxseg5e128.v vluxseg6e128.v vluxseg7e128.v vluxseg8e128.v
    syn keyword riscvVInstruction          vloxseg1e128.v vloxseg2e128.v vloxseg3e128.v vloxseg4e128.v vloxseg5e128.v vloxseg6e128.v vloxseg7e128.v vloxseg8e128.v
    syn keyword riscvVInstruction          vsuxseg1e128.v vsuxseg2e128.v vsuxseg3e128.v vsuxseg4e128.v vsuxseg5e128.v vsuxseg6e128.v vsuxseg7e128.v vsuxseg8e128.v
    syn keyword riscvVInstruction          vsoxseg1e128.v vsoxseg2e128.v vsoxseg3e128.v vsoxseg4e128.v vsoxseg5e128.v vsoxseg6e128.v vsoxseg7e128.v vsoxseg8e128.v
    " Vector Load Whole Register Instructions
    syn keyword riscvVInstruction          vl1re128.v vl2re128.v vl4re128.v vl8re128.v
    " Vector AMO Instructions (zvamo)
    syn keyword riscvVInstruction          vamoswapei128.v vamoaddei128.v vamoxorei128.v vamoandei128.v vamoorei128.v vamominei128.v vamomaxei128.v vamominuei128.v vamomaxuei128.v
endif
if exists("b:riscv_asm_all_enable") || b:riscv_asm_v_eew >= 256
    " Vector Unit-Stride Instructions
    syn keyword riscvVInstruction          vle256.v vse256.v
    " Vector Strided Instructions
    syn keyword riscvVInstruction          vlse256.v vsse256.v
    " Vector Indexed Instructions
    syn keyword riscvVInstruction          vluxei256.v vloxei256.v vsuxei256.v vsoxei256.v
    " Unit-stride Fault-Only-First Loads
    syn keyword riscvVInstruction          vle256ff.v
    " Vector Load/Store Segment Instructions (Zvlsseg)
    " Vector Unit-Stride Segment Loads and Stores
    syn keyword riscvVInstruction          vlseg1e256.v vlseg2e256.v vlseg3e256.v vlseg4e256.v vlseg5e256.v vlseg6e256.v vlseg7e256.v vlseg8e256.v
    syn keyword riscvVInstruction          vsseg1e256.v vsseg2e256.v vsseg3e256.v vsseg4e256.v vsseg5e256.v vsseg6e256.v vsseg7e256.v vsseg8e256.v
    " Vector Strided Segment Loads and Stores
    syn keyword riscvVInstruction          vlsseg1e256.v vlsseg2e256.v vlsseg3e256.v vlsseg4e256.v vlsseg5e256.v vlsseg6e256.v vlsseg7e256.v vlsseg8e256.v
    syn keyword riscvVInstruction          vssseg1e256.v vssseg2e256.v vssseg3e256.v vssseg4e256.v vssseg5e256.v vssseg6e256.v vssseg7e256.v vssseg8e256.v
    " Vector Indexed Segment Loads and Stores
    syn keyword riscvVInstruction          vluxseg1e256.v vluxseg2e256.v vluxseg3e256.v vluxseg4e256.v vluxseg5e256.v vluxseg6e256.v vluxseg7e256.v vluxseg8e256.v
    syn keyword riscvVInstruction          vloxseg1e256.v vloxseg2e256.v vloxseg3e256.v vloxseg4e256.v vloxseg5e256.v vloxseg6e256.v vloxseg7e256.v vloxseg8e256.v
    syn keyword riscvVInstruction          vsuxseg1e256.v vsuxseg2e256.v vsuxseg3e256.v vsuxseg4e256.v vsuxseg5e256.v vsuxseg6e256.v vsuxseg7e256.v vsuxseg8e256.v
    syn keyword riscvVInstruction          vsoxseg1e256.v vsoxseg2e256.v vsoxseg3e256.v vsoxseg4e256.v vsoxseg5e256.v vsoxseg6e256.v vsoxseg7e256.v vsoxseg8e256.v
    " Vector Load Whole Register Instructions
    syn keyword riscvVInstruction          vl1re256.v vl2re256.v vl4re256.v vl8re256.v
    " Vector AMO Instructions (zvamo)
    syn keyword riscvVInstruction          vamoswapei256.v vamoaddei256.v vamoxorei256.v vamoandei256.v vamoorei256.v vamominei256.v vamomaxei256.v vamominuei256.v vamomaxuei256.v
endif
if exists("b:riscv_asm_all_enable") || b:riscv_asm_v_eew >= 512
    " Vector Unit-Stride Instructions
    syn keyword riscvVInstruction          vle512.v vse512.v
    " Vector Strided Instructions
    syn keyword riscvVInstruction          vlse512.v vsse512.v
    " Vector Indexed Instructions
    syn keyword riscvVInstruction          vluxei512.v vloxei512.v vsuxei512.v vsoxei512.v
    " Unit-stride Fault-Only-First Loads
    syn keyword riscvVInstruction          vle512ff.v
    " Vector Load/Store Segment Instructions (Zvlsseg)
    " Vector Unit-Stride Segment Loads and Stores
    syn keyword riscvVInstruction          vlseg1e512.v vlseg2e512.v vlseg3e512.v vlseg4e512.v vlseg5e512.v vlseg6e512.v vlseg7e512.v vlseg8e512.v
    syn keyword riscvVInstruction          vsseg1e512.v vsseg2e512.v vsseg3e512.v vsseg4e512.v vsseg5e512.v vsseg6e512.v vsseg7e512.v vsseg8e512.v
    " Vector Strided Segment Loads and Stores
    syn keyword riscvVInstruction          vlsseg1e512.v vlsseg2e512.v vlsseg3e512.v vlsseg4e512.v vlsseg5e512.v vlsseg6e512.v vlsseg7e512.v vlsseg8e512.v
    syn keyword riscvVInstruction          vssseg1e512.v vssseg2e512.v vssseg3e512.v vssseg4e512.v vssseg5e512.v vssseg6e512.v vssseg7e512.v vssseg8e512.v
    " Vector Indexed Segment Loads and Stores
    syn keyword riscvVInstruction          vluxseg1e512.v vluxseg2e512.v vluxseg3e512.v vluxseg4e512.v vluxseg5e512.v vluxseg6e512.v vluxseg7e512.v vluxseg8e512.v
    syn keyword riscvVInstruction          vloxseg1e512.v vloxseg2e512.v vloxseg3e512.v vloxseg4e512.v vloxseg5e512.v vloxseg6e512.v vloxseg7e512.v vloxseg8e512.v
    syn keyword riscvVInstruction          vsuxseg1e512.v vsuxseg2e512.v vsuxseg3e512.v vsuxseg4e512.v vsuxseg5e512.v vsuxseg6e512.v vsuxseg7e512.v vsuxseg8e512.v
    syn keyword riscvVInstruction          vsoxseg1e512.v vsoxseg2e512.v vsoxseg3e512.v vsoxseg4e512.v vsoxseg5e512.v vsoxseg6e512.v vsoxseg7e512.v vsoxseg8e512.v
    " Vector Load Whole Register Instructions
    syn keyword riscvVInstruction          vl1re512.v vl2re512.v vl4re512.v vl8re512.v
    " Vector AMO Instructions (zvamo)
    syn keyword riscvVInstruction          vamoswapei512.v vamoaddei512.v vamoxorei512.v vamoandei512.v vamoorei512.v vamominei512.v vamomaxei512.v vamominuei512.v vamomaxuei512.v
endif
if exists("b:riscv_asm_all_enable") || b:riscv_asm_v_eew == 1024
    " Vector Unit-Stride Instructions
    syn keyword riscvVInstruction          vle1024.v vse1024.v
    " Vector Strided Instructions
    syn keyword riscvVInstruction          vlse1024.v vsse1024.v
    " Vector Indexed Instructions
    syn keyword riscvVInstruction          vluxei1024.v vloxei1024.v vsuxei1024.v vsoxei1024.v
    " Unit-stride Fault-Only-First Loads
    syn keyword riscvVInstruction          vle1024ff.v
    " Vector Load/Store Segment Instructions (Zvlsseg)
    " Vector Unit-Stride Segment Loads and Stores
    syn keyword riscvVInstruction          vlseg1e1024.v vlseg2e1024.v vlseg3e1024.v vlseg4e1024.v vlseg5e1024.v vlseg6e1024.v vlseg7e1024.v vlseg8e1024.v
    syn keyword riscvVInstruction          vsseg1e1024.v vsseg2e1024.v vsseg3e1024.v vsseg4e1024.v vsseg5e1024.v vsseg6e1024.v vsseg7e1024.v vsseg8e1024.v
    " Vector Strided Segment Loads and Stores
    syn keyword riscvVInstruction          vlsseg1e1024.v vlsseg2e1024.v vlsseg3e1024.v vlsseg4e1024.v vlsseg5e1024.v vlsseg6e1024.v vlsseg7e1024.v vlsseg8e1024.v
    syn keyword riscvVInstruction          vssseg1e1024.v vssseg2e1024.v vssseg3e1024.v vssseg4e1024.v vssseg5e1024.v vssseg6e1024.v vssseg7e1024.v vssseg8e1024.v
    " Vector Indexed Segment Loads and Stores
    syn keyword riscvVInstruction          vluxseg1e1024.v vluxseg2e1024.v vluxseg3e1024.v vluxseg4e1024.v vluxseg5e1024.v vluxseg6e1024.v vluxseg7e1024.v vluxseg8e1024.v
    syn keyword riscvVInstruction          vloxseg1e1024.v vloxseg2e1024.v vloxseg3e1024.v vloxseg4e1024.v vloxseg5e1024.v vloxseg6e1024.v vloxseg7e1024.v vloxseg8e1024.v
    syn keyword riscvVInstruction          vsuxseg1e1024.v vsuxseg2e1024.v vsuxseg3e1024.v vsuxseg4e1024.v vsuxseg5e1024.v vsuxseg6e1024.v vsuxseg7e1024.v vsuxseg8e1024.v
    syn keyword riscvVInstruction          vsoxseg1e1024.v vsoxseg2e1024.v vsoxseg3e1024.v vsoxseg4e1024.v vsoxseg5e1024.v vsoxseg6e1024.v vsoxseg7e1024.v vsoxseg8e1024.v
    " Vector Load Whole Register Instructions
    syn keyword riscvVInstruction          vl1re1024.v vl2re1024.v vl4re1024.v vl8re1024.v
    " Vector AMO Instructions (zvamo)
    syn keyword riscvVInstruction          vamoswapei1024.v vamoaddei1024.v vamoxorei1024.v vamoandei1024.v vamoorei1024.v vamominei1024.v vamomaxei1024.v vamominuei1024.v vamomaxuei1024.v
endif
" Vector Store Whole Register Instructions
syn keyword riscvVInstruction          vs1r.v vs2r.v vs4r.v vs8r.v
" Vector Integer Arithmetic Instructions
" Vector Single-Width Integer Add and Subtract
syn keyword riscvVInstruction          vadd.vv vadd.vx vadd.vi
syn keyword riscvVInstruction          vsub.vv vsub.vx
syn keyword riscvVInstruction          vrsub.vx vrsub.vi
" Vector Widening Integer Add/Subtract
syn keyword riscvVInstruction          vwaddu.vv vwaddu.vx vwsubu.vv vwsubu.vx
syn keyword riscvVInstruction          vwadd.vv vwadd.vx vwsub.vv vwsub.vx
syn keyword riscvVInstruction          vwaddu.wv vwaddu.wx vwsubu.wv vwsubu.wx
syn keyword riscvVInstruction          vwadd.wv vwadd.wx vwsub.wv vwsub.wx
" Vector Integer Extension
syn keyword riscvVInstruction          vzext.vf2 vsext.vf2
syn keyword riscvVInstruction          vzext.vf4 vsext.vf4
syn keyword riscvVInstruction          vzext.vf8 vsext.vf8
" Vector Integer Add-with-Carry / Subtract-with-Borrow Instructions
syn keyword riscvVInstruction          vadc.vvm vadc.vxm vadc.vim
syn keyword riscvVInstruction          vmadc.vvm vmadc.vxm vmadc.vim
syn keyword riscvVInstruction          vmadc.vv vmadc.vx vmadc.vi
syn keyword riscvVInstruction          vsbc.vvm vsbc.vxm
syn keyword riscvVInstruction          vmsbc.vvm vmsbc.vxm
syn keyword riscvVInstruction          vmsbc.vv vmsbc.vx
" Vector Bitwise Logical Instructions
syn keyword riscvVInstruction          vand.vv vand.vx vand.vi
syn keyword riscvVInstruction          vor.vv vor.vx vor.vi
syn keyword riscvVInstruction          vxor.vv vxor.vx vxor.vi
" Vector Single-Width Bit Shift Instructions
syn keyword riscvVInstruction          vsll.vv vsll.vx vsll.vi
syn keyword riscvVInstruction          vsrl.vv vsrl.vx vsrl.vi
syn keyword riscvVInstruction          vsra.vv vsra.vx vsra.vi
" Vector Narrowing Integer Right Shift Instructions
syn keyword riscvVInstruction          vnsrl.wv vnsrl.wx vnsrl.wi
syn keyword riscvVInstruction          vnsra.wv vnsra.wx vnsra.wi
" Vector Integer Comparison Instructions
syn keyword riscvVInstruction          vmseq.vv vmseq.vx vmseq.vi
syn keyword riscvVInstruction          vmsne.vv vmsne.vx vmsne.vi
syn keyword riscvVInstruction          vmsltu.vv vmsltu.vx
syn keyword riscvVInstruction          vmslt.vv vmslt.vx
syn keyword riscvVInstruction          vmsleu.vv vmsleu.vx vmsleu.vi
syn keyword riscvVInstruction          vmsle.vv vmsle.vx vmsle.vi
syn keyword riscvVInstruction          vmsgtu.vx vmsgtu.vi
syn keyword riscvVInstruction          vmsgt.vx vmsgt.vi
" Vector Integer Min/Max Instructions
syn keyword riscvVInstruction          vminu.vv vminu.vx
syn keyword riscvVInstruction          vmin.vv vmin.vx
syn keyword riscvVInstruction          vmaxu.vv vmaxu.vx
syn keyword riscvVInstruction          vmax.vv vmax.vx
" Vector Single-Width Integer Multiply Instructions
syn keyword riscvVInstruction          vmul.vv vmul.vx
syn keyword riscvVInstruction          vmulh.vv vmulh.vx
syn keyword riscvVInstruction          vmulhu.vv vmulhu.vx
syn keyword riscvVInstruction          vmulhsu.vv vmulhsu.vx
" Vector Integer Divide Instructions
syn keyword riscvVInstruction          vdivu.vv vdivu.vx
syn keyword riscvVInstruction          vdiv.vv vdiv.vx
syn keyword riscvVInstruction          vremu.vv vremu.vx
syn keyword riscvVInstruction          vrem.vv vrem.vx
" Vector Widening Integer Multiply Instructions
syn keyword riscvVInstruction          vwmul.vv vwmul.vx
syn keyword riscvVInstruction          vwmulu.vv vwmulu.vx
syn keyword riscvVInstruction          vwmulsu.vv vwmulsu.vx
" Vector Single-Width Integer Multiply-Add Instructions
syn keyword riscvVInstruction          vmacc.vv vmacc.vx
syn keyword riscvVInstruction          vnmsac.vv vnmsac.vx
syn keyword riscvVInstruction          vmadd.vv vmadd.vx
syn keyword riscvVInstruction          vnmsub.vv vnmsub.vx
" Vector Widening Integer Multiply-Add Instructions
syn keyword riscvVInstruction          vwmaccu.vv vwmaccu.vx
syn keyword riscvVInstruction          vwmacc.vv vwmacc.vx
syn keyword riscvVInstruction          vwmaccsu.vv vwmaccsu.vx
syn keyword riscvVInstruction          vwmaccus.vx
" Vector Integer Merge Instructions
syn keyword riscvVInstruction          vmerge.vvm vmerge.vxm vmerge.vim
" Vector Integer Move Instructions
syn keyword riscvVInstruction          vmv.v.v vmv.v.x vmv.v.i
" Vector Fixed-Point Arithmetic Instructions
" Vector Single-Width Saturating Add and Subtract
syn keyword riscvVInstruction          vsaddu.vv vsaddu.vx vsaddu.vi
syn keyword riscvVInstruction          vsadd.vv vsadd.vx vsadd.vi
syn keyword riscvVInstruction          vssubu.vv vssubu.vx
syn keyword riscvVInstruction          vssub.vv vssub.vx
" Vector Single-Width Averaging Add and Subtract
syn keyword riscvVInstruction          vaaddu.vv vaaddu.vx
syn keyword riscvVInstruction          vaadd.vv vaadd.vx
syn keyword riscvVInstruction          vasubu.vv vasubu.vx
syn keyword riscvVInstruction          vasub.vv vasub.vx
" Vector Single-Width Fractional Multiply with Rounding and Saturation
syn keyword riscvVInstruction          vsmul.vv vsmul.vx
" Vector Single-Width Scaling Shift Instructions
syn keyword riscvVInstruction          vssrl.vv vssrl.vx vssrl.vi
syn keyword riscvVInstruction          vssra.vv vssra.vx vssra.vi
" Vector Narrowing Fixed-Point Clip Instructions
syn keyword riscvVInstruction          vnclipu.wv vnclipu.wx vnclipu.wi
syn keyword riscvVInstruction          vnclip.wv vnclip.wx vnclip.wi
" Vector Floating-Point Instructions
if !exists("b:riscv_asm_f")
    let b:riscv_asm_f = b:riscv_asm_f_max
    runtime! syntax/riscv-asm-f.vim
endif
" Vector Single-Width Floating-Point Add/Subtract Instructions
syn keyword riscvVInstruction          vfadd.vv vfadd.vf
syn keyword riscvVInstruction          vfsub.vv vfsub.vf vfrsub.vf
" Vector Widening Floating-Point Add/Subtract Instructions
syn keyword riscvVInstruction          vfwadd.vv vfwadd.vf vfwsub.vv vfwsub.vf
syn keyword riscvVInstruction          vfwadd.wv vfwadd.wf vfwsub.wv vfwsub.wf
" Vector Single-Width Floating-Point Multiply/Divide Instructions
syn keyword riscvVInstruction          vfmul.vv vfmul.vf
syn keyword riscvVInstruction          vfdiv.vv vfdiv.vf vfrdiv.vf
" Vector Widening Floating-Point Multiply
syn keyword riscvVInstruction          vfwmul.vv vfwmul.vf
" Vector Single-Width Floating-Point Fused Multiply-Add Instructions
syn keyword riscvVInstruction          vfmacc.vv vfmacc.vf
syn keyword riscvVInstruction          vfnmacc.vv vfnmacc.vf
syn keyword riscvVInstruction          vfmsac.vv vfmsac.vf
syn keyword riscvVInstruction          vfnmsac.vv vfnmsac.vf
syn keyword riscvVInstruction          vfmadd.vv vfmadd.vf
syn keyword riscvVInstruction          vfnmadd.vv vfnmadd.vf
syn keyword riscvVInstruction          vfmsub.vv vfmsub.vf
syn keyword riscvVInstruction          vfnmsub.vv vfnmsub.vf
" Vector Widening Floating-Point Fused Multiply-Add Instructions
syn keyword riscvVInstruction          vfwmacc.vv vfwmacc.vf
syn keyword riscvVInstruction          vfwnmacc.vv vfwnmacc.vf
syn keyword riscvVInstruction          vfwmsac.vv vfwmsac.vf
syn keyword riscvVInstruction          vfwnmsac.vv vfwnmsac.vf
" Vector Floating-Point Square-Root Instruction
syn keyword riscvVInstruction          vfsqrt.v
" Vector Floating-Point Reciprocal Square-Root Estimate Instruction
syn keyword riscvVInstruction          vfrsqrt7.v
" Vector Floating-Point Reciprocal Estimate Instruction
syn keyword riscvVInstruction          vfrec7.v
" Vector Floating-Point MIN/MAX Instructions
syn keyword riscvVInstruction          vfmin.vv vfmin.vf
syn keyword riscvVInstruction          vfmax.vv vfmax.vf
" Vector Floating-Point Sign-Injection Instructions
syn keyword riscvVInstruction          vfsgnj.vv vfsgnj.vf
syn keyword riscvVInstruction          vfsgnjn.vv vfsgnjn.vf
syn keyword riscvVInstruction          vfsgnjx.vv vfsgnjx.vf
" Vector Floating-Point Compare Instructions
syn keyword riscvVInstruction          vmfeq.vv vmfeq.vf
syn keyword riscvVInstruction          vmfne.vv vmfne.vf
syn keyword riscvVInstruction          vmflt.vv vmflt.vf
syn keyword riscvVInstruction          vmfle.vv vmfle.vf
syn keyword riscvVInstruction          vmfgt.vf
syn keyword riscvVInstruction          vmfge.vf
" Vector Floating-Point Classify Instruction
syn keyword riscvVInstruction          vfclass.v
" Vector Floating-Point Merge Instruction
syn keyword riscvVInstruction          vfmerge.vfm
" Vector Floating-Point Move Instruction
syn keyword riscvVInstruction          vfmv.v.f
" Single-Width Floating-Point/Integer Type-Convert Instructions
syn keyword riscvVInstruction          vfcvt.xu.f.v vfcvt.x.f.v
syn keyword riscvVInstruction          vfcvt.rtz.xu.f.v vfcvt.rtz.x.f.v
syn keyword riscvVInstruction          vfcvt.f.xu.v vfcvt.f.x.v
" Widening Floating-Point/Integer Type-Convert Instructions
syn keyword riscvVInstruction          vfwcvt.xu.f.v vfwcvt.x.f.v
syn keyword riscvVInstruction          vfwcvt.rtz.xu.f.v vfwcvt.rtz.x.f.v
syn keyword riscvVInstruction          vfwcvt.f.xu.v vfwcvt.f.x.v
syn keyword riscvVInstruction          vfwcvt.f.f.v
" Narrowing Floating-Point/Integer Type-Convert Instructions
syn keyword riscvVInstruction          vfncvt.xu.f.w vfncvt.x.f.w
syn keyword riscvVInstruction          vfncvt.rtz.xu.f.w vfncvt.rtz.x.f.w
syn keyword riscvVInstruction          vfncvt.f.xu.w vfncvt.f.x.w
syn keyword riscvVInstruction          vfncvt.f.f.w vfncvt.rod.f.f.w
" Vector Reduction Operations
" Vector Single-Width Integer Reduction Instructions
syn keyword riscvVInstruction          vredsum.vs
syn keyword riscvVInstruction          vredmaxu.vs
syn keyword riscvVInstruction          vredmax.vs
syn keyword riscvVInstruction          vredminu.vs
syn keyword riscvVInstruction          vredmin.vs
syn keyword riscvVInstruction          vredand.vs
syn keyword riscvVInstruction          vredor.vs
syn keyword riscvVInstruction          vredxor.vs
" Vector Widening Integer Reduction Instructions
syn keyword riscvVInstruction          vwredsumu.vs
syn keyword riscvVInstruction          vwredsum.vs
" Vector Single-Width Floating-Point Reduction Instructions
syn keyword riscvVInstruction          vfredosum.vs
syn keyword riscvVInstruction          vfredsum.vs
syn keyword riscvVInstruction          vfredmax.vs
syn keyword riscvVInstruction          vfredmin.vs
" Vector Widening Floating-Point Reduction Instructions
syn keyword riscvVInstruction          vfwredosum.vs
syn keyword riscvVInstruction          vfwredsum.vs
" Vector Mask Instructions
" Vector Mask-Register Logical Instructions
syn keyword riscvVInstruction          vmand.mm
syn keyword riscvVInstruction          vmnand.mm
syn keyword riscvVInstruction          vmandnot.mm
syn keyword riscvVInstruction          vmxor.mm
syn keyword riscvVInstruction          vmor.mm
syn keyword riscvVInstruction          vmnor.mm
syn keyword riscvVInstruction          vmornot.mm
syn keyword riscvVInstruction          vmxnor.mm
" Vector Mask Population Count
syn keyword riscvVInstruction          vpopc.m
" Find-first-set Mask Bit
syn keyword riscvVInstruction          vfirst.m
" Set-before-first Mask Bit
syn keyword riscvVInstruction          vmsbf.m
" Set-including-first Mask Bit
syn keyword riscvVInstruction          vmsif.m
" Set-only-first Mask Bit
syn keyword riscvVInstruction          vmsof.m
" Vector Iota Instruction
syn keyword riscvVInstruction          viota.m
" Vector Element Index Instruction
syn keyword riscvVInstruction          vid.v
" Vector Slide Instructions
" Vector Slideup Instructions
syn keyword riscvVInstruction          vslideup.vx vslideup.vi
" Vector Slidedown Instructions
syn keyword riscvVInstruction          vslidedown.vx vslidedown.vi
" Vector Slide1up Instructions
syn keyword riscvVInstruction          vslide1up.vx vslide1up.vf
" Vector Slide1down Instructions
syn keyword riscvVInstruction          vslide1down.vx vslide1down.vf
" Vector Register Gather Instructions
syn keyword riscvVInstruction          vrgather.vv vrgatherei16.vv
syn keyword riscvVInstruction          vrgather.vx vrgather.vi
" Vector Compress Instruction
syn keyword riscvVInstruction          vcompress.vm
" Whole Vector Register Move
syn keyword riscvVInstruction          vmv1r.v vmv2r.v vmv4r.v vmv8r.v

" Pseudo-instructions
" vl<nf>r.v = vl<nf>re8.v
syn keyword riscvVInstruction          vl1r.v vl2r.v vl4r.v vl8r.v
" vnot.v vd, vs, vm = vxor.vi vd, vs, -1, vm
syn keyword riscvVInstruction          vnot.v
" vncvt.x.x.w vd, vs, vm = vnsrl.wx vd, vx, x0, vm
syn keyword riscvVInstruction          vncvt.x.x.w
" vmsgt{u}.vv vd, va, vb, vm = vmslt{u}.vv vd, vb, va, vm
syn keyword riscvVInstruction          vmsgtu.vv vmsgt.vv
" vmsge{u}.vv vd, va, vb, vm = vmsle{u}.vv vd, vb, va, vm
syn keyword riscvVInstruction          vmsgeu.vv vmsge.vv
" vmsge{u}.vx depends on range of x
syn keyword riscvVInstruction          vmsgeu.vx vmsge.vx
" vmslt{u}.vi vd, va, i, vm = vmsle{u}.vi vd, va, i-1, vm
syn keyword riscvVInstruction          vmsltu.vi vmslt.vi
" vmsge{u}.vi vd, va, i, vm = vmsgt{u}.vi vd, va, i-1, vm
syn keyword riscvVInstruction          vmsgeu.vi vmsge.vi
" vfneg.v vd, vs = vfsgnjn.vv vd, vs, vs
syn keyword riscvVInstruction          vfneg.v
" vfabs.v vd, vs = vfsgnjx.vv vd, vs, vs
syn keyword riscvVInstruction          vfabs.v
" vmfgt.vv vd, va, vb, vm = vmflt.vv vd, vb, va, vm
syn keyword riscvVInstruction          vmfgt.vv
" vmfge.vv vd, va, vb, vm = vmfle.vv vd, vb, va, vm
syn keyword riscvVInstruction          vmfge.vv
" vmmv.m vd, vs = vmand.mm vd, vs, vs
syn keyword riscvVInstruction          vmmv.m
" vmclr.m vd = vmxor.mm vd, vd, vd
syn keyword riscvVInstruction          vmclr.m
" vmset.m vd = vmxnor.mm vd, vd, vd
syn keyword riscvVInstruction          vmset.m
" vmnot.m vd, vs = vmnand.mm vd, vs, vs
syn keyword riscvVInstruction          vmnot.m

if !exists("b:riscv_asm_zicsr")
    let b:riscv_asm_zicsr = b:riscv_asm_zicsr_max
    runtime! syntax/riscv-asm-zicsr.vim
endif

let b:riscv_asm_defined_v = 0
