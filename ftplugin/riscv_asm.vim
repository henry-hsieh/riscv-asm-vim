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

function! s:add_versioned_extension(isa_str, isa_name, max_version, dlm_expected = 0, special_cond = 1)
    exec "let b:riscv_asm_" . tolower(a:isa_name) . "_max = " . string(a:max_version)
    let l:isa_str = a:isa_str
    if a:dlm_expected
        let l:dlm = '\(_\|$\)'
    else
        let l:dlm = ''
    endif
    if a:isa_name[0] =~ '[^Xx]'
        call add(b:riscv_asm_standard_isa, tolower(a:isa_name))
    endif

    if a:isa_str =~ '\c^_\=' . tolower(a:isa_name) . '\(\d\+\(p\d\+\)\=\)\=' . l:dlm && a:special_cond
        if exists("g:riscv_asm_debug")
            echom "INFO: parse " . a:isa_name . " extension"
        endif
        let l:extract_version = substitute(a:isa_str, '\c^_\=' . tolower(a:isa_name) . '\(\d\+\(\p\d\+\)\=\)\=.*', '\1', "")
        if l:extract_version == ''
            if exists("g:riscv_asm_debug")
                echom "INFO: no version of " . a:isa_name . " extension"
            endif
            exec "let b:riscv_asm_" . tolower(a:isa_name) . " = b:riscv_asm_" . tolower(a:isa_name) . "_max"
        else
            let l:extract_version = substitute(l:extract_version, 'p', '.', "")
            exec "let b:riscv_asm_" . tolower(a:isa_name) . " = str2float(l:extract_version)"
            exec "let l:version_overflow = b:riscv_asm_" . tolower(a:isa_name) . " > b:riscv_asm_" . tolower(a:isa_name) . "_max"
            if l:version_overflow
                if exists("g:riscv_asm_debug")
                    echom 'WARN: version of ' . a:isa_name . ' extension is overflow: ' . string(str2float(l:extract_version))
                    echom 'INFO: version of ' . a:isa_name . ' extension is set to: ' . string(a:max_version)
                endif
                exec "let b:riscv_asm_" . tolower(a:isa_name) . " = b:riscv_asm_" . tolower(a:isa_name) . "_max"
            else
                if exists("g:riscv_asm_debug")
                    echom 'INFO: version of ' . a:isa_name . ' extension is: ' . string(str2float(l:extract_version))
                endif
            endif
        endif
        let l:isa_str = substitute(a:isa_str, '\c^\(_\=' . tolower(a:isa_name) . '\(\d\+\(p\d\+\)\=\)\=\)\+', "", "")
    else
        if exists("b:riscv_asm_" . tolower(a:isa_name))
            exec "unlet b:riscv_asm_" . tolower(a:isa_name)
        endif
    endif
    return l:isa_str
endfunction

function! s:add_unversioned_extension(isa_str, isa_name, dlm_expected = 0, special_cond = 1)
    let l:isa_str = a:isa_str
    if a:dlm_expected
        let l:dlm = '\(_\|$\)'
    else
        let l:dlm = ''
    endif
    if a:isa_name[0] =~ '[^Xx]'
        call add(b:riscv_asm_standard_isa, tolower(a:isa_name))
    endif

    if a:isa_str =~ '\c^_\=' . tolower(a:isa_name) . l:dlm && a:special_cond
        if exists("g:riscv_asm_debug")
            echom "INFO: parse " . a:isa_name . " extension"
        endif
        exec "let b:riscv_asm_" . tolower(a:isa_name) . " = 0"
        let l:isa_str = substitute(a:isa_str, '\c^\(_\=' . tolower(a:isa_name) . '\)\+', "", "")
    else
        if exists("b:riscv_asm_" . tolower(a:isa_name))
            exec "unlet b:riscv_asm_" . tolower(a:isa_name)
        endif
    endif
    return l:isa_str
endfunction

