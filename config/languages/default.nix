{
  lib,
  config,
  ...
}:
{
  imports = [
    ./treesitter-nvim.nix
    ./nvim-jdtls.nix
    ./nvim-lint.nix
    # ./nvim-java.nix
  ];

  options = {
    languages.enable = lib.mkEnableOption "Enable languages module";
  };
  config = lib.mkIf config.languages.enable {
    treesitter-nvim.enable = lib.mkDefault true;
    nvim-jdtls.enable = lib.mkDefault true;
    nvim-lint.enable = lib.mkDefault true;
    # nvim-java.enable = lib.mkDefault true; # TODO: can't find the java plugin for some reason, try out building plugin from git repo
  };
}
