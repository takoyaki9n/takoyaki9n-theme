function switch_prompt -a mode
    set -g PROMPT_MODE $mode
    if test -z "$PROMPT_MODE" -o "0" -eq 0
        set -g PROMPT_MODE 'default'
    end
    echo "Prompt switched to $PROMPT_MODE."
end