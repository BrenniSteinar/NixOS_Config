{
  config,
  lib,
  pkgs,
  hostname,
  ...
}: let
  inherit (import ../../hosts/${hostname}/options.nix) distrobox;
in
  lib.mkIf (distrobox == true) {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
    environment.systemPackages = [pkgs.distrobox];
  }
