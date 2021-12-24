local leader = require("cj.utils").get_leader()

vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_session_directory = vim.fn.stdpath "data" .. "/sessions"

vim.g.dashboard_custom_section = {
  find_file = {
    description = { ("  Find File              %s ff"):format(leader) },
    command = "Telescope find_files",
  },
  file_explorer = {
    description = { ("  File Tree              %s e "):format(leader) },
    command = "NvimTreeToggle",
  },
  find_string = {
    description = { ("  Grep String            %s fg"):format(leader) },
    command = "Telescope grep_string",
  },
  load_session = {
    description = { ("缾 Load Session           %s sl"):format(leader) },
    command = "SessionLoad",
  },
}
