# my first theme
# -> »
#
# Resets foreground color
# PR_RST="%f"
# Usage:
# PS1="%F{red}This is red text %fNow back to default "
#
# cp dotfiles/oh-my-zsh-theme/anssi.zsh-theme .oh-my-zsh/themes && exec zsh 

#use extended color palette if available
if [[ $terminfo[colors] -ge 256 ]]; then
    turquoise="%F{81}"
    tangerine="%F{166}"
    orange="%F{214}"
    purple="%F{105}"
    violet="%F{135}"
    hotpink="%F{161}"
    limegreen="%F{118}"
    green="%F{078}"
    gray="%F{237}"
    blue="%F{032}"
    red="%F{red}"
    white="%F{15}"
else
    turquoise="%F{cyan}"
    tangerine="%F{yellow}"
    orange="%F{yellow}"
    purple="%F{magenta}"
    violet="%F{magenta}"
    hotpink="%F{red}"
    limegreen="%F{green}"
    green="%F{green}"
    gray="%F{white}"
    blue="%F{blue}"
    red="%F{red}"
    white="%F{white}"
fi


git_prompt_info() {
  local branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
  if [ -n "$branch" ]; then
    if [[ "$branch" == "main" ]]; then
      local color="$hotpink"  # Use predefined limegreen color
    else
      local color="$limegreen"  # Use predefined hotpink color
    fi

    echo "Git:(%{$color%}$branch%{$reset_color%})"
  fi
}



# Right-side prompt (timestamp)
RPS1='%{$white%}%T%{$reset_color%} 🐢'

# Function to dynamically update PS1
update_prompt() {
  local git_info="$(git_prompt_info)"
  local dir_display="$PWD"

  # Format ~ with purple when in home directory, otherwise color ~ separately
   if [[ "$PWD" == "$HOME" ]]; then
    dir_display="%{$hotpink%}~%{$reset_color%}"
  elif [[ "$PWD" =~ ^"$HOME"(/|$) ]]; then
    dir_display="%{$hotpink%}~%{$white%}${PWD#$HOME}%{$reset_color%}"
  else
    dir_display="%{$white%}$PWD%{$reset_color%}"
  fi

  if [ -z "$(git_current_branch)" ]; then
    PS1='%{$limegreen%}┌──%{$turquoise%}%n%{$reset_color%}@%{$green%}%m%{$reset_color%}%{$white%}['"$dir_display"'%{$white%}]
%{$limegreen%}└─»%{$reset_color%}'
  else
    PS1='%{$limegreen%}┌──%{$turquoise%}%n%{$reset_color%}@%{$green%}%m%{$reset_color%}%{$white%}['"$dir_display"'%{$white%}]-'"$git_info"'
%{$limegreen%}└─»%{$reset_color%}'
  fi
}


# Update prompt before every command
precmd_functions+=(update_prompt)
