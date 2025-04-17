{
  pkgs,
  ...
}:
{
  # options = {
  #   linters.enable = lib.mkEnableOption "Enable linters module";
  # };
  # config = lib.mkIf config.linters.enable {
  # };
  environment.systemPackages = with pkgs; [
    statix
  ];
}
