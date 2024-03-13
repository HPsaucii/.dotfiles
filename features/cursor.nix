{ pkgs, config, ... }:

{
  	home = {
  		pointerCursor = {
  			package =  pkgs.catppuccin-cursors.mochaDark;
  			name = "Catppuccin-Mocha-Dark-Cursors";
  		};
  		file.".icons/default/index.theme".text = ''
  		 	[icon theme]
  		 	Inherits=Catppuccin-Mocha-Dark-Cursors
  		 '';
  	};
}
