# NVIM-Setup

A personal Lua-based Neovim IDE configuration. It is organized as a reference
setup that can be copied and adapted for your own workflow.

## Features

- Plugin management with [lazy.nvim](https://github.com/folke/lazy.nvim)
- LSP servers and development tools managed with Mason
- Completion, snippets, automatic pairs, and LSP-aware completion
- Treesitter syntax highlighting, indentation, folding, and tag support
- Telescope fuzzy finding and TODO searching
- NvimTree file exploration
- Formatting on save and manual formatting
- Automatic linting for JavaScript, TypeScript, Svelte, and Python
- Git signs, hunk actions, diffs, blame, and LazyGit integration
- Rust debugging through nvim-dap, nvim-dap-ui, and CodeLLDB
- Session saving and restoration
- Multiple color schemes with live theme switching
- Language tooling for Rust, Lua, JavaScript, TypeScript, Svelte, Python,
  PHP/Laravel, Go, Java, SQL, GraphQL, and related web technologies

## Requirements

### Required

- Neovim 0.11 or newer
- Git 2.19 or newer
- A C compiler and `make` for native plugin extensions and Treesitter parsers
- A working system clipboard provider

### Recommended

- A [Nerd Font](https://www.nerdfonts.com/) for the icons used by the UI,
  diagnostics, file explorer, and statusline
- [`fd`](https://github.com/sharkdp/fd) for Telescope file searching

### Optional language and workflow dependencies

Install these only if you use the corresponding features:

- `lazygit` for the LazyGit integration
- `vifm` for the floating terminal file manager
- Node.js and npm for JavaScript, TypeScript, Svelte, Prettier, and related
  language servers
- Python for Pyright, Black, isort, and Pylint
- Rust and Cargo for Rust Analyzer, rustfmt, and Rust projects
- Java and a Java project setup for `nvim-jdtls`
- PHP tooling for Laravel, Pint, PHPStan, and Blade formatting
- CodeLLDB for Rust debugging; install it separately through Mason with
  `:Mason`
- A GitHub Copilot subscription and authentication for Copilot suggestions

## Installation

Back up an existing Neovim configuration before installing this setup.

### Clone the repository

On macOS and Linux, Neovim reads its configuration from
`~/.config/nvim` by default:

```sh
mv ~/.config/nvim ~/.config/nvim.backup
git clone https://github.com/M4tt1-Coder/NVIM-Setup.git ~/.config/nvim
nvim
```

Alternatively, copy the following files into your existing
`~/.config/nvim/` directory:

- `init.lua`
- the `lua/` directory
- `lazy-lock.json`

On the first launch, `lua/matti/lazy.lua` automatically downloads
`lazy.nvim` when it is not already installed. lazy.nvim then installs the
configured plugins.

To synchronize plugins without opening the full editor:

```sh
nvim --headless "+Lazy! sync" +qa
```

### Test alongside an existing configuration

Use a separate `NVIM_APPNAME` so that the configuration and its data do not
interfere with your current setup:

```sh
NVIM_APPNAME=nvim-setup-test nvim
```

## Plugin Management

The plugin manager is bootstrapped in
[`lua/matti/lazy.lua`](lua/matti/lazy.lua).

The bootstrap process:

1. Checks Neovim's data directory for `lazy.nvim`.
2. Clones the stable branch if it is missing.
3. Adds lazy.nvim to Neovim's runtime path.
4. Imports plugin specifications from:
   - `matti.plugins`
   - `matti.plugins.lsp`
   - `matti.plugins.themes`
   - `matti.plugins.utils`

Individual plugin files use lazy-loading triggers such as startup status,
events, commands, filetypes, and keymaps. This keeps startup work focused on
the plugins needed for the current editing session.

Useful commands:

```vim
:Lazy
:Lazy sync
:Lazy update
:Lazy clean
```

[`lazy-lock.json`](lazy-lock.json) records the exact plugin commits used by
the setup. Keep this file under version control when reproducible plugin
installations are important.

## LSP and Language Configuration

Language-server configuration is split between:

- [`lua/matti/plugins/lsp/mason.lua`](lua/matti/plugins/lsp/mason.lua), which
  installs language servers and external tools
- [`lua/matti/plugins/lsp/lspconfig.lua`](lua/matti/plugins/lsp/lspconfig.lua),
  which configures servers and attaches buffer-local LSP keymaps
- [`lua/matti/plugins/lsp/jdtls-lsp.lua`](lua/matti/plugins/lsp/jdtls-lsp.lua),
  which loads Java support for Java buffers
- [`lua/matti/plugins/lsp/copilot.lua`](lua/matti/plugins/lsp/copilot.lua),
  which enables GitHub Copilot

### Configured language servers

Mason is configured to install:

- HTML
- CSS
- Tailwind CSS
- Svelte
- Lua
- GraphQL
- Emmet
- Prisma
- Python/Pyright
- Rust Analyzer

The lspconfig setup also ensures or configures TypeScript, Go, and SQL
servers. Lua receives Neovim-specific settings so the language server
recognizes the `vim` global. Rust Analyzer is configured with Cargo features,
Clippy checks, and procedural-macro support.

Special handlers provide additional behavior for:

- Svelte JavaScript/TypeScript file changes
- GraphQL files and frontend filetypes
- Emmet in HTML, CSS, Svelte, and React filetypes

### Mason tools

The setup asks Mason to install:

- Prettier
- StyLua
- isort
- Black
- Pylint
- ESLint daemon

Open `:Mason` to inspect installed servers and tools. Mason installs these
dependencies in Neovim's data directory; they are not installed into each
project.

## Keymaps

The leader key is **Space**. The following are the primary mappings.

### General and windows

| Mapping | Action |
| --- | --- |
| `jk` | Exit insert mode |
| `<leader>nh` | Clear search highlights |
| `<leader>+` / `<leader>-` | Increment/decrement a number |
| `<leader>sv` / `<leader>sh` | Create a vertical/horizontal split |
| `<leader>se` | Equalize split sizes |
| `<leader>sx` | Close the current split |
| `<leader>ml` / `<leader>md` / `<leader>mu` / `<leader>mr` | Move left/down/up/right between windows |
| `<leader>p` / `<leader>mn` | Previous/next window |
| `<leader>tao` / `<leader>tax` | Open/close a tab |
| `<leader>tan` / `<leader>tap` | Next/previous tab |
| `<leader>taf` | Open the current buffer in a new tab |

### Search and navigation

| Mapping | Action |
| --- | --- |
| `<leader>ff` | Find files with Telescope |
| `<leader>fr` | Find recent files |
| `<leader>fs` | Search file contents |
| `<leader>fc` | Search for the word under the cursor |
| `<leader>ft` | Search TODO comments |
| `<leader>ee` | Toggle NvimTree |
| `<leader>ef` | Reveal the current file in NvimTree |
| `<leader>ec` / `<leader>er` | Collapse/refresh NvimTree |

### LSP

| Mapping | Action |
| --- | --- |
| `gd` / `gD` | Go to definition/declaration |
| `gR` / `gi` / `gt` | References/implementations/type definitions |
| `K` | Show hover documentation |
| `<leader>ca` | Show code actions |
| `<leader>rn` | Rename the symbol |
| `<leader>d` / `<leader>D` | Show line/buffer diagnostics |
| `[d` / `]d` | Previous/next diagnostic |
| `<leader>rs` | Restart the LSP |

### Editing tools

| Mapping | Action |
| --- | --- |
| `<leader>mp` | Format the file or visual selection |
| `<leader>lf` | Format through the LSP/none-ls integration |
| `<leader>l` | Trigger linting for the current file |
| `<leader>lg` | Open LazyGit |
| `<leader>wr` / `<leader>ws` | Restore/save the current session |

### Git and debugging

| Mapping | Action |
| --- | --- |
| `[h` / `]h` | Previous/next Git hunk |
| `<leader>hs` / `<leader>hr` | Stage/reset a hunk |
| `<leader>hp` | Preview a hunk |
| `<leader>hb` / `<leader>hB` | Show/toggle line blame |
| `<leader>hd` | Show the current diff |
| `<leader>db` | Toggle a breakpoint |
| `<leader>dc` | Continue debugging |
| `<leader>dl` / `<leader>dj` / `<leader>dk` | Step into/over/out |
| `<leader>de` / `<leader>dr` | Terminate/run the last debug session |
| `<leader>du` | Toggle the DAP UI |

### Treesitter

| Mapping | Action |
| --- | --- |
| `<leader>za` / `<leader>zo` / `<leader>zc` | Toggle/open/close a fold |
| `<leader>zR` / `<leader>zM` | Open/close all folds |
| `<Ctrl-Space>` | Select the parent Treesitter node |
| `<Backspace>` in visual mode | Select the child Treesitter node |

## References

- [Neovim documentation](https://neovim.io/doc/)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), a documented
  Neovim starting configuration
- [LazyVim](https://github.com/LazyVim/LazyVim), a larger lazy.nvim-based
  Neovim framework
- [LazyVim starter](https://github.com/LazyVim/starter), a starter template
  with a clear configuration layout
- [Mason.nvim](https://github.com/mason-org/mason.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
