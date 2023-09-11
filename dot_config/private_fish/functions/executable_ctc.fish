    # saves contents of a given file to the clipboard
    function ctc
        cat (pwd)/$argv | xclip -sel clipboard
    end
