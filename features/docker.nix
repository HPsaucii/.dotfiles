{pkgs, config, ...}:

{
	virtualisation.oci-containers = {
		backend = "docker";
		containers = {
    		startpage = {
      			image = "ghcr.io/hpsaucii/startpage:1710269466";
      			ports = [ "3000:3000" ];
    		};
  		};
  	};
}
