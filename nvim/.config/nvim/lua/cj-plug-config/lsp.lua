-- Default servers I user
local servers = { "tsserver", "pyright", "sumneko_lua" }

-- Define on_attach function for LSP servers
local function on_attach(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Keymaps
  local opts = { noremap = true, silent = true, }

  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
  buf_set_keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
end

-- Setup nvim-lsp-installer
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
  local default_opts = {
    on_attach = on_attach,
    -- capabilities = capabilities,
  }

  -- Custom server options
  local server_opts = {
    ["sumneko_lua"] = function()
      default_opts.settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          },
        },
      }
    end,
  }

  local server_options = server_opts[server.name] and server_opts[server.name]() or default_opts
  server:setup(server_options)
end)

-- Automatically install servers
for _,name in ipairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end
