{ config, osConfig, lib, pkgs, ... }:

let
  cfg = config.myHomeModules;
in

{

  options.myHomeModules.i3.enable = lib.mkEnableOption "i3 settings";

  config = lib.mkIf cfg.i3.enable
  { xsession =
    { windowManager.i3 =
      { enable = true;

        config =

          let
            mod = "Mod4";
          in

        { modifier = mod;

          window.titlebar = false;

          keybindings = {};
          modes = {};

          bars =
          [{statusCommand = "${pkgs.i3blocks}/bin/i3blocks -c ~/.config/i3blocks/config";
            extraConfig = ''
              bindsym button1 nop
              #bindsym button4 nop
              #bindsym button5 nop
            '';

            colors = lib.mkIf osConfig.myModules.theme.stylix.enable
            (

              let
                cfg = config.lib.stylix.colors.withHashtag;
              in

            { background = cfg.base00;
              statusline = cfg.base05;
              separator = cfg.base03;

              focusedWorkspace = {
                border = cfg.base0D;
                background = cfg.base02;
                text = cfg.base07;
              };
              activeWorkspace = {
                border = cfg.base03;
                background = cfg.base01;
                text = cfg.base05;
              };
              inactiveWorkspace = {
                border = cfg.base00;
                background = cfg.base00;
                text = cfg.base04;
              };
              urgentWorkspace = {
                border = cfg.base08;
                background = cfg.base08;
                text = cfg.base00;
              };
            });
          }];

          startup =
          [ { command = "dex --autostart --environment i3"; notification = false; }
            { command = "setxkbmap -layout 'us,ru' -option 'grp:win_space_toggle'"; always = true; notification = false; }
            { command = "-merge ~/.Xresources"; notification = false; }
            { command = "sxhkd"; always = true; notification = false; }
          ];
        };
      };
    };
  };

}
