function switch_prompt -a mode -d "switch prompt"
    set -l modes 'Rich' 'Simple' 'Nothing'
    if contains $mode $modes
        set -g PROMPT_MODE $mode
    else
        set -g PROMPT_MODE 'Rich'
    end
    echo "Prompt switched to $PROMPT_MODE."
end