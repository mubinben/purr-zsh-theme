function username() {
    echo -n $FG[119]
    echo -n $USER
    echo -n $reset_color
}

function current_directory() {
    echo -n $FG[227] 
    echo -n "%B🗁 %b "

    directory=$PWD
    if [[ $directory == *$HOME* ]]; then
        directory="~${directory: ${#HOME}: ${#directory}}"
    fi

    for i in {0..${#directory}}; do
        dir=${directory: $i: 1}
        if [[ $dir = "/" ]]; then
            echo -n $FG[231]
            echo -n "/"
        elif [[ $dir = "-" ]]; then
            echo -n $FG[227]
            printf "-"
        else
            echo -n $FG[227]
            echo -n $dir
        fi
    done
    echo -n $reset_color
}

# setting git_prompt_info
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[231]on$reset_color $FG[123]"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="$reset_color $FG[196]%B*%b$reset_color"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function dollar_sign() {
    echo -n $FG[231]
    echo -n "$"
    echo -n $reset_color
}

PROMPT='
$(username) $(current_directory) $(git_prompt_info)
$(dollar_sign) '