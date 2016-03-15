export LAMPREY_HOME=""

load_env () {
    if [ -d ${HOME}/.dotfiles/zsh/env.d/$1 ]; then
        for i in ${HOME}/.dotfiles/zsh/env.d/$1/*.sh; do
            source $i
        done
    fi
}

host=$(hostname)
# check whether we have a domain within the hostname
if [[ $HOSTNAME =~ \. ]]; then
    host=${HOSTNAME/.*/}
    domain=${HOSTNAME/*./}
fi

if [ -f ~/.dotfiles/zsh/env.d/init/${host}.sh ]; then
    source ~/.dotfiles/zsh/env.d/init/${host}.sh
else
    source ~/.dotfiles/zsh/env.d/init/_default.sh
fi

# if there was a domain in the hostname we overwrite it here
if [ -n "$domain" ]; then
    export DOTFILES_ENV_DOMAIN=$domain
fi

[ -n "$DOTFILES_ENV_TYPE" ] && load_env type/$DOTFILES_ENV_TYPE
[ -n "$DOTFILES_ENV_DOMAIN" ] && load_env domain/$DOTFILES_ENV_DOMAIN
[ -n "$DOTFILES_ENV_DIST" ] && load_env dist/$DOTFILES_ENV_DIST

load_env host/$host

