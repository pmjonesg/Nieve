{ lib, config, ... }:
{
  options = {
    neorg.enable = lib.mkEnableOption "Enable neorg module";
  };
  config = lib.mkIf config.neorg.enable {
    plugins = {
      neorg = {
        enable = true;
        settings = {
          load = {
            "core.defaults" = {};
            "core.completion" = {
              config = {
                engine = "nvim-cmp";
              };
            };
            "core.dirman" = {
              config = {
                workspaces = {
                  default = "~/notes/default";
                  work = "~/notes/work";
                };
              };
            };
          };
        };
        telescopeIntegration = {
          enable = true;
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>nn";
        action = "<Plug>Neorg<CR>";
        options = {
          desc = "Neorg";
        };
      }
    ];
  };
}
