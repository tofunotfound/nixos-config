{ config, lib, ... }:

let
  cfg = config.myHomeModules.terminal.fish;
in

{

  options.myHomeModules.terminal.fish.enable = lib.mkEnableOption "enable fish";

  config = lib.mkIf cfg.enable
  { programs.fish =
    { enable = true;

      interactiveShellInit = "set fish_greeting";
    };
  };

}
