{pkgs, config, ...}:

{
	programs.thunderbird = {
		enable = true;
		profiles.hpsaucii = {
			isDefault = true;
		};
	};
}
