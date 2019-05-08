function fish_right_prompt -d "Write out the right prompt"
    set -l last_status $status

    function __fish_rich_right_prompt -a last_status
        if test $last_status -ne 0
            set_color --bold red
            echo -n "[$last_status] "
            set_color normal
        end

        echo (date "+%D %T")
    end

    switch "$PROMPT_MODE"
        case 1 # Simple
        case 2 # Nothing
        case '*' # Rich (default)
            __fish_rich_right_prompt $last_status
    end
end
