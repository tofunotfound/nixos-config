{ config, lib, ... }:

let
  cfg = config.myModules;
in

{

  options.myModules =
  { network.networkmanager.enable = lib.mkEnableOption "enable nerworkmanager";
    system.fstrim.enable = lib.mkEnableOption "enable fstrim";
    system.zram.enable = lib.mkEnableOption "enable zram";
  };

  config =
  { networking.networkmanager.enable = cfg.network.networkmanager.enable;
    services.fstrim.enable = cfg.system.fstrim.enable;
    zramSwap.enable = cfg.system.zram.enable;
  };
 
}
