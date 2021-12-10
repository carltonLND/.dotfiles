local g = vim.g

g.dashboard_default_executive = "telescope"
g.dashboard_session_directory = vim.fn.stdpath("data").."/sessions"

g.dashboard_custom_section = {
  find_file = {
    description = { "  Find File              <leader>ff" },
    command = "Telescope find_files",
  },
  file_explorer = {
    description = { "  File Tree              <leader>ft" },
    command = "NvimTreeToggle",
  },
  find_string = {
    description = { "  Grep String            <leader>fg" },
    command = "Telescope grep_string",
  },
  load_session = {
    description = { "缾 Load Session           <leader>sl" },
    command = "SessionLoad",
  },
}
