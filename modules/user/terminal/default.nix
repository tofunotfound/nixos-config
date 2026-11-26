{ config, lib, ... }:

let
  cfg = config.myHomeModules.terminal;
in

{

  options.myHomeModules.terminal = lib.mkOption
  { type = lib.types.enum [ "alacritty" "kitty" ];
    default = "kitty";
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
        };
      };
    })
  ];

}
