{ config, pkgs, inputs, ... }:

{

  users.users.tofu =
  { isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  imports =
  [ ./configuration.nix
    ./hardware-configuration.nix
    ../../modules/system
  ];

  home-manager.extraSpecialArgs = { inherit inputs; };
  home-manager.users.tofu = { config, pkgs, ... }:
  { home.username = "tofu";
    home.homeDirectory = "/home/tofu";
    home.backupFileExtension = "backup";
    home.stateVersion = "26.05";

    imports =
    [ ./home.nix
      ../../modules/user
    ];
  };

}
