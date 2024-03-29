return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require "null-ls"
    local helpers = require "null-ls.helpers"
    local utils = require "null-ls.utils"

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup {
      diagnostic_config = {
        virtual_text = false,
      },
      sources = {
        formatting.prettierd,
        formatting.stylua,
        diagnostics.eslint_d.with {
          cwd = helpers.cache.by_bufnr(function(params)
            return utils.root_pattern(
              ".eslintrc",
              ".eslintrc.js",
              ".eslintrc.cjs",
              ".eslintrc.yaml",
              ".eslintrc.yml",
              ".eslintrc.json"
            )(params.bufname)
          end),
        },
      },
      on_attach = function(current_client, bufnr)
        if current_client.supports_method "textDocument/formatting" then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format {
                filter = function(client)
                  return client.name == "null-ls"
                end,
                bufnr = bufnr,
              }
            end,
          })
        end
      end,
    }
  end,
}
