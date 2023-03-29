" Vim syn file
" Language: RISC-V Assembly
"

if exists("b:current_syntax")
    finish
endif

setlocal iskeyword+=48-57,192-255,_,$,.

syn case    ignore
" Number
syn match   riscvHexError              '\<0x\x*\X\+\x*\(u\=l\{,2}\)\=\>' display
syn match   riscvOctError              '\<0\o*\O\+\o*\(u\=l\{,2}\)\=\>' display
syn match   riscvBinError              '\<0b[01]*[^01]\+[01]*\(u\=l\{,2}\)\=\>' display
syn match   riscvDecError              '\<\d\+\D\(u\=l\{,2}\)\=\>' display

syn match   riscvHexNumber             '\<0x\x\+\(u\=l\{,2}\)\=\>' display
syn match   riscvOctNumber             '\<0\o\+\(u\=l\{,2}\)\=\>' display
syn match   riscvBinNumber             '\<0b[01]\+\(u\=l\{,2}\)\=\>' display
syn match   riscvDecNumber             '\<\d\+\(u\=l\{,2}\)\=\>' display
syn match   riscvFltNumber             '\<\(0\a\)\=[+-]\=\d*\.\=\d\+\>' display
syn case    match

" Constant
syn match   riscvConstant              "\<[A-Z_$][A-Z0-9_$.]*\>"

" Character
syn match   riscvCharacter             "'[^\\]'\="
syn match   riscvCharacter             "'[^']*'\=" contains=riscvCharEscape,riscvCharError
syn match   riscvCharError             +'\zs[^']\{2,}\ze'\=+ display contained
syn match   riscvCharEscape            +'\zs\\[bfnrt'"\\]\ze'\=+ display contained