function! s:add_profile(isa_str, isa_name)
    let l:isa_str = a:isa_str

    call add(b:riscv_asm_standard_isa, tolower(a:isa_name))
    if a:isa_str =~ '\c^' . tolower(a:isa_name)
        let l:extract_length = substitute(a:isa_str, '\c^rv[iabm]\d\+[su]\(\d\+\).*', '\1', "")
        if exists("g:riscv_asm_debug")
            echom "INFO: parse " . a:isa_name . " profile"
        endif
        exec "let b:riscv_asm_" . tolower(a:isa_name) . " = 0"
        let b:riscv_asm_xlen = str2nr(l:extract_length)
        let l:isa_str = substitute(a:isa_str, '\c^' . tolower(a:isa_name), "", "")
    else
        if exists("b:riscv_asm_" . tolower(a:isa_name))
            exec "unlet b:riscv_asm_" . tolower(a:isa_name)
        endif
    endif
    return l:isa_str
endfunction

function! s:add_base_isa(isa_str, isa_name, max_version)
    let l:isa_str = a:isa_str
    exec "let b:riscv_asm_" . tolower(a:isa_name) . "_max = " . string(a:max_version)

    call add(b:riscv_asm_standard_isa, tolower(a:isa_name))
    if a:isa_str =~ '\c^' . tolower(a:isa_name) . '\(\d\+\(p\d\+\)\=\)\='
        let l:extract_length = substitute(a:isa_str, '\c^rv\(\d\+\)\([ie]\)\(\d\+\(p\d\+\)\=\)\=.*', '\1', "")
        let l:extract_base = substitute(a:isa_str, '\c^rv\(\d\+\)\([ie]\)\(\d\+\(p\d\+\)\=\)\=.*', '\2', "")
        let l:extract_version = substitute(a:isa_str, '\c^rv\(\d\+\)\([ie]\)\(\d\+\(p\d\+\)\=\)\=.*', '\3', "")
        if exists("g:riscv_asm_debug")
            echom "INFO: parse " . a:isa_name . " base ISA"
        endif
        if l:extract_version == ''
            if exists("g:riscv_asm_debug")
                echom "INFO: no version of " . a:isa_name . " base ISA"
            endif
            exec "let b:riscv_asm_" . tolower(a:isa_name) . " = b:riscv_asm_" . tolower(a:isa_name) . "_max"
        else
            let l:extract_version = substitute(l:extract_version, 'p', '.', "")
            exec "let b:riscv_asm_" . tolower(a:isa_name) . " = str2float(l:extract_version)"
            exec "let l:version_overflow = b:riscv_asm_" . tolower(a:isa_name) . " > b:riscv_asm_" . tolower(a:isa_name) . "_max"
            if l:version_overflow
                if exists("g:riscv_asm_debug")
                    echom 'WARN: version of ' . a:isa_name . ' base ISA is overflow: ' . string(str2float(l:extract_version))
                    echom 'INFO: version of ' . a:isa_name . ' base ISA is set to: ' . string(a:max_version)
                endif
                exec "let b:riscv_asm_" . tolower(a:isa_name) . " = b:riscv_asm_" . tolower(a:isa_name) . "_max"
            else
                if exists("g:riscv_asm_debug")
                    echom 'INFO: version of ' . a:isa_name . ' extension is: ' . string(str2float(l:extract_version))
                endif
            endif
        endif
        let b:riscv_asm_xlen = str2nr(l:extract_length)
        let l:isa_str = substitute(l:isa_str, '\c^rv\d\+[ie]\(\d\+\(p\d\+\)\=\)\=', "", "")
    else
        if exists("b:riscv_asm_" . tolower(a:isa_name))
            exec "unlet b:riscv_asm_" . tolower(a:isa_name)
        endif
    endif
    return l:isa_str
endfunction

