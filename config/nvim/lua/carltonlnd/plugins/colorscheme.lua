return {
  "Mofiqul/vscode.nvim",
  priority = 1000,
  config = function()
    require("vscode").setup({
      italic_comments = false,
    })

    vim.cmd("colorscheme vscode")
    vim.cmd("hi link NormalFloat Normal")
  end
}
