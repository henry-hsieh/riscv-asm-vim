if exists("b:riscv_asm_defined_rv32e")
    finish
endif

" General Purpose Register
syn keyword riscvGPRegister            x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15
syn keyword riscvGPRegister            zero ra sp gp tp fp
syn keyword riscvGPRegister            a0 a1 a2 a3
syn keyword riscvGPRegister            t0 t1
syn keyword riscvGPRegister            s0 s1 s2

" Instructions
" U-type
syn keyword riscvIInstruction          lui auipc
" J-type
syn keyword riscvIInstruction          jal
" I-type: jump
syn keyword riscvIInstruction          jalr
" B-type
syn keyword riscvIInstruction          beq bne blt bge bltu bgeu
" I-type: load
syn keyword riscvIInstruction          lb lh lw lbu lhu
" S-type
syn keyword riscvIInstruction          sb sh sw
" I-type: arithmetic
syn keyword riscvIInstruction          addi slti sltiu xori ori andi
" I-type: shift
syn keyword riscvIInstruction          slli srli srai
" R-type
syn keyword riscvIInstruction          add sub sll slt sltu xor srl sra or and
" I-type: fence
syn match   riscvFenceError            "\S\+" contains=riscvInsnOperator display contained
syn match   riscvFenceType             "\<i\=o\=r\=w\=\>" display contained
syn region  riscvIInstruction          matchgroup=riscvIInstruction start=+\<fence\>+ skip=+\\$+ end=+$+ contains=riscvFenceError,riscvFenceType,riscvComment,riscvCommentL,riscvCommentP,riscvCommentEndError
syn keyword riscvIInstruction          fence.tso
" Special
syn keyword riscvIInstruction          ecall ebreak

" Pseudo-instructions
syn keyword riscvIInstruction          la lla lga
syn keyword riscvIInstruction          nop li mv not neg negw sext.b sext.h sext.w zext.b zext.h zext.w seqz snez sltz sgtz
syn keyword riscvIInstruction          beqz bnez blez bgez bltz bgtz
syn keyword riscvIInstruction          bgt ble bgtu bleu
syn keyword riscvIInstruction          j jr ret call tail

let b:riscv_asm_defined_rv32e = 0
