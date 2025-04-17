{
  lib,
  config,
  ...
}:
{
  imports = [
    ./neorg.nix
    ./orgmode.nix
  ];

  options = {
    notes.enable = lib.mkEnableOption "Enable notes module";
  };
  config = lib.mkIf config.notes.enable {
    neorg.enable = lib.mkDefault true;
    orgmode.enable = lib.mkDefault true;
  };
}
