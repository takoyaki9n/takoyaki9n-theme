function switch_prompt -a code
    set -g PROMPT_MODE $code
    if test -z "$PROMPT_MODE"
        set -g PROMPT_MODE 'default'
    end
    echo "Prompt switched to $PROMPT_MODE."
end