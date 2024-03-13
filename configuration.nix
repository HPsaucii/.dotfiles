{ config, pkgs, ... }:

{
  	imports = [ 
    	./hardware-configuration.nix
    	./features/docker.nix
  	];

	boot.loader = {
  		systemd-boot.enable = true;
  		efi.canTouchEfiVariables = true;
  	};

  	networking = {
  		hostName = "nixos";
  		networkmanager.enable = true;
  	};

  	time.timeZone = "Europe/London";

	i18n = {
  		defaultLocale = "en_GB.UTF-8";
  		extraLocaleSettings = {
    		LC_ADDRESS = "en_GB.UTF-8";
    		LC_IDENTIFICATION = "en_GB.UTF-8";
    		LC_MEASUREMENT = "en_GB.UTF-8";
    		LC_MONETARY = "en_GB.UTF-8";
    		LC_NAME = "en_GB.UTF-8";
    		LC_NUMERIC = "en_GB.UTF-8";
    		LC_PAPER = "en_GB.UTF-8";
    		LC_TELEPHONE = "en_GB.UTF-8";
    		LC_TIME = "en_GB.UTF-8";
  		};
  	};

  	console.keyMap = "uk";

  	users = {
  		defaultUserShell = pkgs.fish;
  		users.holly = {
    		isNormalUser = true;
    		description = "holly";
    		extraGroups = [ "networkmanager" "wheel" "adbusers" "docker" ];
    		packages = with pkgs; [];
  		};
  	};

  	nixpkgs.config.allowUnfree = true;

  	environment = {
		shells = with pkgs; [ fish ];
  		systemPackages = [];
  	};

	programs = {
  		dconf.enable = true;
  		adb.enable = true;
  		steam = {
  	    	enable = true;
  	    	remotePlay.openFirewall = true;
  	    	dedicatedServer.openFirewall = true;
  		};
  		fish = {
  			enable = true;
  		    interactiveShellInit = ''
  		    	set fish_greeting 
  		    	starship init fish | source
  		    	export "MICRO_TRUECOLOR=1"
  		    '';
  		  };
  	};
  	
  	security.rtkit.enable = true;

  	hardware = {
  		bluetooth = {
  			enable = true;
  			powerOnBoot = true;
  		};
  		opengl = {
  			enable = true;
  			driSupport32Bit = true;
  		};
  	};

  	virtualisation.virtualbox.host.enable = true;
  
  	xdg.portal = {
  		enable = true;
  		extraPortals = [pkgs.xdg-desktop-portal-gtk];
  		config.common.default = "*";
  	};

  	systemd.user.services.protonmail-bridge = {          
  		description = "Protonmail Bridge";          
  		enable = true;          
  		script = "${pkgs.protonmail-bridge}/bin/protonmail-bridge --noninteractive --log-level info";          
  		path = [ pkgs.gnome3.gnome-keyring ]; # HACK: https://github.com/ProtonMail/proton-bridge/issues/176          
  		wantedBy = [ "graphical-session.target" ];          
  		partOf = [ "graphical-session.target" ];
  	};

  	services = {
  		gnome.gnome-keyring.enable = true;
  		blueman.enable = true;
  		pipewire = {
    		enable = true;
    		alsa.enable = true;
    		alsa.support32Bit = true;
    		pulse.enable = true;
    		jack.enable = true;
  		};
  		xserver = {
    		enable = true;
    		windowManager.bspwm.enable = true;
    		displayManager.sddm.enable = true;
    		xkb = {
    			layout = "gb";
    			variant = "";
    		};
  		};
  	};

  	nix = {
  		gc = {
    		automatic = true;
    		dates = "weekly";
    		options = "--delete-older-than 7d";
  		};
  		settings.experimental-features = [ "nix-command" "flakes" ];
  	};

	system.stateVersion = "23.11";
}
