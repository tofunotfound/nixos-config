{ config, lib, ... }:

let
  cfg = config.myModules.hardware.bluetooth;
in

{

  options.myModules.hardware.bluetooth.enable = lib.mkEnableOption "enable bluetooth";

  config = lib.mkIf cfg.enable
  { hardware.bluetooth =
    { enable = true;
    };
  };

}
