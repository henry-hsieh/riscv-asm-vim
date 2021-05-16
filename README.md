# RISCV-ASM-VIM

Advanced RISC-V assembly syntax highlight for Vim.

## About

The plugin provides options to combine diffrent ISA extension of RISC-V.

It also highlights GNU Assembler (GAS) directives, and provides basic auto-indent feature.

## Installation

I recommand using Vim plugin manager to install the package

### [VimPlug](https://github.com/junegunn/vim-plug)

1. Add the following to your `.vimrc`:

```VimL
Plug 'henry-hsieh/riscv-asm-vim'
```

2. Reload `.vimrc` and run `:PlugInstall` in Vim.

### [Vundle](https://github.com/VundleVim/Vundle.vim)

1. Add the following to your `.vimrc`:

```VimL
Plugin 'henry-hsieh/riscv-asm-vim'
```

2. There are two methods to install the plugin.

    * Reload `.vimrc` and run `:PlugInstall` in Vim.

    * Use command line:

```Shell
vim +PluginInstall +qall
```

### [Pathogen](https://github.com/tpope/vim-pathogen)

1. Use command line:

```Shell
cd ~/.vim/bundle
git clone https://github.com/henry-hsieh/riscv-asm-vim
```

## Usage

### Basics

1. Any file with a `.S` extension will be loaded as RISC-V assembly syntax.
   Note that this will override default asm syntax.

2. Set filetype in Vim.

```VimL
set ft=riscv-asm
```

3. Add modeline in your files.

```c
// vim: ft=riscv-asm
```

### Options

`g:riscv_asm_isa` `b:riscv_asm_isa`

Before use the options, you can read "ISA Extension Naming Conventions" section in [RISC-V Specification](https://github.com/riscv/riscv-isa-manual/releases/download/Ratified-IMAFDQC/riscv-spec-20191213.pdf)

The options comply with the rule in the specification.

They tell Vim to highlight specified RISC-V extensions.

By default, the plugin will enable the RV32G extension.

This means that only 32I,M,A,F,D,Zicsr,Zifence instructions and registers will be highlighted.

The version numbers of extensions can be parsed, but they are not used in plugin for now.

Following are valid version number format:

* rv32i2 (RV32I v2.0)
* rv32i2p2 (RV32I v2.2)
* rv32i2_p2 (RV32I v2.0, P v2.0)
* rv32i2p2p1 (RV32I v2.2, P v1.0)
* rv32i2p2_p1p2 (RV32I v2.2, P v1.2)

The ISA name is case insensitive. The underscores will give the parser hints, but they are not neccessary for all situations.

Currently supported extensions:

* Base Integer
    * RV32E (Embedded 32-bit integer)
    * RV32I (32-bit integer)
    * RV64I (64-bit integer)
    * RV128I (128-bit integer)
* Extensions
    * M (Integer Multiplication and Division)
    * A (Atomics)
    * F (Single-Precision Floating-Point)
    * D (Double-Precision Floating-Point)
    * Q (Quad-Precision Floating-Point)
    * C (16-bit Compressed Instructions)
    * V (Vector Instructions)
    * N (User-Level Interrupts)
    * Zicsr (Control and Status Register Access)
    * Zifencei (Instruction-Fetch Fence)
* Privileged Extensions
    * S (Supervisor-Level Extension)
    * H (Hypervisor-Level Extension)
    * Zxm (Machine-Level Extension)

You should specifiy the extensions in sequence. `let g:riscv_asm_isa="RV64IMC"` is a valid sequence and `let b:riscv_asm_isa="RV128IZicsrM"` is not a valid sequence.

If invalid sequences are detected, following options will be set.

`g:riscv_asm_all_enable` `b:riscv_asm_all_enable`

If the options are defined (set to any value), the plugin will ignore all ISA settings and highlight all instructions and registers.

If vector extension is enabled, you could use `let g:riscv_asm_v_eew` to setup suitable EEW value. It will be set to 64 by default.

## Other VIM plugins

### Tagbar
[Tagbar](https://github.com/preservim/tagbar) is a Vim plugin that provides an easy way to browse the tags of the current file and get an overview of its structure. Follow steps in [Tagbar Wiki](https://github.com/preservim/tagbar/wiki#risc-v-asm) to apply it.
