{ config, lib, ... }:

let
  cfg = config.myModules.network.openssh;
in

{

  options.myModules.network.openssh.enable = lib.mkEnableOption "enable openssh";

  config = lib.mkIf cfg.enable
  { services.openssh.enable = true;
  };

}
