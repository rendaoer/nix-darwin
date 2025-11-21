{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 16;
        normal = { family = "ZedMono Nerd Font"; style = "Regular"; };
        bold = { family = "ZedMono Nerd Font"; style = "Bold"; };
        italic = { family = "ZedMono Nerd Font"; style = "Italic"; };
        bold_italic = { family = "ZedMono Nerd Font"; style = "Bold Italic"; };
      };
      terminal = { shell = "${pkgs.nushell}/bin/nu"; };
      env = {
        TERM = "xterm-256color";
      };
    };
  };
}
