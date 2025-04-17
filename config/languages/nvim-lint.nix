{ lib, config, pkgs, ... }:
{
  options = {
    nvim-lint.enable = lib.mkEnableOption "Enable nvim-lint module";
  };
  config = lib.mkIf config.nvim-lint.enable {
    plugins.lint = {
      enable = true;
      lintersByFt = {
        c = [ "cpplint" ];
        cpp = [ "cpplint" ];
        go = [ "golangci-lint" ];
        nix = [ "statix" ];
        lua = [ "selene" ];
        python = [ "pylint" ];
        ruby = [ "ruby" ];
        terraform = [ "tflint" ];
        javascript = [ "eslint_d" ];
        javascriptreact = [ "eslint_d" ];
        typescript = [ "eslint_d" ];
        typescriptreact = [ "eslint_d" ];
        json = [ "jsonlint" ];
        java = [ "checkstyle" ];
        haskell = [ "hlint" ];
        bash = [ "shellcheck" ];
      };
    };
  };
}
