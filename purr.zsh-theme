lime_color=$FG[120]
yellow_color=$FG[228]
white_color=$FG[231]
sky_color=$FG[123]
red_color=$FG[196]

user="${lime_color}${USER}${reset_color}"

function current_directory() {
    local dir=$PWD
    local -i len_dir=${#dir}
    
    if [[ $dir == *"$HOME"* ]]; then
        local -i len_home=${#HOME}
        dir="~${dir: len_home: len_dir}"
    fi
    
    for index in {0..$len_dir}; do
        local char=${dir: $index: 1}

        if [[ $char == "/" ]]; then
            echo -n "${white_color}/"
        else
            printf "%s%s" "${yellow_color}" "${char}"
        fi
    done

    echo -n "${reset_color}"
}

ZSH_THEME_GIT_PROMPT_PREFIX="${white_color}:${reset_color} ${sky_color}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${reset_color}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="${reset_color} ${red_color}*${reset_color}"

command_symbol="${white_color}%B\$${reset_color}"

PROMPT='
${user} $(current_directory) $(git_prompt_info)
${command_symbol} '