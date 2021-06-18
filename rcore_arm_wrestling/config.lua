Config = {
    License = '495b99e4458230b31c491f94be7a6f7d', -- Insert your rcore license
}

-- Recommended models
---- prop_arm_wrestle_01
---- bkr_prop_clubhouse_arm_wrestle_01a
---- bkr_prop_clubhouse_arm_wrestle_02a

TABLES = {
    {
        pos = vector3(1131.7716064453,99.010200500488,81.116409301758), --
        model = 'prop_arm_wrestle_01',
        headingOffset = 90.0, -- sets player's relative heading to the object's heading
        blip = false, -- display blip on map
    },
    {
        pos = vector3(1142.36328125,107.76917266846,80.825584411621), --
        model = 'prop_arm_wrestle_01',
        headingOffset = 90.0,
        blip = false,
    },
    {
        pos = vector3(1156.5427246094,148.66273498535,80.835105895996), --
        model = 'prop_arm_wrestle_01',
        headingOffset = 90.0,
        blip = false,
    },
    {
        pos = vector3(1132.5124511719,144.90747070312,80.857551574707), --
        model = 'prop_arm_wrestle_01',
        headingOffset = 90.0,
        blip = false,
    },
    {
        pos = vector3(1116.0456542969,114.92797088623,80.830902099609), --
        model = 'prop_arm_wrestle_01',
        headingOffset = 90.0,
        blip = true,
    },

    --Knäst
    {
        pos = vector3(1742.05,2555.66,45.45), --
        model = 'prop_arm_wrestle_01',
        headingOffset = 90.0, -- sets player's relative heading to the object's heading
        blip = false, -- display blip on map
    },
    {
        pos = vector3(1735.97,2548.92,45.56), --
        model = 'prop_arm_wrestle_01',
        headingOffset = 90.0, -- sets player's relative heading to the object's heading
        blip = false, -- display blip on map
    },

    {
        pos = vector3(1765.82,2562.81,45.56), --
        model = 'prop_arm_wrestle_01',
        headingOffset = 90.0, -- sets player's relative heading to the object's heading
        blip = false, -- display blip on map
    },

    {
        pos = vector3(1769.2,2556.21,45.56), --
        model = 'prop_arm_wrestle_01',
        headingOffset = 90.0, -- sets player's relative heading to the object's heading
        blip = false, -- display blip on map
    },

}

--[[
    How long after starting the match does the match timeout without setting a winner
]]
MATCH_TIMEOUT = 5 * 60 * 1000

--[[
    Determines how many keypresses from one player over another is required to win
    We've tested 10 to be fair difficulty, but you can make it lower to make games faster
]]
MATH_FINAL_WIN_COUNT = 10

--[[
    Color of countdown (3 - 2 - 1) background and color of GO background
]]
COUNTDOWN_COLOR = {r = 196, g = 158, b = 61}
GO_COLOR = {r = 94, g = 154, b = 89}

--[[
    Checkpoint color
]]
CHECKPOINT_COLOR = {r = 255, g = 0, b = 0, a = 100}

--[[
    Translation of end of countdown
    Blip/Control translation is configured in it's section
]]
LANGUAGE = {
    GO = 'GO'
}

--[[
    Blip settings
]]
BLIP_CONFIG = {
    sprite = 311,
    color = 0,
    label = 'Arm Drücken',
    scale = 1.0,
}

--[[
    For control numbers and labels, see https://docs.fivem.net/docs/game-references/controls/
]]
CONTROLS = {
    PLAY = {
        CONTROL = 38,
        CONTROL_LABEL = 'INPUT_PICKUP',
        TEXT = 'Arm Drücken ~r~1vs1~w~\nArmdrücken gegen ~g~Geld-Einsatz~w~ ist ausdrücklich erwünscht!',
    },
    QUIT = {
        CONTROL = 38,
        CONTROL_LABEL = 'INPUT_PICKUP',
        TEXT = 'Aufhören',
    },
    MASH_A = {
        CONTROL = 35,
        CONTROL_LABEL = 'INPUT_MOVE_RIGHT_ONLY',
        TEXT = 'Wrestle',
    },
    MASH_B = {
        CONTROL = 34,
        CONTROL_LABEL = 'INPUT_MOVE_LEFT_ONLY',
    },
}