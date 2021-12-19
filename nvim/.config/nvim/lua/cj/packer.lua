local cmd = vim.cmd
local fn = vim.fn

local installed, packer = pcall(require, "packer")
local first_install = false

if not installed then
  local packer_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

  -- print("Cloning packer...")
  fn.delete(packer_path, "rf")
  fn.system {
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    "--depth",
    "1",
    packer_path,
  }

  cmd "packadd packer.nvim"
  installed, packer = pcall(require, "packer")

  if installed then
    first_install = true
  else
    error("Couldn't clone packer!\nPacker path: " .. packer_path)
  end
end

packer.startup {
  { ... },
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
      prompt_border = "rounded",
    },
    auto_clean = true,
    compile_on_sync = true,
    compile_path = fn.stdpath "config" .. "/lua/cj/packer_compiled.lua",
  },
}

return {
  packer = packer,
  first_install = first_install,
}
