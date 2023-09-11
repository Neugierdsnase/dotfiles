function git-purge-stale
    git fetch -p
    git branch -vv | awk "/: gone]/{print \$1}" | xargs git branch -D
end