" String
syn region  riscvString                start=+"+ skip=+\\"+ end=+"+ keepend contains=riscvByteEscape,riscvByteError
syn match   riscvByteEscape            +\\[bfnrt"\\]+ display contained
syn match   riscvByteError             +\\[^bfnrt"\\]+ display contained
syn match   riscvByteEscape            '\\\o\{3}' display contained
syn match   riscvByteEscape            '\\[xX]\x*' display contained
syn match   riscvByteError             '\\[xX]\x\x\x\+' display contained

" Label
syn match   riscvLabel                 display /^\s*\k\+:/
syn match   riscvNumericLabel          display /\<\d\+[bf]\>/

" Operator
syn match   riscvOperator              "[&|~><!*%+/=\^\-]"
syn match   riscvInsnOperator          "[)(,]"

" GNU Assembler (GAS) directives
syn keyword riscvDirective             .abort .ABORT .align .altmacro .balign .balignw .bundle_align_mode .bundle_lock .bundle_unlock
syn keyword riscvDirective             .cfi_section .cfi_personality .cfi_fde_data .cfi_lsda .cfi_inline_lsda .cfi_def_cfa .cfi_def_cfa_register .cfi_def_cfa_offset .cfi_adjust_cfa_offset .cfi_offset .cfi_val_offset .cfi_rel_offset
syn keyword riscvDirective             .cfi_register .cfi_restore .cfi_undefined .cfi_same_value .cfi_remember_state .cfi_restore_state .cfi_return_column .cfi_signal_frame .cfi_window_save .cfi_escape .cfi_val_encoded_addr
syn keyword riscvDirective             .comm .data .dc.a .dc.b .dc.d .dc.l .dc.s .dc.w dc.x .dcb.b .dcb.d .dcb.l .dcb.s .dcb.w dcb.x .ds.b .ds.d .ds.l .ds.p .ds.s .ds.w ds.x
syn keyword riscvDirective             .desc .dim .eject .end .equ .equiv .eqv .err .error .extern .fail .file .global .globl .hidden
syn keyword riscvDirective             .ident .incbin .include .internal .lcomm .lflag .line .list .ln .loc_mark_labels .local .mri .noaltmacro .nolist
syn keyword riscvDirective             .offset .p2align .p2alignw .p2alignl .popsection .previous .print .protected .psize .purgem .pushsection
syn keyword riscvDirective             .reloc .sbttl .scl .section .set .size .stabd .stabn .stabs .struct .subsection .symvar .tag .text .title
syn keyword riscvDirective             .val .version .vtable_entry .vtable_inherit .warning .weak .weakref
syn match   riscvDirectiveError1       "\S\+" display contained
syn match   riscvDirectiveType1        "\<\(discard\|one_only\|same_size\|same_contents\)\>" display contained
syn match   riscvDirective             "\<\.linkonce\>" nextgroup=riscvDirectiveError1,riscvDirectiveType1 skipwhite
syn match   riscvDirectiveError2       "\S\+" contains=riscvDecNumber,riscvDecError display contained
syn match   riscvDirectiveType2        "\<\(basic_block\|prologue_end\|epilogue_begin\|is_stmt\|isa\|discriminator\|view\)\>" display contained
syn region  riscvDirective             matchgroup=riscvDirective start=+\<\.loc\>+ skip=+\\$+ end=+$+ contains=riscvDirectiveError2,riscvDirectiveType2
syn match   riscvDirectiveSymbol       "\<\k\+\>" display contained
syn match   riscvDirectiveType3        "[#@%]\(function\|gnu_indirect_function\|object\|tls_object\|common\|notype\|gnu_unique_object\)\>" display contained
syn match   riscvDirectiveType4        "\"\(function\|gnu_indirect_function\|object\|tls_object\|common\|notype\|gnu_unique_object\)\"" display contained
syn match   riscvDirectiveType5        "\<\(STT_FUNC\|STT_GNU_IFUNC\|STT_OBJECT\|STT_TLS\|STT_COMMON\|STT_NOTYPE\)\>" display contained
syn region  riscvDirective             matchgroup=riscvDirective start=+\<\.type\>+ skip=+\\$+ end=+$+ contains=riscvDirectiveType3,riscvDirectiveType4,riscvDirectiveType5,riscvDirectiveSymbol,riscvInsnOperator

syn keyword riscvDataDirective         .ascii .asciz .byte .double .fill .float .hword .int .long .nops .octa .org .quad .short .single
syn keyword riscvDataDirective         .skip .sleb128 .space .string .string8 .string16 .uleb128 .word .zero .2byte .4byte .8byte

syn keyword riscvBlockDirective        .cfi_startproc .cfi_endproc
syn keyword riscvBlockDirective        .def .endef
syn keyword riscvBlockDirective        .func .endfunc
syn keyword riscvBlockDirective        .macro .exitm .endm
syn keyword riscvBlockDirective        .irp .irpc .rept .endr

syn keyword riscvConditDirective       .if .ifdef .ifb .ifc .ifeq .ifeqs .ifge .ifgt .ifle .iflt .ifnb .ifnc .ifndef .ifnotdef .ifne .ifnes .else .elseif .endif
" GAS RISC-V directives
syn keyword riscvDataDirective         .half .dword .dtprelword .dtpreldword
syn keyword riscvDirective             .bss .insn
syn match   riscvDirectiveType6        "\<\(push\|pop\|rvc\|norvc\|pic\|nopic\|relax\|norelax\|csr-check\|no-csr-check\)\>" display contained
syn match   riscvDirective             "\<\.option\>" nextgroup=riscvDirectiveError1,riscvDirectiveType6 skipwhite
syn match   riscvDirectiveType7        "\<\(Tag_RISCV_arch\|Tag_RISCV_stack_align\|Tag_RISCV_unaligned_access\|Tag_RISCV_priv_spec\|Tag_RISCV_priv_spec_minor\|Tag_RISCV_priv_spec_revision\)\>" display contained
syn match   riscvDirective             "\<\.attribute\>" nextgroup=riscvDirectiveType7,riscvDirectiveError2,riscvInsnOperator skipwhite
syn cluster riscvDirectiveGroup        contains=riscvDirective,riscvDirectiveError1,riscvDirectiveError2,riscvDirectiveType1,riscvDirectiveType2,riscvDirectiveType3,riscvDirectiveType4,riscvDirectiveType5,riscvDirectiveType6,riscvDirectiveType7,riscvDirectiveSymbol,riscvBlockDirective,riscvDataDirective,riscvConditDirective

" Include registers and instructions
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_rv128i")
    runtime! syntax/riscv_asm_rv128i.vim
elseif exists("b:riscv_asm_rv64i")
    runtime! syntax/riscv_asm_rv64i.vim
elseif exists("b:riscv_asm_rv64e")
    runtime! syntax/riscv_asm_rv64e.vim
elseif exists("b:riscv_asm_rv32i")
    runtime! syntax/riscv_asm_rv32i.vim
elseif exists("b:riscv_asm_rv32e")
    runtime! syntax/riscv_asm_rv32e.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_m")
    runtime! syntax/riscv_asm_m.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_a")
    runtime! syntax/riscv_asm_a.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_f")
    runtime! syntax/riscv_asm_f.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_d")
    runtime! syntax/riscv_asm_d.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_q")
    runtime! syntax/riscv_asm_q.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_c")
    runtime! syntax/riscv_asm_c.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_v")
    runtime! syntax/riscv_asm_v.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_h")
    runtime! syntax/riscv_asm_h.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zicbom")
    runtime! syntax/riscv_asm_zicbom.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zicbop")
    runtime! syntax/riscv_asm_zicbop.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zicboz")
    runtime! syntax/riscv_asm_zicboz.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zicntr")
    runtime! syntax/riscv_asm_zicntr.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zicond")
    runtime! syntax/riscv_asm_zicond.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zicsr")
    runtime! syntax/riscv_asm_zicsr.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zifencei")
    runtime! syntax/riscv_asm_zifencei.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zihintntl")
    runtime! syntax/riscv_asm_zihintntl.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zihintpause")
    runtime! syntax/riscv_asm_zihintpause.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zihpm")
    runtime! syntax/riscv_asm_zihpm.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zmmul")
    runtime! syntax/riscv_asm_zmmul.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zawrs")
    runtime! syntax/riscv_asm_zawrs.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zfa")
    runtime! syntax/riscv_asm_zfa.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zfh")
    runtime! syntax/riscv_asm_zfh.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zfhmin")
    runtime! syntax/riscv_asm_zfhmin.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zfinx")
    runtime! syntax/riscv_asm_zfinx.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zdinx")
    runtime! syntax/riscv_asm_zdinx.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zhinx")
    runtime! syntax/riscv_asm_zhinx.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zhinxmin")
    runtime! syntax/riscv_asm_zhinxmin.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zca")
    runtime! syntax/riscv_asm_zca.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zcb")
    runtime! syntax/riscv_asm_zcb.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zcd")
    runtime! syntax/riscv_asm_zcd.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zce")
    runtime! syntax/riscv_asm_zce.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zcf")
    runtime! syntax/riscv_asm_zcf.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zcmp")
    runtime! syntax/riscv_asm_zcmp.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zcmt")
    runtime! syntax/riscv_asm_zcmt.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zba")
    runtime! syntax/riscv_asm_zba.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zbb")
    runtime! syntax/riscv_asm_zbb.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zbc")
    runtime! syntax/riscv_asm_zbc.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zbkb")
    runtime! syntax/riscv_asm_zbkb.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zbkc")
    runtime! syntax/riscv_asm_zbkc.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zbkx")
    runtime! syntax/riscv_asm_zbkx.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zbs")
    runtime! syntax/riscv_asm_zbs.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zk")
    runtime! syntax/riscv_asm_zk.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zkn")
    runtime! syntax/riscv_asm_zkn.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zknd")
    runtime! syntax/riscv_asm_zknd.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zkne")
    runtime! syntax/riscv_asm_zkne.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zknh")
    runtime! syntax/riscv_asm_zknh.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zkr")
    runtime! syntax/riscv_asm_zkr.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zks")
    runtime! syntax/riscv_asm_zks.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zksed")
    runtime! syntax/riscv_asm_zksed.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zksh")
    runtime! syntax/riscv_asm_zksh.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zvamo")
    runtime! syntax/riscv_asm_zvamo.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zvbb")
    runtime! syntax/riscv_asm_zvbb.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zvbc")
    runtime! syntax/riscv_asm_zvbc.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zve32f")
    runtime! syntax/riscv_asm_zve32f.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zve32x")
    runtime! syntax/riscv_asm_zve32x.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zve64d")
    runtime! syntax/riscv_asm_zve64d.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zve64f")
    runtime! syntax/riscv_asm_zve64f.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zve64x")
    runtime! syntax/riscv_asm_zve64x.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zvediv")
    runtime! syntax/riscv_asm_zvediv.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zvfh")
    runtime! syntax/riscv_asm_zvfh.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zvfhmin")
    runtime! syntax/riscv_asm_zvfhmin.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zvkg")
    runtime! syntax/riscv_asm_zvkg.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zvkn")
    runtime! syntax/riscv_asm_zvkn.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zvkned")
    runtime! syntax/riscv_asm_zvkned.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zvknha")
    runtime! syntax/riscv_asm_zvknha.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zvknhb")
    runtime! syntax/riscv_asm_zvknhb.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zvks")
    runtime! syntax/riscv_asm_zvks.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zvksed")
    runtime! syntax/riscv_asm_zvksed.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_zvksh")
    runtime! syntax/riscv_asm_zvksh.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_ss")
    runtime! syntax/riscv_asm_ss.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_ssaia")
    runtime! syntax/riscv_asm_ssaia.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_sscofpmf")
    runtime! syntax/riscv_asm_sscofpmf.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_sspmp")
    runtime! syntax/riscv_asm_sspmp.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_ssstateen")
    runtime! syntax/riscv_asm_ssstateen.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_sstc")
    runtime! syntax/riscv_asm_sstc.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_svadu")
    runtime! syntax/riscv_asm_svadu.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_svinval")
    runtime! syntax/riscv_asm_svinval.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_sm")
    runtime! syntax/riscv_asm_sm.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_smaia")
    runtime! syntax/riscv_asm_smaia.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_smstateen")
    runtime! syntax/riscv_asm_smstateen.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_sdext")
    runtime! syntax/riscv_asm_sdext.vim
endif
if exists("b:riscv_asm_all_enable") || exists("b:riscv_asm_sdtrig")
    runtime! syntax/riscv_asm_sdtrig.vim
endif

" Disable defined identifier for reopen
if exists("b:riscv_asm_defined_rv32e")
    unlet b:riscv_asm_defined_rv32e
endif
if exists("b:riscv_asm_defined_rv32i")
    unlet b:riscv_asm_defined_rv32i
endif
if exists("b:riscv_asm_defined_rv64i")
    unlet b:riscv_asm_defined_rv64i
endif
if exists("b:riscv_asm_defined_rv128i")
    unlet b:riscv_asm_defined_rv128i
endif
if exists("b:riscv_asm_defined_m")
    unlet b:riscv_asm_defined_m
endif
if exists("b:riscv_asm_defined_a")
    unlet b:riscv_asm_defined_a
endif
if exists("b:riscv_asm_defined_f")
    unlet b:riscv_asm_defined_f
endif
if exists("b:riscv_asm_defined_d")
    unlet b:riscv_asm_defined_d
endif
if exists("b:riscv_asm_defined_q")
    unlet b:riscv_asm_defined_q
endif
if exists("b:riscv_asm_defined_c")
    unlet b:riscv_asm_defined_c
endif
if exists("b:riscv_asm_defined_v")
    unlet b:riscv_asm_defined_v
endif
if exists("b:riscv_asm_defined_h")
    unlet b:riscv_asm_defined_h
endif
if exists("b:riscv_asm_defined_zicbom")
    unlet b:riscv_asm_defined_zicbom
endif
if exists("b:riscv_asm_defined_zicbop")
    unlet b:riscv_asm_defined_zicbop
endif
if exists("b:riscv_asm_defined_zicboz")
    unlet b:riscv_asm_defined_zicboz
endif
if exists("b:riscv_asm_defined_zicntr")
    unlet b:riscv_asm_defined_zicntr
endif
if exists("b:riscv_asm_defined_zicond")
    unlet b:riscv_asm_defined_zicond
endif
if exists("b:riscv_asm_defined_zicsr")
    unlet b:riscv_asm_defined_zicsr
endif
if exists("b:riscv_asm_defined_zifencei")
    unlet b:riscv_asm_defined_zifencei
endif
if exists("b:riscv_asm_defined_zihintntl")
    unlet b:riscv_asm_defined_zihintntl
endif
if exists("b:riscv_asm_defined_zihintpause")
    unlet b:riscv_asm_defined_zihintpause
endif
if exists("b:riscv_asm_defined_zihpm")
    unlet b:riscv_asm_defined_zihpm
endif
if exists("b:riscv_asm_defined_zmmul")
    unlet b:riscv_asm_defined_zmmul
endif
if exists("b:riscv_asm_defined_zawrs")
    unlet b:riscv_asm_defined_zawrs
endif
if exists("b:riscv_asm_defined_zfa")
    unlet b:riscv_asm_defined_zfa
endif
if exists("b:riscv_asm_defined_zfh")
    unlet b:riscv_asm_defined_zfh
endif
if exists("b:riscv_asm_defined_zfhmin")
    unlet b:riscv_asm_defined_zfhmin
endif
if exists("b:riscv_asm_defined_zfinx")
    unlet b:riscv_asm_defined_zfinx
endif
if exists("b:riscv_asm_defined_zdinx")
    unlet b:riscv_asm_defined_zdinx
endif
if exists("b:riscv_asm_defined_zhinx")
    unlet b:riscv_asm_defined_zhinx
endif
if exists("b:riscv_asm_defined_zhinxmin")
    unlet b:riscv_asm_defined_zhinxmin
endif
if exists("b:riscv_asm_defined_zca")
    unlet b:riscv_asm_defined_zca
endif
if exists("b:riscv_asm_defined_zcb")
    unlet b:riscv_asm_defined_zcb
endif
if exists("b:riscv_asm_defined_zcd")
    unlet b:riscv_asm_defined_zcd
endif
if exists("b:riscv_asm_defined_zce")
    unlet b:riscv_asm_defined_zce
endif
if exists("b:riscv_asm_defined_zcf")
    unlet b:riscv_asm_defined_zcf
endif
if exists("b:riscv_asm_defined_zcmp")
    unlet b:riscv_asm_defined_zcmp
endif
if exists("b:riscv_asm_defined_zcmt")
    unlet b:riscv_asm_defined_zcmt
endif
if exists("b:riscv_asm_defined_zba")
    unlet b:riscv_asm_defined_zba
endif
if exists("b:riscv_asm_defined_zbb")
    unlet b:riscv_asm_defined_zbb
endif
if exists("b:riscv_asm_defined_zbc")
    unlet b:riscv_asm_defined_zbc
endif
if exists("b:riscv_asm_defined_zbkb")
    unlet b:riscv_asm_defined_zbkb
endif
if exists("b:riscv_asm_defined_zbkc")
    unlet b:riscv_asm_defined_zbkc
endif
if exists("b:riscv_asm_defined_zbkx")
    unlet b:riscv_asm_defined_zbkx
endif
if exists("b:riscv_asm_defined_zbs")
    unlet b:riscv_asm_defined_zbs
endif
if exists("b:riscv_asm_defined_zk")
    unlet b:riscv_asm_defined_zk
endif
if exists("b:riscv_asm_defined_zkn")
    unlet b:riscv_asm_defined_zkn
endif
if exists("b:riscv_asm_defined_zknd")
    unlet b:riscv_asm_defined_zknd
endif
if exists("b:riscv_asm_defined_zkne")
    unlet b:riscv_asm_defined_zkne
endif
if exists("b:riscv_asm_defined_zknh")
    unlet b:riscv_asm_defined_zknh
endif
if exists("b:riscv_asm_defined_zkr")
    unlet b:riscv_asm_defined_zkr
endif
if exists("b:riscv_asm_defined_zks")
    unlet b:riscv_asm_defined_zks
endif
if exists("b:riscv_asm_defined_zksed")
    unlet b:riscv_asm_defined_zksed
endif
if exists("b:riscv_asm_defined_zksh")
    unlet b:riscv_asm_defined_zksh
endif
if exists("b:riscv_asm_defined_zvamo")
    unlet b:riscv_asm_defined_zvamo
endif
if exists("b:riscv_asm_defined_zvbb")
    unlet b:riscv_asm_defined_zvbb
endif
if exists("b:riscv_asm_defined_zvbc")
    unlet b:riscv_asm_defined_zvbc
endif
if exists("b:riscv_asm_defined_zve32f")
    unlet b:riscv_asm_defined_zve32f
endif
if exists("b:riscv_asm_defined_zve32x")
    unlet b:riscv_asm_defined_zve32x
endif
if exists("b:riscv_asm_defined_zve64d")
    unlet b:riscv_asm_defined_zve64d
endif
if exists("b:riscv_asm_defined_zve64f")
    unlet b:riscv_asm_defined_zve64f
endif
if exists("b:riscv_asm_defined_zve64x")
    unlet b:riscv_asm_defined_zve64x
endif
if exists("b:riscv_asm_defined_zvediv")
    unlet b:riscv_asm_defined_zvediv
endif
if exists("b:riscv_asm_defined_zvfh")
    unlet b:riscv_asm_defined_zvfh
endif
if exists("b:riscv_asm_defined_zvfhmin")
    unlet b:riscv_asm_defined_zvfhmin
endif
if exists("b:riscv_asm_defined_zvkg")
    unlet b:riscv_asm_defined_zvkg
endif
if exists("b:riscv_asm_defined_zvkn")
    unlet b:riscv_asm_defined_zvkn
endif
if exists("b:riscv_asm_defined_zvkned")
    unlet b:riscv_asm_defined_zvkned
endif
if exists("b:riscv_asm_defined_zvknha")
    unlet b:riscv_asm_defined_zvknha
endif
if exists("b:riscv_asm_defined_zvknhb")
    unlet b:riscv_asm_defined_zvknhb
endif
if exists("b:riscv_asm_defined_zvks")
    unlet b:riscv_asm_defined_zvks
endif
if exists("b:riscv_asm_defined_zvksed")
    unlet b:riscv_asm_defined_zvksed
endif
if exists("b:riscv_asm_defined_zvksh")
    unlet b:riscv_asm_defined_zvksh
endif
if exists("b:riscv_asm_defined_ss")
    unlet b:riscv_asm_defined_ss
endif
if exists("b:riscv_asm_defined_ssaia")
    unlet b:riscv_asm_defined_ssaia
endif
if exists("b:riscv_asm_defined_sscofpmf")
    unlet b:riscv_asm_defined_sscofpmf
endif
if exists("b:riscv_asm_defined_sspmp")
    unlet b:riscv_asm_defined_sspmp
endif
if exists("b:riscv_asm_defined_ssstateen")
    unlet b:riscv_asm_defined_ssstateen
endif
if exists("b:riscv_asm_defined_sstc")
    unlet b:riscv_asm_defined_sstc
endif
if exists("b:riscv_asm_defined_svadu")
    unlet b:riscv_asm_defined_svadu
endif
if exists("b:riscv_asm_defined_svinval")
    unlet b:riscv_asm_defined_svinval
endif
if exists("b:riscv_asm_defined_sm")
    unlet b:riscv_asm_defined_sm
endif
if exists("b:riscv_asm_defined_smaia")
    unlet b:riscv_asm_defined_smaia
endif
if exists("b:riscv_asm_defined_smstateen")
    unlet b:riscv_asm_defined_smstateen
endif
if exists("b:riscv_asm_defined_sdext")
    unlet b:riscv_asm_defined_sdext
endif
if exists("b:riscv_asm_defined_sdtrig")
    unlet b:riscv_asm_defined_sdtrig
endif

" Functions
syn match riscvFunction                "%\(hi\|lo\|pcrel_hi\|pcrel_lo\|tprel_hi\|tprel_lo\|tprel_add\|tls_ie_pcrel_hi\|tls_gd_pcrel_hi\|got_pcrel_hi\)\>"

" To-do
syn keyword riscvTodo                  contained TODO FIXME

" Comments
syn region  riscvCommentP              start="#" skip="\\$" end="$" keepend contains=riscvTodo
syn region  riscvCommentL              start="//" skip="\\$" end="$" keepend contains=riscvTodo
syn region  riscvComment               matchgroup=riscvCommentStart start="/\*" end="\*/" keepend contains=riscvTodo,riscvCommentStartError extend
syn match   riscvCommentEndError       display "\*/"
syn match   riscvCommentStartError     display "/\*"me=e-1 contained

" PreCondit
syn region  riscvPreCondit             start="^\s*\zs#\s*\(if\|ifdef\|ifndef\|elif\)\>" skip="\\$" end="$" keepend contains=riscvComment,riscvCommentL,riscvCommentEndError,riscvString,riscvCharacter,riscvBinNumber,riscvOperator,riscvOctNumber,riscvDecNumber,riscvHexNumber,riscvBinError,riscvOctError,riscvDecError,riscvHexError
syn match   riscvPreConditMatch        display "^\s*\zs#\s*\(else\|endif\)\>"
" Include
syn region  riscvIncluded              display contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match   riscvIncluded              display contained "<[^>]*>"
syn match   riscvInclude               display "^\s*\zs#\s*include\>\s*["<]" contains=riscvIncluded
" Define
syn region  riscvDefine                start="^\s*\zs#\s*\(define\|undef\)\>" skip="\\$" end="$" keepend contains=ALLBUT,riscvCommentP,riscvPreCondit,riscvPreConditMatch,riscvInclude,riscvIncluded,riscvFenceError,riscvFenceType,@riscvDirectiveGroup
syn region  riscvPreProc               start="^\s*\zs#\s*\(pragma\>\|line\>\|warning\>\|warn\>\|error\>\)" skip="\\$" end="$" keepend contains=ALLBUT,riscvCommentP,riscvPreCondit,riscvPreConditMatch,riscvInclude,riscvIncluded,riscvFenceError,riscvFenceType,@riscvDirectiveGroup

hi def link riscvCommentP                   Comment
hi def link riscvCommentL                   Comment
hi def link riscvComment                    Comment
hi def link riscvCommentStart               Comment
hi def link riscvCommentStartError          Error
hi def link riscvCommentEndError            Error
hi def link riscvTodo                       Todo
hi def link riscvBinNumber                  Number
hi def link riscvOctNumber                  Number
hi def link riscvDecNumber                  Number
hi def link riscvHexNumber                  Number
hi def link riscvFltNumber                  Number
hi def link riscvBinError                   Error
hi def link riscvOctError                   Error
hi def link riscvDecError                   Error
hi def link riscvHexError                   Error
hi def link riscvByteEscape                 SpecialChar
hi def link riscvConstant                   Constant
hi def link riscvByteError                  Error
hi def link riscvCharError                  Error
hi def link riscvCharEscape                 SpecialChar
hi def link riscvCharacter                  Character
hi def link riscvString                     String
hi def link riscvOperator                   Special
hi def link riscvInsnOperator               Special
" Registers
hi def link riscvGPRegister                 Keyword
hi def link riscvFPRegister                 Keyword
hi def link riscvVRegister                  Keyword
hi def link riscvUCSRegister                Function
hi def link riscvSCSRegister                Function
hi def link riscvHCSRegister                Function
hi def link riscvMCSRegister                Function
hi def link riscvDCSRegister                Function
hi def link riscvLabel                      Label
hi def link riscvNumericLabel               Label
hi def link riscvDirective                  Special
hi def link riscvDirectiveError1            Error
hi def link riscvDirectiveError2            Error
hi def link riscvDirectiveType1             Identifier
hi def link riscvDirectiveType2             Identifier
hi def link riscvDirectiveType3             Identifier
hi def link riscvDirectiveType4             String
hi def link riscvDirectiveType5             Identifier
hi def link riscvDirectiveType6             Identifier
hi def link riscvDirectiveType7             Identifier
hi def link riscvDirectiveSymbol            Label
hi def link riscvDataDirective              Type
hi def link riscvBlockDirective             Function
hi def link riscvConditDirective            Conditional
" Instructions
hi def link riscvIInstruction               Statement
hi def link riscvFenceError                 Error
hi def link riscvFenceType                  Keyword
hi def link riscvMInstruction               Statement
hi def link riscvAInstruction               Statement
hi def link riscvFInstruction               Statement
hi def link riscvDInstruction               Statement
hi def link riscvQInstruction               Statement
hi def link riscvCInstruction               Statement
hi def link riscvBInstruction               Statement
hi def link riscvKInstruction               Statement
hi def link riscvVInstruction               Statement
hi def link riscvHInstruction               Statement
hi def link riscvSsInstruction              Statement
hi def link riscvSvInstruction              Statement
hi def link riscvSmInstruction              Statement
hi def link riscvFunction                   Function
hi def link riscvInclude                    Include
hi def link riscvIncluded                   String
hi def link riscvDefine                     Macro
hi def link riscvPreCondit                  Conditional
hi def link riscvPreConditMatch             Conditional
hi def link riscvPreProc                    PreProc

let b:current_syntax = "riscv_asm"
