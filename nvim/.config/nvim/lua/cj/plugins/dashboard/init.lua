local leader = require("cj.utils").get_leader()
local dashboard = require "dashboard"

dashboard.custom_header = {
  "",
  "",
  "",
  " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
  " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
  " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
  " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
  " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
  " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
  "",
  "",
  "",
}

dashboard.custom_center = {
  {
    icon = "   ",
    desc = "Find File                   ",
    shortcut = leader .. " ff",
  },
  {
    icon = "  ",
    desc = "File Tree                   ",
    shortcut = leader .. " e",
  },
  {
    icon = "   ",
    desc = "Previous Session            ",
    shortcut = leader .. " sc",
  },
  {
    icon = "   ",
    desc = "Recent Projects             ",
    shortcut = leader .. " fp",
  },
  {
    icon = "   ",
    desc = "Edit Config                 ",
    shortcut = leader .. " f.",
  },
}
