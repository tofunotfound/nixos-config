{ config, lib, pkgs, ... }:

let
  cfg = config.myModules;
in

{
 
  options.myModules.system.settings.default.enable = lib.mkEnableOption "default nix.settings";

  options.myModules.packages.default.enable = lib.mkEnableOption "enable default pkgs";
  options.myModules.hardware.brightnessctl.enable = lib.mkEnableOption "enable brightnessctl";

  config = lib.mkMerge
  [ (lib.mkIf cfg.packages.default.enable
    { environment.systemPackages = with pkgs;
      [ neovim
        p7zip
        btop
        git
      ];

      environment.variables.EDITOR = "nvim";
    })

    (lib.mkIf cfg.hardware.brightnessctl.enable
    { environment.systemPackages = [ pkgs.brightnessctl ];
    })

    (lib.mkIf config.myModules.system.settings.default.enable
    { nix.settings =
      { max-jobs = "auto";
        cores = 0;
        http-connections = 50;
        download-buffer-size = 536870912;

        #keep-outputs = true;
        #keep-derivations = true;

        auto-optimise-store = true;

        trusted-users = [ "root" "@wheel" ];
        fallback = true;
        connect-timeout = 5;
        log-lines = 30;
        warn-dirty = false;
      };
    })

    { documentation.nixos.enable = false;
      environment.systemPackages = [ pkgs.home-manager ];
      nix.settings.experimental-features = [ "nix-command" "flakes" ];
      nixpkgs.config.allowUnfree = true;
    }
  ];

}
