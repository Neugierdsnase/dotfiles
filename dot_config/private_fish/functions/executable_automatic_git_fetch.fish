function cd
    # Use the builtin cd to actually change directories
    builtin cd $argv

    # Check for .git directory
    if test -d .git
        echo "Looks like this folder is a git repo. Fetching..."
        git fetch
    end
end
