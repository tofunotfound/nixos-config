{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.myHomeModules;
in

{

  options.myHomeModules =
  { terminal =
    { yazi.enable = lib.mkEnableOption "enable yazi";
      btop.enable = lib.mkEnableOption "enable btop";
    };

    services =
    { warpd.enable = lib.mkEnableOption "enable warpd";
    };

    apps =
    { media.mpv.enable = lib.mkEnableOption "enable mpv";
      media.feh.enable = lib.mkEnableOption "enable feh";
      messenger.discord.enable = lib.mkEnableOption "enable discord";
      messenger.telegram.enable = lib.mkEnableOption "enable telegram cli";
    };

    tools =
    { playerctl.enable = lib.mkEnableOption "enable playerctl";
      maim.enable = lib.mkEnableOption "enable maim";
      opencode.enable = lib.mkEnableOption "enable opencode";
    };

  };

  config =
  { home.packages = lib.filter lib.isDerivation (with pkgs;
    [ (if cfg.terminal.yazi.enable then yazi else null)
      (if cfg.terminal.btop.enable then btop else null)
      (if cfg.services.warpd.enable then warpd else null)
      (if cfg.apps.media.mpv.enable then mpv else null)
      (if cfg.apps.media.feh.enable then feh else null)
      (if cfg.apps.messenger.discord.enable then discord else null)
      (if cfg.apps.messenger.telegram.enable then inputs.tele-client.packages.${pkgs.system}.default else null)
      (if cfg.tools.maim.enable then maim else null)
      (if cfg.tools.playerctl.enable then playerctl else null)
      (if cfg.tools.opencode.enable then opencode else null)
    ]);
  };

}
