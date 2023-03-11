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
let b:riscv_asm_v_max = 1.1
" H Extension: Hypervisor Extension
let b:riscv_asm_h_max = 1.0
" Zicntr Extension: Base Counters and Timers
let b:riscv_asm_zicntr_max = 2.0
" Zicsr Extension: Control and Status Register Access
let b:riscv_asm_zicsr_max = 2.0
" Zifencei Extension: Instruction-Fetch Fence
let b:riscv_asm_zifencei_max = 2.0
" Zihintntl Extension: Non-Temporal Locality Hints
let b:riscv_asm_zihintntl_max = 0.2
" Zihintpause Extension: Pause Hint
let b:riscv_asm_zihintpause_max = 2.0
" Zihpm Extension: Hardware Performance Counters
let b:riscv_asm_zihpm_max = 2.0
" Zmmul Extension: Multiplication Without Division
let b:riscv_asm_zmmul_max = 1.0
" Zfa Extension: Additional Floating-Point Instructions
let b:riscv_asm_zfa_max = 0.1
" Zfh Extension: Half-Precision Floating-Point
let b:riscv_asm_zfh_max = 1.0
" Zfhmin Extension: Minimal Half-Precision Floating-Point
let b:riscv_asm_zfhmin_max = 1.0
" Zfinx Extension: Single-Precision Floating-Point in Integer Registers
let b:riscv_asm_zfinx_max = 1.0
" Zdinx Extension: Double-Precision Floating-Point in Integer Registers
let b:riscv_asm_zdinx_max = 1.0
" Zhinx Extension: Half-Precision Floating-Point in Integer Registers
let b:riscv_asm_zhinx_max = 1.0
" Zhinxmin Extension: Minimal Half-Precision Floating-Point in Integer Registers
let b:riscv_asm_zhinxmin_max = 1.0
" Zve32f Extension: Vector Extension for Embedded 32-bit Single-Precision Floating-Point
let b:riscv_asm_zve32f_max = 1.1
" Zve32x Extension: Vector Extension for Embedded 32-bit Integer
let b:riscv_asm_zve32x_max = 1.1
" Zve64d Extension: Vector Extension for Embedded 64-bit Double-Precision Floating-Point
let b:riscv_asm_zve64d_max = 1.1
" Zve64f Extension: Vector Extension for Embedded 64-bit Single-Precision Floating-Point
let b:riscv_asm_zve64f_max = 1.1
" Zve64x Extension: Vector Extension for Embedded 64-bit Integer
let b:riscv_asm_zve64x_max = 1.1
" Zvfh Extension: Vector Extension for Half-Precision Floating-Point
let b:riscv_asm_zvfh_max = 1.1
" Zvfhmin Extension: Vector Extension for Minimal Half-Precision Floating-Point
let b:riscv_asm_zvfhmin_max = 1.1
" Ss Extension: Supervisor-Level Extension
let b:riscv_asm_ss_max = 1.12
" Sm Extension: Machine-Level Extension
let b:riscv_asm_sm_max = 1.12

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

