{ osConfig, lib, ... }:

{

  stylix =
  { targets.firefox = lib.mkIf osConfig.myModules.theme.stylix.enable
    { profileNames = [ "default" ];
      colorTheme.enable = true;
    };

    fonts.sizes.terminal = 11;
  };

}
