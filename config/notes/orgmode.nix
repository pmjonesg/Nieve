{ lib, config, ... }:
{
  options = {
    orgmode.enable = lib.mkEnableOption "Enable orgmode module";
  };
  config = lib.mkIf config.orgmode.enable {

    plugins.orgmode = {
      enable = true;
      settings = {
        org_agenda_files = "~/org/**/*";
        org_default_notes_file = "~/org/refile.org";
      };
    };

    # keymaps = [
    #   {
    #     mode = "n";
    #     key = "<leader>no";
    #     action = "<cmd>Orgmode<CR>";
    #     options = {
    #       desc = "Orgmode";
    #     };
    #   }
    # ];
  };
}
