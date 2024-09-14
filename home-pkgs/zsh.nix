{ ... }:
{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
		dotDir = ".config/zsh";

		shellAliases = {
			ls = "eza";
			la = "eza -la";
			ld = "eza -lD";
			lf = "eza -lf --color=always | grep -v /";
			lh = "eza -dl .* --group-directories-first";
			ll = "eza -al --group-directories-first";
			lt = "eza -al --sort=modified";
			llf = "eza -alf --color=always --sort=size | grep -v /";
		};

		initExtra = ''
			eval "$(zoxide init zsh)"
		'';
	};
}
