set fish_greeting ""

if status is-interactive

    # workflow aliases
    alias conf 'cd ~/.config'
    alias pd 'tmuxinator start prompt-dress'
    alias dsa 'tmuxinator start dsa-gateway'
    alias bbx 'tmuxinator start bbx'
    alias paylivery 'tmuxinator start paylivery'

    alias hb '~/Projects/hemingway-bridge/target/release/hemingway-bridge'
    alias whb '~/Projects/hemingway-bridge/target/release/hemingway-bridge --write'

    # git aliases
    alias fetch 'git fetch'
    alias pull 'git pull'
    alias push 'git push'
    alias dev 'git checkout develop'

    # program aliases
    alias vim 'nvim'
    alias py 'python3'
    alias lg 'lazygit'
    alias lzd 'lazydocker'
    alias obs 'cd ~/Documents/obsidian-vault/ && nvim .'

    # setting nvim as the default editor
    set -gx EDITOR (type -p nvim)

    # adding bun to the path
    fish_add_path ~/.bun/bin

    # adding surrealdb to the path
    fish_add_path /home/konsti/.surrealdb

    # adding sdkman to the path
    fish_add_path /home/konsti/.sdkman/bin

    # adding kafka to the path
    fish_add_path /home/konsti/Software/kafka_2.13-3.8.0/bin

    # adding deno to the path
    fish_add_path /home/konsti/.deno/bin/deno

    # adding java to the path
    # note: sdkman gets initialized via https://github.com/reitzig/sdkman-for-fish
    set -gx JAVA_HOME /home/konsti/.sdkman/candidates/java/current
    fish_add_path $JAVA_HOME/bin

    # You must call it on initialization or listening to directory switching won't work
    load_nvm > /dev/stderr

    starship init fish | source
end

