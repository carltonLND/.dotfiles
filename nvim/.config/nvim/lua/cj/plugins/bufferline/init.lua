require("bufferline").setup {
  options = {
    offsets = { { filetype = "NvimTree", text = "File Explorer" } },
    separator_style = "thick",
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = false,
    diagnostics = "nvim_lsp",
  },
  highlights = {
    buffer_selected = {
      gui = "none",
    },
  },
}
