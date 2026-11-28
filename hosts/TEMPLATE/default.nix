{ config, pkgs, inputs, ... }:

{

  users.users.nixos =
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
  home-manager.users.nixos = { config, pkgs, ... }:
  { home.username = "nixos";
    home.homeDirectory = "/home/nixos";
    home.backupFileExtension = "backup";
    home.stateVersion = "26.05";

    imports =
    [ ./home.nix
      ../../modules/user
    ];
  };

}
