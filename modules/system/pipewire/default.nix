{ config, lib, ... }:

let
  cfg = config.myModules.hardware.pipewire;
in

{

  options.myModules.hardware.pipewire.enable = lib.mkEnableOption "enable pipewire";

  config = lib.mkIf cfg.enable
  { services.pipewire =
    { enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    security.rtkit.enable = true;
  };

}
