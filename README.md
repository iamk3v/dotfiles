# Vimtex

## Mactex
`brew install --cask mactex-no-gui`

## Skim
`brew install --cask skim`

Skim -> Preferences -> Preset: Custom
Command: `/opt/homebrew/bin/nvim`
Arguments: `--headless -c "VimtexInverseSearch %line '%file'"`
