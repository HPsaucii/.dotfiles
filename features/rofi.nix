{pkgs, config, ...}:

{
  	programs.rofi = {
    	enable = true;
    	theme = let inherit (config.lib.formats.rasi) mkLiteral; in {
    		"*" = {
        		background-color = mkLiteral "rgba ( 0, 0, 0, 0 % )";
    		};
    		"window" = {
    			background-color = mkLiteral "#${config.colorScheme.colors.base01}";
    		   	border = 3;
    		    border-color = mkLiteral "#${config.colorScheme.colors.base0E}";
    		    padding = 5;
    		};
    		"mainbox" = {
    			border = 0;
    		    padding = 0;
    		};
    		"message" = {
    			border = mkLiteral "2px 0px 0px";
    		     border-color = mkLiteral "#${config.colorScheme.colors.base0E}";
    		     padding = mkLiteral "1px";
    		};
    		"textbox" = {
    		    text-color = mkLiteral "#${config.colorScheme.colors.base05}";
    		};
    		"listview" = {
    			fixed-height = 0;
    		    border = mkLiteral "3px 0px 0px";
    		    border-color = mkLiteral "#${config.colorScheme.colors.base0E}";
    		    spacing = mkLiteral "5px";
    		    scrollbar = false;
    		    padding = mkLiteral "2px 0px 0px";
    		};
    		"element" = {
    			border = 0;
    		    padding = mkLiteral "1px";
    		};
    		"element-text" = {
    		    text-color = mkLiteral "inherit";
    		};
    		"element.normal.normal" = {
    			background-color = mkLiteral "#${config.colorScheme.colors.base00}";
    		    text-color = mkLiteral "#${config.colorScheme.colors.base05}";
    		};
    		"element.selected.normal" = {
    		    background-color = mkLiteral "#${config.colorScheme.colors.base0E}";
    		    text-color = mkLiteral "#${config.colorScheme.colors.base00}";
    		};
    		"element.alternate.normal" = {
    		    background-color = mkLiteral "#${config.colorScheme.colors.base00}";
    		    text-color = mkLiteral "#${config.colorScheme.colors.base05}";
    		};
    		"scrollbar" = {
    		    width = mkLiteral "4px";
    		    border = 0;
    		    handle-width = mkLiteral "8px";
    		    padding = 0;
    		};
    		"mode-switcher" = {
    		    border = mkLiteral "2px 0px 0px";
    		    border-color = mkLiteral "#${config.colorScheme.colors.base0E}";
    		};
    		"button.selected" = {
    		    background-color = mkLiteral "#${config.colorScheme.colors.base0E}";
    		    text-color = mkLiteral "#${config.colorScheme.colors.base0E}";
    		};
    		"inputbar" = {
    		    spacing = 0;
    		    text-color = mkLiteral "#${config.colorScheme.colors.base05}";
    		    padding = mkLiteral "1px";
    		};
    		"case-indicator" = {
    		    spacing = 0;
    		    text-color = mkLiteral "#${config.colorScheme.colors.base0E}";
    		};
    		"entry" = {
    		    spacing = 0;
    		    text-color = mkLiteral "#${config.colorScheme.colors.base05}";
    		};
    		"prompt" = {
    			spacing = 0;
    		    text-color = mkLiteral "#${config.colorScheme.colors.base05}";
    		};
    		"inputbar" = {
    		    children = map mkLiteral [ "textbox-prompt-colon" "entry" "case-indicator" ];
    		};
    		"textbox-prompt-colon" = {
    			expand = false;
    		    str = "~>";
    		    margin = mkLiteral "0px 0.3em 0em 0em";
    		    text-color = mkLiteral "#${config.colorScheme.colors.base0E}";
    		};
    	};
  	};
}
