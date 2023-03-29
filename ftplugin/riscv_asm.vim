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
" Zicbom Extension: Cache-Block Management Instructions
let b:riscv_asm_zicbom_max = 1.0
" Zicbop Extension: Cache-Block Prefetch Instructions
let b:riscv_asm_zicbop_max = 1.0
" Zicboz Extension: Cache-Block Zero Instructions
let b:riscv_asm_zicboz_max = 1.0
" Zicntr Extension: Base Counters and Timers
let b:riscv_asm_zicntr_max = 2.0
" Zicond Extension:  Integer Conditional Operations Extension
let b:riscv_asm_zicond_max = 1.0
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
" Zawrs Extension: Wait-On-Reservation-Set Extension
let b:riscv_asm_zawrs_max = 1.0
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
" Zca Extension: C Extension Instructions without Floating-Point Load/Stores
let b:riscv_asm_zca_max = 1.0
" Zcb Extension: Simple Code Size Saving Instructions
let b:riscv_asm_zcb_max = 1.0
" Zcd Extension: Compressed Double-Precision Floating-Point Load/Stores Instructions
let b:riscv_asm_zcd_max = 1.0
" Zce Extension: Compressed Instructions for Microcontrollers
let b:riscv_asm_zce_max = 1.0
" Zcf Extension: Compressed Single-Precision Floating-Point Load/Stores Instructions
let b:riscv_asm_zcf_max = 1.0
" Zcmp Extension: Push/Pop and Double Move Instructions
let b:riscv_asm_zcmp_max = 1.0
" Zcmt Extension: Table Jump Instructions
let b:riscv_asm_zcmt_max = 1.0
" Zba Extension: Address Generation Instructions
let b:riscv_asm_zba_max = 1.0
" Zbb Extension: Basic Bit-Manipulation
let b:riscv_asm_zbb_max = 1.0
" Zbc Extension: Carry-Less Multiplication
let b:riscv_asm_zbc_max = 1.0
" Zbkb Extension: Bit-Manipulation Instructions for Cryptography
let b:riscv_asm_zbkb_max = 1.0
" Zbkc Extension: Carry-Less Multiplication Instructions for Cryptography
let b:riscv_asm_zbkc_max = 1.0
" Zbkx Extension: Crossbar Permutation Instructions for Cryptography
let b:riscv_asm_zbkx_max = 1.0
" Zbs Extension: Single-Bit Instructions
let b:riscv_asm_zbs_max = 1.0
" Zk Extension: Standard Scalar Cryptography Extension
let b:riscv_asm_zk_max = 1.0
" Zkn Extension: NIST Algorithm Suite Extension
let b:riscv_asm_zkn_max = 1.0
" Zknd Extension: AES Decryption Instructions
let b:riscv_asm_zknd_max = 1.0
" Zkne Extension: AES Encryption Instructions
let b:riscv_asm_zkne_max = 1.0
" Zknh Extension: SHA2 Hash Function Instructions
let b:riscv_asm_zknh_max = 1.0
" Zkr Extension: Entropy Source Extension
let b:riscv_asm_zkr_max = 1.0
" Zks Extension: ShangMi Algorithm Suite Extension
let b:riscv_asm_zks_max = 1.0
" Zksed Extension: SM4 Block Cipher Instructions
let b:riscv_asm_zksed_max = 1.0
" Zksh Extension: SM3 Hash Function Instructions
let b:riscv_asm_zksh_max = 1.0
" Zvbb Extension: Vector Bit-Manipulation Instructions for Cryptography
let b:riscv_asm_zvbb_max = 0.4
" Zvbc Extension: Vector Carry-Less Multiplication
let b:riscv_asm_zvbc_max = 0.4
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
" Zvkg Extension: Vector GCM/GMAC
let b:riscv_asm_zvkg_max = 0.4
" Zvkn Extension: Vector NIST Algorithm Suite Extension
let b:riscv_asm_zvkn_max = 0.4
" Zvkned Extension: Vector AES Block Cipher
let b:riscv_asm_zvkned_max = 0.4
" Zvknha Extension: Vector SHA-2 Secure Hash for Embedded 32-bit
let b:riscv_asm_zvknha_max = 0.4
" Zvknhb Extension: Vector SHA-2 Secure Hash
let b:riscv_asm_zvknhb_max = 0.4
" Zvks Extension: Vector ShangMi Algorithm Suite Extension
let b:riscv_asm_zvks_max = 0.4
" Zvksed Extension: Vector SM4 Block Cipher
let b:riscv_asm_zvksed_max = 0.4
" Zvksh Extension: Vector SM3 Secure Hash
let b:riscv_asm_zvksh_max = 0.4
" Ss Extension: Supervisor-Level Extension
let b:riscv_asm_ss_max = 1.12
" Ssaia Extension: Supervisor-Level Advanced Interrupt Architecture Extension
let b:riscv_asm_ssaia_max = 1.12
" Sscofpmf Extension: Count Overflow and Mode-Based Filtering Extension
let b:riscv_asm_sscofpmf_max = 0.5
" Sspmp Extension: Supervisor Memory Protection Extension
let b:riscv_asm_sspmp_max = 0.8
" Sstc Extension: Supervisor-Level Timer Comparison Extension
let b:riscv_asm_sstc_max = 0.5
" Ssstateen Extension: Supervisor-Level State Enable Extension
let b:riscv_asm_ssstateen_max = 1.0
" Svadu Extension: Hardware Updating of PTE A/D Bits
let b:riscv_asm_svadu_max = 0.1
" Svinval Extension: Fine-Grained Address-Translation Cache Invalidation
let b:riscv_asm_svinval_max = 1.0
" Sm Extension: Machine-Level Extension
let b:riscv_asm_sm_max = 1.12
" Smaia Extension: Machine-Level Advanced Interrupt Architecture Extension
let b:riscv_asm_smaia_max = 1.12
" Smstateen Extension: Machine-Level State Enable Extension
let b:riscv_asm_smstateen_max = 1.0
" Sdext Extension: External Debug Extension
let b:riscv_asm_sdext_max = 1.0
" Sdtrig Extension: Debug Trigger Extension
let b:riscv_asm_sdtrig_max = 1.0

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
    let s:riscv_asm_isa = "rv64gc"
    unlet b:riscv_asm_xlen
