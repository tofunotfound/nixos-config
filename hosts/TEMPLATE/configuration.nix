{ config, pkgs, inputs, ... }:

{

  networking.hostName = "nixos";

  time.timeZone = "Europe/Minsk";
  i18n.defaultLocale = "ru_RU.UTF-8";

  myModules =
  { system =
    { settings.default.enable = true;
      boot = "systemd"; #"systemd" or "wsl"
      fstrim.enable = true;
      zram.enable = true;
    };

    hardware =
    { pipewire.enable = true;
      bluetooth.enable = true;
      brightnessctl.enable = true;
    };

    network =
    { networkmanager.enable = true;
      openssh.enable = true;
    };

    desktop =
    { displayServer.xserver.i3.enable = true;
      theme.stylix.enable = true;
    };

    packages =
    { default.enable = true;
      git.enable = false;
    };
  };

  programs =
  { fish.enable = true;
    tmux.enable = false;
    steam.enable = false;
  };

}
