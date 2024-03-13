{ config, pkgs, ... }:

{
	programs.kitty = {
    	enable = true;
      	theme = "Catppuccin-Mocha";
      	font = {
        	package = pkgs.nerdfonts;
        	name = "FiraCode Nerd Font";
      	};
      	settings = {
      		confirm_os_window_close = 0;
      		background_opacity = "0.8";
      		cursor = "#cba6f7";
      		cursor_blink_interval = 0;
      		mouse_hide_wait = 0;
      	};
    };
}
