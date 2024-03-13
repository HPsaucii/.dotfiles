{
  description = "HPsaucii's nixos configs";

  inputs = {
    nixpkgs = {
      url = "nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-colors = {
      url = "github:misterio77/nix-colors";
    };
    firefox-addons = {
    	url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    	inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nixpkgs, home-manager, nix-colors, firefox-addons, ...}: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./configuration.nix ];
      };
    };
    homeConfigurations = {
      holly = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [ ./home.nix ];
        extraSpecialArgs = { inherit nix-colors; inherit firefox-addons; };
      };
    };
  };
}
