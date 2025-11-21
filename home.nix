{ pkgs, ... }:
{
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    helix
    nushell
    jujutsu
    starship
    zellij
    gemini-cli
    nodejs
    pnpm
    vtsls
    tailwindcss-language-server
    biome
    nil
    nixpkgs-fmt
    (rust-bin.stable.latest.default.override
      {
        extensions = [ "rust-src" "rust-analyzer" ];
      }
    )
  ];

  imports = [
    ./alacritty.nix
    ./nushell.nix
    ./zellij.nix
    ./helix.nix
    ./jujutsu.nix
  ];
}
