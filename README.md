# Neovim Configuration

Personal Neovim configuration for Go, Rust, and Kotlin/Android development.

## Requirements

- Neovim 0.11+
- [lazy.nvim](https://github.com/folke/lazy.nvim) (auto-bootstrapped)
- Git, ripgrep, fd

## Language Support

### Go
- LSP: `gopls` (install via `brew install go`)
- Test runner: neotest-golang
- Snippets: `trun`, `ttest`, `iferr`, `tfunc`

### Rust
- LSP: `rust-analyzer` (install via `rustup component add rust-analyzer`)
- Test runner: neotest-rust
- Snippets: `tfunc`

### Kotlin / Android
- LSP: JetBrains `kotlin-lsp` (install via `brew install JetBrains/utils/kotlin-lsp`)
- Decompiler for library navigation: `cfr-decompiler` (install via `brew install cfr-decompiler`)
- `gd` on library imports shows the actual Kotlin source (pulled from Gradle sources JARs) and jumps to the function definition
- Snippets: `comp`, `prev`, `col`, `row`, `box`, `txt`, `btn`, `stt`, `vm`, `flow`, `vmclass`, `data`, `sealed`, `tfunc`

## Key Mappings

### General
| Key | Action |
|-----|--------|
| `<leader>ff` | Find files (including hidden) |
| `<leader>fg` | Live grep |
| `<leader>fb` | Open buffers |
| `<leader>fh` | Help tags |
| `<leader>fu` | Untracked git files |
| `<leader>ss` | Grep string |
| `<leader><Enter>` | Insert blank line below |
| `<leader><C-Enter>` | Insert blank line above |

### LSP (active in any LSP buffer)
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `<leader>gd` | Go to definition in vertical split |
| `K` | Hover docs |

### Testing (neotest)
| Key | Action |
|-----|--------|
| `<leader>tt` | Run nearest test |
| `<leader>ta` | Run all tests |
| `<leader>to` | Open test output |
| `<leader>tO` | Open test output (focus) |
| `<leader>tp` | Toggle output panel |
| `<leader>ts` | Toggle test summary |
| `<leader>tk` | Stop test run |

### Snippets (LuaSnip)
| Key | Action |
|-----|--------|
| `<C-j>` | Expand / jump forward |
| `<C-k>` | Jump backward |

### Debugging (DAP)
| Key | Action |
|-----|--------|
| `<leader>bp` | Toggle breakpoint |
| `<F1>`–`<F6>` | Step over/into/out, continue, terminate, restart |

### Harpoon
| Key | Action |
|-----|--------|
| `<leader>a` | Add file |
| `<leader>e` | Open harpoon menu |
| `<C-h/t/n/s/g/c>` | Jump to marks 1–6 |

### Git (gitsigns)
| Key | Action |
|-----|--------|
| `]h` / `[h` | Next / prev hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hb` | Blame line |

## AI (CodeCompanion)
Uses Anthropic (claude-opus-5) for both chat and inline interactions.
Configure your API key: `export ANTHROPIC_API_KEY=...`
