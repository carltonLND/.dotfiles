local mods = {
	"cj.packer_compiled",
	"cj.core",
}

for _, mod in ipairs(mods) do
	local status_ok, err = pcall(require, mod)
	if mod ~= "cj.packer_compiled" and not status_ok then
		error(("Error loading cj module: %s...\n\n%s"):format(mod, err))
	end
end
