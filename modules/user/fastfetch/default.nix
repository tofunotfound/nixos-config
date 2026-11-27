{ config, lib, ... }:

let
  cfg = config.myHomeModules.fastfetch;
in

{

  options.myHomeModules.fastfetch.enable = lib.mkEnableOption "enable fastfetch";

  config = lib.mkIf cfg.enable
  { programs.fastfetch =
    { enable = true;

      settings =
      { logo =
        { source = "~/098/fastfetch";
          padding.right = 0;
          width = 30;
          height = 21;
        };

        display.disableLinewrap = true;

        modules =
        [ #"title"
          #"separator"
          "os"
          "host"
          "kernel"
          "uptime"
          "packages"
          "shell"
          "display"
          #"de"
          "wm"
          "wmtheme"
          "theme"
          "icons"
          "font"
          "cursor"
          "terminal"
          "terminalfont"
          "cpu"
          "gpu"
          "memory"
          "swap"
          "disk"
          "battery"
          "poweradapter"
          "localip"
          "locale"
          #"break"
          #"colors"
        ];
      };
    };
  };

}
