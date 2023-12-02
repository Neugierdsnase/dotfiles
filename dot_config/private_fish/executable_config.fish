set fish_greeting ""

if status is-interactive

    # workflow aliases
    alias conf 'cd ~/.config'
    alias pd 'tmuxinator start prompt-dress'

    # git aliases
    alias fetch 'git fetch'
    alias pull 'git pull'
    alias push 'git push'
    alias dev 'git checkout develop'

    # program aliases
    alias vim 'nvim'
    alias python 'python3'
    alias py 'python3'
    alias pip 'pip3'
    alias lg 'lazygit'

    # setting nvim as the default editor
    set -gx EDITOR (type -p nvim)

    # setting this ChatGPT API key for the nvim plugin
    set -gx OPENAI_API_KEY (cat ~/.config/openai_api_key.txt)

    # adding bun to the path
    fish_add_path ~/.bun/bin

    # adding surrealdb to the path
    fish_add_path /home/konsti/.surrealdb

    # You must call it on initialization or listening to directory switching won't work
    load_nvm > /dev/stderr

    starship init fish | source
end