endif

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
if s:riscv_asm_isa =~ '\c^rv\(32\|64\|128\)[ieg]' && !exists("b:riscv_asm_all_enable")
    let s:extract_length = substitute(s:riscv_asm_isa, '\c^rv\(\d\+\)\([ieg]\)\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
    let s:extract_base = substitute(s:riscv_asm_isa, '\c^rv\(\d\+\)\([ieg]\)\(\d\+\(\.\d\+\)\=\)\=.*', '\2', "")
    let s:extract_version = substitute(s:riscv_asm_isa, '\c^rv\(\d\+\)\([ieg]\)\(\d\+\(\.\d\+\)\=\)\=.*', '\3', "")
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
    elseif s:extract_length == "32" && s:extract_base =~ '[Gg]' && s:extract_version == ''
        let b:riscv_asm_rv32i = b:riscv_asm_rv32i_max
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
    elseif s:extract_length == "64" && s:extract_base =~ '[Gg]' && s:extract_version == ''
        let b:riscv_asm_rv64i = b:riscv_asm_rv64i_max
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
    elseif s:extract_length == "128" && s:extract_base =~ '[Gg]' && s:extract_version == ''
        let b:riscv_asm_rv128i = b:riscv_asm_rv128i_max
        let b:riscv_asm_xlen = 128
    endif
    let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^rv\(32\|64\)[ie]\(\d\+\(\.\d\+\)\=\)\=', "", "")
    let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^rv128i\(\d\+\(\.\d\+\)\=\)\=', "", "")
    let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^rv\d\+', "", "")
else
    " Base ISA isn't found, enable all extensions
    let b:riscv_asm_xlen = 0
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
    " G extension
    if s:riscv_asm_isa =~ '\c^g' && s:extract_base !~ '[Ee]'
        if !exists("b:riscv_asm_m")
            let b:riscv_asm_m = b:riscv_asm_m_max
        endif
        if !exists("b:riscv_asm_a")
            let b:riscv_asm_a = b:riscv_asm_a_max
        endif
        if !exists("b:riscv_asm_f")
            let b:riscv_asm_f = b:riscv_asm_f_max
        endif
        if !exists("b:riscv_asm_d")
            let b:riscv_asm_d = b:riscv_asm_d_max
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^g', "", "")
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
    if s:riscv_asm_isa =~ '\c^h' && !exists("b:riscv_asm_rv32e") && !exists("b:riscv_asm_rv64e")
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
    " Zic64b extension
    if s:riscv_asm_isa =~ '\c^-\=zic64b\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zic64b', "", "")
    endif
    " Zicbom extension
    if s:riscv_asm_isa =~ '\c^-\=zicbom\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zicbom\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zicbom = b:riscv_asm_zicbom_max
        else
            let b:riscv_asm_zicbom = str2float(s:extract_version)
            if b:riscv_asm_zicbom > b:riscv_asm_zicbom_max
                let b:riscv_asm_zicbom = b:riscv_asm_zicbom_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zicbom\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zicbom")
            unlet b:riscv_asm_zicbom
        endif
    endif
    " Zicbop extension
    if s:riscv_asm_isa =~ '\c^-\=zicbop\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zicbop\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zicbop = b:riscv_asm_zicbop_max
        else
            let b:riscv_asm_zicbop = str2float(s:extract_version)
            if b:riscv_asm_zicbop > b:riscv_asm_zicbop_max
                let b:riscv_asm_zicbop = b:riscv_asm_zicbop_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zicbop\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zicbop")
            unlet b:riscv_asm_zicbop
        endif
    endif
    " Zicboz extension
    if s:riscv_asm_isa =~ '\c^-\=zicboz\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zicboz\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zicboz = b:riscv_asm_zicboz_max
        else
            let b:riscv_asm_zicboz = str2float(s:extract_version)
            if b:riscv_asm_zicboz > b:riscv_asm_zicboz_max
                let b:riscv_asm_zicboz = b:riscv_asm_zicboz_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zicboz\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zicboz")
            unlet b:riscv_asm_zicboz
        endif
    endif
    " Ziccamoa extension
    if s:riscv_asm_isa =~ '\c^-\=ziccamoa\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=ziccamoa', "", "")
    endif
    " Ziccif extension
    if s:riscv_asm_isa =~ '\c^-\=ziccif\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=ziccif', "", "")
    endif
    " Zicclsm extension
    if s:riscv_asm_isa =~ '\c^-\=zicclsm\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zicclsm', "", "")
    endif
    " Ziccrse extension
    if s:riscv_asm_isa =~ '\c^-\=ziccrse\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=ziccrse', "", "")
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
    " Zicond extension
    if s:riscv_asm_isa =~ '\c^-\=zicond\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zicond\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zicond = b:riscv_asm_zicond_max
        else
            let b:riscv_asm_zicond = str2float(s:extract_version)
            if b:riscv_asm_zicond > b:riscv_asm_zicond_max
                let b:riscv_asm_zicond = b:riscv_asm_zicond_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zicond\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zicond")
            unlet b:riscv_asm_zicond
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
    " Za128rs extension
    if s:riscv_asm_isa =~ '\c^-\=za128rs\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=za128rs', "", "")
    endif
    " Za64rs extension
    if s:riscv_asm_isa =~ '\c^-\=za64rs\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=za64rs', "", "")
    endif
    " Zawrs extension
    if s:riscv_asm_isa =~ '\c^-\=zawrs\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zawrs\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zawrs = b:riscv_asm_zawrs_max
        else
            let b:riscv_asm_zawrs = str2float(s:extract_version)
            if b:riscv_asm_zawrs > b:riscv_asm_zawrs_max
                let b:riscv_asm_zawrs = b:riscv_asm_zawrs_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zawrs\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zawrs")
            unlet b:riscv_asm_zawrs
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
    " Zca extension
    if s:riscv_asm_isa =~ '\c^-\=zca\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zca\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zca = b:riscv_asm_zca_max
        else
            let b:riscv_asm_zca = str2float(s:extract_version)
            if b:riscv_asm_zca > b:riscv_asm_zca_max
                let b:riscv_asm_zca = b:riscv_asm_zca_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zca\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zca")
            unlet b:riscv_asm_zca
        endif
    endif
    " Zcb extension
    if s:riscv_asm_isa =~ '\c^-\=zcb\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zcb\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zcb = b:riscv_asm_zcb_max
        else
            let b:riscv_asm_zcb = str2float(s:extract_version)
            if b:riscv_asm_zcb > b:riscv_asm_zcb_max
                let b:riscv_asm_zcb = b:riscv_asm_zcb_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zcb\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zcb")
            unlet b:riscv_asm_zcb
        endif
    endif
    " Zcd extension
    if s:riscv_asm_isa =~ '\c^-\=zcd\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)' && b:riscv_asm_xlen <= 64 && !exists("b:riscv_asm_zfinx") && !exists("b:riscv_asm_zdinx") && !exists("b:riscv_asm_zhinx") && !exists("b:riscv_asm_zhinxmin")
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zcd\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zcd = b:riscv_asm_zcd_max
        else
            let b:riscv_asm_zcd = str2float(s:extract_version)
            if b:riscv_asm_zcd > b:riscv_asm_zcd_max
                let b:riscv_asm_zcd = b:riscv_asm_zcd_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zcd\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zcd")
            unlet b:riscv_asm_zcd
        endif
    endif
    " Zce extension
    if s:riscv_asm_isa =~ '\c^-\=zce\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)' && !exists("b:riscv_asm_c") && !exists("b:riscv_asm_zcd")
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zce\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zce = b:riscv_asm_zce_max
        else
            let b:riscv_asm_zce = str2float(s:extract_version)
            if b:riscv_asm_zce > b:riscv_asm_zce_max
                let b:riscv_asm_zce = b:riscv_asm_zce_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zce\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zce")
            unlet b:riscv_asm_zce
        endif
    endif
    " Zcf extension
    if s:riscv_asm_isa =~ '\c^-\=zcf\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)' && b:riscv_asm_xlen == 32 && !exists("b:riscv_asm_zfinx") && !exists("b:riscv_asm_zdinx") && !exists("b:riscv_asm_zhinx") && !exists("b:riscv_asm_zhinxmin")
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zcf\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zcf = b:riscv_asm_zcf_max
        else
            let b:riscv_asm_zcf = str2float(s:extract_version)
            if b:riscv_asm_zcf > b:riscv_asm_zcf_max
                let b:riscv_asm_zcf = b:riscv_asm_zcf_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zcf\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zcf")
            unlet b:riscv_asm_zcf
        endif
    endif
    " Zcmp extension
    if s:riscv_asm_isa =~ '\c^-\=zcmp\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)' && !exists("b:riscv_asm_c") && !exists("b:riscv_asm_zcd")
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zcmp\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zcmp = b:riscv_asm_zcmp_max
        else
            let b:riscv_asm_zcmp = str2float(s:extract_version)
            if b:riscv_asm_zcmp > b:riscv_asm_zcmp_max
                let b:riscv_asm_zcmp = b:riscv_asm_zcmp_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zcmp\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zcmp")
            unlet b:riscv_asm_zcmp
        endif
    endif
    " Zcmt extension
    if s:riscv_asm_isa =~ '\c^-\=zcmt\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)' && !exists("b:riscv_asm_c") && !exists("b:riscv_asm_zcd")
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zcmt\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zcmt = b:riscv_asm_zcmt_max
        else
            let b:riscv_asm_zcmt = str2float(s:extract_version)
            if b:riscv_asm_zcmt > b:riscv_asm_zcmt_max
                let b:riscv_asm_zcmt = b:riscv_asm_zcmt_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zcmt\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zcmt")
            unlet b:riscv_asm_zcmt
        endif
    endif
    " Zba extension
    if s:riscv_asm_isa =~ '\c^-\=zba\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zba\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zba = b:riscv_asm_zba_max
        else
            let b:riscv_asm_zba = str2float(s:extract_version)
            if b:riscv_asm_zba > b:riscv_asm_zba_max
                let b:riscv_asm_zba = b:riscv_asm_zba_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zba\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zba")
            unlet b:riscv_asm_zba
        endif
    endif
    " Zba extension
    if s:riscv_asm_isa =~ '\c^-\=zba\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zba\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zba = b:riscv_asm_zba_max
        else
            let b:riscv_asm_zba = str2float(s:extract_version)
            if b:riscv_asm_zba > b:riscv_asm_zba_max
                let b:riscv_asm_zba = b:riscv_asm_zba_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zba\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zba")
            unlet b:riscv_asm_zba
        endif
    endif
    " Zba extension
    if s:riscv_asm_isa =~ '\c^-\=zba\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zba\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zba = b:riscv_asm_zba_max
        else
            let b:riscv_asm_zba = str2float(s:extract_version)
            if b:riscv_asm_zba > b:riscv_asm_zba_max
                let b:riscv_asm_zba = b:riscv_asm_zba_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zba\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zba")
            unlet b:riscv_asm_zba
        endif
    endif
    " Zbb extension
    if s:riscv_asm_isa =~ '\c^-\=zbb\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zbb\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zbb = b:riscv_asm_zbb_max
        else
            let b:riscv_asm_zbb = str2float(s:extract_version)
            if b:riscv_asm_zbb > b:riscv_asm_zbb_max
                let b:riscv_asm_zbb = b:riscv_asm_zbb_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zbb\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zbb")
            unlet b:riscv_asm_zbb
        endif
    endif
    " Zbc extension
    if s:riscv_asm_isa =~ '\c^-\=zbc\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zbc\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zbc = b:riscv_asm_zbc_max
        else
            let b:riscv_asm_zbc = str2float(s:extract_version)
            if b:riscv_asm_zbc > b:riscv_asm_zbc_max
                let b:riscv_asm_zbc = b:riscv_asm_zbc_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zbc\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zbc")
            unlet b:riscv_asm_zbc
        endif
    endif
    " Zbkb extension
    if s:riscv_asm_isa =~ '\c^-\=zbkb\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zbkb\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zbkb = b:riscv_asm_zbkb_max
        else
            let b:riscv_asm_zbkb = str2float(s:extract_version)
            if b:riscv_asm_zbkb > b:riscv_asm_zbkb_max
                let b:riscv_asm_zbkb = b:riscv_asm_zbkb_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zbkb\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zbkb")
            unlet b:riscv_asm_zbkb
        endif
    endif
    " Zbkc extension
    if s:riscv_asm_isa =~ '\c^-\=zbkc\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zbkc\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zbkc = b:riscv_asm_zbkc_max
        else
            let b:riscv_asm_zbkc = str2float(s:extract_version)
            if b:riscv_asm_zbkc > b:riscv_asm_zbkc_max
                let b:riscv_asm_zbkc = b:riscv_asm_zbkc_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zbkc\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zbkc")
            unlet b:riscv_asm_zbkc
        endif
    endif
    " Zbkx extension
    if s:riscv_asm_isa =~ '\c^-\=zbkx\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zbkx\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zbkx = b:riscv_asm_zbkx_max
        else
            let b:riscv_asm_zbkx = str2float(s:extract_version)
            if b:riscv_asm_zbkx > b:riscv_asm_zbkx_max
                let b:riscv_asm_zbkx = b:riscv_asm_zbkx_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zbkx\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zbkx")
            unlet b:riscv_asm_zbkx
        endif
    endif
    " Zbs extension
    if s:riscv_asm_isa =~ '\c^-\=zbs\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zbs\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zbs = b:riscv_asm_zbs_max
        else
            let b:riscv_asm_zbs = str2float(s:extract_version)
            if b:riscv_asm_zbs > b:riscv_asm_zbs_max
                let b:riscv_asm_zbs = b:riscv_asm_zbs_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zbs\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zbs")
            unlet b:riscv_asm_zbs
        endif
    endif
    " Zk extension
    if s:riscv_asm_isa =~ '\c^-\=zk\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zk\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zk = b:riscv_asm_zk_max
        else
            let b:riscv_asm_zk = str2float(s:extract_version)
            if b:riscv_asm_zk > b:riscv_asm_zk_max
                let b:riscv_asm_zk = b:riscv_asm_zk_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zk\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zk")
            unlet b:riscv_asm_zk
        endif
    endif
    " Zkn extension
    if s:riscv_asm_isa =~ '\c^-\=zkn\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zkn\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zkn = b:riscv_asm_zkn_max
        else
            let b:riscv_asm_zkn = str2float(s:extract_version)
            if b:riscv_asm_zkn > b:riscv_asm_zkn_max
                let b:riscv_asm_zkn = b:riscv_asm_zkn_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zkn\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zkn")
            unlet b:riscv_asm_zkn
        endif
    endif
    " Zknd extension
    if s:riscv_asm_isa =~ '\c^-\=zknd\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zknd\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zknd = b:riscv_asm_zknd_max
        else
            let b:riscv_asm_zknd = str2float(s:extract_version)
            if b:riscv_asm_zknd > b:riscv_asm_zknd_max
                let b:riscv_asm_zknd = b:riscv_asm_zknd_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zknd\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zknd")
            unlet b:riscv_asm_zknd
        endif
    endif
    " Zkne extension
    if s:riscv_asm_isa =~ '\c^-\=zkne\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zkne\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zkne = b:riscv_asm_zkne_max
        else
            let b:riscv_asm_zkne = str2float(s:extract_version)
            if b:riscv_asm_zkne > b:riscv_asm_zkne_max
                let b:riscv_asm_zkne = b:riscv_asm_zkne_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zkne\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zkne")
            unlet b:riscv_asm_zkne
        endif
    endif
    " Zknh extension
    if s:riscv_asm_isa =~ '\c^-\=zknh\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zknh\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zknh = b:riscv_asm_zknh_max
        else
            let b:riscv_asm_zknh = str2float(s:extract_version)
            if b:riscv_asm_zknh > b:riscv_asm_zknh_max
                let b:riscv_asm_zknh = b:riscv_asm_zknh_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zknh\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zknh")
            unlet b:riscv_asm_zknh
        endif
    endif
    " Zkr extension
    if s:riscv_asm_isa =~ '\c^-\=zkr\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zkr\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zkr = b:riscv_asm_zkr_max
        else
            let b:riscv_asm_zkr = str2float(s:extract_version)
            if b:riscv_asm_zkr > b:riscv_asm_zkr_max
                let b:riscv_asm_zkr = b:riscv_asm_zkr_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zkr\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zkr")
            unlet b:riscv_asm_zkr
        endif
    endif
    " Zks extension
    if s:riscv_asm_isa =~ '\c^-\=zks\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zks\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zks = b:riscv_asm_zks_max
        else
            let b:riscv_asm_zks = str2float(s:extract_version)
            if b:riscv_asm_zks > b:riscv_asm_zks_max
                let b:riscv_asm_zks = b:riscv_asm_zks_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zks\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zks")
            unlet b:riscv_asm_zks
        endif
    endif
    " Zksed extension
    if s:riscv_asm_isa =~ '\c^-\=zksed\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zksed\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zksed = b:riscv_asm_zksed_max
        else
            let b:riscv_asm_zksed = str2float(s:extract_version)
            if b:riscv_asm_zksed > b:riscv_asm_zksed_max
                let b:riscv_asm_zksed = b:riscv_asm_zksed_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zksed\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zksed")
            unlet b:riscv_asm_zksed
        endif
    endif
    " Zksh extension
    if s:riscv_asm_isa =~ '\c^-\=zksh\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zksh\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zksh = b:riscv_asm_zksh_max
        else
            let b:riscv_asm_zksh = str2float(s:extract_version)
            if b:riscv_asm_zksh > b:riscv_asm_zksh_max
                let b:riscv_asm_zksh = b:riscv_asm_zksh_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zksh\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zksh")
            unlet b:riscv_asm_zksh
        endif
    endif
    " Zkt extension
    if s:riscv_asm_isa =~ '\c^-\=zkt\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zkt\(\d\+\(\.\d\+\)\=\)\=', "", "")
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
    " Zvbb extension
    if s:riscv_asm_isa =~ '\c^-\=zvbb\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zvbb\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zvbb = b:riscv_asm_zvbb_max
        else
            let b:riscv_asm_zvbb = str2float(s:extract_version)
            if b:riscv_asm_zvbb > b:riscv_asm_zvbb_max
                let b:riscv_asm_zvbb = b:riscv_asm_zvbb_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zvbb\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zvbb")
            unlet b:riscv_asm_zvbb
        endif
    endif
    " Zvbc extension
    if s:riscv_asm_isa =~ '\c^-\=zvbc\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zvbc\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zvbc = b:riscv_asm_zvbc_max
        else
            let b:riscv_asm_zvbc = str2float(s:extract_version)
            if b:riscv_asm_zvbc > b:riscv_asm_zvbc_max
                let b:riscv_asm_zvbc = b:riscv_asm_zvbc_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zvbc\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zvbc")
            unlet b:riscv_asm_zvbc
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
    " Zvkg extension
    if s:riscv_asm_isa =~ '\c^-\=zvkg\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zvkg\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zvkg = b:riscv_asm_zvkg_max
        else
            let b:riscv_asm_zvkg = str2float(s:extract_version)
            if b:riscv_asm_zvkg > b:riscv_asm_zvkg_max
                let b:riscv_asm_zvkg = b:riscv_asm_zvkg_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zvkg\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zvkg")
            unlet b:riscv_asm_zvkg
        endif
    endif
    " Zvkn extension
    if s:riscv_asm_isa =~ '\c^-\=zvkn\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zvkn\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zvkn = b:riscv_asm_zvkn_max
        else
            let b:riscv_asm_zvkn = str2float(s:extract_version)
            if b:riscv_asm_zvkn > b:riscv_asm_zvkn_max
                let b:riscv_asm_zvkn = b:riscv_asm_zvkn_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zvkn\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zvkn")
            unlet b:riscv_asm_zvkn
        endif
    endif
    " Zvkned extension
    if s:riscv_asm_isa =~ '\c^-\=zvkned\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zvkned\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zvkned = b:riscv_asm_zvkned_max
        else
            let b:riscv_asm_zvkned = str2float(s:extract_version)
            if b:riscv_asm_zvkned > b:riscv_asm_zvkned_max
                let b:riscv_asm_zvkned = b:riscv_asm_zvkned_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zvkned\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zvkned")
            unlet b:riscv_asm_zvkned
        endif
    endif
    " Zvknha extension
    if s:riscv_asm_isa =~ '\c^-\=zvknha\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zvknha\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zvknha = b:riscv_asm_zvknha_max
        else
            let b:riscv_asm_zvknha = str2float(s:extract_version)
            if b:riscv_asm_zvknha > b:riscv_asm_zvknha_max
                let b:riscv_asm_zvknha = b:riscv_asm_zvknha_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zvknha\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zvknha")
            unlet b:riscv_asm_zvknha
        endif
    endif
    " Zvknhb extension
    if s:riscv_asm_isa =~ '\c^-\=zvknhb\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)' && !exists("b:riscv_asm_zve32x") && !exists("b:riscv_asm_zve32f")
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zvknhb\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zvknhb = b:riscv_asm_zvknhb_max
        else
            let b:riscv_asm_zvknhb = str2float(s:extract_version)
            if b:riscv_asm_zvknhb > b:riscv_asm_zvknhb_max
                let b:riscv_asm_zvknhb = b:riscv_asm_zvknhb_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zvknhb\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zvknhb")
            unlet b:riscv_asm_zvknhb
        endif
    endif
    " Zvks extension
    if s:riscv_asm_isa =~ '\c^-\=zvks\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zvks\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zvks = b:riscv_asm_zvks_max
        else
            let b:riscv_asm_zvks = str2float(s:extract_version)
            if b:riscv_asm_zvks > b:riscv_asm_zvks_max
                let b:riscv_asm_zvks = b:riscv_asm_zvks_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zvks\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zvks")
            unlet b:riscv_asm_zvks
        endif
    endif
    " Zvksed extension
    if s:riscv_asm_isa =~ '\c^-\=zvksed\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zvksed\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zvksed = b:riscv_asm_zvksed_max
        else
            let b:riscv_asm_zvksed = str2float(s:extract_version)
            if b:riscv_asm_zvksed > b:riscv_asm_zvksed_max
                let b:riscv_asm_zvksed = b:riscv_asm_zvksed_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zvksed\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zvksed")
            unlet b:riscv_asm_zvksed
        endif
    endif
    " Zvksh extension
    if s:riscv_asm_isa =~ '\c^-\=zvksh\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=zvksh\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_zvksh = b:riscv_asm_zvksh_max
        else
            let b:riscv_asm_zvksh = str2float(s:extract_version)
            if b:riscv_asm_zvksh > b:riscv_asm_zvksh_max
                let b:riscv_asm_zvksh = b:riscv_asm_zvksh_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zvksh\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_zvksh")
            unlet b:riscv_asm_zvksh
        endif
    endif
    " Zvkt extension
    if s:riscv_asm_isa =~ '\c^-\=zvkt\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=zvkt\(\d\+\(\.\d\+\)\=\)\=', "", "")
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
    " Ssaia extension
    if s:riscv_asm_isa =~ '\c^-\=ssaia\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=ssaia\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_ssaia = b:riscv_asm_ssaia_max
        else
            let b:riscv_asm_ssaia = str2float(s:extract_version)
            if b:riscv_asm_ssaia > b:riscv_asm_ssaia_max
                let b:riscv_asm_ssaia = b:riscv_asm_ssaia_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=ssaia\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_ssaia")
            unlet b:riscv_asm_ssaia
        endif
    endif
    " Ssccptr extension
    if s:riscv_asm_isa =~ '\c^-\=ssccptr\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=ssccptr', "", "")
    endif
    " Sscofpmf extension
    if s:riscv_asm_isa =~ '\c^-\=sscofpmf\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=sscofpmf\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_sscofpmf = b:riscv_asm_sscofpmf_max
        else
            let b:riscv_asm_sscofpmf = str2float(s:extract_version)
            if b:riscv_asm_sscofpmf > b:riscv_asm_sscofpmf_max
                let b:riscv_asm_sscofpmf = b:riscv_asm_sscofpmf_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=sscofpmf\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_sscofpmf")
            unlet b:riscv_asm_sscofpmf
        endif
    endif
    " Sscounterenw extension
    if s:riscv_asm_isa =~ '\c^-\=sscounterenw\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=sscounterenw', "", "")
    endif
    " Sspmp extension
    if s:riscv_asm_isa =~ '\c^-\=sspmp\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=sspmp\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_sspmp = b:riscv_asm_sspmp_max
        else
            let b:riscv_asm_sspmp = str2float(s:extract_version)
            if b:riscv_asm_sspmp > b:riscv_asm_sspmp_max
                let b:riscv_asm_sspmp = b:riscv_asm_sspmp_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=sspmp\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_sspmp")
            unlet b:riscv_asm_sspmp
        endif
    endif
    " Ssstateen extension
    if s:riscv_asm_isa =~ '\c^-\=ssstateen\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=ssstateen\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_ssstateen = b:riscv_asm_ssstateen_max
        else
            let b:riscv_asm_ssstateen = str2float(s:extract_version)
            if b:riscv_asm_ssstateen > b:riscv_asm_ssstateen_max
                let b:riscv_asm_ssstateen = b:riscv_asm_ssstateen_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=ssstateen\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_ssstateen")
            unlet b:riscv_asm_ssstateen
        endif
    endif
    " Sstc extension
    if s:riscv_asm_isa =~ '\c^-\=sstc\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=sstc\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_sstc = b:riscv_asm_sstc_max
        else
            let b:riscv_asm_sstc = str2float(s:extract_version)
            if b:riscv_asm_sstc > b:riscv_asm_sstc_max
                let b:riscv_asm_sstc = b:riscv_asm_sstc_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=sstc\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_sstc")
            unlet b:riscv_asm_sstc
        endif
    endif
    " Sstvala extension
    if s:riscv_asm_isa =~ '\c^-\=sstvala\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=sstvala', "", "")
    endif
    " Sstvecd extension
    if s:riscv_asm_isa =~ '\c^-\=sstvecd\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=sstvecd', "", "")
    endif
    " Ssu64xl extension
    if s:riscv_asm_isa =~ '\c^-\=ssu64xl\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=ssu64xl', "", "")
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
    " Svade extension
    if s:riscv_asm_isa =~ '\c^-\=svade\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=svade', "", "")
    endif
    " Svadu extension
    if s:riscv_asm_isa =~ '\c^-\=svadu\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=svadu\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_svadu = b:riscv_asm_svadu_max
        else
            let b:riscv_asm_svadu = str2float(s:extract_version)
            if b:riscv_asm_svadu > b:riscv_asm_svadu_max
                let b:riscv_asm_svadu = b:riscv_asm_svadu_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=svadu\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_svadu")
            unlet b:riscv_asm_svadu
        endif
    endif
    " Svbare extension
    if s:riscv_asm_isa =~ '\c^-\=svbare\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=svbare', "", "")
    endif
    " Svinval extension
    if s:riscv_asm_isa =~ '\c^-\=svinval\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=svinval\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_svinval = b:riscv_asm_svinval_max
        else
            let b:riscv_asm_svinval = str2float(s:extract_version)
            if b:riscv_asm_svinval > b:riscv_asm_svinval_max
                let b:riscv_asm_svinval = b:riscv_asm_svinval_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=svinval\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_svinval")
            unlet b:riscv_asm_svinval
        endif
    endif
    " Svnapot extension
    if s:riscv_asm_isa =~ '\c^-\=svnapot\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=svnapot\(\d\+\(\.\d\+\)\=\)\=', "", "")
    endif
    " Svpbmt extension
    if s:riscv_asm_isa =~ '\c^-\=svpbmt\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=svpbmt\(\d\+\(\.\d\+\)\=\)\=', "", "")
    endif
    " Shcounterenw extension
    if s:riscv_asm_isa =~ '\c^-\=shcounterenw\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=shcounterenw', "", "")
    endif
    " Shtvala extension
    if s:riscv_asm_isa =~ '\c^-\=shtvala\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=shtvala', "", "")
    endif
    " Shvsatpa extension
    if s:riscv_asm_isa =~ '\c^-\=shvsatpa\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=shvsatpa', "", "")
    endif
    " Shvstvala extension
    if s:riscv_asm_isa =~ '\c^-\=shvstvala\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=shvstvala', "", "")
    endif
    " Shvstvecd extension
    if s:riscv_asm_isa =~ '\c^-\=shvstvecd\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=shvstvecd', "", "")
    endif
    " Shgatpa extension
    if s:riscv_asm_isa =~ '\c^-\=shgatpa\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=shgatpa', "", "")
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
    " Smaia extension
    if s:riscv_asm_isa =~ '\c^-\=smaia\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=smaia\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_smaia = b:riscv_asm_smaia_max
        else
            let b:riscv_asm_smaia = str2float(s:extract_version)
            if b:riscv_asm_smaia > b:riscv_asm_smaia_max
                let b:riscv_asm_smaia = b:riscv_asm_smaia_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=smaia\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_smaia")
            unlet b:riscv_asm_smaia
        endif
    endif
    " Smepmp extension
    if s:riscv_asm_isa =~ '\c^-\=smepmp\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=smepmp\(\d\+\(\.\d\+\)\=\)\=', "", "")
    endif
    " Smstateen extension
    if s:riscv_asm_isa =~ '\c^-\=smstateen\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=smstateen\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_smstateen = b:riscv_asm_smstateen_max
        else
            let b:riscv_asm_smstateen = str2float(s:extract_version)
            if b:riscv_asm_smstateen > b:riscv_asm_smstateen_max
                let b:riscv_asm_smstateen = b:riscv_asm_smstateen_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=smstateen\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_smstateen")
            unlet b:riscv_asm_smstateen
        endif
    endif
    " Sdext extension
    if s:riscv_asm_isa =~ '\c^-\=sdext\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=sdext\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_sdext = b:riscv_asm_sdext_max
        else
            let b:riscv_asm_sdext = str2float(s:extract_version)
            if b:riscv_asm_sdext > b:riscv_asm_sdext_max
                let b:riscv_asm_sdext = b:riscv_asm_sdext_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=sdext\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_sdext")
            unlet b:riscv_asm_sdext
        endif
    endif
    " Sdtrig extension
    if s:riscv_asm_isa =~ '\c^-\=sdtrig\(\d\+\(\.\d\+\)\=\)\=\(-\|$\)'
        let s:extract_version = substitute(s:riscv_asm_isa, '\c^-\=sdtrig\(\d\+\(\.\d\+\)\=\)\=.*', '\1', "")
        if s:extract_version !~ '\d\+\.\d\+'
            let b:riscv_asm_sdtrig = b:riscv_asm_sdtrig_max
        else
            let b:riscv_asm_sdtrig = str2float(s:extract_version)
            if b:riscv_asm_sdtrig > b:riscv_asm_sdtrig_max
                let b:riscv_asm_sdtrig = b:riscv_asm_sdtrig_max
            endif
        endif
        let s:riscv_asm_isa = substitute(s:riscv_asm_isa, '\c^-\=sdtrig\(\d\+\(\.\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_sdtrig")
            unlet b:riscv_asm_sdtrig
        endif
    endif
endif
if exists("b:riscv_asm_xlen")
    " Unknown extensions or parser error
    if s:riscv_asm_isa =~ '.\+' || b:riscv_asm_xlen == 0
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
