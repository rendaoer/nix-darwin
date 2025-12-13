{
  description = "Mac Studio nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    home-manager =
      {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager }:
    let
      configuration = { pkgs, ... }: {
        system.primaryUser = "dao";

        users.users.dao = {
          name = "dao";
          home = "/Users/dao";
          uid = 501;
        };

        environment.systemPackages =
          [
            pkgs.alacritty
          ];

        fonts.packages = [
          pkgs.nerd-fonts.zed-mono
          pkgs.nerd-fonts.jetbrains-mono
        ];

        homebrew = {
          enable = true;
          onActivation = {
            cleanup = "zap";
            autoUpdate = true;
            upgrade = true;
          };
          casks = [
            "blender"
          ];
          masApps = { };
        };

        nix.settings.experimental-features = [ "nix-command" "flakes" ];

        system.defaults = { };

        system.configurationRevision = self.rev or self.dirtyRev or null;

        system.stateVersion = 6;

        nixpkgs.hostPlatform = "aarch64-darwin";
      };
    in
    {
      darwinConfigurations."Mac-Studao" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              user = "dao";
            };
          }
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "bak";
            home-manager.users.dao = import ./home.nix;
          }
        ];
      };
    };
}
