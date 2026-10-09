{
  services.nginx = {
    enable = true;
    virtualHosts."hello.local" = {
      default = true;
      locations."/".extraConfig = ''
        default_type text/plain;
        return 200 "Hello world\n";
      '';
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 ];
}
