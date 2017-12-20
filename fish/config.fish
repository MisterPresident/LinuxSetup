set -g theme_display_user yes
set -g theme_hide_hostname no
set -g default_user raabls
set -g fish_prompt_pwd_dir_length 0
set -g case_insensitive
fish_vi_key_bindings

function fish_greeting
  archey3 
end

alias meld="env GTK_THEME=adwaita meld"
alias l="ls -la"

export TERMINAL="terminator"
export EDITOR="vim"

# Start X at login
if status --is-login
  # set PATH $PATH /usr/bin /sbin
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx --keeptty
  end
end
