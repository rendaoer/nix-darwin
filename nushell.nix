{ config, ... }:
{
  programs.nushell = {
    enable = true;
    settings = {
      show_banner = false;
    };
    extraConfig = ''
      use std/util "path add"
      path add "${config.home.homeDirectory}/.local/bin"
      path add "${config.home.homeDirectory}/.cargo/bin"
      path add "/opt/homebrew/bin"
      path add "/opt/homebrew/sbin"
      path add "/nix/var/nix/profiles/default/bin"
      path add "/run/current-system/sw/bin"
      path add "/etc/profiles/per-user/${config.home.username}/bin"
    '';
    shellAliases = {
      vi = "hx";
      vim = "hx";
      nano = "hx";
    };
  };
  programs.starship = {
    enable = true;
    settings = {
      battery = {
        full_symbol = "• ";
        charging_symbol = "⇡ ";
        discharging_symbol = "⇣ ";
        unknown_symbol = "❓ ";
        empty_symbol = "❗ ";
      };

      erlang = {
        symbol = "ⓔ ";
      };

      fortran = {
        symbol = "F ";
      };

      nodejs = {
        symbol = "[⬢](bold green) ";
      };

      pulumi = {
        symbol = "🧊 ";
      };

      typst = {
        symbol = "t ";
      };
    };
  };
}

