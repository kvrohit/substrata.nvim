# 🏔  Substrata

A cold, dark color scheme for Neovim written in Lua ported from [vim-substrata](https://github.com/arzg/vim-substrata) theme.

## Screenshot

<img width="1612" alt="Screenshot 2021-07-19 at 10 29 33 PM" src="https://user-images.githubusercontent.com/1040966/126198536-db58e689-f7cb-4cc7-a331-04b29c080c46.png">

## ✨ Features

- Supports the latest Neovim `0.5` features like TreeSitter and LSP
- Terminal colors inside Neovim

### Plugin Support

- [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
- [LSP Trouble](https://github.com/folke/lsp-trouble.nvim)
- [LSP Saga](https://github.com/glepnir/lspsaga.nvim)
- [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [WhichKey](https://github.com/liuchengxu/vim-which-key)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [BufferLine](https://github.com/akinsho/nvim-bufferline.lua)
- [ALE](https://github.com/dense-analysis/ale)
- [vim-sneak](https://github.com/justinmk/vim-sneak)

## ⚡️ Requirements

- Neovim >= 0.5.0

## 📦 Installation

Install the theme with your preferred package manager:

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'kvrohit/substrata.nvim'
```

[packer](https://github.com/wbthomason/packer.nvim)

```lua
use 'kvrohit/substrata.nvim'
```

## 🚀 Usage

Enable the colorscheme:

```vim
" Vim Script
colorscheme substrata
```

```lua
-- Lua
vim.cmd [[colorscheme substrata]]
```

## 👍 Credits

- The original authors of the excellent [vim-substrata](https://github.com/arzg/vim-substrata) theme.
- Lua plugin derived from [neon](https://github.com/rafamadriz/neon) and influenced by [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
