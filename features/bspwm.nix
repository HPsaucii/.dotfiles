{ pkgs, config, ... }:

{
  	xsession.windowManager.bspwm = {
    	enable = true;
    	monitors = {
      		eDP-1 = [
        		"1"
        		"2"
        		"3"
        		"4"
        		"5"
        		"6"
        		"7"
        		"8"
        		"9"
        		"10"
      		];
    	};
    	settings = {
      		border_width = 4;
      		focused_border_color = "#${config.colorScheme.colors.base0E}";
      		normal_border_color = "#${config.colorScheme.colors.base04}";
      		left_padding = 0;
      		top_padding = 43;
      		right_padding = 0;
      		bottom_padding = 0;
      		window_gap = 0;
    	};
    	extraConfig = ''
    		feh --bg-fill /home/holly/.config/bspwm/background.webp
      		xsetroot -cursor_name left_ptr
      		polybar &
      		nm-applet &
    	'';
  	};
  home.file.".config/bspwm/background.webp".source = ../resources/background.webp;
}
