" Vim filetype plugin file
" Language:	RISC-V Assembly
"

" Define include string
setlocal include=^\s*#\s*include

" Store cpoptions
let oldcpo=&cpoptions
set cpo-=C

" Set 'formatoptions' to break comment lines but not other lines,
" and insert the comment leader when hitting <CR> or using "o".
setlocal fo+=croq

" Set 'comments' to format dashed lists in comments.
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#

" List max version of supported ISA and its extensions
" Base Integer
let b:riscv_asm_rv32e_max = 2.0
let b:riscv_asm_rv32i_max = 2.1
let b:riscv_asm_rv64e_max = 2.0
let b:riscv_asm_rv64i_max = 2.1
let b:riscv_asm_rv128i_max = 1.7
" M Extension: Integer Multiplication and Division
let b:riscv_asm_m_max = 2.0
" A Extension: Atomics
let b:riscv_asm_a_max = 2.1
" F Extension: Single-Precision Floating-Point
let b:riscv_asm_f_max = 2.2
" D Extension: Double-Precision Floating-Point
let b:riscv_asm_d_max = 2.2
" Q Extension: Quad-Precision Floating-Point
let b:riscv_asm_q_max = 2.2
" L Extension: Decimal Floating-Point
"let b:riscv_asm_l_max = 0.0
" C Extension: 16-bit Compressed Instructions
let b:riscv_asm_c_max = 2.0
" B Extension: Bit Manipulation
"let b:riscv_asm_b_max = 0.0
" J Extension: Dynamic Languages
"let b:riscv_asm_j_max = 0.0
" T Extension: Transactional Memory
"let b:riscv_asm_t_max = 0.0
" P Extension: Packed-SIMD Extensions
"let b:riscv_asm_p_max = 0.2
" V Extension: Vector Extensions
let b:riscv_asm_v_max = 1.0
" Zicntr Extension: Base Counters and Timers
let b:riscv_asm_zicntr_max = 2.0
" Zicsr Extension: Control and Status Register Access
let b:riscv_asm_zicsr_max = 2.0
" Zifencei Extension: Instruction-Fetch Fence
let b:riscv_asm_zifencei_max = 2.0
" Zihintntl Extension: Non-Temporal Locality Hints
let b:riscv_asm_zihintntl_max = 0.2
" Zihpm Extension: Hardware Performance Counters
let b:riscv_asm_zihpm_max = 2.0
" Zfh Extension: Half-Precision Floating-Point
let b:riscv_asm_zfh_max = 1.0
" Zfhmin Extension: Minimal Half-Precision Floating-Point
let b:riscv_asm_zfhmin_max = 1.0
" S Extension: Supervisor-Level Extension
let b:riscv_asm_s_max = 1.12
" H Extension: Hypervisor-Level Extension
let b:riscv_asm_h_max = 0.6
" Zxm Extension: Machine-Level Extension
let b:riscv_asm_zxm_max = 1.12

" Find global setting of RISC-V ISA
if exists("g:riscv_asm_isa")
    let s:riscv_asm_isa = g:riscv_asm_isa
endif

" Find buffer setting of RISC-V ISA
if exists("b:riscv_asm_isa")
    let s:riscv_asm_isa = b:riscv_asm_isa
endif

" Set default value if setting of RISC-V ISA isn't found
if !exists("s:riscv_asm_isa")
    let s:riscv_asm_isa = "rv32g"
endif

" Replace the G extension with separated extensions
let s:riscv_asm_g = 'IMAFDZicsrZifencei'
let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\cg\(\d\+\(p\d\+\)\=\)\=', s:riscv_asm_g, "g")

" Replace version format with decimal format
let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c\(\d\+\)p\(\d\+\)', '\1.\2', "g")

" Delete the underscore of the variable
let s:riscv_asm_isa = substitute(s:riscv_asm_isa, "_", "", "g")

" If all extensions are enabled, skip the parser
if exists("g:riscv_asm_all_enable")
    let b:riscv_asm_all_enable = 1
