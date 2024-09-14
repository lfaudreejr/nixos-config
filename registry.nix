{ lib, inputs, ... }: {
	# make `nix run nixpkgs#nixpkgs use the same nixpkgs as the one used by this flake
	nix.registry.nixpkgs.flake = inputs.nixpkgs;
	nix.channel.enable = false;
	environment.etc."nix/inputs/nixpkgs".source = "${inputs.nixpkgs}";
	nix.settings.nix-path = lib.mkForce "nixpkgs=/etc/nix/inputs/nixpkgs";
}
