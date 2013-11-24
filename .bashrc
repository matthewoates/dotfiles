#[ -n "$PS1" ] && source ~/.bash_profile
if [ -n "$PS1" ]; then
    source ~/.bash_profile
    if [ -f ~/.bash_profile_private ]; then
        source ~/.bash_profile_private
    fi
fi
