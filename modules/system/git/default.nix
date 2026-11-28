{ config, lib, ... }:

let
  cfg = config.myModules.packages.git;
in

{
 
  options.myModules.packages.git.enable = lib.mkEnableOption "enable git";

  config = lib.mkIf cfg.enable {
    programs.git =
    { enable = true;

      config =
      { user =
        { name = "tofunotfound";
          email = "tofunotfound@gmail.com";
        };
        init.defaultBranch = "main";
      };
    };
  };

}
