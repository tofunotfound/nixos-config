{ config, lib, ... }:

let
  cfg = config.myHomeModules.desktop.xresources;
in

{

  options.myHomeModules.desktop.xresources.enable = lib.mkEnableOption "xresources settings";

  options.myHomeModules.desktop.xresources.dpi = lib.mkOption
  { type = lib.types.int;
    default = 140;
  };

  config = lib.mkIf cfg.enable
  { xresources.properties =
    { "Xft.dpi" = cfg.dpi;
    };
  };

}
