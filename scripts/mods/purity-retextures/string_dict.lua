local mod = get_mod("purity-retextures")
mod:dofile("scripts/mods/purity-retextures/skin_list")

local desc_strings = {
    Kruber_purity_armor = "Purity Skin Retexture",
}

local name_strings = {}

--these mod name tables are spilt up so the keys can be used by vmf widgets
--the order of shields only matters for vmf menu and it is displayed as the reverse

mod.krub_armors = {
    Kruber_purity_armor = "Purity Skin Retexture",
}

--merges all the upbove tables together to be used for another mod table that is sent to the localization hook
for k,v in pairs(mod.krub_armors) do
    name_strings[k] = v
end

--copies the name_strings table to be used in a mod table for the vmf menu localization
mod.name_strings_id = {}
for k,v in pairs(name_strings) do
    mod.name_strings_id[k] = v
end


local desc = {}
local name = {}
-- local skin_table = table.clone(WeaponSkins.skins)
local skin_table = table.clone(ItemMasterList, true)

local pattern = "_rightHand"


for skin, data in pairs(mod.SKIN_CHANGED) do
    
    local new_name = string.gsub(skin, pattern, "")
    
    local description = skin_table[new_name].description
    local heiss = skin_table[new_name].display_name
    
    desc[description] = skin
    name[heiss] = skin
end

mod.dict = {}
mod.helper_dict = {}
for k,v in pairs(desc) do
    mod.dict[k] = table.clone(desc_strings, true)
end
for k,v in pairs(name) do
    mod.dict[k] = table.clone(name_strings, true)
end

for k,v in pairs(desc) do
    mod.helper_dict[k] = v
end
for k,v in pairs(name) do
    mod.helper_dict[k] = v
end