" Preserve the underscore before additional extension names
let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c_\(z\)', '-\1', "g")
let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c_\(s\)', '-\1', "g")

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
" The name should follow the sequence shown in README
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
    else
        if exists("b:riscv_asm_v")
            unlet b:riscv_asm_v
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
    " Zicntr extension
    if s:riscv_asm_isa =~ '\c^-\=zicntr\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zicntr\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zicntr = b:riscv_asm_zicntr_max
        else
            let b:riscv_asm_zicntr = str2float(s:extract_version)
            if b:riscv_asm_zicntr > b:riscv_asm_zicntr_max
                let b:riscv_asm_zicntr = b:riscv_asm_zicntr_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zicntr\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zicntr")
            unlet b:riscv_asm_zicntr
        endif
    endif
    " Zicsr extension
    if s:riscv_asm_isa =~ '\c^-\=zicsr\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zicsr\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zicsr = b:riscv_asm_zicsr_max
        else
            let b:riscv_asm_zicsr = str2float(s:extract_version)
            if b:riscv_asm_zicsr > b:riscv_asm_zicsr_max
                let b:riscv_asm_zicsr = b:riscv_asm_zicsr_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zicsr\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zicsr")
            unlet b:riscv_asm_zicsr
        endif
    endif
    " Zifencei extension
    if s:riscv_asm_isa =~ '\c^-\=zifencei\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zifencei\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zifencei = b:riscv_asm_zifencei_max
        else
            let b:riscv_asm_zifencei = str2float(s:extract_version)
            if b:riscv_asm_zifencei > b:riscv_asm_zifencei_max
                let b:riscv_asm_zifencei = b:riscv_asm_zifencei_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zifencei\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zifencei")
            unlet b:riscv_asm_zifencei
        endif
    endif
    " Zihintntl extension
    if s:riscv_asm_isa =~ '\c^-\=zihintntl\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zihintntl\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zihintntl = b:riscv_asm_zihintntl_max
        else
            let b:riscv_asm_zihintntl = str2float(s:extract_version)
            if b:riscv_asm_zihintntl > b:riscv_asm_zihintntl_max
                let b:riscv_asm_zihintntl = b:riscv_asm_zihintntl_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zihintntl\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zihintntl")
            unlet b:riscv_asm_zihintntl
        endif
    endif
    " Zihintpause extension
    if s:riscv_asm_isa =~ '\c^-\=zihintpause\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zihintpause\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zihintpause = b:riscv_asm_zihintpause_max
        else
            let b:riscv_asm_zihintpause = str2float(s:extract_version)
            if b:riscv_asm_zihintpause > b:riscv_asm_zihintpause_max
                let b:riscv_asm_zihintpause = b:riscv_asm_zihintpause_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zihintpause\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zihintpause")
            unlet b:riscv_asm_zihintpause
        endif
    endif
    " Zihpm extension
    if s:riscv_asm_isa =~ '\c^-\=zihpm\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zihpm\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zihpm = b:riscv_asm_zihpm_max
        else
            let b:riscv_asm_zihpm = str2float(s:extract_version)
            if b:riscv_asm_zihpm > b:riscv_asm_zihpm_max
                let b:riscv_asm_zihpm = b:riscv_asm_zihpm_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zihpm\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zihpm")
            unlet b:riscv_asm_zihpm
        endif
    endif
    " Zmmul extension
    if s:riscv_asm_isa =~ '\c^-\=zmmul\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zmmul\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zmmul = b:riscv_asm_zmmul_max
        else
            let b:riscv_asm_zmmul = str2float(s:extract_version)
            if b:riscv_asm_zmmul > b:riscv_asm_zmmul_max
                let b:riscv_asm_zmmul = b:riscv_asm_zmmul_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zmmul\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zmmul")
            unlet b:riscv_asm_zmmul
        endif
    endif
    " Zam extension
    if s:riscv_asm_isa =~ '\c^-\=zam\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zam\(\d\+\(\.\d\+\)\=\)\=', "", "")
    endif
    " Zfa extension
    if s:riscv_asm_isa =~ '\c^-\=zfa\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zfa\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zfa = b:riscv_asm_zfa_max
        else
            let b:riscv_asm_zfa = str2float(s:extract_version)
            if b:riscv_asm_zfa > b:riscv_asm_zfa_max
                let b:riscv_asm_zfa = b:riscv_asm_zfa_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zfa\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zfa")
            unlet b:riscv_asm_zfa
        endif
    endif
    " Zfh extension
    if s:riscv_asm_isa =~ '\c^-\=zfh\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zfh\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zfh = b:riscv_asm_zfh_max
        else
            let b:riscv_asm_zfh = str2float(s:extract_version)
            if b:riscv_asm_zfh > b:riscv_asm_zfh_max
                let b:riscv_asm_zfh = b:riscv_asm_zfh_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zfh\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zfh")
            unlet b:riscv_asm_zfh
        endif
    endif
    " Zfhmin extension
    if s:riscv_asm_isa =~ '\c^-\=zfhmin\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zfhmin\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zfhmin = b:riscv_asm_zfhmin_max
        else
            let b:riscv_asm_zfhmin = str2float(s:extract_version)
            if b:riscv_asm_zfhmin > b:riscv_asm_zfhmin_max
                let b:riscv_asm_zfhmin = b:riscv_asm_zfhmin_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zfhmin\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zfhmin")
            unlet b:riscv_asm_zfhmin
        endif
    endif
    " Zfinx extension
    if s:riscv_asm_isa =~ '\c^-\=zfinx\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)' && !exists("b:riscv_asm_f") && !exists("b:riscv_asm_d") && !exists("b:riscv_asm_q") && !exists("b:riscv_asm_zfa") && !exists("b:riscv_asm_zfh") && !exists("b:riscv_asm_zfhmin")
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zfinx\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zfinx = b:riscv_asm_zfinx_max
        else
            let b:riscv_asm_zfinx = str2float(s:extract_version)
            if b:riscv_asm_zfinx > b:riscv_asm_zfinx_max
                let b:riscv_asm_zfinx = b:riscv_asm_zfinx_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zfinx\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zfinx")
            unlet b:riscv_asm_zfinx
        endif
    endif
    " Zdinx extension
    if s:riscv_asm_isa =~ '\c^-\=zdinx\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)' && !exists("b:riscv_asm_f") && !exists("b:riscv_asm_d") && !exists("b:riscv_asm_q") && !exists("b:riscv_asm_zfa") && !exists("b:riscv_asm_zfh") && !exists("b:riscv_asm_zfhmin")
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zdinx\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zdinx = b:riscv_asm_zdinx_max
        else
            let b:riscv_asm_zdinx = str2float(s:extract_version)
            if b:riscv_asm_zdinx > b:riscv_asm_zdinx_max
                let b:riscv_asm_zdinx = b:riscv_asm_zdinx_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zdinx\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zdinx")
            unlet b:riscv_asm_zdinx
        endif
    endif
    " Zhinx extension
    if s:riscv_asm_isa =~ '\c^-\=zhinx\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)' && !exists("b:riscv_asm_f") && !exists("b:riscv_asm_d") && !exists("b:riscv_asm_q") && !exists("b:riscv_asm_v") && !exists("b:riscv_asm_zfa") && !exists("b:riscv_asm_zfh") && !exists("b:riscv_asm_zfhmin")
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zhinx\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zhinx = b:riscv_asm_zhinx_max
        else
            let b:riscv_asm_zhinx = str2float(s:extract_version)
            if b:riscv_asm_zhinx > b:riscv_asm_zhinx_max
                let b:riscv_asm_zhinx = b:riscv_asm_zhinx_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zhinx\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zhinx")
            unlet b:riscv_asm_zhinx
        endif
    endif
    " Zhinxmin extension
    if s:riscv_asm_isa =~ '\c^-\=zhinxmin\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)' && !exists("b:riscv_asm_f") && !exists("b:riscv_asm_d") && !exists("b:riscv_asm_q") && !exists("b:riscv_asm_zfa") && !exists("b:riscv_asm_zfh") && !exists("b:riscv_asm_zfhmin")
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zhinxmin\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zhinxmin = b:riscv_asm_zhinxmin_max
        else
            let b:riscv_asm_zhinxmin = str2float(s:extract_version)
            if b:riscv_asm_zhinxmin > b:riscv_asm_zhinxmin_max
                let b:riscv_asm_zhinxmin = b:riscv_asm_zhinxmin_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zhinxmin\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zhinxmin")
            unlet b:riscv_asm_zhinxmin
        endif
    endif
    " Zvamo extension
    if s:riscv_asm_isa =~ '\c^-\=zvamo\(-\|$\)'
        let b:riscv_asm_zvamo = 0.0
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zvamo', "", "")
    else
        if exists("b:riscv_asm_zvamo")
            unlet b:riscv_asm_zvamo
        endif
    endif
    " Zve32f extension
    if s:riscv_asm_isa =~ '\c^-\=zve32f\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)' && !exists("b:riscv_asm_zfinx") && !exists("b:riscv_asm_zdinx") && !exists("b:riscv_asm_zhinx") && !exists("b:riscv_asm_zhinxmin")
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zve32f\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zve32f = b:riscv_asm_zve32f_max
        else
            let b:riscv_asm_zve32f = str2float(s:extract_version)
            if b:riscv_asm_zve32f > b:riscv_asm_zve32f_max
                let b:riscv_asm_zve32f = b:riscv_asm_zve32f_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zve32f\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zve32f")
            unlet b:riscv_asm_zve32f
        endif
    endif
    " Zve32x extension
    if s:riscv_asm_isa =~ '\c^-\=zve32x\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zve32x\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zve32x = b:riscv_asm_zve32x_max
        else
            let b:riscv_asm_zve32x = str2float(s:extract_version)
            if b:riscv_asm_zve32x > b:riscv_asm_zve32x_max
                let b:riscv_asm_zve32x = b:riscv_asm_zve32x_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zve32x\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zve32x")
            unlet b:riscv_asm_zve32x
        endif
    endif
    " Zve64d extension
    if s:riscv_asm_isa =~ '\c^-\=zve64d\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)' && !exists("b:riscv_asm_zfinx") && !exists("b:riscv_asm_zdinx") && !exists("b:riscv_asm_zhinx") && !exists("b:riscv_asm_zhinxmin")
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zve64d\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zve64d = b:riscv_asm_zve64d_max
        else
            let b:riscv_asm_zve64d = str2float(s:extract_version)
            if b:riscv_asm_zve64d > b:riscv_asm_zve64d_max
                let b:riscv_asm_zve64d = b:riscv_asm_zve64d_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zve64d\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zve64d")
            unlet b:riscv_asm_zve64d
        endif
    endif
    " Zve64f extension
    if s:riscv_asm_isa =~ '\c^-\=zve64f\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)' && !exists("b:riscv_asm_zfinx") && !exists("b:riscv_asm_zdinx") && !exists("b:riscv_asm_zhinx") && !exists("b:riscv_asm_zhinxmin")
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zve64f\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zve64f = b:riscv_asm_zve64f_max
        else
            let b:riscv_asm_zve64f = str2float(s:extract_version)
            if b:riscv_asm_zve64f > b:riscv_asm_zve64f_max
                let b:riscv_asm_zve64f = b:riscv_asm_zve64f_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zve64f\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zve64f")
            unlet b:riscv_asm_zve64f
        endif
    endif
    " Zve64x extension
    if s:riscv_asm_isa =~ '\c^-\=zve64x\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zve64x\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zve64x = b:riscv_asm_zve64x_max
        else
            let b:riscv_asm_zve64x = str2float(s:extract_version)
            if b:riscv_asm_zve64x > b:riscv_asm_zve64x_max
                let b:riscv_asm_zve64x = b:riscv_asm_zve64x_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zve64x\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zve64x")
            unlet b:riscv_asm_zve64x
        endif
    endif
    " Zvediv extension
    if s:riscv_asm_isa =~ '\c^-\=zvediv\(-\|$\)'
        let b:riscv_asm_zvediv = 0.0
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zvediv', "", "")
    else
        if exists("b:riscv_asm_zvediv")
            unlet b:riscv_asm_zvediv
        endif
    endif
    " Zvfh extension
    if s:riscv_asm_isa =~ '\c^-\=zvfh\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zvfh\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zvfh = b:riscv_asm_zvfh_max
        else
            let b:riscv_asm_zvfh = str2float(s:extract_version)
            if b:riscv_asm_zvfh > b:riscv_asm_zvfh_max
                let b:riscv_asm_zvfh = b:riscv_asm_zvfh_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zvfh\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zvfh")
            unlet b:riscv_asm_zvfh
        endif
    endif
    " Zvfhmin extension
    if s:riscv_asm_isa =~ '\c^-\=zvfhmin\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zvfhmin\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zvfhmin = b:riscv_asm_zvfhmin_max
        else
            let b:riscv_asm_zvfhmin = str2float(s:extract_version)
            if b:riscv_asm_zvfhmin > b:riscv_asm_zvfhmin_max
                let b:riscv_asm_zvfhmin = b:riscv_asm_zvfhmin_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zvfhmin\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zvfhmin")
            unlet b:riscv_asm_zvfhmin
        endif
    endif
    " Zvl32b extension
    if s:riscv_asm_isa =~ '\c^-\=zvl32b\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zvl32b\(\d\+\(\.\d\+\)\=\)\=', "", "")
    endif
    " Zvl64b extension
    if s:riscv_asm_isa =~ '\c^-\=zvl64b\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zvl64b\(\d\+\(\.\d\+\)\=\)\=', "", "")
    endif
    " Zvl128b extension
    if s:riscv_asm_isa =~ '\c^-\=zvl128b\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zvl128b\(\d\+\(\.\d\+\)\=\)\=', "", "")
    endif
    " Zvl256b extension
    if s:riscv_asm_isa =~ '\c^-\=zvl256b\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zvl256b\(\d\+\(\.\d\+\)\=\)\=', "", "")
    endif
    " Zvl512b extension
    if s:riscv_asm_isa =~ '\c^-\=zvl512b\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zvl512b\(\d\+\(\.\d\+\)\=\)\=', "", "")
    endif
    " Zvl1024b extension
    if s:riscv_asm_isa =~ '\c^-\=zvl1024b\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zvl1024b\(\d\+\(\.\d\+\)\=\)\=', "", "")
    endif
    " Ztso extension
    if s:riscv_asm_isa =~ '\c^-\=ztso\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=ztso\(\d\+\(\.\d\+\)\=\)\=', "", "")
    endif
    " Ss extension
    if s:riscv_asm_isa =~ '\c^-\=ss\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=ss\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_ss = b:riscv_asm_ss_max
        else
            let b:riscv_asm_ss = str2float(s:extract_version)
            if b:riscv_asm_ss > b:riscv_asm_ss_max
                let b:riscv_asm_ss = b:riscv_asm_ss_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=ss\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_ss")
            unlet b:riscv_asm_ss
        endif
    endif
    " Sv32 extension
    if s:riscv_asm_isa =~ '\c^-\=sv32\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=sv32', "", "")
    endif
    " Sv39 extension
    if s:riscv_asm_isa =~ '\c^-\=sv39\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=sv39', "", "")
    endif
    " Sv48 extension
    if s:riscv_asm_isa =~ '\c^-\=sv48\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=sv48', "", "")
    endif
    " Sv57 extension
    if s:riscv_asm_isa =~ '\c^-\=sv57\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=sv57', "", "")
    endif
    " Sm extension
    if s:riscv_asm_isa =~ '\c^-\=sm\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=sm\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_sm = b:riscv_asm_sm_max
        else
            let b:riscv_asm_sm = str2float(s:extract_version)
            if b:riscv_asm_sm > b:riscv_asm_sm_max
                let b:riscv_asm_sm = b:riscv_asm_sm_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=sm\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_sm")
            unlet b:riscv_asm_sm
        endif
    endif
    " Unknown extensions or parser error
    if s:riscv_asm_isa =~ '.\+'
        let b:riscv_asm_all_enable = 1
        " Restore the underscore before additional extension names
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c-\(z\)', '_\1', "g")
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c-\(s\)', '_\1', "g")

        " Restore version format
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\(\d\+\)\.\(\d\+\)', '\1p\2', "g")
        echom "Error! Can't resolve remaining ISA string: " . s:riscv_asm_isa
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
