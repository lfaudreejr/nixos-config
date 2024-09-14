{ lib, pkgs, ... }:
{
	home.packages = [
		pkgs.kitty
	];	

	programs.kitty = {
		enable = true;
		settings = {
			font_size = 18;
			font_family = "Fira Code";
			modify_font = "cell_width 90%";
			background_opacity = lib.mkForce "0.85";
		};
		keybindings = {
			"ctrl+c" = "copy_or_interrupt";
			"ctrl+v" = "paste_from_clipboard";
		};
		shellIntegration.enableZshIntegration = true;
	};
}
