return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`purity-retextures` mod must be lower than Vermintide Mod Framework in your launcher's load order.")

		new_mod("purity-retextures", {
			mod_script       = "scripts/mods/purity-retextures/purity-retextures",
			mod_data         = "scripts/mods/purity-retextures/purity-retextures_data",
			mod_localization = "scripts/mods/purity-retextures/purity-retextures_localization",
		})
	end,
	packages = {
		"resource_packages/purity-retextures/purity-retextures",
	},
}
