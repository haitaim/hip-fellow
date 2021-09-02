function theme_git_prompt {
    local branchname=$(git_current_branch)
    if [[ -n $name ]]; then
        echo "$(parse_git_dirty)$(git_prompt_status)($branchname)%f: "\
            "%F{yellow}$(git_prompt_short_sha)%f"
    fi
}

# Branch name changes colour depending on branch status
ZSH_THEME_GIT_PROMPT_DIRTY='%F{red}'
ZSH_THEME_GIT_PROMPT_CLEAN='%F{green}'

# user@machine directory (branch): shortsha
# >
PS1='
%F{cyan}%n%F{magenta}@%m%f %1~ $(theme_git_prompt)
> '

RPS1='%(?..%F{red}errno:%?%f)'
