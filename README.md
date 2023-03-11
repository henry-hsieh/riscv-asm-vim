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

This means that only 32I,M,A,F,D,Zicsr,Zifencei instructions and registers will be highlighted.

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

| Base ISA               | Full Name                                                                                   | Supported Version |
|:---------------------- |:------------------------------------------------------------------------------------------- |:----------------- |
| `RV32E`                | Embedded 32-bit integer                                                                     | 2.0               |
| `RV32I`                | 32-bit integer                                                                              | 2.1               |
| `RV64E`                | Embedded 64-bit integer                                                                     | 2.0               |
| `RV64I`                | 64-bit integer                                                                              | 2.1               |
| `RV128I`               | 128-bit integer                                                                             | 1.7               |

* Unprivileged Extensions

| Extension              | Full Name                                                                                   | Supported Version |
|:---------------------- |:------------------------------------------------------------------------------------------- |:----------------- |
| `M`                    | Integer Multiplication and Division                                                         | 2.0               |
| `A`                    | Atomics                                                                                     | 2.1               |
| `F`                    | Single-Precision Floating-Point                                                             | 2.2               |
| `D`                    | Double-Precision Floating-Point                                                             | 2.2               |
| `Q`                    | Quad-Precision Floating-Point                                                               | 2.2               |
| `C`                    | 16-bit Compressed Instructions                                                              | 2.0               |
| `V`                    | Vector Instructions                                                                         | 1.1               |

* Privileged Extensions

| Extension              | Full Name                                                                                   | Supported Version |
|:---------------------- |:------------------------------------------------------------------------------------------- |:----------------- |
| `H`                    | Hypervisor Extension                                                                        | 1.0               |

* Additional Unprivileged Extensions

| Extension              | Full Name                                                                                   | Supported Version |
|:---------------------- |:------------------------------------------------------------------------------------------- |:----------------- |
| `Zicntr`               | Base Counters and Timers                                                                    | 2.0               |
| `Zicsr`                | Control and Status Register Access                                                          | 2.0               |
| `Zifencei`             | Instruction-Fetch Fence                                                                     | 2.0               |
| `Zihintntl`            | Non-Temporal Locality Hints                                                                 | 0.2               |
| `Zihintpause`          | Pause Hint                                                                                  | 2.0               |
| `Zihpm`                | Hardware Performance Counters                                                               | 2.0               |
| `Zmmul`                | Multiplication Without Division                                                             | 1.0               |
| `Zam`                  | Misaligned Atomic                                                                           | 0.1               |
| `Zfa`                  | Additional Floating-Point Instructions                                                      | 0.1               |
| `Zfh`                  | Half-Precision Floating-Point                                                               | 1.0               |
| `Zfhmin`               | Minimal Half-Precision Floating-Point                                                       | 1.0               |
| `Zfinx`                | Single-Precision Floating-Point in Integer Registers                                        | 1.0               |
| `Zdinx`                | Double-Precision Floating-Point in Integer Registers                                        | 1.0               |
| `Zhinx`                | Half-Precision Floating-Point in Integer Registers                                          | 1.0               |
| `Zhinxmin`             | Minimal Half-Precision Floating-Point in Integer Registers                                  | 1.0               |
| `Zba`                  | Address Generation Instructions                                                             | 1.0               |
| `Zbb`                  | Basic Bit-Manipulation                                                                      | 1.0               |
| `Zbc`                  | Carry-Less Multiplication                                                                   | 1.0               |
| `Zbs`                  | Single-Bit Instructions                                                                     | 1.0               |
| `Zvamo`                | Vector Atomic Instructions                                                                  |                   |
| `Zve32f`               | Vector Extension for Embedded 32-bit Single-Precision Floating-Point                        | 1.1               |
| `Zve32x`               | Vector Extension for Embedded 32-bit Integer                                                | 1.1               |
| `Zve64d`               | Vector Extension for Embedded 64-bit Double-Precision Floating-Point                        | 1.1               |
| `Zve64f`               | Vector Extension for Embedded 64-bit Single-Precision Floating-Point                        | 1.1               |
| `Zve64x`               | Vector Extension for Embedded 64-bit Integer                                                | 1.1               |
| `Zvediv`               | Vector Divided Element Extension                                                            |                   |
| `Zvfh`                 | Vector Extension for Half-Precision Floating-Point                                          | 1.1               |
| `Zvfhmin`              | Vector Extension for Minimal Half-Precision Floating-Point                                  | 1.1               |
| `Zvl32b`               | Minimum 32-bit Vector Length                                                                | 1.1               |
| `Zvl64b`               | Minimum 64-bit Vector Length                                                                | 1.1               |
| `Zvl128b`              | Minimum 128-bit Vector Length                                                               | 1.1               |
| `Zvl256b`              | Minimum 256-bit Vector Length                                                               | 1.1               |
| `Zvl512b`              | Minimum 512-bit Vector Length                                                               | 1.1               |
| `Zvl1024b`             | Minimum 1024-bit Vector Length                                                              | 1.1               |
| `Ztso`                 | Total Store Ordering                                                                        | 1.0               |

