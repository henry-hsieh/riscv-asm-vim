if exists("b:riscv_asm_defined_rvb23s64")
    finish
endif

runtime! syntax/riscv_asm_rvb23u64.vim
if !exists("b:riscv_asm_zifencei")
    let b:riscv_asm_zifencei = b:riscv_asm_zifencei_max
    runtime! syntax/riscv_asm_zifencei.vim
endif
if !exists("b:riscv_asm_ss")
    let b:riscv_asm_ss = 1.13
    runtime! syntax/riscv_asm_ss.vim
endif
if !exists("b:riscv_asm_svinval")
    let b:riscv_asm_svinval = b:riscv_asm_svinval_max
    runtime! syntax/riscv_asm_svinval.vim
endif
if !exists("b:riscv_asm_sstc")
    let b:riscv_asm_sstc = b:riscv_asm_sstc_max
    runtime! syntax/riscv_asm_sstc.vim
endif
if exists("b:riscv_asm_h")
    if !exists("b:riscv_asm_ssstateen")
        let b:riscv_asm_ssstateen = b:riscv_asm_ssstateen_max
        runtime! syntax/riscv_asm_ssstateen.vim
    endif
endif

let b:riscv_asm_defined_rvb23s64 = 0
