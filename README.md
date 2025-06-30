## How to install
Dotfiles are managed by [GNU Stow](http://www.gnu.org/software/stow/).

1. Install [Homebrew](http://brew.sh/)
2. Install [GNU Stow](http://www.gnu.org/software/stow/)
3. Clone this repository
4. Run stow command

```zsh
stow . -t ~
```

### Theme
Themes are managed by [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).

1. Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
2. Move the theme `omz-conf/robbyrussel.zsh-theme` to `~/.oh-my-zsh/themes`
3. Restart terminal, and you should see the theme
