if exists("b:riscv_asm_defined_zve32f")
    finish
endif

" Instructions
" Vector Floating-Point Instructions
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
" Vector Single-Width Floating-Point Reduction Instructions
syn keyword riscvVInstruction          vfredosum.vs
syn keyword riscvVInstruction          vfredusum.vs
syn keyword riscvVInstruction          vfredmax.vs
syn keyword riscvVInstruction          vfredmin.vs
" Vector Widening Floating-Point Reduction Instructions
syn keyword riscvVInstruction          vfwredosum.vs
syn keyword riscvVInstruction          vfwredusum.vs
" Vector Permutation Instructions
" Floating-Point Scalar Move Instructions
syn keyword riscvVInstruction          vfmv.f.s vfmv.s.f
" Vector Slide Instructions
" Vector Floating-Point Slide1up Instruction
syn keyword riscvVInstruction          vfslide1up.vf
" Vector Floating-Point Slide1down Instructions
syn keyword riscvVInstruction          vfslide1down.vf

" Pseudo-instructions
" vfneg.v vd, vs = vfsgnjn.vv vd, vs, vs
syn keyword riscvVInstruction          vfneg.v
" vfabs.v vd, vs = vfsgnjx.vv vd, vs, vs
syn keyword riscvVInstruction          vfabs.v
" vmfgt.vv vd, va, vb, vm = vmflt.vv vd, vb, va, vm
syn keyword riscvVInstruction          vmfgt.vv
" vmfge.vv vd, va, vb, vm = vmfle.vv vd, vb, va, vm
syn keyword riscvVInstruction          vmfge.vv

if !exists("b:riscv_asm_f")
    let b:riscv_asm_f = b:riscv_asm_f_max
    runtime! syntax/riscv_asm_f.vim
endif
if !exists("b:riscv_asm_zve32x")
    let b:riscv_asm_zve32x = b:riscv_asm_zve32x_max
    runtime! syntax/riscv_asm_zve32x.vim
endif

let b:riscv_asm_defined_zve32f = 0
