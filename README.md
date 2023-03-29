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

1. Any file with a `.S` extension will be loaded as RISC-V assembly syntax.
   Note that this will override default asm syntax.

2. Set filetype in Vim.

```VimL
set ft=riscv_asm
```

3. Add modeline in your files.

```c
// vim: ft=riscv_asm
```

## Options

### Specify the ISAs You Want to Highlight

| Language    | Option Name                                        |
|:----------- |:-------------------------------------------------- |
| Vimscript   | `g:riscv_asm_isa`                                  |
| Neovim Lua  | `vim.g.riscv_asm_isa`                              |

The option complies with the ISA naming rule in the specification. But the extension names follow the latest RISC-V standard.

Vim highlights specified RISC-V ISA and extensions.

By default, the plugin will enable the RV64GC extension.

This means that only RV64I,M,A,F,D,C,Zicsr,Zifencei instructions and registers will be highlighted.

The version numbers of extensions can be parsed, but they are not used in plugin for now.

Following are valid version number format:

* rv32i2 (RV32I v2.0)
* rv32i2p2 (RV32I v2.2)
* rv32i2_p2 (RV32I v2.0, P v2.0)
* rv32i2p2p1 (RV32I v2.2, P v1.0)
* rv32i2p2_p1p2 (RV32I v2.2, P v1.2)

The ISA name is case insensitive. The underscores will give the parser hints, but they are not neccessary for all situations.

