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

### [Packer.nvim](https://github.com/wbthomason/packer.nvim)

1. Add the following to your packer startup function:

```lua
use "henry-hsieh/riscv-asm-vim"
```

2. Install the plugin:

    * Reload `init.lua` and run `:PackerSync` in Neovim.

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

#### Currently supported extensions

* Base Integer
    * RV32E (Embedded 32-bit integer)
    * RV32I (32-bit integer)
    * RV64E (Embedded 64-bit integer)
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
    * Zicntr (Base Counters and Timers)
    * Zicsr (Control and Status Register Access)
    * Zifencei (Instruction-Fetch Fence)
    * Zihintntl (Non-Temporal Locality Hints)
    * Zihintpause (Pause Hint)
    * Zihpm (Hardware Performance Counters)
    * __Scalar Half-Precsion Floating-Point__
        * Zfh (Half-Precision Floating-Point)
        * Zfhmin (Minimal Half-Precision Floating-Point)
* Privileged Extensions
    * Ss (Supervisor-Level Extension)
    * _Sv32_ (Page-Based 32-bit Virtual-Memory Systems)
    * _Sv39_ (Page-Based 39-bit Virtual-Memory Systems)
    * _Sv48_ (Page-Based 48-bit Virtual-Memory Systems)
    * _Sv57_ (Page-Based 57-bit Virtual-Memory Systems)
    * H (Hypervisor-Level Extension)
    * Sm (Machine-Level Extension)

1. You should specifiy the extensions in sequence listed above. The base integer ISA is first, the extensions are followed, and the privileged extensions should be the last. The extensions and the privileged extensions are optional.
2. You should choose one of the Base Integer ISA.
3. _Italic_ means the version number shall not be given.
4. __Bold__ means you can only choose one of the extensions in the sub-list.

For example, `let g:riscv_asm_isa="RV64IMC"` is a valid sequence and `let b:riscv_asm_isa="RV128IZicsrM"` is not a valid sequence.

If invalid sequences are detected, following options will be set.

`g:riscv_asm_all_enable` `b:riscv_asm_all_enable`

If the options are defined (set to any value), the plugin will ignore all ISA settings and highlight all instructions and registers.

If vector extension is enabled, you could use `let g:riscv_asm_v_eew` to setup suitable EEW value. It will be set to 64 by default.

## Other VIM plugins

### Tagbar
[Tagbar](https://github.com/preservim/tagbar) is a Vim plugin that provides an easy way to browse the tags of the current file and get an overview of its structure. Follow steps in [Tagbar Wiki](https://github.com/preservim/tagbar/wiki#risc-v-asm) to apply it.
