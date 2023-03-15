if exists("b:riscv_asm_defined_zcmp")
    finish
endif

" Instructions
" Push/Pop
syn keyword riscvCInstruction          cm.push cm.pop cm.popret cm.popretz
" Double Move
syn keyword riscvCInstruction          cm.mva01s cm.mvsa01

if !exists("b:riscv_asm_zca")
    let b:riscv_asm_zca = b:riscv_asm_zca_max
    runtime! syntax/riscv_asm_zca.vim
endif

let b:riscv_asm_defined_zcmp = 0
