#Git shortcuts
alias ..='cd ..'
alias g='git'

#Auto-launches ssh-agent on Git for Windows
env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

choose_identity () {
    PS3='Choose an identity to load: '
    options=("github_m-coding" "github_kermit" "github_fozzie" "gitlab_misspiggy" "gitlab_gonzo" "bitbucket_pepe" "Remove all loaded identies" "Quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "github_m-coding")
                ssh-add ~/.ssh/github_m-coding
                break
                ;;
            "github_kermit")
                ssh-add ~/.ssh/github_kermit
                break
                ;;
            "github_fozzie")
                ssh-add ~/.ssh/github_fozzie
                break
                ;;
            "gitlab_misspiggy")
                ssh-add ~/.ssh/gitlab_misspiggy
                break
                ;;
            "gitlab_gonzo")
                ssh-add ~/.ssh/gitlab_gonzo
                break
                ;;
            "bitbucket_pepe")
                ssh-add ~/.ssh/bitbucket_pepe
                break
                ;;
            "Remove all loaded identies")
                ssh-add -D
                break
                ;;
            "Quit")
                break
                ;;
            *) echo "invalid option";;
        esac
    done
}

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

agent_load_env

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    choose_identity
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    choose_identity
fi

unset env