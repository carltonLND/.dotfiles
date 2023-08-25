return {
  "Mofiqul/vscode.nvim",
  priority = 1000,
  config = function()
    require("vscode").setup {
      transparent = true,
      italic_comments = false,
      disable_nvimtree_bg = true,
    }

    vim.cmd.colorscheme "vscode"
    vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
  end,
}
