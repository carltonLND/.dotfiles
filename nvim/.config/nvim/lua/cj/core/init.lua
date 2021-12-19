local modules = {
  "cj.core.plugins",
  "cj.core.editor",
  "cj.core.keymaps",
}

for _, mod in ipairs(modules) do
  local status_ok, _ = pcall(require, mod)
  if not status_ok then
    error(("Error loading module: %s..."):format(mod))
  end
end
