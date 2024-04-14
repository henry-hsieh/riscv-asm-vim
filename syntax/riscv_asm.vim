" Vim syn file
" Language: RISC-V Assembly
"

if exists("b:current_syntax")
    finish
endif

setlocal iskeyword+=48-57,192-255,_,$,.
let b:undo_ftplugin .= "| setlocal iskeyword<"

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
syn match   riscvInsnOperator          "[}{)(,]"

" GNU Assembler (GAS) directives
syn keyword riscvDirective             .abort .ABORT .align .altmacro .attach_to_group .balign .balignw .balignl .bss .bundle_align_mode .bundle_lock .bundle_unlock
syn keyword riscvDirective             .cfi_section .cfi_personality .cfi_fde_data .cfi_lsda .cfi_inline_lsda .cfi_def_cfa .cfi_def_cfa_register .cfi_def_cfa_offset .cfi_adjust_cfa_offset .cfi_offset .cfi_val_offset .cfi_rel_offset
syn keyword riscvDirective             .cfi_register .cfi_restore .cfi_undefined .cfi_same_value .cfi_remember_state .cfi_restore_state .cfi_return_column .cfi_signal_frame .cfi_window_save .cfi_escape .cfi_val_encoded_addr
syn keyword riscvDirective             .comm .data .dc.a .dc.b .dc.d .dc.l .dc.s .dc.w dc.x .dcb.b .dcb.d .dcb.l .dcb.s .dcb.w dcb.x .ds.b .ds.d .ds.l .ds.p .ds.s .ds.w ds.x
syn keyword riscvDirective             .desc .dim .eject .end .equ .equiv .eqv .err .error .extern .fail .file .global .globl .gnu_attribute .hidden
syn keyword riscvDirective             .ident .incbin .include .internal .lcomm .lflag .line .list .ln .loc_mark_labels .local .mri .noaltmacro .nolist .nop
syn keyword riscvDirective             .offset .org .p2align .p2alignw .p2alignl .popsection .previous .print .protected .psize .purgem .pushsection
syn keyword riscvDirective             .reloc .sbttl .scl .section .set .size .skip .space .stabd .stabn .stabs .struct .subsection .symver .tag .text .title .tls_common
syn keyword riscvDirective             .val .version .vtable_entry .vtable_inherit .warning .weak .weakref .zero
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

syn keyword riscvDataDirective         .ascii .asciz .byte .double .fill .float .hword .int .long .octa .quad .short .single
syn keyword riscvDataDirective         .sleb128 .string .string8 .string16 .uleb128 .word .2byte .4byte .8byte

syn keyword riscvBlockDirective        .cfi_startproc .cfi_endproc
syn keyword riscvBlockDirective        .def .endef
syn keyword riscvBlockDirective        .func .endfunc
syn keyword riscvBlockDirective        .macro .exitm .endm
syn keyword riscvBlockDirective        .irp .irpc .rept .endr

syn keyword riscvConditDirective       .if .ifdef .ifb .ifc .ifeq .ifeqs .ifge .ifgt .ifle .iflt .ifnb .ifnc .ifndef .ifnotdef .ifne .ifnes .else .elseif .endif
" GAS RISC-V directives
syn keyword riscvDataDirective         .half .dword .dtprelword .dtpreldword
syn keyword riscvDirective             .common .rodata .insn .variant_cc
syn match   riscvDirectiveType6        "\<\(arch\|push\|pop\|rvc\|norvc\|pic\|nopic\|relax\|norelax\|csr-check\|no-csr-check\)\>" display contained
syn match   riscvDirective             "\<\.option\>" nextgroup=riscvDirectiveError1,riscvDirectiveType6 skipwhite
syn match   riscvDirectiveType7        "\<\(Tag_RISCV_\)\?\(stack_align\|arch\|unaligned_access\|priv_spec\|priv_spec_minor\|priv_spec_revision\|atomic_abi\|x3_reg_usage\)\>" display contained
syn match   riscvDirective             "\<\.attribute\>" nextgroup=riscvDirectiveType7,riscvDirectiveError2,riscvInsnOperator skipwhite
syn cluster riscvDirectiveGroup        contains=riscvDirective,riscvDirectiveError1,riscvDirectiveError2,riscvDirectiveType1,riscvDirectiveType2,riscvDirectiveType3,riscvDirectiveType4,riscvDirectiveType5,riscvDirectiveType6,riscvDirectiveType7,riscvDirectiveSymbol,riscvBlockDirective,riscvDataDirective,riscvConditDirective

