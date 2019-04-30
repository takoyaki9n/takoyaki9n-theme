function fish_prompt
	function caret
		if test $USER = "root"
			echo '# '
		else
			echo '$ '
		end
	end

	function rich_prompt
		set -l reset (set_color normal)
		set -l green (set_color --bold green)
		set -l blue (set_color --bold blue)

		# current directory
		set -l directory $green(echo $PWD | sed -e "s|^$HOME|~|")$reset

		# git information
		set -g __fish_git_prompt_show_informative_status
		set -g __fish_git_prompt_showcolorhints
		set -g __fish_git_prompt_color_branch "yellow"
		set -g __fish_git_prompt_char_stateseparator ' '
		set -l git (__fish_git_prompt " %s")

		echo -s $directory $git
		echo -s $blue (caret) $reset
	end

	switch "$PROMPT_MODE"
		case 0 # Simple
			caret
		case 1 # Nothing
		case '*' # Rich (default)
			rich_prompt
	end
end
