local mod = get_mod("purity-retextures")

mod.SKIN_LIST = {
    Kruber_KOTBS_armor = {
        kind = "texture",
        swap_skin = nil,
        cosmetic_key = "skin_es_knight_black_and_gold",
        skin_to_swap = {
            skin_es_knight_black_and_gold = "skin_es_knight_black_and_gold",
        },
        textures = {
            "textures/fk_purity/fk_bod_purity",
            "textures/Kruber_KOTBS_armor/Kruber_EmpireSoldier_KotBS_body_combined",
            "textures/Kruber_KOTBS_armor/Kruber_EmpireSoldier_KotBS_body_normal",
        },
        textures_fps = {
            "textures/Kruber_KOTBS_armor/Kruber_EmpireSoldier_KotBS_body_diffuse_1p",
            "textures/Kruber_KOTBS_armor/Kruber_EmpireSoldier_KotBS_body_combined_1p",
            "textures/Kruber_KOTBS_armor/Kruber_EmpireSoldier_KotBS_body_normal_1p",
        },
        new_units = {
            "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_mesh",
        },
        fps_units = {
            "units/beings/player/empire_soldier_knight/first_person_base/chr_first_person_mesh",
        },
        is_vanilla_unit = true, 
        swap_hand = "armor",
        skip_meshes = {
            skip0 = true,
            skip1 = true,
            skip2 = true,
            skip3 = true,
            skip4 = true,
            skip5 = true,
            skip6 = true,
            skip10= true,
            skip11 = true, 
            skip12 = true,
            skip13 = true,
            skip14 = true,
            skip15 = true,
            skip16 = true,
            skip17 = true,
            skip18 = true,
            skip19 = true,
            skip20 = true,
            skip21 = true,
            skip22 = true,
            skip23 = true,
            skip24 = true,
            skip25 = true,
            skip26 = true,
        },
    },
    Kruber_purity_armor = {
        kind = "texture",
        swap_skin = nil,
        cosmetic_key = "skin_es_knight_white",
        skin_to_swap = {
            skin_es_knight_white = "skin_es_knight_white",
        },
        textures = {
            "textures/fk_purity/fk_bod_purity",
        },
        textures_fps = {
    
        },
        new_units = {
            "units/beings/player/empire_soldier_knight/third_person_base/chr_third_person_mesh",
        },
        fps_units = {
            "units/beings/player/empire_soldier_knight/first_person_base/chr_first_person_mesh",
        },
        is_vanilla_unit = true, 
        swap_hand = "armor",
        skip_meshes = {
            skip0 = true,
            skip1 = true,
            skip2 = true,
            skip3 = true,
            skip4 = true,
            skip5 = true,
            skip6 = true,
            skip10= true,
            skip11 = true, 
            skip12 = true,
            skip13 = true,
            skip14 = true,
            skip15 = true,
            skip16 = true,
            skip17 = true,
            skip18 = true,
            skip19 = true,
            skip20 = true,
            skip21 = true,
            skip22 = true,
            skip23 = true,
            skip24 = true,
            skip25 = true,
            skip26 = true,
        },
    },
}

local skin_table_weapons = table.clone(WeaponSkins.skins)
local skin_table_items = table.clone(ItemMasterList, true)
local skins_to_change = {}

--these mod tables are used split up so the vmf widgets can easily group the skins by weapon type

mod.krub_armor_skins = {
	"skin_es_knight_white",
    "skin_es_knight_black_and_gold",
}

table.append(skins_to_change, mod.krub_armor_skins)

--this mod table is used for the vmf menu localization
mod.vanilla_game_strings = table.clone(skins_to_change, true)

mod.SKIN_CHANGED = {}

local pattern = "_rightHand"
-- local new_name = string.gsub(skin, pattern, "")

for _,skin in pairs(skins_to_change) do
    local unit = nil
    local new_name = string.gsub(skin, pattern, "")
    if skin_table_weapons[new_name] then
        if string.find(skin, pattern) then 
            unit = skin_table_weapons[new_name].right_hand_unit
        else 
            unit = skin_table_weapons[new_name].left_hand_unit or skin_table_weapons[new_name].right_hand_unit
        end
    elseif skin_table_items[new_name] then
        unit = skin_table_items[new_name].unit
    end
 
    
    local tisch = {
        changed_texture = false,
        changed_model = false,
        unit = unit,
        cosmetic_table = Cosmetics[new_name]
    }
    mod.SKIN_CHANGED[skin] = table.clone(tisch, true)
end

mod.has_old_texture = false

return