main = {
    commandName = "sc223xxhild",
    commandChatSuggestion = "",
    parameterType = "Shield Type", -- Use this to change to a different language
    acePermissionsEnabled = false, --If true, this enables ace permissions
}

translations = {
    noArguments = "",
    invalidShieldType = "",
    outsideVehicle = "~r~Error~w~: Du bist in einem Fahrzeug.",
    shieldRemoved = "~g~Success~w~: Schild entfernt",
}

-- Shield Names must be one word for command usage
-- eg /shield ballistic

shields = {
    {
        name = "1",
        model = `prop_shield_one`,
        offSet = {-0.59, 0.29, 0.15},
        rotation = {0.16, 79.04, 41.39},
        boneIndex = 24818,
        collision = true,
        animDict = "combat@combat_reactions@pistol_1h_hillbilly",
        animName = "180",
    },
    {
        name = "2",
        model = `prop_shield_two`,
        offSet = {-0.59, 0.29, 0.15},
        rotation = {0.16, 79.04, 41.39},
        boneIndex = 24818,
        collision = true,
        animDict = "combat@combat_reactions@pistol_1h_hillbilly",
        animName = "180",
    },
    {
        name = "3",
        model = `prop_shield_three`,
        offSet = {-1.2, 0.31, -0.05},
        rotation = {1.0, 74.39, 41.39},
        boneIndex = 24818,
        collision = true,
        animDict = "combat@combat_reactions@pistol_1h_hillbilly",
        animName = "180",
    },
    {
        name = "4",
        model = `prop_shield_four`,
        offSet = {-0.68, 0.22, 0.15},
        rotation = {0.52, 79.28, 41.39},
        boneIndex = 24818,
        collision = true,
        animDict = "combat@combat_reactions@pistol_1h_hillbilly",
        animName = "180",
    },
}