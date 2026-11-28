{ config, lib, ... }:

let
  cfg = config.myHomeModules.services.syncthing;
in

{

  options.myHomeModules.services.syncthing.enable = lib.mkEnableOption "enable syncthing";

  config = lib.mkIf cfg.enable
  { services.syncthing.enable = true;
  };

}
