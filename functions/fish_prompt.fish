function fish_prompt
    function __print_caret
        if test $USER = "root"
            echo '# '
        else
            echo '$ '
        end
    end

    function __fish_rich_prompt
        set -l reset (set_color normal)
        set -l green (set_color --bold green)
        set -l blue (set_color --bold blue)
        set -l cyan (set_color --bold cyan)
        set -l magenta (set_color --bold magenta)

        # user@host
        set -l user $cyan(whoami)$reset
        set -l host $blue(hostname| cut -d . -f 1)$reset

        # current directory
        set -l directory $green(echo $PWD | sed -e "s|^$HOME|~|")$reset

        # git information
        set -g __fish_git_prompt_show_informative_status
        set -g __fish_git_prompt_showcolorhints
        set -g __fish_git_prompt_char_dirtystate '+'
        set -g __fish_git_prompt_char_invalidstate !
        set -g __fish_git_prompt_char_stagedstate '@'
        set -g __fish_git_prompt_color_branch "yellow"
        set -g __fish_git_prompt_char_stateseparator ' '
        set -l git (__fish_git_prompt " %s")

        echo -s $user '@' $host ':' $directory $git
        echo -s $magenta (__print_caret) $reset
    end

    switch "$PROMPT_MODE"
        case 'Simple'
            __print_caret
        case 'Nothing'
        case '*' # Rich (default)
            __fish_rich_prompt
    end
end
