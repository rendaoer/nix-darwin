{ ... }:
{

  programs.helix = {
    enable = true;

    settings = {
      theme = "zed_onedark";

      editor = {
        line-number = "relative";
        cursorline = true;
        cursorcolumn = true;
        bufferline = "multiple";
        end-of-line-diagnostics = "hint";
        soft-wrap.enable = true;

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        lsp.display-progress-messages = true;
        lsp.display-inlay-hints = true;

        auto-save.focus-lost = true;

        inline-diagnostics.cursor-line = "warning";
        # inline-diagnostics.other-lines = "warning";
      };
    };

    languages.language-server = {
      biome = {
        command = "biome";
        args = [ "lsp-proxy" ];
      };

      vtsls = {
        command = "vtsls";
        args = [ "--stdio" ];
      };

      tailwindcss = {
        command = "tailwindcss-language-server";
        args = [ "--stdio" ];
      };

      rust-analyzer.config = {
        check.command = "clippy";
        targetDir = true;
        imports.granularity.group = "module";
        imports.granularity.enforce = true;
      };
    };

    languages.language = [
      {
        name = "typescript";
        language-servers = [ "vtsls" "biome" ];
        auto-format = true;
      }
      {
        name = "tsx";
        language-servers = [ "tailwindcss" "vtsls" "biome" ];
        auto-format = true;
      }
      {
        name = "nix";
        formatter = { command = "nixpkgs-fmt"; };
        auto-format = true;
      }
    ];
  };
}
