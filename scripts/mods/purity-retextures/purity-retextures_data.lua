local mod = get_mod("purity-retextures")
mod:dofile("scripts/mods/purity-retextures/string_dict")

local menu = {
	name = "purity-retextures",
	description = "purity-retextures",
	is_togglable = false,
}

local shield_sub_choice = {
	setting_id = nil,
	type = "dropdown",
	default_value = "default",
	title = nil,
	tooltip = "choose_skin",
	options = {
		{text = "default",   value = "default"},
	},
	sub_widgets = {},
}

menu.options = {}
menu.options.widgets = {
	{
		setting_id = "armor",
		type = "dropdown",
		default_value = 1,
		title = "choose_char_armor",
		tooltip = "choose_char_armor",
		options = {
			{text = "choose_char_armor",   value = 1},
			{text = "krub",   value = 2, show_widgets = {}},
			{text = "bard",   value = 3, show_widgets = {}},
			{text = "salt",   value = 4, show_widgets = {}},
			{text = "elf",   value = 5, show_widgets = {}},
			{text = "wiz",   value = 6, show_widgets = {}},
		},
		sub_widgets = {},
	}
}

local num_skins = 0

--krub armor
for _,skin in ipairs(mod.krub_armor_skins) do
	local widget = table.clone(shield_sub_choice, true)
	widget.setting_id = skin
	widget.title = skin
	local x = 1
	for Amoury_key,skin_name  in pairs(mod.krub_armors) do
		local choice = {text = Amoury_key,   value = Amoury_key}
		table.insert(widget.options, choice)
	end
	num_skins = num_skins + 1
	table.insert(menu.options.widgets[1].options[2].show_widgets, num_skins)
	table.insert(menu.options.widgets[1].sub_widgets, widget)
end

return menu