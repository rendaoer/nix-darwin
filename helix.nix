{ ... }:

{
  programs.helix = {
    enable = true;
  };

  # 使用相对路径引用你刚刚创建的 toml 文件
  xdg.configFile."helix/config.toml".source = ./helix/config.toml;
  xdg.configFile."helix/languages.toml".source = ./helix/languages.toml;
}
