{ config, lib, ... }:

let
  cfg = config.myHomeModules.terminal.fastfetch;
in

{

  options.myHomeModules.terminal.fastfetch.enable = lib.mkEnableOption "enable fastfetch";

  config = lib.mkIf cfg.enable
  { programs.fastfetch =
    { enable = true;

      settings =
      { logo =
        { source = "NixOS2";
          padding =
          { right = 1;
            left = 1;
          };
          #width = 30;
          #height = 19;
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
          #"wmtheme"
          #"theme"
          #"icons"
          #"font"
          "cursor"
          "terminal"
          #"terminalfont"
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
