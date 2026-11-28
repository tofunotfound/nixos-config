{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.myModules.desktop.theme.stylix;
in

{

  options.myModules.desktop.theme.stylix.enable = lib.mkEnableOption "enable stylix";

  config = lib.mkIf cfg.enable
  { stylix =
    { enable = true;

      base16Scheme =
      { base00 = "000000";
        base01 = "0c0c0e";
        base02 = "18181c";
        base03 = "4c4c57";
        base04 = "71717a";
        base05 = "d4d4d8";
        base06 = "e4e4e7";
        base07 = "ffffff";
        base08 = "f87171";
        base09 = "fb923c";
        base0A = "facc15";
        base0B = "a78bfa";
        base0C = "22d3ee";
        base0D = "526480";
        base0E = "c084fc";
        base0F = "f472b6";
      };

      fonts =
      { monospace =
        { package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font";
        };
        sansSerif =
        { package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font";
        };
        serif =
        { package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font";
        };
        emoji =
        { package = pkgs.noto-fonts-color-emoji;
          name = "Noto Color Emoji";
        };
      };
    };
  };

}
