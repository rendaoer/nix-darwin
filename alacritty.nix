{ ... }:

{
  programs.alacritty = {
    enable = true;
  };

  # 将本地的 toml 文件映射到标准路径
  xdg.configFile."alacritty/alacritty.toml".source = ./alacritty/alacritty.toml;
}
