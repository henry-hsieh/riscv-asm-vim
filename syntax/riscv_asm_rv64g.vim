if exists("b:riscv_asm_defined_rv64g")
    finish
endif

runtime! syntax/riscv_asm_rv64i.vim
if !exists("b:riscv_asm_m")
    let b:riscv_asm_m = b:riscv_asm_m_max
    runtime! syntax/riscv_asm_m.vim
endif
if !exists("b:riscv_asm_a")
    let b:riscv_asm_a = b:riscv_asm_a_max
    runtime! syntax/riscv_asm_a.vim
endif
if !exists("b:riscv_asm_f")
    let b:riscv_asm_f = b:riscv_asm_f_max
    runtime! syntax/riscv_asm_f.vim
endif
if !exists("b:riscv_asm_d")
    let b:riscv_asm_d = b:riscv_asm_d_max
    runtime! syntax/riscv_asm_d.vim
endif
if !exists("b:riscv_asm_zicsr")
    let b:riscv_asm_zicsr = b:riscv_asm_zicsr_max
    runtime! syntax/riscv_asm_zicsr.vim
endif
if !exists("b:riscv_asm_zifencei")
    let b:riscv_asm_zifencei = b:riscv_asm_zifencei_max
    runtime! syntax/riscv_asm_zifencei.vim
endif

let b:riscv_asm_defined_rv64g = 0
