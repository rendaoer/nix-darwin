{ pkgs, ... }:
{
  imports = [
    ./alacritty.nix
    ./nushell.nix
    ./zellij.nix
    ./helix.nix
    ./jujutsu.nix
  ];

  home.stateVersion = "25.11";
  home.packages = with pkgs; [
    gemini-cli
    tombi
    nil
    nixpkgs-fmt
  ];

  home.programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