#### Currently Supported Extensions

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
| `G`                    | General                                                                                     |                   |
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
| `Zicbom`               | Cache-Block Management Instructions                                                         | 1.0               |
| `Zicbop`               | Cache-Block Prefetch Instructions                                                           | 1.0               |
| `Zicboz`               | Cache-Block Zero Instructions                                                               | 1.0               |
| `Zicntr`               | Base Counters and Timers                                                                    | 2.0               |
| `Zicond`               | Integer Conditional Operations Extension                                                    | 1.0               |
| `Zicsr`                | Control and Status Register Access                                                          | 2.0               |
| `Zifencei`             | Instruction-Fetch Fence                                                                     | 2.0               |
| `Zihintntl`            | Non-Temporal Locality Hints                                                                 | 0.2               |
| `Zihintpause`          | Pause Hint                                                                                  | 2.0               |
| `Zihpm`                | Hardware Performance Counters                                                               | 2.0               |
| `Zmmul`                | Multiplication Without Division                                                             | 1.0               |
| `Zawrs`                | Wait-On-Reservation-Set Extension                                                           | 1.0               |
| `Zam`                  | Misaligned Atomic                                                                           | 0.1               |
| `Zfa`                  | Additional Floating-Point Instructions                                                      | 0.1               |
| `Zfh`                  | Half-Precision Floating-Point                                                               | 1.0               |
| `Zfhmin`               | Minimal Half-Precision Floating-Point                                                       | 1.0               |
| `Zfinx`                | Single-Precision Floating-Point in Integer Registers                                        | 1.0               |
| `Zdinx`                | Double-Precision Floating-Point in Integer Registers                                        | 1.0               |
| `Zhinx`                | Half-Precision Floating-Point in Integer Registers                                          | 1.0               |
| `Zhinxmin`             | Minimal Half-Precision Floating-Point in Integer Registers                                  | 1.0               |
| `Zca`                  | C Extension Instructions without Floating-Point Load/Stores                                 | 1.0               |
| `Zcb`                  | Simple Code Size Saving Instructions                                                        | 1.0               |
| `Zcd`                  | Compressed Double-Precision Floating-Point Load/Stores Instructions                         | 1.0               |
| `Zce`                  | Compressed Instructions for Microcontrollers                                                | 1.0               |
| `Zcf`                  | Compressed Single-Precision Floating-Point Load/Stores Instructions                         | 1.0               |
| `Zcmp`                 | Push/Pop and Double Move Instructions                                                       | 1.0               |
| `Zcmt`                 | Table Jump Instructions                                                                     | 1.0               |
| `Zba`                  | Address Generation Instructions                                                             | 1.0               |
| `Zbb`                  | Basic Bit-Manipulation                                                                      | 1.0               |
| `Zbc`                  | Carry-Less Multiplication                                                                   | 1.0               |
| `Zbkb`                 | Bit-Manipulation Instructions for Cryptography                                              | 1.0               |
| `Zbkc`                 | Carry-Less Multiplication Instructions for Cryptography                                     | 1.0               |
| `Zbkx`                 | Crossbar Permutation Instructions for Cryptography                                          | 1.0               |
| `Zbs`                  | Single-Bit Instructions                                                                     | 1.0               |
| `Zk`                   | Standard Scalar Cryptography Extension                                                      | 1.0               |
| `Zkn`                  | NIST Algorithm Suite Extension                                                              | 1.0               |
| `Zknd`                 | AES Decryption Instructions                                                                 | 1.0               |
| `Zkne`                 | AES Encryption Instructions                                                                 | 1.0               |
| `Zknh`                 | SHA2 Hash Function Instructions                                                             | 1.0               |
| `Zkr`                  | Entropy Source Extension                                                                    | 1.0               |
| `Zks`                  | ShangMi Algorithm Suite Extension                                                           | 1.0               |
| `Zksed`                | SM4 Block Cipher Instructions                                                               | 1.0               |
| `Zksh`                 | SM3 Hash Function Instructions                                                              | 1.0               |
| `Zkt`                  | Data Independent Execution Latency Extension                                                | 1.0               |
| `Zvamo`                | Vector Atomic Instructions                                                                  |                   |
| `Zvbb`                 | Vector Bit-Manipulation Instructions for Cryptography                                       | 0.4               |
| `Zvbc`                 | Vector Carry-Less Multiplication                                                            | 0.4               |
| `Zve32f`               | Vector Extension for Embedded 32-bit Single-Precision Floating-Point                        | 1.1               |
| `Zve32x`               | Vector Extension for Embedded 32-bit Integer                                                | 1.1               |
| `Zve64d`               | Vector Extension for Embedded 64-bit Double-Precision Floating-Point                        | 1.1               |
| `Zve64f`               | Vector Extension for Embedded 64-bit Single-Precision Floating-Point                        | 1.1               |
| `Zve64x`               | Vector Extension for Embedded 64-bit Integer                                                | 1.1               |
| `Zvediv`               | Vector Divided Element Extension                                                            |                   |
| `Zvfh`                 | Vector Extension for Half-Precision Floating-Point                                          | 1.1               |
| `Zvfhmin`              | Vector Extension for Minimal Half-Precision Floating-Point                                  | 1.1               |
| `Zvkg`                 | Vector GCM/GMAC                                                                             | 0.4               |
| `Zvkn`                 | Vector NIST Algorithm Suite Extension                                                       | 0.4               |
| `Zvkned`               | Vector AES Block Cipher                                                                     | 0.4               |
| `Zvknha`               | Vector SHA-2 Secure Hash for Embedded 32-bit                                                | 0.4               |
| `Zvknhb`               | Vector SHA-2 Secure Hash                                                                    | 0.4               |
| `Zvks`                 | Vector ShangMi Algorithm Suite Extension                                                    | 0.4               |
| `Zvksed`               | Vector SM4 Block Cipher                                                                     | 0.4               |
| `Zvksh`                | Vector SM3 Secure Hash                                                                      | 0.4               |
| `Zvkt`                 | Vector Data Independent Execution Latency Extension                                         | 0.4               |
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
| `Ssaia`                | Supervisor-Level Advanced Interrupt Architecture Extension                                  | 1.0               |
| `Sspmp`                | Supervisor Memory Protection Extension                                                      | 0.8               |
| `Sscofpmf`             | Count Overflow and Mode-Based Filtering Extension                                           | 0.5               |
| `Sstc`                 | Supervisor-Level Timer Comparison Extension                                                 | 0.5               |
| `Ssstateen`            | Supervisor-Level State Enable Extension                                                     | 1.0               |
| `Sv32`                 | Page-Based 32-bit Virtual-Memory Systems                                                    |                   |
| `Sv39`                 | Page-Based 39-bit Virtual-Memory Systems                                                    |                   |
| `Sv48`                 | Page-Based 48-bit Virtual-Memory Systems                                                    |                   |
| `Sv57`                 | Page-Based 57-bit Virtual-Memory Systems                                                    |                   |
| `Svadu`                | Hardware Updating of PTE A/D Bits                                                           | 0.1               |
| `Svinval`              | Fine-Grained Address-Translation Cache Invalidation                                         | 1.0               |
| `Svnapot`              | NAPOT Translation Contiguity                                                                | 1.0               |
| `Svpbmt`               | Page-Based Memory Types                                                                     | 1.0               |
| `Sm`                   | Machine-Level Extension                                                                     | 1.12              |
| `Smaia`                | Machine-Level Advanced Interrupt Architecture Extension                                     | 1.0               |
| `Smepmp`               | PMP Enhancements for Memory Access and Execution Prevention on Machine Mode                 | 1.12              |
| `Smstateen`            | Machine-Level State Enable Extension                                                        | 1.0               |
| `Sdext`                | External Debug Extension                                                                    | 1.0               |
| `Sdtrig`               | Debug Trigger Extension                                                                     | 1.0               |

