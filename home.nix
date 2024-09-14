{ pkgs, inputs, systemSettings, userSettings, ... }:
{
	imports = [
		./home-pkgs
	];

	home.username = userSettings.username;
	home.homeDirectory = "/home/"+userSettings.username;

	home.packages = with pkgs; [
		zip
		unzip
		p7zip
		ripgrep
		jq
		eza
		fzf
		which
		just
		zoxide
		lazygit
		devenv
		google-chrome
		brave
		bitwarden-desktop
		sesh
	] ++ [
		inputs.my-nvim.packages."x86_64-linux".nvim
	];
	
	programs.git = {
		enable = true;
		userName = userSettings.name;
		userEmail = "lfaudreejr@hotmail.com";
		extraConfig = {
			init.defaultBranch = "main";
		};
	};
	
	home.stateVersion = systemSettings.version;
	
	programs.home-manager.enable = true;
}