function! s:add_general_isa(isa_str, isa_name)
    let l:isa_str = a:isa_str

    call add(b:riscv_asm_standard_isa, tolower(a:isa_name))
    if a:isa_str =~ '\c^' . tolower(a:isa_name)
        let l:extract_length = substitute(a:isa_str, '\c^rv\(\d\+\)\(g\).*', '\1', "")
        let l:extract_base = substitute(a:isa_str, '\c^rv\(\d\+\)\(g\).*', '\2', "")
        if exists("g:riscv_asm_debug")
            echom "INFO: parse " . a:isa_name . " general purpose ISA"
        endif
        exec "let b:riscv_asm_" . tolower(a:isa_name) . " = 0"
        let b:riscv_asm_xlen = str2nr(l:extract_length)
        let l:isa_str = substitute(l:isa_str, '\c^rv\d\+g', "", "")
    else
        if exists("b:riscv_asm_" . tolower(a:isa_name))
            exec "unlet b:riscv_asm_" . tolower(a:isa_name)
        endif
    endif
    return l:isa_str
endfunction

function! s:order_extensions(a, b)
    let a_key = a:a.name
    let b_key = a:b.name

    let len_a = len(a_key)
    let len_b = len(b_key)
    let max_len = max([len_a, len_b])

    for i in range(max_len)
        let char_a = i < len_a ? a_key[i] : ' '
        let char_b = i < len_b ? b_key[i] : ' '

        if char_a ># char_b
            return 1
        elseif char_a <# char_b
            return -1
        endif
    endfor

    return 0
endfunction

function! s:is_list_of_dict(variable)
  if type(a:variable) != v:t_list
    return 0
  endif

  for item in a:variable
    if type(item) != v:t_dict
      return 0
    endif
  endfor

  return 1
endfunction

" Find global setting of RISC-V ISA
if exists("g:riscv_asm_isa")
    if type(g:riscv_asm_isa) == v:t_string
        let s:riscv_asm_isa = g:riscv_asm_isa
    else
        echom "WARN: g:riscv_asm_isa is not a string"
        if exists("s:riscv_asm_isa")
            unlet s:riscv_asm_isa
        endif
    endif
endif

" Set default value if setting of RISC-V ISA isn't found
if !exists("s:riscv_asm_isa")
    let s:riscv_asm_isa = "rv64gc"
endif

" Check whether all extensions should be enabled
if exists("g:riscv_asm_all_enable")
    let b:riscv_asm_all_enable = 1
else
    if exists("b:riscv_asm_all_enable")
        unlet b:riscv_asm_all_enable
    endif
endif

" Initial list of supported standard ISAs
let b:riscv_asm_standard_isa = []

" Filter and sort valid custom extensions
if exists("g:riscv_asm_custom_isa")
    if s:is_list_of_dict(g:riscv_asm_custom_isa)
        let b:riscv_asm_custom_isa = deepcopy(g:riscv_asm_custom_isa)
        let s:riscv_asm_custom_unnamed = len(b:riscv_asm_custom_isa) - len(filter(b:riscv_asm_custom_isa, 'has_key(v:val, "name")'))
        let s:riscv_asm_custom_not_x = len(b:riscv_asm_custom_isa) - len(filter(b:riscv_asm_custom_isa, 'v:val["name"] =~ "\\c^x"'))
        call sort(b:riscv_asm_custom_isa, 's:order_extensions')
        if exists("g:riscv_asm_debug")
            echom "INFO: Detect " . len(g:riscv_asm_custom_isa) . ' custom extension(s)'
            if s:riscv_asm_custom_unnamed > 0
                echom "WARN: Remove " . s:riscv_asm_custom_unnamed . ' unnamed custom extension(s)'
            endif
            if s:riscv_asm_custom_not_x > 0
                echom "WARN: Remove " . s:riscv_asm_custom_not_x . ' custom extension(s) not start with "X"'
            endif
            echom "INFO: Add " . len(b:riscv_asm_custom_isa) . ' named custom extension(s)'
        endif
        unlet s:riscv_asm_custom_unnamed
        unlet s:riscv_asm_custom_not_x
    else
        echom "WARN: g:riscv_asm_custom_isa is not a list of dictionaries"
        if exists("b:riscv_asm_custom_isa")
            unlet b:riscv_asm_custom_isa
        endif
    endif
else
    if exists("b:riscv_asm_custom_isa")
        unlet b:riscv_asm_custom_isa
    endif
endif

" Reset XLEN
let b:riscv_asm_xlen = 0

