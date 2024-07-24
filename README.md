# Advanced RISC-V Assembly Highlight for Vim and Neovim

## Overview

This Vim plugin is designed to enhance your RISC-V assembly coding experience. It achieves this by offering comprehensive syntax highlighting and providing support for both standard and custom RISC-V extensions, including instructions and registers. Additionally, the plugin is configurable by using RISC-V ISA extension naming conventions, recognizes GNU Assembly (GAS) directives, and incorporates smart indent functionality.

## Features
1. Syntax Highlighting:

    - Full coverage of standard RISC-V instructions and registers for improved code readability.
    - Clear and intuitive color coding to distinguish different elements in your RISC-V assembly code.

2. Customization:

    - Add custom RISC-V extensions consist of instructions and CSRs to tailor the plugin to your specific needs.
    - Follows RISC-V ISA Extension Naming Conventions to enable certain extensions, ensuring compatibility and standardization.

3. GAS Directives:

    - Recognizes and highlights GNU Assembly (GAS) directives for a seamless coding experience with popular RISC-V assemblers.

4. Smart Indent:

    - Provides smart indent functionality for improved code structure and alignment.

## Installation

### [VimPlug](https://github.com/junegunn/vim-plug)

1. Add the following text to the vim-plug section in your `.vimrc`:

```VimL
Plug 'henry-hsieh/riscv-asm-vim'
```

2. Reload `.vimrc` and run `:PlugInstall` in Vim.

### [Vundle](https://github.com/VundleVim/Vundle.vim)

