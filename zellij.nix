{ pkgs, ... }:
{
  programs.zellij = {
    enable = true;
    settings = {
      simplified_ui = true;
      default_mode = "normal";
      default_shell = "${pkgs.nushell}/bin/nu";
      default_layout = "compact";
      pane_frames = false;
    };
  };
}


