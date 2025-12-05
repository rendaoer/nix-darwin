{ pkgs, ... }:
{
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    nushell
    starship
    zellij
    jujutsu
    gemini-cli

    helix
    tombi

    nodejs
    pnpm
    vtsls
    vscode-langservers-extracted
    tailwindcss-language-server
    biome

    nil
    nixpkgs-fmt

    (rust-bin.stable.latest.default.override
      {
        targets = [ "aarch64-apple-darwin" ];
        extensions = [ "rust-src" "rust-analyzer" ];
      }
    )
    cargo-watch
    cargo-generate
    cargo-expand
    cargo-sort
    cargo-edit
  ];

  imports = [
    ./alacritty.nix
    ./nushell.nix
    ./zellij.nix
    ./helix.nix
    ./jujutsu.nix
  ];
}
