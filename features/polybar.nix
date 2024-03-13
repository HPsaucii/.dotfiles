{ pkgs, config, ... }:

{
  	services.polybar = {
    	enable = true;
    	package = pkgs.polybar.override {
      		pulseSupport = true;
    	};
    	script = "polybar";
    	settings = {
      		"bar/example" = {
        		width = "100%";
        		height = "25pt";
        		background = "#${config.colorScheme.colors.base01}";
        		foreground = "#${config.colorScheme.colors.base06}";
        		line-size = "3pt";
        		border-size = "4pt";
        		border-color = "#00000000";
        		padding-left = "0";
        		padding-right = "1";
        		module-margin = "1";
        		separator = "|";
        		separator-foreground = "#${config.colorScheme.colors.base01}";
        		font-0 = "FiraCode Nerd Font;2";
        		modules-left = "xworkspaces xwindow";
        		modules-right = "screenshot pulseaudio memory cpu wireless wired battery date";
        		cursor-click = "pointer";
        		cursor-scroll = "pointer";
        		wm-restack = "bspwm";
        		enable-ipc = "true";
      		};
      
      		"module/xworkspaces" = {
        		type = "internal/xworkspaces";

        		label-active = "%name%";
        		label-active-foreground = "#${config.colorScheme.colors.base00}";
        		label-active-background = "#${config.colorScheme.colors.base0E}";
        		label-active-padding = "1";

        		label-occupied = "%name%";
        		label-occupied-foreground = "#${config.colorScheme.colors.base05}";
        		label-occupied-padding = "1";

        		label-urgent = "%name%";
        		label-urgent-background = "#${config.colorScheme.colors.base01}";
        		label-urgent-padding = "1";

        		label-empty = "%name%";
        		label-empty-foreground = "#${config.colorScheme.colors.base04}";
        		label-empty-padding = "1";
      		};
        
      		"module/xwindow" = {
        		type = "internal/xwindow";
        		label = "%title:0:60:...%";
      		};

      		"module/screenshot" = {
        		type = "custom/script";
        		exec = "echo \"󰹑\"";
        		click-left = "~/.config/polybar/scripts/screenshot.sh";
      		};

      		"module/pulseaudio" = {
        		type = "internal/pulseaudio";
        		use-ui-max = "false";
        		interval = "5";
        		reverse-scroll = "false";
        		format-volume = "<ramp-volume> <label-volume>";
        		label-muted = "󰝟 %percentage%%";
        		ramp-volume-0 = "󰕿";
        		ramp-volume-1 = "󰖀";
        		ramp-volume-2 = "󰕾";
        		click-right = "pavucontrol";
      		};
      		
      		"module/memory" = {
        		type = "internal/memory";
        		interval = "2";
        		format-prefix = "󰄨 ";
        		format-prefix-foreground = "#${config.colorScheme.colors.base06}";
        		label = "%percentage_used:2%%";
      		};

      		"module/cpu" = {
        		type = "internal/cpu";
        		interval = "2";
        		format-prefix = "󱄅 ";
        		format-prefix-foreground = "#${config.colorScheme.colors.base06}";
        		label = "%percentage:2%%";
      		};

      		"module/network" = {
        		type = "internal/network";
        		interval = "5";
        		format-connected = "<label-connected>";
        		format-disconnected = "<label-disconnected>";
        		# label-disconnected = "󰲛";
        		unknown-as-up = "true";
      		};

      		"module/wireless" = {
				type = "internal/network";
        		interface-type = "wireless";
        		format-connected = "<label-connected>";
        		format-disconnected = "<label-disconnected>";
        		label-connected = "󰖩";
        		unknown-as-up = "true";
      		};

      		"module/wired" = {
      			type = "internal/network";
        		"inherit" = "module/network";
        		interface-type = "wired";
        		format-connected = "<label-connected>";
        		format-disconnected = "<label-disconnected>";
        		label-connected = "󰈀";
        		unknown-as-up = "true";
      		};

      		"module/battery" = {
        		type = "internal/battery";
        		full-at = "99";
        		low-at = "10";
        		battery = "BAT1";
        		time-format = "%H:%M";
        		format-charging = "󱐋<ramp-capacity> <label-charging>";
        		format-discharging = "<ramp-capacity> <label-discharging>";
        		label-charging = "%percentage%%";
        		label-discharging = "%percentage%%";
        		label-full = "󰁹 %percentage%%";
        		ramp-capacity-0 = "󰂎";
        		ramp-capacity-1 = "󰁻";
        		ramp-capacity-2 = "󰁽";
        		ramp-capacity-3 = "󰁿";
        		ramp-capacity-4 = "󰂁";
        		ramp-capacity-5 = "󰁹";
        		bar-capacity-width = "10";
      		};

      		"module/date" = {
        		type = "internal/date";
        		interval = "1";
        		date = "%H:%M";
        		date-alt = "%d-%m-%Y %H:%M:%S";
        		label = "%date%";
        		label-foreground = "#${config.colorScheme.colors.base06}";
        		screenchange-reload = "true";
        		pseudo-transparency = "true";
      		};
    	};
  	};

  	home.file.".config/polybar/scripts/screenshot.sh" = {
    	executable = true;
    	text = ''
      		#!/usr/bin/env bash
      		flameshot gui
    	'';
  	};
}
