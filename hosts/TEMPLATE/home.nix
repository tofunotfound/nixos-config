{ ... }:

{

  myHomeModules =
  { desktop =
    { i3.enable = true;
      i3blocks.enable = true;
      dunst.enable = true;

      rofi =
      { enable = true;
        dpi = 200;
      };

      xresources =
      { enable = true;
        dpi = 140;
      };
    };

    terminal =
    { default = "kitty"; #"kitty" or "alacritty"
      fish.enable = true;
      nvim.enable = true;
      fastfetch.enable = true;
      yazi.enable = true;
      btop.enable = true;
    };

    services =
    { sxhkd.enable = true;
      syncthing.enable = true;
      unclutter.enable = true;
      warpd.enable = true;
    };

    apps =
    { firefox.enable = true;

      media =
      { mpv.enable = false;
        feh.enable = true;
      };

      messenger =
      { discord.enable = true;
        telegram.enable = true;
      };
    };

    tools =
    { maim.enable = true;
      playerctl.enable = true;
      opencode.enable = false;
    };
  };

}
