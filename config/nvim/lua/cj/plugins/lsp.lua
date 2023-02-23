local function lspsaga_maps()
  vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
  vim.keymap.set({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
  vim.keymap.set("n", "gr", "<cmd>Lspsaga rename ++project<CR>")
  vim.keymap.set("n","gd", "<cmd>Lspsaga goto_definition<CR>")
  vim.keymap.set("n","gt", "<cmd>Lspsaga goto_type_definition<CR>")
  vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>")
  vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
  vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")
  vim.keymap.set("n", "[D", function()
    require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end)
  vim.keymap.set("n", "]D", function()
    require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
  end)
  vim.keymap.set("n","<leader>o", "<cmd>Lspsaga outline<CR>")
  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc ++quiet<CR>")
  vim.keymap.set({"n", "t"}, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
end

local function lua_lsp_setup()
  require("lspconfig").lua_ls.setup {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" }
        },
        telemetry = {
          enable = false,
        },
      }
    }
  }
end

local function lsp_config()
  local mason_lspconfig = require("mason-lspconfig")
  mason_lspconfig.setup()
  mason_lspconfig.setup_handlers({
    function (server_name)
      require("lspconfig")[server_name].setup {}
    end,
    ["lua_ls"] = lua_lsp_setup
  })
end

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require('lspconfig.ui.windows').default_options.border = "rounded"
    end,
    dependencies = {"glepnir/lspsaga.nvim", "williamboman/mason.nvim"}
  },
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    init = lspsaga_maps,
    config = true,
    dependencies = {"nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter"}
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({ ui = { border = "rounded" } })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = lsp_config,
    dependencies = {"williamboman/mason.nvim", "neovim/nvim-lspconfig"}
  },
}