1. Add the following text to the vundle section in your `.vimrc`:

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
use {
  "henry-hsieh/riscv-asm-vim",
}
```

2. Install the plugin:

    * Reload `init.lua` and run `:PackerSync` in Neovim.

### [lazy.nvim](https://github.com/folke/lazy.nvim)

1. Add the following to your lazy.nvim startup function:

```lua
{
  "henry-hsieh/riscv-asm-vim",
  ft = { "riscv_asm" },
}
```

2. Install the plugin:

    * Reload `init.lua` and run `:Lazy install` in Neovim.
    * Or if you are using **install missing plugins**, just restart Neovim.

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

To set the option of this plugin, you can use either Vimscript or Lua (Neovim only). Put the options in your Vim/Neovim startup file.

### Highlight All Supported RISC-V ISA

**Vimscript:**
```VimL
let g:riscv_asm_all_enable = 1
```

**Neovim Lua:**
```lua
vim.g.riscv_asm_all_enable = true
```
If the option is defined (set to any value), the plugin will ignore the value of `g:riscv_asm_isa` and highlight all instructions and registers supported by the plugin. If an invalid sequence in `g:riscv_asm_isa` is detected, the plugin will automatically highlight all instructions and registers, too.

### Specify the Extensions You Want to Highlight

**Vimscript:**
```VimL
let g:riscv_asm_isa = 'RV64GC'
```

**Neovim Lua:**
```lua
vim.g.riscv_asm_isa = 'RV64GC'
```

The value of `g:riscv_asm_isa` aligns with RISC-V ISA extension naming conventions, allowing Vim to highlight specified RISC-V ISAs and extensions. By default, the plugin activates only the RV64GC extension, resulting in the highlighting of RV64I, M, A, F, D, C, Zicsr, and Zifencei instructions and registers.

While the version numbers of extensions can be parsed, the plugin currently does not utilize them. Here are examples of combinations of ISA extensions and version numbers:

- `rv32i2` (RV32I v2.0)
- `rv32i2p2` (RV32I v2.2)
- `rv32i2_p2` (RV32I v2.0, P v2.0)
- `rv32i2p2p1` (RV32I v2.2, P v1.0)
- `rv32i2p2_p1p2` (RV32I v2.2, P v1.2)

It's important to note that the ISA name is case insensitive, and underscores may provide hints to the parser but are not required in all situations.

#### Currently Supported Extensions

* Base Integer ISAs or Profiles

| Base ISA / Profile     | Full Name                                                                                   | Supported Version |
|:---------------------- |:------------------------------------------------------------------------------------------- |:----------------- |
| `RV32E`                | Embedded 32-bit integer                                                                     | 2.0               |
| `RV32I`                | 32-bit integer                                                                              | 2.1               |
| `RV64E`                | Embedded 64-bit integer                                                                     | 2.0               |
| `RV64I`                | 64-bit integer                                                                              | 2.1               |
| `RV128I`               | 128-bit integer                                                                             | 1.7               |
| `RVI20U32`             | RVI20U32 Profile                                                                            |                   |
| `RVI20U64`             | RVI20U64 Profile                                                                            |                   |
| `RVA20U64`             | RVA20U64 Profile                                                                            |                   |
| `RVA20S64`             | RVA20S64 Profile                                                                            |                   |
| `RVA22U64`             | RVA22U64 Profile                                                                            |                   |
| `RVA22S64`             | RVA22S64 Profile                                                                            |                   |
| `RVA23U64`             | RVA23U64 Profile                                                                            |                   |
| `RVA23S64`             | RVA23S64 Profile                                                                            |                   |
| `RVB23U64`             | RVB23U64 Profile                                                                            |                   |
| `RVB23S64`             | RVB23S64 Profile                                                                            |                   |
| `RVM23U32`             | RVM23U32 Profile                                                                            |                   |

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
| `Zic64b`               | Cache Block Size Is 64 Bytes                                                                |                   |
| `Zicbom`               | Cache-Block Management Instructions                                                         | 1.0               |
| `Zicbop`               | Cache-Block Prefetch Instructions                                                           | 1.0               |
| `Zicboz`               | Cache-Block Zero Instructions                                                               | 1.0               |
| `Ziccamoa`             | Main Memory Supports All Atomics in A                                                       |                   |
| `Ziccif`               | Main Memory Supports Instruction Fetch With Atomicity Requirement                           |                   |
| `Zicclsm`              | Main Memory Supports Misaligned Loads/Stores                                                |                   |
| `Ziccrse`              | Main Memory Supports Forward Progress on LR/SC Sequences                                    |                   |
| `Zicfilp`              | Landing Pad                                                                                 | 1.0               |
| `Zicfiss`              | Shadow Stack                                                                                | 1.0               |
| `Zicntr`               | Base Counters and Timers                                                                    | 2.0               |
| `Zicond`               | Integer Conditional Operations Extension                                                    | 1.0               |
| `Zicsr`                | Control and Status Register Access                                                          | 2.0               |
| `Zifencei`             | Instruction-Fetch Fence                                                                     | 2.0               |
| `Zihintntl`            | Non-Temporal Locality Hints                                                                 | 1.0               |
| `Zihintpause`          | Pause Hint                                                                                  | 2.0               |
| `Zihpm`                | Hardware Performance Counters                                                               | 2.0               |
| `Zimop`                | May-Be-Operations Extension                                                                 | 1.0               |
| `Zmmul`                | Multiplication Without Division                                                             | 1.0               |
| `Za128rs`              | Reservation Set Size of 128 Bytes                                                           |                   |
| `Za64rs`               | Reservation Set Size of 64 Bytes                                                            |                   |
| `Zaamo`                | Atomic Memory Operations Extension                                                          | 1.0               |
| `Zabha`                | Byte and Halfword Atomic Memory Operations                                                  | 1.0               |
| `Zacas`                | Atomic Compare-and-Swap Instructions                                                        | 1.0               |
| `Zalrsc`               | Load-Reserved/Store-Conditional Extension                                                   | 1.0               |
| `Zawrs`                | Wait-On-Reservation-Set Extension                                                           | 1.0               |
| `Zfa`                  | Additional Floating-Point Instructions                                                      | 1.0               |
| `Zfbfmin`              | Scalar BF16 Converts                                                                        | 1.0               |
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
| `Zcmop`                | Compressed May-Be-Operations Extension                                                      | 1.0               |
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
| `Zvbb`                 | Vector Bit-Manipulation Instructions for Cryptography                                       | 1.0               |
| `Zvbc`                 | Vector Carry-Less Multiplication                                                            | 1.0               |
| `Zve32f`               | Vector Extension for Embedded 32-bit Single-Precision Floating-Point                        | 1.1               |
| `Zve32x`               | Vector Extension for Embedded 32-bit Integer                                                | 1.1               |
| `Zve64d`               | Vector Extension for Embedded 64-bit Double-Precision Floating-Point                        | 1.1               |
| `Zve64f`               | Vector Extension for Embedded 64-bit Single-Precision Floating-Point                        | 1.1               |
| `Zve64x`               | Vector Extension for Embedded 64-bit Integer                                                | 1.1               |
| `Zvediv`               | Vector Divided Element Extension                                                            |                   |
| `Zvfbfmin`             | Vector BF16 Converts                                                                        | 1.0               |
| `Zvfbfwma`             | Vector BF16 Widening Mul-Add                                                                | 1.0               |
| `Zvfh`                 | Vector Extension for Half-Precision Floating-Point                                          | 1.1               |
| `Zvfhmin`              | Vector Extension for Minimal Half-Precision Floating-Point                                  | 1.1               |
| `Zvkb`                 | Vector Cryptography Bit-manipulation                                                        | 1.0               |
| `Zvkg`                 | Vector GCM/GMAC                                                                             | 1.0               |
| `Zvkn`                 | Vector NIST Algorithm Suite Extension                                                       | 1.0               |
| `Zvknc`                | Vector NIST Algorithm Suite with Carryless Multiply                                         | 1.0               |
| `Zvkned`               | Vector AES Block Cipher                                                                     | 1.0               |
| `Zvkng`                | Vector NIST Algorithm Suite with GCM                                                        | 1.0               |
| `Zvknha`               | Vector SHA-2 Secure Hash for Embedded 32-bit                                                | 1.0               |
| `Zvknhb`               | Vector SHA-2 Secure Hash                                                                    | 1.0               |
| `Zvks`                 | Vector ShangMi Algorithm Suite Extension                                                    | 1.0               |
| `Zvksc`                | Vector ShangMi Algorithm Suite with Carryless Multiplication                                | 1.0               |
| `Zvksed`               | Vector SM4 Block Cipher                                                                     | 1.0               |
| `Zvksg`                | Vector ShangMi Algorithm Suite with GCM                                                     | 1.0               |
| `Zvksh`                | Vector SM3 Secure Hash                                                                      | 1.0               |
| `Zvkt`                 | Vector Data Independent Execution Latency Extension                                         | 1.0               |
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
| `Supm`                 | User-Level Has Pointer Masking Support                                                      | 1.0               |
| `Ss`                   | Supervisor-Level Extension                                                                  | 1.12              |
| `Ssaia`                | Supervisor-Level Advanced Interrupt Architecture Extension                                  | 1.0               |
| `Ssccptr`              | Main Memory Supports Page Table Reads                                                       |                   |
| `Sscofpmf`             | Count Overflow and Mode-Based Filtering Extension                                           | 1.0               |
| `Sscounterenw`         | Support Writeable Enables for Any Supported Counter                                         |                   |
| `Sscsrind`             | Supervisor-Level Indirect CSR Access                                                        | 1.0               |
| `Ssnpm`                | Supervisor-Level Next Lower Privilege Mode Pointer Masking                                  | 1.0               |
| `Sspm`                 | Supervisor-Level Has Pointer Masking Support                                                | 1.0               |
| `Sspmp`                | Supervisor Memory Protection Extension                                                      | 0.8               |
| `Ssqosid`              | Quality-of-Service Identifiers                                                              | 1.0               |
| `Ssstateen`            | Supervisor-Level State Enable Extension                                                     | 1.0               |
| `Ssstrict`             | No Non-Conforming Extensions Are Present                                                    | 1.0               |
| `Sstc`                 | Supervisor-Level Timer Comparison Extension                                                 | 1.0               |
| `Sstvala`              | Stval Provides All Needed Values                                                            |                   |
| `Sstvecd`              | Stvec Supports Direct Mode                                                                  |                   |
| `Ssu64xl`              | UXLEN=64 Must Be Supported                                                                  |                   |
| `Sv32`                 | Page-Based 32-bit Virtual-Memory Systems                                                    |                   |
| `Sv39`                 | Page-Based 39-bit Virtual-Memory Systems                                                    |                   |
| `Sv48`                 | Page-Based 48-bit Virtual-Memory Systems                                                    |                   |
| `Sv57`                 | Page-Based 57-bit Virtual-Memory Systems                                                    |                   |
| `Svade`                | Raise Exceptions on Improper A/D Bits                                                       |                   |
| `Svadu`                | Hardware Updating of PTE A/D Bits                                                           | 1.0               |
| `Svbare`               | Bare Mode Virtual-Memory Translation Supported                                              |                   |
| `Svinval`              | Fine-Grained Address-Translation Cache Invalidation                                         | 1.0               |
| `Svnapot`              | NAPOT Translation Contiguity                                                                | 1.0               |
| `Svpbmt`               | Page-Based Memory Types                                                                     | 1.0               |
| `Shcounterenw`         | Support Writeable Enables for Any Supported Counter                                         |                   |
| `Shtvala`              | Htval Provides All Needed Values                                                            |                   |
| `Shvsatpa`             | Vsatp Supports All Modes Supported by Satp                                                  |                   |
| `Shvstvala`            | Vstval Provides All Needed Values                                                           |                   |
| `Shvstvecd`            | Vstvec Supports Direct Mode                                                                 |                   |
| `Shgatpa`              | SvNNx4 Mode Supported for All Modes Supported by Satp, As Well As Bare                      |                   |
| `Sm`                   | Machine-Level Extension                                                                     | 1.12              |
| `Smaia`                | Machine-Level Advanced Interrupt Architecture Extension                                     | 1.0               |
| `Smcntrpmf`            | Cycle and Instret Privilege Mode Filtering                                                  | 1.0               |
| `Smcsrind`             | Machine-Level Indirect CSR Access                                                           | 1.0               |
| `Smepmp`               | PMP Enhancements for Memory Access and Execution Prevention on Machine Mode                 | 1.0               |
| `Smmpm`                | Machine-Level Pointer Masking                                                               | 1.0               |
| `Smnpm`                | Machine-Level Next Lower Privilege Mode Pointer Masking                                     | 1.0               |
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

1. Ensure that you specify extensions in the sequence listed in [Currently Supported Extensions](#currently-supported-extensions). Always choose one of the base integer ISAs or profiles, and place the base ISA name at the beginning of the option. An exception is the general-purpose extension `G`, which can replace the RV32I and RV64I base ISAs. Do not specify more than one base ISA and profile, as this will result in a parser error. Extensions should be added in the following order: unprivileged, privileged, additional unprivileged, and additional privileged. Extensions within the same category should adhere to the order in the corresponding table.

2. If the supported version of an extension is unspecified in the table, *DO NOT* including the version in the sequence.

3. Insert an underscore between two consecutive multi-letter extensions, i.e. additional extensions, for clarity.

4. Some extensions and privileged extensions cannot coexist; refer to [Conflict Extensions](#conflict-extensions). Avoid including conflicting extensions in the option.

Following table contains some examples of valid and invalid ISA extension combinations:

| Sequence                | Valid | Reason                                                        | Unresolved String |
|:----------------------- |:----- |:------------------------------------------------------------- |:----------------- |
| `RV64IMCZicsr_Zifencei` | Yes   |                                                               |                   |
| `RV32IAM`               | No    | Incorrect order                                               | `M`               |
| `RV32GMAF`              | No    | Incorrect order                                               | `MAF`             |
| `Zicsr`                 | No    | No base ISA                                                   | `Zicsr`           |
| `RV32IRV64IMAFC`        | No    | More than one base ISAs                                       | `RV64IMAFC`       |
| `RV64GZve64dZvl256b`    | No    | No underscore between two consecutive multi-letter extensions | `Zve64dZvl256b`   |
| `RV32EMG`               | No    | Conflict extensions (`RV32E` & `G`)                           | `G`               |
| `RV64GCVZvamo1p0`       | No    | Specify version number on an unversioned extension            | `Zvamo1p0`        |

### Add Custom Extensions with Instructions and CSRs

**Vimscript:**
```VimL
let g:riscv_asm_custom_isa = [{'name': 'Xcustom'}]
```

**Neovim Lua:**
```lua
vim.g.riscv_asm_custom_isa = {{name = 'Xcustom'}}
```

The custom ISA extensions are construct by a list of dictionaries, each representing a custom ISA extension. Each custom extension has following configuration options:

- `name`: _String_, **mandatory**. The custom extension name which starts with the letter 'X'.
- `ver`: _Float/Number_, **optional**. The version of the custom extension.
- `inst`: _List of Strings_, **optional**. Common instructions for all `XLEN`.
- `csr`: _List of Strings_, **optional**. Common CSRs for all `XLEN`.
- `inst32`: _List of Strings_, **optional**. Instructions for `XLEN=32`.
- `csr32`: _List of Strings_, **optional**. CSRs for `XLEN=32`.
- `inst64`: _List of Strings_, **optional**. Instructions for `XLEN=64`.
- `csr64`: _List of Strings_, **optional**. CSRs for `XLEN=64`.
- `inst128`: _List of Strings_, **optional**. Instructions for `XLEN=128`.
- `csr128`: _List of Strings_, **optional**. CSRs for `XLEN=128`.

#### Highlight the Custom Extensions

Like the standard extensions, you can use `g:riscv_asm_isa` to control enablement of the custom extensions, or use `g:riscv_asm_all_enable` to highlight all of the standard extensions and the custom extensions. The syntax in `g:riscv_asm_isa` should comply with the RISC-V ISA extension naming conventions:

1. The string is case insensitive.

2. The name of a custom extension should start with the letter 'X' followed by an alphabetical name and an optional version number.

3. The custom extensions must be listed after all standard extensions.

4. Like other multi-letter extensions, must be separated from other multi-letter extensions by an underscore.

5. If multiple custom extensions are listed, they should be ordered alphabetically.

If you did not specify the `ver` of a custom extension defined in `g:riscv_asm_custom_isa`, you should not list the custom extension with any version number. Following table listed some valid or invalid sequence with the two custom extensions in the [examples](#examples-of-adding-the-custom-extensions).

| Sequence                  | Valid | Reason                                                        | Unresolved String |
|:------------------------- |:----- |:------------------------------------------------------------- |:----------------- |
| `RV64GCXargle1p0_Xbargle` | Yes   |                                                               |                   |
| `RV64GCXargle1p0_Sv48`    | No    | Incorrect order (standard extensions should be prior)         | `_Sv48`           |
| `RV64GCXbargle_Xargle`    | No    | Incorrect order (violate the alphabetical order)              | `_Xargle`         |
| `RV64GCXargleXbargle`     | No    | No underscore between two consecutive multi-letter extensions | `XargleXbargle`   |
| `RV64GC_Sv48_Xbargle1p0`  | No    | Specify version number on an unversioned extension            | `_Xbargle1p0`     |

#### Examples of Adding the Custom Extensions

Vim example for adding two custom extensions, `Xangle` and `Xbargle`:

```VimL
let g:riscv_asm_custom_isa =
\ [
\     {
\         'name': 'Xargle',
\         'ver': 1.0,
\         'inst': ['inst_1', 'inst_2'],
\         'csr': ['csr_1', 'csr_2'],
\         'inst32': ['inst32_1', 'inst32_2'],
\         'csr32': ['csr32_1', 'csr32_2'],
\         'inst64': ['inst64_1', 'inst64_2'],
\         'csr64': ['csr64_1', 'csr64_2'],
\     },
\     {
\         'name': 'Xbargle',
\     },
\ ]
```
Equivalent example of Neovim Lua:

```lua
vim.g.riscv_asm_custom_isa = {
    {
        name = 'Xargle',
        ver = 1.0,
        inst = {'inst_1', 'inst_2'},
        csr = {'csr_1', 'csr_2'},
        inst32 = {'inst32_1', 'inst32_2'},
        csr32 = {'csr32_1', 'csr32_2'},
        inst64 = {'inst64_1', 'inst64_2'},
        csr64 = {'csr64_1', 'csr64_2'},
    },
    {
        name = 'Xbargle',
    },
}
```

### Display Debug Information

**Vimscript:**
```VimL
let g:riscv_asm_debug = 1
```

**Neovim Lua:**
```lua
vim.g.riscv_asm_debug = true
```


If the option is defined (set to any value), the plugin will display more information while it's parsing the value of `g:riscv_asm_isa` or the custom extensions.

## Other VIM plugins

### Tagbar
[Tagbar](https://github.com/preservim/tagbar) is a Vim plugin that provides an easy way to browse the tags of the current file and get an overview of its structure. Follow steps in [Tagbar Wiki](https://github.com/preservim/tagbar/wiki#risc-v-asm) to apply it.

## Contributing

Contributions are welcome! If you encounter issues or have suggestions for improvements, please open an issue or submit a pull request on the [riscv-asm-vim](https://github.com/henry-hsieh/riscv-asm-vim).

## License

This plugin is licensed under the [MIT License](LICENSE.md).
