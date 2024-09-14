{
	description = "NixOS flake";
	
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		my-nvim.url = "github:lfaudreejr/nix-darwin-nvim";
		stylix.url = "github:danth/stylix";
	};

	outputs = { nixpkgs, home-manager, ... }@inputs: 
	let
		systemSettings = {
			system = "x86_64-linux";
			hostName = "my-nixos";
			version = "24.05";
		};
		userSettings = {
			username = "lfaudreejr";
			name = "Larry Faudree";
			theme = "uwunicorn";
		};
	in
	{
		nixosConfigurations.${systemSettings.hostName} = nixpkgs.lib.nixosSystem {
			system = systemSettings.system;
			specialArgs = { 
				inherit inputs;
				inherit systemSettings;
				inherit userSettings;
			};
			modules = [
				./configuration.nix
				./registry.nix
				home-manager.nixosModules.home-manager
				{
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.${userSettings.username} = import ./home.nix;
					home-manager.backupFileExtension = "bak";
					home-manager.extraSpecialArgs = {
						inherit inputs;
						inherit systemSettings;
						inherit userSettings;
					};
				}
			];
		};
	};
}
