if exists("b:riscv_asm_defined_zve32x")
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
syn keyword riscvVInstruction          vsetvli vsetvl vsetivli
" Vector Unit-Stride Instructions
syn keyword riscvVInstruction          vle8.v vse8.v
" Vector Strided Instructions
syn keyword riscvVInstruction          vlse8.v vsse8.v
" Vector Indexed Instructions
syn keyword riscvVInstruction          vluxei8.v vloxei8.v vsuxei8.v vsoxei8.v
" Unit-stride Fault-Only-First Loads
syn keyword riscvVInstruction          vle8ff.v
" Vector Load/Store Segment Instructions
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
" Vector Unit-Stride Instructions
syn keyword riscvVInstruction          vle16.v vse16.v
" Vector Strided Instructions
syn keyword riscvVInstruction          vlse16.v vsse16.v
" Vector Indexed Instructions
syn keyword riscvVInstruction          vluxei16.v vloxei16.v vsuxei16.v vsoxei16.v
" Unit-stride Fault-Only-First Loads
syn keyword riscvVInstruction          vle16ff.v
" Vector Load/Store Segment Instructions
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
" Vector Unit-Stride Instructions
syn keyword riscvVInstruction          vle32.v vse32.v
" Vector Strided Instructions
syn keyword riscvVInstruction          vlse32.v vsse32.v
" Vector Indexed Instructions
syn keyword riscvVInstruction          vluxei32.v vloxei32.v vsuxei32.v vsoxei32.v
" Unit-stride Fault-Only-First Loads
syn keyword riscvVInstruction          vle32ff.v
" Vector Load/Store Segment Instructions
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
" Vector Unit-Stride Mask Instructions
syn keyword riscvVInstruction          vlm.v vsm.v
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
" Vector Mask Instructions
" Vector Mask-Register Logical Instructions
syn keyword riscvVInstruction          vmand.mm
syn keyword riscvVInstruction          vmnand.mm
syn keyword riscvVInstruction          vmandn.mm
syn keyword riscvVInstruction          vmxor.mm
syn keyword riscvVInstruction          vmor.mm
syn keyword riscvVInstruction          vmnor.mm
syn keyword riscvVInstruction          vmorn.mm
syn keyword riscvVInstruction          vmxnor.mm
" Vector Mask Population Count
syn keyword riscvVInstruction          vcpop.m
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
" Vector Permutation Instructions
" Integer Scalar Move Instructions
syn keyword riscvVInstruction          vmv.x.s vmv.s.x
" Vector Slide Instructions
" Vector Slideup Instructions
syn keyword riscvVInstruction          vslideup.vx vslideup.vi
" Vector Slidedown Instructions
syn keyword riscvVInstruction          vslidedown.vx vslidedown.vi
" Vector Slide1up Instructions
syn keyword riscvVInstruction          vslide1up.vx
" Vector Slide1down Instructions
syn keyword riscvVInstruction          vslide1down.vx
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
    runtime! syntax/riscv_asm_zicsr.vim
endif

let b:riscv_asm_defined_zve32x = 0
