{ config, lib, ... }:

let
  cfg = config.myHomeModules.terminal.default;
in

{

  options.myHomeModules.terminal.default = lib.mkOption
  { type = lib.types.enum [ "alacritty" "kitty" ];
    default = "null";
  };

  config = lib.mkMerge
  [ (lib.mkIf (cfg == "alacritty")
    { programs.alacritty =
      { enable = true;
      };
    })

    (lib.mkIf (cfg == "kitty")
    { programs.kitty =
      { enable = true;

        settings =
        { confirm_os_window_close = 0;

          #modify_font = "cell_height -3px";
        };
      };
    })
  ];

}
