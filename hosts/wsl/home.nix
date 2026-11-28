{ ... }:

{

  myHomeModules =
  { desktop =
    { i3.enable = false;
      i3blocks.enable = false;
      dunst.enable = false;
      rofi.enable = false;
      xresources.enable = false;
    };

    terminal =
    { default = "null"; #"kitty" or "alacritty"
      fish.enable = true;
      nvim.enable = true;
      fastfetch.enable = true;
      yazi.enable = true;
      btop.enable = true;
    };

    services =
    { sxhkd.enable = false;
      syncthing.enable = false;
      unclutter.enable = false;
      warpd.enable = false;
    };

    apps =
    { firefox.enable = false;

      media =
      { mpv.enable = false;
        feh.enable = false;
      };

      messenger =
      { discord.enable = false;
        telegram.enable = false;
      };
    };

    tools =
    { maim.enable = false;
      playerctl.enable = false;
      opencode.enable = false;
    };
  };

}
