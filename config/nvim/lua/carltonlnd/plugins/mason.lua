return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jayp0521/mason-null-ls.nvim",
  },
  config = function()
    local mason = require "mason"
    local mason_lspconfig = require "mason-lspconfig"
    local mason_null_ls = require "mason-null-ls"

    mason.setup { ui = { border = "rounded" } }
    mason_lspconfig.setup()
    mason_null_ls.setup()
  end,
}
