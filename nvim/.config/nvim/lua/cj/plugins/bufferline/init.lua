require("bufferline").setup {
  options = {
    offsets = { { filetype = "NvimTree", text = "File Explorer" } },
    separator_style = "slant",
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = false,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    diagnostics_indicator = function(_, level)
      if level == "error" then
        return " " .. ""
      end
    end,
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