endif

" Parse base ISA
if s:riscv_asm_isa =~ '\c^rv\(32\|64\|128\)[ie]' && !exists("b:riscv_asm_all_enable")
    let s:extract_length = substitute(s:riscv_asm_isa, '\c^rv\(\d\+\)\([ie]\)\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
    let s:extract_base = substitute(s:riscv_asm_isa, '\c^rv\(\d\+\)\([ie]\)\(\d\+\(\.\d\+\)\=\)\=.*', '\2', "")
    let s:extract_version = substitute(s:riscv_asm_isa, '\c^rv\(\d\+\)\([ie]\)\(\d\+\(\.\d\+\)\=\)\=.*', '\3', "")
    if exists("b:riscv_asm_rv32e")
        unlet b:riscv_asm_rv32e
    endif
    if exists("b:riscv_asm_rv32i")
        unlet b:riscv_asm_rv32i
    endif
    if exists("b:riscv_asm_rv64e")
        unlet b:riscv_asm_rv64e
    endif
    if exists("b:riscv_asm_rv64i")
        unlet b:riscv_asm_rv64i
    endif
    if exists("b:riscv_asm_rv128i")
        unlet b:riscv_asm_rv128i
    endif
    if s:extract_length == "32" && s:extract_base =~ '[Ee]'
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_rv32e = b:riscv_asm_rv32e_max
        else
            let b:riscv_asm_rv32e = str2float(s:extract_version)
            if b:riscv_asm_rv32e > b:riscv_asm_rv32e_max
                let b:riscv_asm_rv32e = b:riscv_asm_rv32e_max
            endif
        endif
        let b:riscv_asm_xlen = 32
    elseif s:extract_length == "32" && s:extract_base =~ '[Ii]'
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_rv32i = b:riscv_asm_rv32i_max
        else
            let b:riscv_asm_rv32i = str2float(s:extract_version)
            if b:riscv_asm_rv32i > b:riscv_asm_rv32i_max
                let b:riscv_asm_rv32i = b:riscv_asm_rv32i_max
            endif
        endif
        let b:riscv_asm_xlen = 32
    elseif s:extract_length == "64" && s:extract_base =~ '[Ee]'
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_rv64e = b:riscv_asm_rv64e_max
        else
            let b:riscv_asm_rv64e = str2float(s:extract_version)
            if b:riscv_asm_rv64e > b:riscv_asm_rv64e_max
                let b:riscv_asm_rv64e = b:riscv_asm_rv64e_max
            endif
        endif
        let b:riscv_asm_xlen = 64
    elseif s:extract_length == "64" && s:extract_base =~ '[Ii]'
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_rv64i = b:riscv_asm_rv64i_max
        else
            let b:riscv_asm_rv64i = str2float(s:extract_version)
            if b:riscv_asm_rv64i > b:riscv_asm_rv64i_max
                let b:riscv_asm_rv64i = b:riscv_asm_rv64i_max
            endif
        endif
        let b:riscv_asm_xlen = 64
    elseif s:extract_length == "128" && s:extract_base =~ '[Ii]'
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_rv128i = b:riscv_asm_rv128i_max
        else
            let b:riscv_asm_rv128i = str2float(s:extract_version)
            if b:riscv_asm_rv128i > b:riscv_asm_rv128i_max
                let b:riscv_asm_rv128i = b:riscv_asm_rv128i_max
            endif
        endif
        let b:riscv_asm_xlen = 128
    endif
    let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^rv\d\+[ie]\(\d\+\(\.\d\+\)\=\)\=', "", "")
else
    " Base ISA isn't found, enable all extensions
    let b:riscv_asm_all_enable = 1
endif
" Parse extensions
" The name should follow the MAFDQLCBJTPVZicntrZicsrZifenceiZihintntlZihpmZfh(min)SHZxm sequence
if !exists("b:riscv_asm_all_enable")
    " M extension
    if s:riscv_asm_isa =~ '\c^m'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^m\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_m = b:riscv_asm_m_max
        else
            let b:riscv_asm_m = str2float(s:extract_version)
            if b:riscv_asm_m > b:riscv_asm_m_max
                let b:riscv_asm_m = b:riscv_asm_m_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^m\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_m")
            unlet b:riscv_asm_m
        endif
    endif
    " A extension
    if s:riscv_asm_isa =~ '\c^a'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^a\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_a = b:riscv_asm_a_max
        else
            let b:riscv_asm_a = str2float(s:extract_version)
            if b:riscv_asm_a > b:riscv_asm_a_max
                let b:riscv_asm_a = b:riscv_asm_a_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^a\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_a")
            unlet b:riscv_asm_a
        endif
    endif
    " F extension
    if s:riscv_asm_isa =~ '\c^f'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^f\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_f = b:riscv_asm_f_max
        else
            let b:riscv_asm_f = str2float(s:extract_version)
            if b:riscv_asm_f > b:riscv_asm_f_max
                let b:riscv_asm_f = b:riscv_asm_f_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^f\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_f")
            unlet b:riscv_asm_f
        endif
    endif
    " D extension
    if s:riscv_asm_isa =~ '\c^d'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^d\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_d = b:riscv_asm_d_max
        else
            let b:riscv_asm_d = str2float(s:extract_version)
            if b:riscv_asm_d > b:riscv_asm_d_max
                let b:riscv_asm_d = b:riscv_asm_d_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^d\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_d")
            unlet b:riscv_asm_d
        endif
    endif
    " Q extension
    if s:riscv_asm_isa =~ '\c^q'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^q\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_q = b:riscv_asm_q_max
        else
            let b:riscv_asm_q = str2float(s:extract_version)
            if b:riscv_asm_q > b:riscv_asm_q_max
                let b:riscv_asm_q = b:riscv_asm_q_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^q\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_q")
            unlet b:riscv_asm_q
        endif
    endif
    " L extension
    if s:riscv_asm_isa =~ '\c^l'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^l\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_l = b:riscv_asm_l_max
        else
            let b:riscv_asm_l = str2float(s:extract_version)
            if b:riscv_asm_l > b:riscv_asm_l_max
                let b:riscv_asm_l = b:riscv_asm_l_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^l\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_l")
            unlet b:riscv_asm_l
        endif
    endif
    " C extension
    if s:riscv_asm_isa =~ '\c^c'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^c\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_c = b:riscv_asm_c_max
        else
            let b:riscv_asm_c = str2float(s:extract_version)
            if b:riscv_asm_c > b:riscv_asm_c_max
                let b:riscv_asm_c = b:riscv_asm_c_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^c\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_c")
            unlet b:riscv_asm_c
        endif
    endif
    " B extension
    if s:riscv_asm_isa =~ '\c^b'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^b\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_b = b:riscv_asm_b_max
        else
            let b:riscv_asm_b = str2float(s:extract_version)
            if b:riscv_asm_b > b:riscv_asm_b_max
                let b:riscv_asm_b = b:riscv_asm_b_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^b\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_b")
            unlet b:riscv_asm_b
        endif
    endif
    " J extension
    if s:riscv_asm_isa =~ '\c^j'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^j\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_j = b:riscv_asm_j_max
        else
            let b:riscv_asm_j = str2float(s:extract_version)
            if b:riscv_asm_j > b:riscv_asm_j_max
                let b:riscv_asm_j = b:riscv_asm_j_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^j\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_j")
            unlet b:riscv_asm_j
        endif
    endif
    " T extension
    if s:riscv_asm_isa =~ '\c^t'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^t\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_t = b:riscv_asm_t_max
        else
            let b:riscv_asm_t = str2float(s:extract_version)
            if b:riscv_asm_t > b:riscv_asm_t_max
                let b:riscv_asm_t = b:riscv_asm_t_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^t\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_t")
            unlet b:riscv_asm_t
        endif
    endif
    " P extension
    if s:riscv_asm_isa =~ '\c^p'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^p\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_p = b:riscv_asm_p_max
        else
            let b:riscv_asm_p = str2float(s:extract_version)
            if b:riscv_asm_p > b:riscv_asm_p_max
                let b:riscv_asm_p = b:riscv_asm_p_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^p\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_p")
            unlet b:riscv_asm_p
        endif
    endif
    " V extension
    if s:riscv_asm_isa =~ '\c^v'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^v\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_v = b:riscv_asm_v_max
        else
            let b:riscv_asm_v = str2float(s:extract_version)
            if b:riscv_asm_v > b:riscv_asm_v_max
                let b:riscv_asm_v = b:riscv_asm_v_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^v\(\d\+\(\.\d\+\)\=\)\=', "", "")
        " Find EEW setting for V extension
        if exists("g:riscv_asm_v_eew")
            let s:riscv_asm_v_eew = g:riscv_asm_v_eew
            if s:riscv_asm_v_eew !~ '^\(8\|16\|32\|64\|128\|256\|512\|1024\)$'
                " Informal EEW
                " EEW above 64 are reserved
                let s:riscv_asm_v_eew = 64
            else
                let s:riscv_asm_v_eew = str2nr(s:riscv_asm_v_eew, 10)
            endif
        else
            " EEW above 64 are reserved
            let s:riscv_asm_v_eew = 64
        endif
        let b:riscv_asm_v_eew = s:riscv_asm_v_eew
    else
        if exists("b:riscv_asm_v")
            unlet b:riscv_asm_v
        endif
    endif
    " Zicntr extension
    if s:riscv_asm_isa =~ '\c^zicntr'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^zicntr\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zicntr = b:riscv_asm_zicntr_max
        else
            let b:riscv_asm_zicntr = str2float(s:extract_version)
            if b:riscv_asm_zicntr > b:riscv_asm_zicntr_max
                let b:riscv_asm_zicntr = b:riscv_asm_zicntr_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^zicntr\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zicntr")
            unlet b:riscv_asm_zicntr
        endif
    endif
    " Zicsr extension
    if s:riscv_asm_isa =~ '\c^zicsr'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^zicsr\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zicsr = b:riscv_asm_zicsr_max
        else
            let b:riscv_asm_zicsr = str2float(s:extract_version)
            if b:riscv_asm_zicsr > b:riscv_asm_zicsr_max
                let b:riscv_asm_zicsr = b:riscv_asm_zicsr_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^zicsr\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zicsr")
            unlet b:riscv_asm_zicsr
        endif
    endif
    " Zifencei extension
    if s:riscv_asm_isa =~ '\c^zifencei'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^zifencei\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zifencei = b:riscv_asm_zifencei_max
        else
            let b:riscv_asm_zifencei = str2float(s:extract_version)
            if b:riscv_asm_zifencei > b:riscv_asm_zifencei_max
                let b:riscv_asm_zifencei = b:riscv_asm_zifencei_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^zifencei\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zifencei")
            unlet b:riscv_asm_zifencei
        endif
    endif
    " Zihintntl extension
    if s:riscv_asm_isa =~ '\c^zihintntl'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^zihintntl\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zihintntl = b:riscv_asm_zihintntl_max
        else
            let b:riscv_asm_zihintntl = str2float(s:extract_version)
            if b:riscv_asm_zihintntl > b:riscv_asm_zihintntl_max
                let b:riscv_asm_zihintntl = b:riscv_asm_zihintntl_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^zihintntl\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zihintntl")
            unlet b:riscv_asm_zihintntl
        endif
    endif
    " Zihpm extension
    if s:riscv_asm_isa =~ '\c^zihpm'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^zihpm\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zihpm = b:riscv_asm_zihpm_max
        else
            let b:riscv_asm_zihpm = str2float(s:extract_version)
            if b:riscv_asm_zihpm > b:riscv_asm_zihpm_max
                let b:riscv_asm_zihpm = b:riscv_asm_zihpm_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^zihpm\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zihpm")
            unlet b:riscv_asm_zihpm
        endif
    endif
    " Zfhmin extension
    if s:riscv_asm_isa =~ '\c^zfhmin'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^zfhmin\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zfhmin = b:riscv_asm_zfhmin_max
        else
            let b:riscv_asm_zfhmin = str2float(s:extract_version)
            if b:riscv_asm_zfhmin > b:riscv_asm_zfhmin_max
                let b:riscv_asm_zfhmin = b:riscv_asm_zfhmin_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^zfhmin\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zfhmin")
            unlet b:riscv_asm_zfhmin
        endif
    endif
    " Zfh extension
    if s:riscv_asm_isa =~ '\c^zfh' && !exists("b:riscv_asm_zfhmin")
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^zfh\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zfh = b:riscv_asm_zfh_max
        else
            let b:riscv_asm_zfh = str2float(s:extract_version)
            if b:riscv_asm_zfh > b:riscv_asm_zfh_max
                let b:riscv_asm_zfh = b:riscv_asm_zfh_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^zfh\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zfh")
            unlet b:riscv_asm_zfh
        endif
    endif
    " S extension
    if s:riscv_asm_isa =~ '\c^s'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^s\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_s = b:riscv_asm_s_max
        else
            let b:riscv_asm_s = str2float(s:extract_version)
            if b:riscv_asm_s > b:riscv_asm_s_max
                let b:riscv_asm_s = b:riscv_asm_s_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^s\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_s")
            unlet b:riscv_asm_s
        endif
    endif
    " H extension
    if s:riscv_asm_isa =~ '\c^h'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^h\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_h = b:riscv_asm_h_max
        else
            let b:riscv_asm_h = str2float(s:extract_version)
            if b:riscv_asm_h > b:riscv_asm_h_max
                let b:riscv_asm_h = b:riscv_asm_h_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^h\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_h")
            unlet b:riscv_asm_h
        endif
    endif
    " Zxm extension
    if s:riscv_asm_isa =~ '\c^zxm'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^zxm\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zxm = b:riscv_asm_zxm_max
        else
            let b:riscv_asm_zxm = str2float(s:extract_version)
            if b:riscv_asm_zxm > b:riscv_asm_zxm_max
                let b:riscv_asm_zxm = b:riscv_asm_zxm_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^zxm\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zxm")
            unlet b:riscv_asm_zxm
        endif
    endif
    " Unknown extensions or parser error
    if s:riscv_asm_isa =~ '.\+'
        let b:riscv_asm_all_enable = 1
    endif
endif

" Override matchit configurations
if exists("loaded_matchit")
  let b:match_ignorecase=0
  let b:match_words=
    \ '^\s*#\s*if\(n\=def\)\=\>:^\s*#\s*elif\>:^\s*#\s*else\>:^\s*#\s*endif\>,' .
    \ '\<.macro\>:\<.exitm\>:\<.endm\>,' .
    \ '\<.def\>:\<.endef\>,' .
    \ '\<.func\>:\<.endfunc\>,' .
    \ '\<.bundle_lock\>:\<.bundle_unlock\>,' .
    \ '\<.cfi_startproc\>:\<.cfi_endproc\>,' .
    \ '\<.cfi_remember_state\>:\<.cfi_restore_state\>,' .
    \ '\<.\(irpc\=\|rept\)\>:\<.endr\>,' .
    \ '\<.pushsection\>:\<.popsection\>,' .
    \ '\<.if\(\(n\(ot\)\=\)\=def\|n\=b\|n\=c\|eqs\=\|ge\|gt\|le\|lt\|nes\=\)\=\>:\<.elseif\>:\<.else\>:\<.endif\>,'
endif

" Restore cpoptions
let &cpoptions=oldcpo
unlet oldcpo
