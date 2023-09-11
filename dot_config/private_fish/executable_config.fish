set fish_greeting

if status is-interactive

    # workflow aliases
    alias conf 'cd ~/.config'
    alias frc 'cd ~/.config/fish; and nvim .; and cd -'
    alias avim 'cd ~/.config/nvim; and nvim .; and cd -'
    alias pd 'tmuxinator start prompt-dress'
    alias blog 'tmuxinator start blog'
    alias alc 'tmuxinator start alc'

    # git aliases
    alias fetch 'git fetch'
    alias pull 'git pull'
    alias push 'git push'
    alias dev 'git checkout develop'
    alias gitinit 'git init; and git config user.name "Konstantin Kovar"; and git config user.email "mail@vomkonstant.in"; and git config --local core.sshCommand "ssh -i ~/.ssh/id_neugierdsnase_rsa"'

    # program aliases
    alias vim 'nvim'
    alias python 'python3'
    alias py 'python3'
    alias pip 'pip3'
    alias lg 'lazygit'

    # setting nvim as the default editor
    set -gx EDITOR (type -p nvim)

    # You must call it on initialization or listening to directory switching won't work
    load_nvm > /dev/stderr

    starship init fish | source
end

