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
                c = config.lib.stylix.colors.withHashtag;
              in

            { background = c.base00;
              statusline = c.base05;
              separator = c.base03;

              focusedWorkspace = {
                border = c.base0D;
                background = c.base02;
                text = c.base07;
              };
              activeWorkspace = {
                border = c.base03;
                background = c.base01;
                text = c.base05;
              };
              inactiveWorkspace = {
                border = c.base00;
                background = c.base00;
                text = c.base04;
              };
              urgentWorkspace = {
                border = c.base08;
                background = c.base08;
                text = c.base00;
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
