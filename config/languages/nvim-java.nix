{ lib, config, ... }:
{
  options = {
    nvim-java.enable = lib.mkEnableOption "Enable nvim-java module";
  };
  config = lib.mkIf config.nvim-java.enable {
    plugins = {
      java = {
        enable = false;
      };
    };
  };
}
