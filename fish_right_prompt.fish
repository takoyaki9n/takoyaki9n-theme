function fish_right_prompt -d "Write out the right prompt"
	set -l last_status $status

	function rich_prompt -a last_status
		if test $last_status -ne 0
			set_color --bold red
			echo -ns $last_status '✗'
			set_color normal
		end

		echo -ns (date "+%D %T")
	end

	switch "$PROMPT_MODE"
		case 0 # Simple
		case 1 # Nothing
		case '*' # Rich (default)
			rich_prompt $last_status
	end
end
