{ config, pkgs, inputs, ... }:

{

  networking.hostName = "wsl";

  time.timeZone = "Europe/Minsk";
  i18n.defaultLocale = "ru_RU.UTF-8";

  myModules =
  { system =
    { settings.default.enable = true;
      boot = "wsl"; #"systemd" or "wsl"
      fstrim.enable = false;
      zram.enable = false;
    };

    hardware =
    { pipewire.enable = false;
      bluetooth.enable = false;
      brightnessctl.enable = false;
    };

    network =
    { networkmanager.enable = false;
      openssh.enable = true;
    };

    desktop =
    { displayServer.xserver.i3.enable = false;
      theme.stylix.enable = true;
    };

    packages =
    { default.enable = true;
      git.enable = true;
    };
  };

  programs =
  { fish.enable = true;
    tmux.enable = true;
    steam.enable = false;
  };

}
