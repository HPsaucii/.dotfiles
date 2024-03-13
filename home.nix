{ config, pkgs, nix-colors, firefox-addons, ... }:

{
  	imports = [
    	nix-colors.homeManagerModules.default
    	./features/bspwm.nix
    	./features/sxhkd.nix
    	./features/rofi.nix
    	./features/cursor.nix
    	./features/polybar.nix
    	./features/micro.nix
    	./features/firefox.nix
    	./features/thunderbird.nix
    	./features/hyfetch.nix
    	./features/kitty.nix
    	./features/starship.nix
    	./features/dunst.nix
  	];

  	colorScheme = nix-colors.colorSchemes.catppuccin-mocha;

  	home.username = "holly";
  	home.homeDirectory = "/home/holly";

  	home.stateVersion = "23.11";

  	home.packages = [
    	pkgs.gimp
    	pkgs.pavucontrol
    	pkgs.feh
    	pkgs.qbittorrent
    	pkgs.armcord
    	pkgs.obs-studio
    	pkgs.prismlauncher
    	pkgs.alacritty
    	pkgs.lutris
    	pkgs.git
    	pkgs.wget
    	pkgs.unzip
    	pkgs.rustup
    	# pkgs.gcc
    	pkgs.clang
    	pkgs.mold
    	pkgs.onlyoffice-bin
    	pkgs.protonmail-bridge
    	pkgs.gnome-secrets
    	pkgs.yuzuPackages.early-access
    	pkgs.protonvpn-gui
    	pkgs.networkmanagerapplet
    	pkgs.vulkan-tools
    	pkgs.jq
    	pkgs.yt-dlp
  	];

  	home.sessionVariables = {};

  	programs = {
    	home-manager.enable = true;
  	};

  	services = {
    	flameshot.enable = true;
    	picom.enable = true;
  	};

  	gtk = {
    	enable = true;
    	theme = {
      		name = "Catppuccin-Mocha-Standard-Mauve-Dark";
      		package = pkgs.catppuccin-gtk.override {
        		accents = [ "mauve" ];
        		size = "standard";
        		tweaks = [];
        		variant = "mocha";
      		};
    	};
    	cursorTheme = {
        	package = pkgs.catppuccin-cursors.mochaDark;
        	name = "Catppuccin-Mocha-Dark-Cursors";
    	};
    	iconTheme = {
    		package = pkgs.catppuccin-papirus-folders.override {
    			flavor = "mocha";
    			accent = "mauve";	
    		};
    		name = "Papirus-Dark";
    	};
    	font = {
      		package = pkgs.nerdfonts;
      		name = "firacode";
    	};
  	};

  	xdg.userDirs.enable = true;

  	nixpkgs.config.allowUnfree = true;
}