" Include registers and instructions
for isa_name in b:riscv_asm_standard_isa
    exec 'let isa_enable = exists("b:riscv_asm_' . isa_name . '")'
    if exists("b:riscv_asm_all_enable") || isa_enable
        exec 'runtime! syntax/riscv_asm/riscv_asm_' . isa_name . '.vim'
    endif
endfor

function! s:highlight(isa, type, csr = 0)
    let l:list = a:isa[a:type]
    if type(l:list) == v:t_list
        for item in l:list
            if type(item) == v:t_string
                if a:csr
                    exec "syn keyword riscvXCSRegister " . item
                else
                    exec "syn keyword riscvXInstruction " . item
                endif
            else
                if exists("g:riscv_asm_debug")
                    echom 'WARN: "' . a:type . '" of ' . a:isa["name"] . ' extension contains non-string'
                endif
                break
            endif
        endfor
    else
        echom 'WARN: "' . a:type . '" of ' . a:isa["name"] . ' extension is not a list'
        return
    endif
endfunction

function! s:add_custom_isa(isa)
    exec 'let l:isa_enable = exists("b:riscv_asm_' . tolower(a:isa["name"]) . '")'
    if l:isa_enable || exists("b:riscv_asm_all_enable")
        if has_key(a:isa, "inst")
            call s:highlight(a:isa, "inst")
        endif
        if has_key(a:isa, "csr")
            call s:highlight(a:isa, "csr", 1)
        endif
        if b:riscv_asm_xlen == 32 || exists("b:riscv_asm_all_enable")
            if has_key(a:isa, "inst32")
                call s:highlight(a:isa, "inst32")
            endif
            if has_key(a:isa, "csr32")
                call s:highlight(a:isa, "csr32", 1)
            endif
        elseif b:riscv_asm_xlen == 64 || exists("b:riscv_asm_all_enable")
            if has_key(a:isa, "inst64")
                call s:highlight(a:isa, "inst64")
            endif
            if has_key(a:isa, "csr64")
                call s:highlight(a:isa, "csr64", 1)
            endif
        elseif b:riscv_asm_xlen == 128 || exists("b:riscv_asm_all_enable")
            if has_key(a:isa, "inst128")
                call s:highlight(a:isa, "inst128")
            endif
            if has_key(a:isa, "csr128")
                call s:highlight(a:isa, "csr128", 1)
            endif
        endif
    endif
endfunction

if exists("b:riscv_asm_custom_isa")
    for isa in b:riscv_asm_custom_isa
        call s:add_custom_isa(isa)
    endfor
endif

" Disable defined identifier for reopen
for isa_name in b:riscv_asm_standard_isa
    exec 'let isa_defined = exists("b:riscv_asm_defined_' . isa_name . '")'
    if isa_defined
        let b:undo_ftplugin .= "| unlet! b:riscv_asm_defined_" . isa_name
        exec 'unlet! b:riscv_asm_defined_' . isa_name
    endif
endfor

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
hi def link riscvXCSRegister                Function
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
hi def link riscvXInstruction               Statement
hi def link riscvFunction                   Function
hi def link riscvInclude                    Include
hi def link riscvIncluded                   String
hi def link riscvDefine                     Macro
hi def link riscvPreCondit                  Conditional
hi def link riscvPreConditMatch             Conditional
hi def link riscvPreProc                    PreProc

let b:current_syntax = "riscv_asm"
