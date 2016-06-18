# enables color in the terminal bash shell
export CLICOLOR='true'

# sets up the color scheme for list

# a -> black        A -> bold black, usually shows up as dark grey  
# b -> red          B -> bold red
# c -> green        C -> bold green
# d -> brown        D -> bold brown, usually shows up as yellow
# e -> blue         E -> bold blue
# f -> magenta      F -> bold magenta
# g -> cyan         G -> bold cyan
# h -> light grey   H -> bold light grey, looks like bright white
# x -> default foreground or background

# 1. directory      7. character special
# 2. symbolic link  8. executable with setuid bit set
# 3. socket         9. executable with setgid bit set
# 4. pipe           10. directory writable to others, with sticky bit
# 5. executable     11. directory writable to others, without sticky bit
# 6. block special

export LSCOLORS="Exfxcxdxcxegedabagacad"

# sets up the prompt color (currently a green similar to linux terminal)
export PS1="\[\033[m\][\[\033[1;36m\]\u\[\033[1;37m\]@\[\033[0;36m\]\h\[\033[37m\]]\[\033[1;32m\]\w\[\033[1;33m#\[\033[0m " 

# enables color for iTerm
export TERM=xterm-256color

# Set alias forms
alias la='ls -al'
