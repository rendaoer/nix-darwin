{ pkgs, ... }:
{
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "RenDaoEr";
        email = "rendaoer@outlook.com";
      };
      ui.editor = "${pkgs.helix}/bin/hx";
      snapshot.max-new-file-size = "20MiB";
    };
  };
}
