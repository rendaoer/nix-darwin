{ ... }:
{
  programs.nushell = {
    enable = true;
  };

  xdg.configFile."nushell".source = ./nushell;

  programs.starship = {
    enable = true;
  };

  # 映射配置文件
  xdg.configFile."starship.toml".source = ./starship/starship.toml;
}

