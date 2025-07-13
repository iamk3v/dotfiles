# Main Prompt: First line with directory and optional Git status
PROMPT=$'%{$fg_bold[green]%}┌─ %{$fg[cyan]%}%c $(git_prompt_info)\n%{$fg_bold[green]%}└➜ %{$reset_color%}'   # First line with directory
#PROMPT=$'%{$fg[cyan]%}%c $(git_prompt_info)\n%{$fg_bold[white]%}❯ %{$reset_color%}'   # First line with directory

# Git Prompt Configuration
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}\ue0a0 %{$fg_bold[magenta]%}" # Git info prefix (styled in blue and red)
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"                    # Reset after Git info
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[magenta]%} %{$fg[yellow]%}✗"      # Indicate dirty state
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[magenta]%}"                       # Indicate clean state
