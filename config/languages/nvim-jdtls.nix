{ lib, config, ... }:
let
  # TODO: resolve paths in a better way
  javaTestPath = "/nix/store/lvsrfilcqz25mcfpcp0yz99wv048qa1k-vscode-extension-vscjava-vscode-java-test-0.40.2024011806/share/vscode/extensions/vscjava.vscode-java-test/server/com.microsoft.java.test.plugin-0.38.2.jar
 ";
in
{
  options = {
    nvim-jdtls.enable = lib.mkEnableOption "Enable nvim-jdtls module";
  };
  config = lib.mkIf config.nvim-jdtls.enable {
    plugins.nvim-jdtls = {
      enable = true;
      cmd = [
        "/nix/store/3jhhg6k2yrw9jairr00q9krdpjqfg5lj-jdt-language-server-1.31.0/bin/jdtls"
      ];
      # configuration = "/path/to/configuration";
      data = "~/.cache/jdtls/workspace";
      settings = {
        java = {
          signatureHelp = true;
          completion = true;
        };
      };
      initOptions = {
        bundles = [
          
          "/nix/store/6b18kcrq0k27yxx4ragcxpfdxnx0dck6-vscode-extension-vscjava-vscode-java-debug-0.55.2023121302/share/vscode/extensions/vscjava.vscode-java-debug/server/com.microsoft.java.debug.plugin-0.44.0.jar"
          "${javaTestPath}"
        ];
      };
    };
  };
}
#
# extraConfigLua = ''
#   local jdtls = require("jdtls")
#   local cmp_nvim_lsp = require("cmp_nvim_lsp")
#
#   local root_dir = require("jdtls.setup").find_root({ "packageInfo" }, "Config")
#   local home = os.getenv("HOME")
#   local eclipse_workspace = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
#
#   local ws_folders_jdtls = {}
#   if root_dir then
#    local file = io.open(root_dir .. "/.bemol/ws_root_folders")
#    if file then
#     for line in file:lines() do
#      table.insert(ws_folders_jdtls, "file://" .. line)
#     end
#     file:close()
#    end
#   end
#
#   -- for completions
#   local client_capabilities = vim.lsp.protocol.make_client_capabilities()
#   local capabilities = cmp_nvim_lsp.default_capabilities(client_capabilities)
#
#   local config = {
#    capabilities = capabilities,
#    cmd = {
#     "${pkgs.jdt-language-server}/bin/jdt-language-server",
#     "--jvm-arg=-javaagent:" .. home .. "/Developer/lombok.jar",
#     "-data",
#     eclipse_workspace,
#     "--add-modules=ALL-SYSTEM",
#    },
#    root_dir = root_dir,
#    init_options = {
#     workspaceFolders = ws_folders_jdtls,
#    },
#    settings = {
#      java = {
#        signatureHelp = { enabled = true},
#        completion = { enabled = true },
#      },
#    },
#    on_attach = function(client, bufnr)
#       local opts = { silent = true, buffer = bufnr }
#       vim.keymap.set('n', "<leader>lo", jdtls.organize_imports, { desc = 'Organize imports', buffer = bufnr })
#       vim.keymap.set('n', "<leader>df", jdtls.test_class, opts)
#       vim.keymap.set('n', "<leader>dn", jdtls.test_nearest_method, opts)
#       vim.keymap.set('n', '<leader>rv', jdtls.extract_variable_all, { desc = 'Extract variable', buffer = bufnr })
#       vim.keymap.set('n', '<leader>rc', jdtls.extract_constant, { desc = 'Extract constant', buffer = bufnr })
#     end
#   }
#
#   jdtls.start_or_attach(config)
# '';
