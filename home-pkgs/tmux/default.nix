{ pkgs, ... }:

{
	programs.tmux.enable = true;
	programs.tmux.mouse = true;
	programs.tmux.shell = "\${pkgs.zsh}/bin/zsh";
	programs.tmux.sensibleOnTop = true;
	programs.tmux.plugins = with pkgs; [
		tmuxPlugins.vim-tmux-navigator	
	];
	
	home.file = {
		tmux = {
			target = ".config/.tmux.conf";
			source = ./tmux.conf;
		};	
	};
}
