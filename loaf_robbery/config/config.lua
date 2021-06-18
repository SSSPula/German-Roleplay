Config = {
    Blips = {
        Enabled = false, -- should all stores have a blip?
        Sprite = 52, -- https://docs.fivem.net/docs/game-references/blips/
        Colour = 1, -- https://runtime.fivem.net/doc/natives/?_0x03D7FB09E75D6B7E
        Scale = 0.5, -- the scale of the blip
        Label = "Store robbery", -- the label of the blip
    },
    ArmedFlag = 4, -- https://docs.fivem.net/natives/?_0x475768A975D5AD17
    GiveBlack = true, -- give black money? false = give cash, true = give black money
    Greet = true, -- say a greeting when entering store?
    KickCheaters = true, -- kick potential cheaters? (99% that they are cheating)

    Respawn = 10 * 60, -- 10 minutes (± 5 sec) for the ped to respawn when it has been killed
    -- i recommend you to set the Respawn to higher than the cooldown since the store will be robbable once the ped has respawned.
    Cooldown = 5 * 60, -- 5 minutes between each robbery

    CopsRequired = 5, -- amount of cops required to rob
    CCTVImage = true, -- send a cctv image of the robber to police?
    CopJobs = { -- these jobs will be alerted when there's a robbery in progress
        "police",
        "sheriff",
    },
    AllowCops = true, -- allow cops to rob?
    Start = true, -- require people to aim for a couple seconds before starting robbery? (so people don't accidentally rob)

    -- add new stores here, remember they need to be inside a table {}, all tables must end with a comma ","
    Stores = {
        -- PALETO x SANDY
        {
            Ped = "mp_m_shopkeep_01", -- the clerks model
            Name = "24/7 Supermarket", -- the name of the store (on notifications etc)
            Spawn = vector4(-3040.7807617188, 583.50497558594, 7.9089283943176, 18.67197227478), -- the coordinates of the clerk, vector4(x, y, z, heading)
            Reward = {1000, 2500}, -- reward when picking up the bag
            Safe = {
                position = vector4(-3045.4379882812, 584.38226318359, 6.9089365005493, 289.59002685547), -- the coordinates of the safe 
                reset = 30, -- how many minutes until the safe is robbable again
                attempts = 10, -- how many attempts before the player has to start over
                locks = 5, -- how many locks the player needs to get correct
                reward = {
                    cash = {5000, 7500}, -- how much cash that hides in the safe, format: {min cash, max cash}
                    items = {
                         ["ladenraub_schliesskassette"] = {0, 1}, -- format: ["item"] = {min amount, max amount}
                    },
                },
            },
        },
        {
            Ped = "mp_m_shopkeep_01",
            Name = "24/7 Supermarket",
            Spawn = vector4(1728.4660644531, 6416.953125, 35.037212371826, 247.53112792969),
            Reward = {1000, 2500},
            Safe = {
                position = vector4(1732.2513427734, 6419.98046875, 34.037220001221, 156.35766601562), -- the coordinates of the safe 
                reset = 30, -- how many minutes until the safe is robbable again
                attempts = 10, -- how many attempts before the player has to start over
                locks = 5, -- how many locks the player needs to get correct
                reward = {
                    cash = {5000, 7500}, -- how much cash that hides in the safe, format: {min cash, max cash}
                    items = {
                        ["ladenraub_schliesskassette"] = {0, 1}, -- format: ["item"] = {min amount, max amount}
                    },
                },
            },
        },
        {
            Ped = "mp_m_shopkeep_01",
            Name = "24/7 Supermarket",
            Spawn = vector4(2676.30078125, 3279.9870605469, 55.24112701416, 331.52154541016),
            Reward = {1000, 2500},
            Safe = {
                position = vector4(2673.3112792969, 3284.1530761719, 54.241130828857, 243.27767944336), -- the coordinates of the safe 
                reset = 30, -- how many minutes until the safe is robbable again
                attempts = 10, -- how many attempts before the player has to start over
                locks = 5, -- how many locks the player needs to get correct
                reward = {
                    cash = {5000, 7500}, -- how much cash that hides in the safe, format: {min cash, max cash}
                    items = {
                        ["ladenraub_schliesskassette"] = {0, 1}, -- format: ["item"] = {min amount, max amount}
                    },
                },
            },
        },
        {
            Ped = "mp_m_shopkeep_01",
            Name = "24/7 Supermarket",
            Spawn = vector4(1958.9880371094, 3741.4318847656, 32.343730926514, 303.10214233398),
            Reward = {1000, 2500},
            Safe = {
                position = vector4(1958.6541748047, 3746.3208007812, 31.343788146973, 209.03736877441), -- the coordinates of the safe 
                reset = 30, -- how many minutes until the safe is robbable again
                attempts = 10, -- how many attempts before the player has to start over
                locks = 5, -- how many locks the player needs to get correct
                reward = {
                    cash = {5000, 7500}, -- how much cash that hides in the safe, format: {min cash, max cash}
                    items = {
                        ["ladenraub_schliesskassette"] = {0, 1}, -- format: ["item"] = {min amount, max amount}
                    },
                },
            },
        },
        {
            Ped = "mp_m_shopkeep_01",
            Name = "Liquor ACE",
            Spawn = vector4(1392.3447265625, 3606.4470214844, 34.980937957764, 205.05265808105),
            Reward = {750, 1500},
        },

        -- LSC
        {
            Ped = "mp_m_shopkeep_01",
            Name = "24/7 Supermarket",
            Spawn = vector4(372.80084228516, 328.34945678711, 103.56634521484, 258.50247192383),
            Reward = {2000, 4000},
            Safe = {
                position = vector4(375.94897460938, 332.2529296875, 102.56635284424, 168.42269897461), -- the coordinates of the safe 
                reset = 30, -- how many minutes until the safe is robbable again
                attempts = 10, -- how many attempts before the player has to start over
                locks = 5, -- how many locks the player needs to get correct
                reward = {
                    cash = {5000, 7500}, -- how much cash that hides in the safe, format: {min cash, max cash}
                    items = {
                        ["ladenraub_schliesskassette"] = {0, 1}, -- format: ["item"] = {min amount, max amount}
                    },
                },
            },
        },
        {
            Ped = "mp_m_shopkeep_01",
            Name = "24/7 Supermarket",
            Spawn = vector4(24.172290802002, -1345.3940429688, 29.497020721436, 271.23046875),
            Reward = {2000, 4000},
            Safe = {
                position = vector4(26.238149642944, -1341.1148681641, 28.497043609619, 181.68579101562), -- the coordinates of the safe 
                reset = 30, -- how many minutes until the safe is robbable again
                attempts = 10, -- how many attempts before the player has to start over
                locks = 5, -- how many locks the player needs to get correct
                reward = {
                    cash = {5000, 7500}, -- how much cash that hides in the safe, format: {min cash, max cash}
                    items = {
                        ["ladenraub_schliesskassette"] = {0, 1}, -- format: ["item"] = {min amount, max amount}
                    },
                },
            },
        },
        {
            Ped = "mp_m_shopkeep_01",
            Name = "Rob's Liquor",
            Spawn = vector4(-1221.4384765625, -908.41442871094, 12.326360702515, 34.550037384033),
            Reward = {1000, 3000},
        },
        {
            Ped = "mp_m_shopkeep_01",
            Name = "LTD Gasoline",
            Spawn = vector4(-705.83422851562, -913.32421875, 19.21558380127, 87.422431945801),
            Reward = {2000, 4000},
            Safe = {
                position = vector4(-707.70031738281, -903.76849365234, 18.21558380127, 322.87045288086), -- the coordinates of the safe 
                reset = 30, -- how many minutes until the safe is robbable again
                attempts = 10, -- how many attempts before the player has to start over
                locks = 5, -- how many locks the player needs to get correct
                reward = {
                    cash = {5000, 7500}, -- how much cash that hides in the safe, format: {min cash, max cash}
                    items = {
                        ["ladenraub_schliesskassette"] = {0, 1}, -- format: ["item"] = {min amount, max amount}
                    },
                },
            },
        },
        {
            Ped = "mp_m_shopkeep_01",
            Name = "LTD Gasoline",
            Spawn = vector4(-46.433006286621, -1757.7216796875, 29.420989990234, 51.516014099121),
            Reward = {2000, 4000},
            Safe = {
                position = vector4(-41.66333694458, -1749.3130859375, 28.421009063721, 284.31793212891), -- the coordinates of the safe 
                reset = 30, -- how many minutes until the safe is robbable again
                attempts = 10, -- how many attempts before the player has to start over
                locks = 5, -- how many locks the player needs to get correct
                reward = {
                    cash = {5000, 7500}, -- how much cash that hides in the safe, format: {min cash, max cash}
                    items = {
                        ["ladenraub_schliesskassette"] = {0, 1}, -- format: ["item"] = {min amount, max amount}
                    },
                },
            },
        },
        {
            Ped = "mp_m_shopkeep_01",
            Name = "LTD Gasoline",
            Spawn = vector4(1165.1716308594, -323.95007324219, 69.205055236816, 104.75079345703),
            Reward = {2000, 4000},
            Safe = {
                position = vector4(1161.3411865234, -313.41571044922, 68.205154418945, 328.21243286133), -- the coordinates of the safe 
                reset = 30, -- how many minutes until the safe is robbable again
                attempts = 10, -- how many attempts before the player has to start over
                locks = 5, -- how many locks the player needs to get correct
                reward = {
                    cash = {5000, 7500}, -- how much cash that hides in the safe, format: {min cash, max cash}
                    items = {
                        ["ladenraub_schliesskassette"] = {0, 1}, -- format: ["item"] = {min amount, max amount}
                    },
                },
            },
        },
    },
}