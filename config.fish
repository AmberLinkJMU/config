source /usr/share/cachyos-fish-config/cachyos-config.fish

if status is-interactive
    # oh-my-posh init fish --config ~/.cache/oh-my-posh/themes/tiwahu.omp.json | source
    set fish_greeting ""
    bind \cy accept-autosuggestion

    # Add user's private bin to PATH if it exists
	if test -d "$HOME/bin"
	    fish_add_path "$HOME/bin"
	end
	
	# Add user's private .local/bin to PATH if it exists
	if test -d "$HOME/.local/bin"
	    fish_add_path "$HOME/.local/bin"
	end

	if test -d "$HOME/.local/nvim-linux-x86_64/bin/"
	    fish_add_path "$HOME/.local/nvim-linux-x86_64/bin/"
	end

    alias n="nvim . && echo -ne '\e[5 q'"
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
