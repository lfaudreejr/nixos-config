{ lib, pkgs, userSettings, inputs, ... }:
{
	imports = [ inputs.stylix.homeManagerModules.stylix ];
	stylix.autoEnable = false;
	stylix.image = pkgs.fetchurl {
		url = "https://www.pixelstalk.net/wp-content/uploads/2016/05/Epic-Anime-Awesome-Wallpapers.jpg";
		sha256 = "enQo3wqhgf0FEPHj2coOCvo7DuZv+x5rL/WIo4qPI50=";
	};
	stylix.polarity = "dark";
	stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/uwunicorn.yaml";
	stylix.targets.gnome.enable = true;
	stylix.targets.kitty.enable = true;
}
