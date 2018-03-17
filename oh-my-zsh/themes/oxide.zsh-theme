# Oxide theme for Oh My Zsh
#
# Author: Diki Ananta <diki1aap@gmail.com>
# Repository: https://github.com/dikiaap/dotfiles
# License: MIT

export VIRTUAL_ENV_DISABLE_PROMPT=1
function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('%F{blue}`basename $VIRTUAL_ENV`%f') '
}
PR_GIT_UPDATE=1

setopt prompt_subst

autoload -U add-zsh-hook
autoload -Uz vcs_info

# use extended color palette if available.
if [[ $terminfo[colors] -ge 256 ]]; then
    turquoise="%F{73}"
    orange="%F{179}"
    purple="%F{140}"
    red="%F{167}"
    limegreen="%F{107}"
else
    turquoise="%F{cyan}"
    orange="%F{yellow}"
    purple="%F{magenta}"
    red="%F{hotpink}"
    limegreen="%F{green}"
fi

# enable VCS systems you use.
zstyle ':vcs_info:*' enable git svn

# check-for-changes can be really slow.
# you should disable it, if you work with large repositories.
zstyle ':vcs_info:*:prompt:*' check-for-changes true

# set formats.
PR_RST="%f"
FMT_BRANCH="(%{$orange%}%b%u%c${PR_RST})"
FMT_ACTION="(%{$limegreen%}%a${PR_RST})"
FMT_UNSTAGED="%{$turquoise%} ●"
FMT_STAGED="%{$limegreen%} ✚"

zstyle ':vcs_info:*:prompt:*' unstagedstr   "${FMT_UNSTAGED}"
zstyle ':vcs_info:*:prompt:*' stagedstr     "${FMT_STAGED}"
zstyle ':vcs_info:*:prompt:*' actionformats "${FMT_BRANCH}${FMT_ACTION}"
zstyle ':vcs_info:*:prompt:*' formats       "${FMT_BRANCH}"
zstyle ':vcs_info:*:prompt:*' nvcsformats   ""

function oxide_preexec {
    case "$(history $HISTCMD)" in
        *git*)
            PR_GIT_UPDATE=1
            ;;
        *svn*)
            PR_GIT_UPDATE=1
            ;;
    esac
}
add-zsh-hook preexec oxide_preexec

function oxide_chpwd {
    PR_GIT_UPDATE=1
}
add-zsh-hook chpwd oxide_chpwd

function oxide_precmd {
    if [[ -n "$PR_GIT_UPDATE" ]] ; then
        # check for untracked files or updated submodules, since vcs_info doesn't.
        if git ls-files --other --exclude-standard 2> /dev/null | grep -q "."; then
            PR_GIT_UPDATE=1
            FMT_BRANCH="on %{$turquoise%} %b%u%c%F{red} ● ${PR_RST}"
        else
            FMT_BRANCH="on %{$turquoise%} %b%u%c${PR_RST}"
        fi
        zstyle ':vcs_info:*:prompt:*' formats "${FMT_BRANCH} "

        vcs_info 'prompt'
        PR_GIT_UPDATE=
    fi
}
add-zsh-hook precmd oxide_precmd

# Get the status of the working tree (copied and modified from git.zsh)
custom_git_prompt_status() {
  INDEX=$(git status --porcelain 2> /dev/null)
  STATUS=""
  # Non-staged
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^.M ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  fi
  # Staged
  if $(echo "$INDEX" | grep '^D  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_DELETED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^R' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_RENAMED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^M' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_MODIFIED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^A' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_ADDED$STATUS"
  fi

  if $(echo -n "$STATUS" | grep '.*' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_STATUS_PREFIX$STATUS"
  fi

  echo $STATUS
}

ZSH_THEME_GIT_STATUS_PREFIX=" "

# Staged
ZSH_THEME_GIT_PROMPT_STAGED_ADDED="%{$limegreen%}A"
ZSH_THEME_GIT_PROMPT_STAGED_MODIFIED="%{$limegreen%}M"
ZSH_THEME_GIT_PROMPT_STAGED_RENAMED="%{$limegreen%}R"
ZSH_THEME_GIT_PROMPT_STAGED_DELETED="%{$limegreen%}D"

# Unstaged
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$turquoise%}?"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$turquoise%}M"
ZSH_THEME_GIT_PROMPT_DELETED="%{$turquoise%}D"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$turquoise%}UU"

PROMPT=$'
%{$limegreen%}%~${PR_RST} $vcs_info_msg_0_$(virtualenv_info)$(custom_git_prompt_status)
%(?.%F{white}.%F{red})$%f '