#### Conflict Extensions

| Extension A                                                                                          | Extension B                                                                                          |
|:---------------------------------------------------------------------------------------------------- |:---------------------------------------------------------------------------------------------------- |
| `RV32E`/`RV64E`                                                                                      | `H`/`G`                                                                                              |
| `F`/`D`/`Q`/`V`/`Zfa`/`Zfh`/`Zcd`/`Zcf`/`Zfhmin`/`Zve32f`/`Zve64d`/`Zve64f`/`Zvfh`/`Zvfhmin`         | `Zfinx`/`Zdinx`/`Zhinx`/`Zhinxmin`                                                                   |
| `Zve32x`/`Zve32f`                                                                                    | `Zvknhb`                                                                                             |
| `Zcd`                                                                                                | `RV128I`/`Zce`/`Zcmp`/`Zcmt`                                                                         |
| `C`                                                                                                  | `Zce`/`Zcmp`/`Zcmt`                                                                                  |
| `Zcf`                                                                                                | `RV64I`/`RV64E`/`RV128I`                                                                             |

#### Rules Should Be Followed

1. You should specifiy the extensions in sequence listed in [Currently Supported Extensions](#currently-supported-extensions). You should always choose one of the base integer ISA and put the base ISA name in the head of the option. Don't specify more than one base ISA, or the parser will return error. In addition to the base ISA, you can optionally add the extensions. The specified order should be the unprivileged extensions, the privileged extensions, the additional unprivileged extensions, and the additional privileged extensions. The extensions in the same category should follow the order listed in the corresponding table.
2. If the supported version of an extension is not given, you shouldn't specified the version in the sequence.
3. A underscore should be added between two consecutive additional extensions.
4. Some extensions and privileged extensions can't co-exist, they are listed in [Conflict Extensions](#conflict-extensions). You shouldn't put them into the option together.

Some examples of valid and invalid ISA combinations:

| Sequence                | Valid | Reason                                                      | Unresolved String |
|:----------------------- |:----- |:----------------------------------------------------------- |:----------------- |
| `RV64IMCZicsr_Zifencei` | Yes   |                                                             |                   |
| `RV32IAM`               | No    | Incorrect order                                             | `M`               |
| `Zicsr`                 | No    | No base ISA                                                 | `Zicsr`           |
| `RV32IRV64IMAFC`        | No    | More than one base ISAs                                     | `RV64IMAFC`       |
| `RV64GZve64dZvl256b`    | No    | No underscore between two consecutive additional extensions | `Zve64dZvl256b`   |
| `RV32EMG`               | No    | Conflict extensions (`RV32E` & `G`)                         | `G`               |
| `RV64GCVZvamo1p0`       | No    | Specify version number on an unversioned extension          | `Zvamo1p0`        |

### Enable All Supported RISC-V ISA

| Language    | Option Name                                        |
|:----------- |:-------------------------------------------------- |
| Vimscript   | `g:riscv_asm_all_enable`                           |
| Neovim Lua  | `vim.g.riscv_asm_all_enable`                       |

If the option is defined (set to any value), the plugin will ignore the value of `g:riscv_asm_isa` and highlight all instructions and registers supported by the plugin. If an invalid sequence in `g:riscv_asm_isa` is detected, the plugin will automatically highlight all instructions and registers, too.

## Other VIM plugins

### Tagbar
[Tagbar](https://github.com/preservim/tagbar) is a Vim plugin that provides an easy way to browse the tags of the current file and get an overview of its structure. Follow steps in [Tagbar Wiki](https://github.com/preservim/tagbar/wiki#risc-v-asm) to apply it.
