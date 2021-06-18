--damit waffen entnommen werden - todo für mich: alle querverweise checken
Config = {
	Weapon = 'WEAPON_COMBATPDW',
	RemoveWeapon = true,
}

Config.Locale = 'de'

Config.DrawDistance = 100
Config.Size         = {x = 1.5, y = 1.5, z = 1.5}
Config.BuyZoneSize  = {x = 4, y = 4, z = 4}
Config.Color        = {r = 0, g = 128, b = 255}
Config.TeamDeathMatchBlip = { x = 1734.80, y = 3291.98, z = 40.08}
Config.Spectate = {x = -2366.06, y = 3095.65, z = 31.83}
Config.MapCenter = {x = -2366.06, y = 3095.65, z = 31.83}


Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 2.0, y = 2.0, z = 2.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 1    -- default circle type, low draw distance due to indoors area
}






Config.Deathmatch = {
    BlueTeam = {
        name = "Anti-Terroreinheit", --blau
        color = { r = 0, g = 0, b = 255},
        game_start_pos = { x = -1709.63, y =2853.55, z = 31.89},
        enter_pos = { x = -1687.22, y = -1116.67, z = 12.15},
        --enter_pos = { x = -75.85, y = -824.88, z = 325.15},
        skin = {
            male = {
                ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                ['torso_1'] = 51,   ['torso_2'] = 0,
                ['decals_1'] = 0,   ['decals_2'] = 0,
                ['arms'] = 0,		['arms_2'] = 0,
                ['pants_1'] = 24,   ['pants_2'] = 2,
                ['shoes_1'] = 51,   ['shoes_2'] = 0,
                ['helmet_1'] = 10,  ['helmet_2'] = 4,
                ['mask_1'] = 121,    ['chain_2'] = 0,
                ['ears_1'] = 0,     ['ears_2'] = 0,
                ['bproof_1'] = 21,  ['bproof_2'] = 3

            },
            female = {
                ['tshirt_1'] = 14,  ['tshirt_2'] = 0,
                ['torso_1'] = 44,   ['torso_2'] = 0,
                ['decals_1'] = 0,   ['decals_2'] = 0,
                ['arms'] = 14,		['arms_2'] = 0,
                ['pants_1'] = 34,   ['pants_2'] = 0,
                ['shoes_1'] = 10,   ['shoes_2'] = 0,
                ['helmet_1'] = 10,  ['helmet_2'] = 3,
                ['mask_1'] = 121,    ['chain_2'] = 0,
                ['ears_1'] = 0,     ['ears_2'] = 0,
                ['bproof_1'] = 20,  ['bproof_2'] = 3
            }
        }
    },
    RedTeam = {
        name = "Terroreinheit", --rot
        color = { r = 255, g = 0, b = 0},
        game_start_pos = { x = -2862.24, y = 3350.90, z = 32.81},
        enter_pos = { x = -1690.78, y = -1129.08, z = 12.15},
        --enter_pos = { x = -77.13, y = -813.79, z = 325.10},
        skin = {
            male = {
                ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                ['torso_1'] = 15,   ['torso_2'] = 0,
                ['decals_1'] = 0,   ['decals_2'] = 0,
                ['arms'] = 15,		['arms_2'] = 0,
                ['pants_1'] = 6,   ['pants_2'] = 0,
                ['shoes_1'] = 5,   ['shoes_2'] = 0,
                ['helmet_1'] = -1,  ['helmet_2'] = 0,
                ['chain_1'] = 0,    ['chain_2'] = 0,
                ['mask_1'] = 114,     ['ears_2'] = 0,
                ['bproof_1'] = 0,  ['bproof_2'] = 0
            },
            female = {
                ['tshirt_1'] = 14,  ['tshirt_2'] = 0,
                ['torso_1'] = 5,   ['torso_2'] = 0,
                ['decals_1'] = 0,   ['decals_2'] = 0,
                ['arms'] = 4,		['arms_2'] = 0,
                ['pants_1'] = 14,   ['pants_2'] = 8,
                ['shoes_1'] = 5,   ['shoes_2'] = 0,
                ['helmet_1'] = -1,  ['helmet_2'] = 0,
                ['chain_1'] = 0,    ['chain_2'] = 0,
                ['mask_1'] = 114,     ['ears_2'] = 0,
                ['bproof_1'] = 0,  ['bproof_2'] = 0
            }
        }
    }
}

-- Config.Uniforms = 

Config.BuyMenu = {
    Knife = {
        label = "Waffe nehmen",
        list = {
            {
                label = "PDW",
                key = "WEAPON_COMBATPDW"
            }
        }
    }
}