* Additional Privileged Extensions

| Extension              | Full Name                                                                                   | Supported Version |
|:---------------------- |:------------------------------------------------------------------------------------------- |:----------------- |
| `Ss`                   | Supervisor-Level Extension                                                                  | 1.12              |
| `Sv32`                 | Page-Based 32-bit Virtual-Memory Systems                                                    |                   |
| `Sv39`                 | Page-Based 39-bit Virtual-Memory Systems                                                    |                   |
| `Sv48`                 | Page-Based 48-bit Virtual-Memory Systems                                                    |                   |
| `Sv57`                 | Page-Based 57-bit Virtual-Memory Systems                                                    |                   |
| `Svinval`              | Fine-Grained Address-Translation Cache Invalidation                                         | 1.0               |
| `Svnapot`              | NAPOT Translation Contiguity                                                                | 1.0               |
| `Svpbmt`               | Page-Based Memory Types                                                                     | 1.0               |
| `Sm`                   | Machine-Level Extension                                                                     | 1.12              |

1. You should specifiy the extensions in sequence listed above. The base integer ISA is first and mandatory, the unprivileged extensions, the privileged extensions, the additional unprivileged extensions, and the additional privileged extensions should be specified in sequence. The (additional) unprivileged extensions and the (additional) privileged extensions are optional.
2. If the supported version of an extension is not given, you shouldn't specified the version in the sequence.
3. A underscore should be added between two additional extensions.
4. Some extensions and privileged extensions can't co-exist, they are listed in the following table.

| Extension A                                                                                          | Extension B                                                                                          |
|:---------------------------------------------------------------------------------------------------- |:---------------------------------------------------------------------------------------------------- |
| `RV32E`/`RV64E`                                                                                      | `H`                                                                                                  |
| `F`/`D`/`Q`/`V`/`Zfa`/`Zfh`/`Zfhmin`/`Zve32f`/`Zve64d`/`Zve64f`/`Zvfh`/`Zvfhmin`                     | `Zfinx`/`Zdinx`/`Zhinx`/`Zhinxmin`                                                                   |

For example, `let g:riscv_asm_isa="RV64IMC"` is a valid sequence and `let b:riscv_asm_isa="RV128IZicsrM"` is not a valid sequence.

If invalid sequences are detected, following options will be set.

`g:riscv_asm_all_enable` `b:riscv_asm_all_enable`

If the options are defined (set to any value), the plugin will ignore all ISA settings and highlight all instructions and registers.

## Other VIM plugins

### Tagbar
[Tagbar](https://github.com/preservim/tagbar) is a Vim plugin that provides an easy way to browse the tags of the current file and get an overview of its structure. Follow steps in [Tagbar Wiki](https://github.com/preservim/tagbar/wiki#risc-v-asm) to apply it.
