function fish_right_prompt -d "Write out the right prompt"
    set -l cmd_status $status

    function __fish_rich_right_prompt -a cmd_status
        printf "\033[1A" # cursor up

        if test "$cmd_status" -ne 0
            set_color red
            echo -n "[$cmd_status] "
            set_color normal
        end

        echo (date "+%D %T")
        printf "\033[1B" # cursor down
    end

    switch "$PROMPT_MODE"
        case 1   # Simple
        case 2   # Nothing
        case '*' # Rich (default)
            __fish_rich_right_prompt "$cmd_status"
    end
end
