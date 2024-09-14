deploy:
	nixos-rebuild switch --flake .#my-nixos --use-remote-sudo
debug:
	nixos-rebuild switch --flake .#my-nixos --use-remote-sudo --show-trace --verbose
up:
	nix flake update

# Update specific input
# use: make upp i=home-manager
upp:
	nix flake update $(1)

history:
	nix profile history --profile /nix/var/nix/profiles/system
repl:
	nix repl -f flake:nixpkgs

# remove all package older than 7 days
clean:
	sudo nix profile wipe-history --profile /nix/var/nix/profiles/system
gc:
	sudo nix-collect-garbage --delete-old
