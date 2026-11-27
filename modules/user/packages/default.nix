{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.myHomeModules.packages;
in

{

  options.myHomeModules.packages = 
  { yazi.enable = lib.mkEnableOption "enable yazi";
    btop.enable = lib.mkEnableOption "enable btop";
    playerctl.enable = lib.mkEnableOption "enable playerctl";
    mpv.enable = lib.mkEnableOption "enable mpv";
    maim.enable = lib.mkEnableOption "enable maim";
    warpd.enable = lib.mkEnableOption "enable warpd";
    opencode.enable = lib.mkEnableOption "enable opencode";
    discord.enable = lib.mkEnableOption "enable discord";
    tele.enable = lib.mkEnableOption "enable telegram cli";
  };

  config =
  { home.packages = lib.filter lib.isDerivation (with pkgs;
    [ (if cfg.yazi.enable then yazi else null)
      (if cfg.btop.enable then btop else null)
      (if cfg.playerctl.enable then playerctl else null)
      (if cfg.mpv.enable then mpv else null)
      (if cfg.maim.enable then maim else null)
      (if cfg.warpd.enable then warpd else null)
      (if cfg.opencode.enable then opencode else null)
      (if cfg.discord.enable then discord else null)
      (if cfg.tele.enable then inputs.tele-client.packages.${pkgs.system}.default else null)
    ]);
  };

}
