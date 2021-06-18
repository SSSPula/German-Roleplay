Config = {
    Prices = {
        ['bird_crap_ammo'] = {1, 1},
    },
    Marker = {
        Enabled = true,
        Type = 1,
        Scale = vec3(1.5, 1.5, 0.5),
        Colour = {255, 255, 255, 255},
        Offset = vec3(0.0, 0.0, -0.2)
    },
    ChanceToGetItem = 75, -- percent that you will get an item
    Items = { -- idk how to explain how the percentage works here, i couldn't get the math working
    {
        Percent = 1,
        Item = 'diamond', 
    },
    {
        Percent = 2,
        Item = 'smaragd', 
    },
    {
        Percent = 9, 
        Item = 'bernstein', 
    },
    {
        Percent = 17, 
        Item = 'gold',
    },
    {
        Percent = 31, 
        Item = 'silber',
    },
    {
        Percent = 56, 
        Item = 'aluminium', 
    },

    {
        Percent = 100,  
        Item = 'coal', 
    },

    },
    Sell = vector3(1724.44, 2507.03, 44.67),

    MiningPositions = {
        vec4(2992.77, 2750.64, 42.78, 209.29),
        vec4(2983.03, 2750.9, 42.02, 214.08),
        vec4(2976.74, 2740.94, 43.63, 246.21),
        vec4(2999.54, 2753.63, 42.82, 235.04),
        vec4(3004.26, 2763.45, 42.67, 279.9),
        vec4(3004.54, 2783.35, 43.54, 289.72),
        vec4(3001.27, 2790.93, 43.55, 283.36),
        vec4(2978.27, 2830.54, 45.36, 304.56),
        vec4(2972.78, 2839.02, 44.69, 258.11),
        vec4(2969.58, 2846.06, 45.68, 298.77),
      --  vec4(2955.1, 2852.02, 48.41, 326.77),
        vec4(2950.08, 2853.47, 49.21, 6.19),
        vec4(2957.11, 2851.61, 47.85, 337.91030),
        vec4(2960.75, 2850.01, 47.47, 331.09835),
        vec4(2974.68, 2834.4, 46.08, 317.837615),
        vec4(2979.84, 2826.8, 46.2, 297.0241088),
        vec4(2944.97, 2850.3, 47.7, 20.0241088),

        vec4(2938.86, 2827.26, 45.59, 0.8),
        vec4(2943.8, 2826.72, 44.84, 355.8),
        vec4(2954.12, 2826.44, 42.91, 0.92),


        vec4(2983.27, 2821.63, 45.64, 309.180511),
    },

    keys = {
        {'~INPUT_SELECT_WEAPON_UNARMED~', 157}, -- 1
        {'~INPUT_SELECT_WEAPON_MELEE~', 158}, -- 2
        {'~INPUT_SELECT_WEAPON_SHOTGUN~', 160}, -- 3
        {'~INPUT_SELECT_WEAPON_HEAVY~', 164}, -- 4

        -- {'~INPUT_SELECT_WEAPON_SPECIAL~', 165}, -- 5
        -- {'~INPUT_SELECT_WEAPON_HANDGUN~', 159}, -- 6
        -- {'~INPUT_SELECT_WEAPON_SMG~', 161}, -- 7
        -- {'~INPUT_SELECT_WEAPON_AUTO_RIFLE~', 162}, -- 8
        -- {'~INPUT_SELECT_WEAPON_SNIPER~', 163}, -- 9,

        {'~INPUT_MOVE_UP_ONLY~', 32}, -- W
        {'~INPUT_MOVE_LEFT_ONLY~', 34}, -- A
        {'~INPUT_MOVE_DOWN_ONLY~', 33}, -- S
        {'~INPUT_MOVE_RIGHT_ONLY~', 35}, -- D

       -- {'~INPUT_CELLPHONE_UP~', 172}, -- arrow up
       -- {'~INPUT_CELLPHONE_DOWN~', 173}, -- arrow down,
       -- {'~INPUT_CELLPHONE_LEFT~', 174}, -- arrow left,
       -- {'~INPUT_CELLPHONE_RIGHT~', 175}, -- arrow right
    }
}

Strings = {
    ['press_mine'] = 'Drücke ~INPUT_CONTEXT~ um Bergbau zu betreiben.',
    ['mining_info'] = 'Drücke ~INPUT_FRONTEND_RRIGHT~ um Bergbau zu beenden.',
    ['you_sold'] = 'Du verkaufst %sx %s für $%s',
    ['e_sell'] = 'Drücke ~INPUT_CONTEXT~ zum Verkaufen.',
    ['someone_close'] = 'Jemand ist zu nah an dir dran! Sicherheit geht vor!.',
    ['mining'] = 'Abbauen',
    ['sell_mine'] = 'Verkaufe Gegenstände',
    ['press'] = 'Du hast was gefunden!\n%s - Sammeln',
    ['slow'] = 'Du warst zu langsam',
    ['cant_carry'] = 'Du hast zu viel bei dir für: %s.',
    ['mined'] = 'Du hast gefunden 1x %s'
}