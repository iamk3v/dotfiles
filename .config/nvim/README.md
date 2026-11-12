# Neovim on macOS

Use Neovim 0.12. With Homebrew installed, run `xcode-select --install` if
you don't already have Apple's command-line tools, then install the tools
used by this config.

```sh
brew install stow git neovim tree-sitter-cli node go python ripgrep fd luacheck
```

From the dotfiles repo:

```sh
stow --simulate --verbose --target="$HOME" .
stow --target="$HOME" .
nvim .config/nvim/init.lua
```

Stow links the whole dotfiles repo. Back up or merge any existing files that
Stow reports as conflicts.

On first launch, Lazy downloads the plugins. Opening a file starts the
configured LSP installs. Check their progress with `:Mason`, then install
the linters and parsers you use:

```vim
:MasonInstall ruff mypy yamllint cpplint
:TSInstall bash c cpp css go html javascript json latex lua markdown python tsx typescript yaml
```

Reopen files after installing parsers. For HTML with inline scripts and styles,
install all three parsers: `html`, `javascript`, and `css`. Use
`:checkhealth vim.lsp` from a code buffer to see whether its server attached.
Lua linting uses Homebrew's Luacheck. If a stale Mason copy shadows it, run
`:MasonUninstall luacheck` and restart Neovim.

## LaTeX and Skim

```sh
brew install --cask mactex-no-gui skim
```

Open a new shell and check `command -v latexmk`. If needed, add
`/Library/TeX/texbin` to your `PATH`.

In **Skim → Settings → Sync**, select **Custom**.

- **Command** — The output of `command -v nvim`.
- **Arguments** — `--headless -c "VimtexInverseSearch %line '%file'"`

In a TeX buffer, `<Space>ll` compiles and `<Space>lv` jumps to the PDF.
Shift–Command–click in Skim jumps back to the source. For a project that
requires shell escape, set it in that project's `.latexmkrc`:

```perl
$pdflatex = 'pdflatex -shell-escape %O %S';
```

## Optional

- For icons, install `font-jetbrains-mono-nerd-font` with Homebrew and select
  it in your terminal.
- For AI completion, follow the Supermaven setup prompt.
- Install AeroSpace if you use the reload-on-save hook for `aerospace.toml`.
