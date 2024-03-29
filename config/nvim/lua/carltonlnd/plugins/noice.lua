return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    notify = {
      view = "mini",
    },
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      signature = {
        auto_open = { enabled = false },
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      lsp_doc_border = true,
    },
    messages = {
      view_search = false,
    },
    views = {
      mini = {
        win_options = {
          winblend = 0,
        },
        size = {
          width = "auto",
          height = "auto",
          max_height = 3,
        },
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
}
