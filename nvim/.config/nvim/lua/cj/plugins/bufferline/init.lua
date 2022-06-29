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
    diagnostic_selected = {
      gui = "none",
    },
    info_selected = {
      gui = "none",
    },
    info_diagnostic_selected = {
      gui = "none",
    },
    warning_selected = {
      gui = "none",
    },
    warning_diagnostic_selected = {
      gui = "none",
    },
    error_selected = {
      gui = "none",
    },
    error_diagnostic_selected = {
      gui = "none",
    },
    duplicate_selected = {
      gui = "none",
    },
    duplicate_visible = {
      gui = "none",
    },
    duplicate = {
      gui = "none",
    },
    pick_selected = {
      gui = "none",
    },
    pick_visible = {
      gui = "none",
    },
    pick = {
      gui = "none",
    },
  },
}
