{ config, pkgs, ... }:

{
	services.dunst = {
		enable = true;
		settings = {
			global = {
				frame_color = "#CBA6F7";
				separator_color= "frame";
				offset = "13x55";
				font = "FiraCode Nerd Font 9";
			};
			urgency_low = {
				background = "#1E1E2E";
				foreground = "#CDD6F4";
			};
			urgency_normal = {
				background = "#1E1E2E";
				foreground = "#CDD6F4";
			};
			urgency_critical = {
				background = "#1E1E2E";
				foreground = "#CDD6F4";
				frame_color = "#FAB387";
			};
		};
	};
}
