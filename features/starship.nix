{ config, pkgs, ... }:

{
	programs.starship = {
		enable = true;
		settings = {
			format = "$directory\n$character";
			directory = {
				truncation_length = 0;
				truncate_to_repo = false;
				format = "[$path](bold #cba6f7)";
			};
			character = {
				success_symbol = "[󰊟](#cba6f7)";
				error_symbol = "[󰊟](#f38ba8)";
			};
		};
	};
}