" Parse base ISA
" RV128I
let s:riscv_asm_isa = s:add_base_isa(s:riscv_asm_isa, "RV128I", 1.7)
" RV64I
let s:riscv_asm_isa = s:add_base_isa(s:riscv_asm_isa, "RV64I", 2.1)
" RV64E
let s:riscv_asm_isa = s:add_base_isa(s:riscv_asm_isa, "RV64E", 2.0)
" RV32I
let s:riscv_asm_isa = s:add_base_isa(s:riscv_asm_isa, "RV32I", 2.1)
" RV32E
let s:riscv_asm_isa = s:add_base_isa(s:riscv_asm_isa, "RV32E", 2.0)

" Parse general purpose ISA
" RV64G
let s:riscv_asm_isa = s:add_general_isa(s:riscv_asm_isa, "RV64G")
" RV32G
let s:riscv_asm_isa = s:add_general_isa(s:riscv_asm_isa, "RV32G")

" Parse profiles
" RVI20U32
let s:riscv_asm_isa = s:add_profile(s:riscv_asm_isa, "RVI20U32")
" RVI20U64
let s:riscv_asm_isa = s:add_profile(s:riscv_asm_isa, "RVI20U64")
" RVA20U64
let s:riscv_asm_isa = s:add_profile(s:riscv_asm_isa, "RVA20U64")
" RVA20S64
let s:riscv_asm_isa = s:add_profile(s:riscv_asm_isa, "RVA20S64")
" RVA22U64
let s:riscv_asm_isa = s:add_profile(s:riscv_asm_isa, "RVA22U64")
" RVA22S64
let s:riscv_asm_isa = s:add_profile(s:riscv_asm_isa, "RVA22S64")
" RVA23U64
let s:riscv_asm_isa = s:add_profile(s:riscv_asm_isa, "RVA23U64")
" RVA23S64
let s:riscv_asm_isa = s:add_profile(s:riscv_asm_isa, "RVA23S64")
" RVB23U64
let s:riscv_asm_isa = s:add_profile(s:riscv_asm_isa, "RVB23U64")
" RVB23S64
let s:riscv_asm_isa = s:add_profile(s:riscv_asm_isa, "RVB23S64")
" RVM23U32
let s:riscv_asm_isa = s:add_profile(s:riscv_asm_isa, "RVM23U32")

