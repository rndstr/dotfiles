ps_scm_f() {
    local s=
    if [[ "$NO_VCS_PROMPT" ]]; then
        return
    fi
    if [[ -d ".svn" ]] ; then
        local info= r= url= repo=?
        #info=$(svn info)
        #r=$(echo -e "$info" | sed -n -e '/Revision: \([0-9]*\).*/s//\1/p' )
        #url=$(echo -e "$info" | sed -n -e '/URL: \(.*\)/ s//\1/p')

        # get topmost .svn path
        rootdir=$PWD
        while [ -d $(dirname $rootdir)/.svn ]; do
            rootdir=$(dirname $rootdir)
        done

        info=$(cat $rootdir/.svn/entries)
        r=$(echo -e "$info" | head -n 11 | tail -n 1)
        url=$(echo -e "$info" | head -n 5 | tail -n 1)

        if [[ $url = *trunk* ]]; then
            repo=trunk
        elif [[ $url = *branches* ]]; then
            url=${url##*branches/}
            url=${url%%/*}
            repo=%$url
        elif [[ $url = *tags* ]]; then
            url=${url##*tags/}
            url=${url%%/*}
            repo=+$url
        fi

        #s="r$r$(svn status | grep -q -v '^?' && echo -n "*" )@$repo"
        s="r$r@$repo"
    else
        local d=$(git rev-parse --git-dir 2>/dev/null ) b= r= a=
        if [[ -n "${d}" ]] ; then
            if [[ -d "${d}/../.dotest" ]] ; then
                if [[ -f "${d}/../.dotest/rebase" ]] ; then
                    r="rebase"
                elif [[ -f "${d}/../.dotest/applying" ]] ; then
                    r="am"
                else
                    r="???"
                fi
                b=$(git symbolic-ref HEAD 2>/dev/null )
            elif [[ -f "${d}/.dotest-merge/interactive" ]] ; then
                r="rebase-i"
                b=$(<${d}/.dotest-merge/head-name)
            elif [[ -d "${d}/../.dotest-merge" ]] ; then
                r="rebase-m"
                b=$(<${d}/.dotest-merge/head-name)
            elif [[ -f "${d}/MERGE_HEAD" ]] ; then
                r="merge"
                b=$(git symbolic-ref HEAD 2>/dev/null )
            elif [[ -f "${d}/BISECT_LOG" ]] ; then
                r="bisect"
                b=$(git symbolic-ref HEAD 2>/dev/null )"???"
            else
                r=""
                b=$(git symbolic-ref HEAD 2>/dev/null )
            fi

            if git status | grep -q '^# Changed but not updated:' ; then
                a="${a}*"
            fi

            if git status | grep -q '^# Changes to be committed:' ; then
                a="${a}+"
            fi

            if git status | grep -q '^# Untracked files:' ; then
                a="${a}?"
            fi

            b=${b#refs/heads/}
            b=${b// }
            [[ -n "${r}${b}${a}" ]] && s="${r:+${r}:}${b}${a:+${a}}"
        fi
    fi
    s="${s}${ACTIVE_COMPILER}"
    s="${s:+${s}}"
    echo -n "$s"
}

function set_prompt() {
# If not running interactively, don't do anything
    if [ ! -z "$PS1" ]; then

        black="\[\033[0;30m\]"
        blue="\[\033[0;34m\]"
        green="\[\033[0;32m\]"
        cyan="\[\033[0;36m\]"
        red="\[\033[0;31m\]"
        purple="\[\033[0;35m\]"
        brown="\[\033[0;33m\]"
        light_gray="\[\033[0;37m\]"
        dark_gray="\[\033[1;30m\]"
        light_blue="\[\033[1;34m\]"
        light_green="\[\033[1;32m\]"
        light_cyan="\[\033[1;36m\]"
        light_red="\[\033[1;31m\]"
        light_purple="\[\033[1;35m\]"
        yellow="\[\033[1;33m\]"
        white="\[\033[1;37m\]"
        no_color="\[\033[0m\]"

        hostname_color="$white"
        suffix_count=1
        suffix=""

        if [ $UID -eq 0 ]; then
            user_color="$light_red"
        else
            user_color="$light_green"
        fi

        if [ -n "$PROMPT_HOSTNAME_COLOR" ]; then
            printf -v hostname_color '\[\033[%s\]' $PROMPT_HOSTNAME_COLOR
        fi
        if [ -n "$PROMPT_SUFFIX_COUNT" ]; then
            suffix_count=$PROMPT_SUFFIX_COUNT
        fi

        for ((i=1; i<=$suffix_count; i++)); do suffix="${suffix}>"; done;


        scm=$(ps_scm_f)
        if [ -n "$scm" ]; then
            scm="${brown}$scm:"
        fi
        PS1="${no_color}\u${hostname_color}\H${no_color}${user_color}<${scm}${no_color}\W${user_color}${suffix} ${no_color}"
        PS2='\[\e[00;33m\]>\[\e[0m\] '
        PS3='> ' # PS3 doesn't get expanded like 1, 2 and 4
        PS4='\[\e[01;31m\]+\[\e[0m\]'
    fi
}

export PROMPT_COMMAND=set_prompt

