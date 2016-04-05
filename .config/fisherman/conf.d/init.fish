## XDG Base Directory Specification workarounds.
if which 'ncmpcpp' > '/dev/null'
  alias ncmpcpp "ncmpcpp -c $XDG_CONFIG_HOME/ncmpcpp/config"
end

## Git
alias gpl 'git log --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s \
%Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

if which 'git' > '/dev/null'; and which 'hub' > '/dev/null'
  alias 'git' 'hub'
end

## Misc.
set fish_greeting # Goodbye welcome message!

# Have Tmux re-attach to the Tmux the main session.
function tmux
  if test $argv[1]
    /usr/bin/tmux $argv -f $XDG_CONFIG_HOME/tmux/tmux.conf
  else
    /usr/bin/tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf \
      new-session -A -s main
  end
end

eval (dircolors -c \
      $XDG_CONFIG_HOME/dircolors/dircolors.ansi-dark | sed 's/>&\/dev\/null$//')