" Parse extensions
" The name should follow the sequence shown in README
" M Extension: Integer Multiplication and Division
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "M", 2.0, 0, !exists("b:riscv_asm_rv32g") && !exists("b:riscv_asm_rv64g"))
" A Extension: Atomics
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "A", 2.1, 0, !exists("b:riscv_asm_rv32g") && !exists("b:riscv_asm_rv64g"))
" F Extension: Single-Precision Floating-Point
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "F", 2.2, 0, !exists("b:riscv_asm_rv32g") && !exists("b:riscv_asm_rv64g"))
" D Extension: Double-Precision Floating-Point
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "D", 2.2, 0, !exists("b:riscv_asm_rv32g") && !exists("b:riscv_asm_rv64g"))
" G Extension: General
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "G", 0, !exists("b:riscv_asm_rv32e") && !exists("b:riscv_asm_rv64e"))
" Q Extension: Quad-Precision Floating-Point
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Q", 2.2)
" C Extension: 16-bit Compressed Instructions
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "C", 2.0)
" V Extension: Vector Extensions
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "V", 1.1)
" H Extension: Hypervisor Extension
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "H", 1.0, 0, !exists("b:riscv_asm_rv32e") && !exists("b:riscv_asm_rv64e"))
" Zic64b Extension: Cache Block Size Is 64 Bytes
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Zic64b", 1)
" Zicbom Extension: Cache-Block Management Instructions
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zicbom", 1.0, 1)
" Zicbop Extension: Cache-Block Prefetch Instructions
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zicbop", 1.0, 1)
" Zicboz Extension: Cache-Block Zero Instructions
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zicboz", 1.0, 1)
" Ziccamoa Extension: Main Memory Supports All Atomics in A
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Ziccamoa", 1)
" Ziccif Extension: Main Memory Supports Instruction Fetch With Atomicity Requirement
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Ziccif", 1)
" Zicclsm Extension: Main Memory Supports Misaligned Loads/Stores
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Zicclsm", 1)
" Ziccrse Extension: Main Memory Supports Forward Progress on LR/SC Sequences
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Ziccrse", 1)
" Zicfilp Extension: Landing Pad
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zicfilp", 0.4, 1)
" Zicfiss Extension: Shadow Stack
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zicfiss", 0.4, 1)
" Zicntr Extension: Base Counters and Timers
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zicntr", 2.0, 1)
" Zicond Extension:  Integer Conditional Operations Extension
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zicond", 1.0, 1)
" Zicsr Extension: Control and Status Register Access
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zicsr", 2.0, 1)
" Zifencei Extension: Instruction-Fetch Fence
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zifencei", 2.0, 1)
" Zihintntl Extension: Non-Temporal Locality Hints
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zihintntl", 1.0, 1)
" Zihintpause Extension: Pause Hint
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zihintpause", 2.0, 1)
" Zihpm Extension: Hardware Performance Counters
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zihpm", 2.0, 1)
" Zimop Extension: May-Be-Operations Extension
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zimop", 0.1, 1)
" Zmmul Extension: Multiplication Without Division
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zmmul", 1.0, 1)
" Za128rs Extension: Reservation Set Size of 128 Bytes
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Za128rs", 1)
" Za64rs Extension: Reservation Set Size of 64 Bytes
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Za64rs", 1)
" Zabha Extension: Byte and Halfword Atomic Memory Operations
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zabha", 1.0, 1)
" Zacas Extension: Atomic Compare-and-Swap Instructions
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zacas", 1.0, 1)
" Zawrs Extension: Wait-On-Reservation-Set Extension
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zawrs", 1.0, 1)
" Zam Extension: Misaligned Atomic
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zam", 0.1, 1)
" Zfa Extension: Additional Floating-Point Instructions
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zfa", 1.0, 1)
" Zfbfmin Extension: Scalar BF16 Converts
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zfbfmin", 1.0, 1)
" Zfh Extension: Half-Precision Floating-Point
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zfh", 1.0, 1)
" Zfhmin Extension: Minimal Half-Precision Floating-Point
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zfhmin", 1.0, 1)
" Zfinx Extension: Single-Precision Floating-Point in Integer Registers
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zfinx", 1.0, 1, !exists("b:riscv_asm_f") && !exists("b:riscv_asm_d") && !exists("b:riscv_asm_q") && !exists("b:riscv_asm_zfa") && !exists("b:riscv_asm_zfh") && !exists("b:riscv_asm_zfhmin"))
" Zdinx Extension: Double-Precision Floating-Point in Integer Registers
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zdinx", 1.0, 1, !exists("b:riscv_asm_f") && !exists("b:riscv_asm_d") && !exists("b:riscv_asm_q") && !exists("b:riscv_asm_zfa") && !exists("b:riscv_asm_zfh") && !exists("b:riscv_asm_zfhmin"))
" Zhinx Extension: Half-Precision Floating-Point in Integer Registers
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zhinx", 1.0, 1, !exists("b:riscv_asm_f") && !exists("b:riscv_asm_d") && !exists("b:riscv_asm_q") && !exists("b:riscv_asm_zfa") && !exists("b:riscv_asm_zfh") && !exists("b:riscv_asm_zfhmin"))
" Zhinxmin Extension: Minimal Half-Precision Floating-Point in Integer Registers
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zhinxmin", 1.0, 1, !exists("b:riscv_asm_f") && !exists("b:riscv_asm_d") && !exists("b:riscv_asm_q") && !exists("b:riscv_asm_zfa") && !exists("b:riscv_asm_zfh") && !exists("b:riscv_asm_zfhmin"))
" Zca Extension: C Extension Instructions without Floating-Point Load/Stores
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zca", 1.0, 1)
" Zcb Extension: Simple Code Size Saving Instructions
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zcb", 1.0, 1)
" Zcd Extension: Compressed Double-Precision Floating-Point Load/Stores Instructions
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zcd", 1.0, 1, b:riscv_asm_xlen <= 64 && !exists("b:riscv_asm_zfinx") && !exists("b:riscv_asm_zdinx") && !exists("b:riscv_asm_zhinx") && !exists("b:riscv_asm_zhinxmin"))
" Zce Extension: Compressed Instructions for Microcontrollers
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zce", 1.0, 1, !exists("b:riscv_asm_c") && !exists("b:riscv_asm_zcd"))
" Zcf Extension: Compressed Single-Precision Floating-Point Load/Stores Instructions
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zcf", 1.0, 1, b:riscv_asm_xlen == 32 && !exists("b:riscv_asm_zfinx") && !exists("b:riscv_asm_zdinx") && !exists("b:riscv_asm_zhinx") && !exists("b:riscv_asm_zhinxmin"))
" Zcmop Extension: Compressed May-Be-Operations Extension
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zcmop", 0.2, 1)
" Zcmp Extension: Push/Pop and Double Move Instructions
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zcmp", 1.0, 1, !exists("b:riscv_asm_c") && !exists("b:riscv_asm_zcd"))
" Zcmt Extension: Table Jump Instructions
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zcmt", 1.0, 1, !exists("b:riscv_asm_c") && !exists("b:riscv_asm_zcd"))
" Zba Extension: Address Generation Instructions
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zba", 1.0, 1)
" Zbb Extension: Basic Bit-Manipulation
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zbb", 1.0, 1)
" Zbc Extension: Carry-Less Multiplication
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zbc", 1.0, 1)
" Zbkb Extension: Bit-Manipulation Instructions for Cryptography
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zbkb", 1.0, 1)
" Zbkc Extension: Carry-Less Multiplication Instructions for Cryptography
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zbkc", 1.0, 1)
" Zbkx Extension: Crossbar Permutation Instructions for Cryptography
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zbkx", 1.0, 1)
" Zbs Extension: Single-Bit Instructions
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zbs", 1.0, 1)
" Zk Extension: Standard Scalar Cryptography Extension
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zk", 1.0, 1)
" Zkn Extension: NIST Algorithm Suite Extension
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zkn", 1.0, 1)
" Zknd Extension: AES Decryption Instructions
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zknd", 1.0, 1)
" Zkne Extension: AES Encryption Instructions
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zkne", 1.0, 1)
" Zknh Extension: SHA2 Hash Function Instructions
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zknh", 1.0, 1)
" Zkr Extension: Entropy Source Extension
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zkr", 1.0, 1)
" Zks Extension: ShangMi Algorithm Suite Extension
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zks", 1.0, 1)
" Zksed Extension: SM4 Block Cipher Instructions
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zksed", 1.0, 1)
" Zksh Extension: SM3 Hash Function Instructions
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zksh", 1.0, 1)
" Zkt Extension: Data Independent Execution Latency Extension
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zkt", 1.0, 1)
" Zvamo Extension: Vector Atomic Instructions
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Zvamo", 1)
" Zvbb Extension: Vector Bit-Manipulation Instructions for Cryptography
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvbb", 1.0, 1)
" Zvbc Extension: Vector Carry-Less Multiplication
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvbc", 1.0, 1)
" Zve32f Extension: Vector Extension for Embedded 32-bit Single-Precision Floating-Point
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zve32f", 1.1, 1, !exists("b:riscv_asm_zfinx") && !exists("b:riscv_asm_zdinx") && !exists("b:riscv_asm_zhinx") && !exists("b:riscv_asm_zhinxmin"))
" Zve32x Extension: Vector Extension for Embedded 32-bit Integer
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zve32x", 1.1, 1)
" Zve64d Extension: Vector Extension for Embedded 64-bit Double-Precision Floating-Point
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zve64d", 1.1, 1, !exists("b:riscv_asm_zfinx") && !exists("b:riscv_asm_zdinx") && !exists("b:riscv_asm_zhinx") && !exists("b:riscv_asm_zhinxmin"))
" Zve64f Extension: Vector Extension for Embedded 64-bit Single-Precision Floating-Point
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zve64f", 1.1, 1, !exists("b:riscv_asm_zfinx") && !exists("b:riscv_asm_zdinx") && !exists("b:riscv_asm_zhinx") && !exists("b:riscv_asm_zhinxmin"))
" Zve64x Extension: Vector Extension for Embedded 64-bit Integer
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zve64x", 1.1, 1)
" Zvediv Extension: Vector Divided Element Extension
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Zvediv", 1)
" Zvfbfmin Extension: Vector BF16 Converts
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvfbfmin", 1.0, 1)
" Zvfbfwma Extension: Vector BF16 Widening Mul-Add
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvfbfwma", 1.0, 1)
" Zvfh Extension: Vector Extension for Half-Precision Floating-Point
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvfh", 1.1, 1, !exists("b:riscv_asm_zfinx") && !exists("b:riscv_asm_zdinx") && !exists("b:riscv_asm_zhinx") && !exists("b:riscv_asm_zhinxmin"))
" Zvfhmin Extension: Vector Extension for Minimal Half-Precision Floating-Point
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvfhmin", 1.1, 1, !exists("b:riscv_asm_zfinx") && !exists("b:riscv_asm_zdinx") && !exists("b:riscv_asm_zhinx") && !exists("b:riscv_asm_zhinxmin"))
" Zvkb Extension: Vector Cryptography Bit-manipulation
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvkb", 1.0, 1)
" Zvkg Extension: Vector GCM/GMAC
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvkg", 1.0, 1)
" Zvkn Extension: Vector NIST Algorithm Suite Extension
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvkn", 1.0, 1)
" Zvknc Extension: Vector NIST Algorithm Suite with Carryless Multiply
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvknc", 1.0, 1)
" Zvkned Extension: Vector AES Block Cipher
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvkned", 1.0, 1)
" Zvkng Extension: Vector NIST Algorithm Suite with GCM
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvkng", 1.0, 1)
" Zvknha Extension: Vector SHA-2 Secure Hash for Embedded 32-bit
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvknha", 1.0, 1)
" Zvknhb Extension: Vector SHA-2 Secure Hash
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvknhb", 1.0, 1, !exists("b:riscv_asm_zve32x") && !exists("b:riscv_asm_zve32f"))
" Zvks Extension: Vector ShangMi Algorithm Suite Extension
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvks", 1.0, 1)
" Zvksc Extension: Vector ShangMi Algorithm Suite with Carryless Multiplication
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvksc", 1.0, 1)
" Zvksed Extension: Vector SM4 Block Cipher
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvksed", 1.0, 1)
" Zvksg Extension: Vector ShangMi Algorithm Suite with GCM
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvksg", 1.0, 1)
" Zvksh Extension: Vector SM3 Secure Hash
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvksh", 1.0, 1)
" Zvkt Extension: Vector Data Independent Execution Latency Extension
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvkt", 1.0, 1)
" Zvl32b Extension: Minimum 32-bit Vector Length
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvl32b", 1.1, 1)
" Zvl64b Extension: Minimum 64-bit Vector Length
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvl64b", 1.1, 1)
" Zvl128b Extension: Minimum 128-bit Vector Length
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvl128b", 1.1, 1)
" Zvl256b Extension: Minimum 256-bit Vector Length
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvl256b", 1.1, 1)
" Zvl512b Extension: Minimum 512-bit Vector Length
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvl512b", 1.1, 1)
" Zvl1024b Extension: Minimum 1024-bit Vector Length
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Zvl1024b", 1.1, 1)
" Ztso Extension: Total Store Ordering
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Ztso", 1.0, 1)
" Ss Extension: Supervisor-Level Extension
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Ss", 1.12, 1)
" Ssaia Extension: Supervisor-Level Advanced Interrupt Architecture Extension
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Ssaia", 1.0, 1)
" Ssccptr Extension: Main Memory Supports Page Table Reads
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Ssccptr", 1)
" Sscofpmf Extension: Count Overflow and Mode-Based Filtering Extension
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Sscofpmf", 1.0, 1)
" Sscounterenw Extension: Support Writeable Enables for Any Supported Counter
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Sscounterenw", 1)
" Sscsrind Extension: Supervisor-Level Indirect CSR Access
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Sscsrind", 1.0, 1)
" Sspmp Extension: Supervisor Memory Protection Extension
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Sspmp", 0.8, 1)
" Ssstateen Extension: Supervisor-Level State Enable Extension
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Ssstateen", 1.0, 1)
" Sstc Extension: Supervisor-Level Timer Comparison Extension
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Sstc", 1.0, 1)
" Sstvala Extension: Stval Provides All Needed Values
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Sstvala", 1)
" Sstvecd Extension: Stvec Supports Direct Mode
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Sstvecd", 1)
" Ssu64xl Extension: UXLEN=64 Must Be Supported
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Ssu64xl", 1)
" Sv32 Extension: Page-Based 32-bit Virtual-Memory Systems
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Sv32", 1)
" Sv39 Extension: Page-Based 39-bit Virtual-Memory Systems
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Sv39", 1)
" Sv48 Extension: Page-Based 48-bit Virtual-Memory Systems
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Sv48", 1)
" Sv57 Extension: Page-Based 57-bit Virtual-Memory Systems
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Sv57", 1)
" Svade Extension: Raise Exceptions on Improper A/D Bits
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Svade", 1)
" Svadu Extension: Hardware Updating of PTE A/D Bits
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Svadu", 1.0, 1)
" Svbare Extension: Bare Mode Virtual-Memory Translation Supported
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Svbare", 1)
" Svinval Extension: Fine-Grained Address-Translation Cache Invalidation
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Svinval", 1.0, 1)
" Svnapot Extension: NAPOT Translation Contiguity
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Svnapot", 1.0, 1)
" Svpbmt Extension: Page-Based Memory Types
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Svpbmt", 1.0, 1)
" Shcounterenw Extension: Support Writeable Enables for Any Supported Counter
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Shcounterenw", 1)
" Shtvala Extension: Htval Provides All Needed Values
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Shtvala", 1)
" Shvsatpa Extension: Vsatp Supports All Modes Supported by Satp
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Shvsatpa", 1)
" Shvstvala Extension: Vstval Provides All Needed Values
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Shvstvala", 1)
" Shvstvecd Extension: Vstvec Supports Direct Mode
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Shvstvecd", 1)
" Shgatpa Extension: SvNNx4 Mode Supported for All Modes Supported by Satp, As Well As Bare
let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, "Shgatpa", 1)
" Sm Extension: Machine-Level Extension
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Sm", 1.0, 1)
" Smaia Extension: Machine-Level Advanced Interrupt Architecture Extension
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Smaia", 1.0, 1)
" Smcntrpmf Extension: Cycle and Instret Privilege Mode Filtering
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Smcntrpmf", 1.0, 1)
" Smcsrind Extension: Machine-Level Indirect CSR Access
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Smcsrind", 1.0, 1)
" Smepmp Extension: PMP Enhancements for Memory Access and Execution Prevention on Machine Mode
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Smepmp", 1.0, 1)
" Smstateen Extension: Machine-Level State Enable Extension
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Smstateen", 1.0, 1)
" Sdext Extension: External Debug Extension
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Sdext", 1.0, 1)
" Sdtrig Extension: Debug Trigger Extension
let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, "Sdtrig", 1.0, 1)

" Parse custom extensions
if exists("b:riscv_asm_custom_isa")
    for isa in b:riscv_asm_custom_isa
        if has_key(isa, "ver") && (type(isa["ver"]) == v:t_float || type(isa["ver"]) == v:t_number)
            let s:riscv_asm_isa = s:add_versioned_extension(s:riscv_asm_isa, isa["name"], isa["ver"], 1)
        else
            let s:riscv_asm_isa = s:add_unversioned_extension(s:riscv_asm_isa, isa["name"], 1)
        endif
    endfor
endif

" Unknown extensions or parser error
if s:riscv_asm_isa =~ '.\+' || b:riscv_asm_xlen == 0
    let b:riscv_asm_all_enable = 1
    echom "ERROR: Can't resolve remaining ISA string: " . s:riscv_asm_isa
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
