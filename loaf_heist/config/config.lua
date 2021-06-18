local second = 1000 -- 1 s = 1000 ms
local minute = 60 * second -- 1 m = 60 s
local hour = 60 * minute -- 1 h = 60 m

Config = {
    Use3DText = nil,
    RemoveHack = false, -- remove laptop & hacking device?
    RemoveThermite = true, -- remove thermite item when using it?
    AllowLock = true, -- allow cops to lock vault
    CopLoot = false, -- allow cops to steal cash
    GiveBlack = true, -- give black money?
    Required = {
        Thermite = "thermit", -- set to false if no item is required
        Computer = "laptop", -- same as above
        Device = "hacking_device", -- same as above
        Drill = "drill_bank_heist", -- ^^^^^^
    },

    Blips = {
        Sprite = 107,
        Colour = 1,
        Scale = 0.6,
    },

    CopJobs = {
        "police",
        "sheriff",
    },

    Banks = {
        ["Pacific Standard"] = {
            Cops = 8, -- cops required
            Cooldown = 1 * hour, -- 1 hour between each robbery
            Blip = vector3(231.82, 215.37, 106.28), -- you can set this to false to disable blips
            Thermals = {
                {
                    Object = "hei_v_ilev_bk_gate_pris",
                    Offset = vector3(1.2, -0.05, -0.08),
                    PtfxOffs = vector3(1.2, 0.4, -0.05),
                    DripOffs = vector3(1.2, -0.1, -0.15),
                    Pos = vector3(257.28, 219.84, 106.29),
                    -- Cam = { -- cams don't look good when using thermite imo
                    --     from = {
                    --         pos = vector3(255.6, 219.5, 107.0),
                    --         rot = vector3(-25.0, 0.0, 300.0)
                    --     },

                    --     to = {
                    --         pos = vector3(257.72, 218.3, 107.0),
                    --         rot = vector3(-25.0, 0.0, 26.0)
                    --     },
                    -- },
                    Locked = 340.30081176758
                },
                {
                    Object = "hei_v_ilev_bk_gate2_pris",
                    Offset = vector3(1.2, -0.05, -0.08),
                    PtfxOffs = vector3(1.2, 0.4, -0.05),
                    DripOffs = vector3(1.2, -0.1, -0.15),
                    Pos = vector3(261.49, 221.57, 106.28),
                    EnableHacking = true, -- this means that this is the last thermal outside the vault, when this is unlocked trolleys will spawn
                    -- Cam = {
                    --     from = {
                    --         pos = vector3(260.46, 223.59, 107.0),
                    --         rot = vector3(-25.0, 0.0, 210.0)
                    --     },

                    --     to = {
                    --         pos = vector3(259.85, 221.07, 107.0),
                    --         rot = vector3(-25.0, 0.0, 300.0)
                    --     },
                    -- },
                    Locked = 249.9285736084
                },
                {
                    Object = "hei_v_ilev_bk_safegate_pris",
                    Offset = vector3(-1.175, -0.05, -0.08),
                    PtfxOffs = vector3(-1.175, 0.4, -0.05),
                    DripOffs = vector3(-1.2, -0.1, 0.15),
                    Pos = vector3(252.77, 220.87, 101.68),
                    Locked = 159.831,
                }
            },
            Hacking = {
                Time = 10 * second, -- 10 seconds to complete hack
                Attempts = 3, -- 3 attempts, then fail
                Speed = {min = 500, max = 1000},
                Object = "hei_prop_hei_securitypanel", -- security panel object
                Pos = vector3(253.0, 228.52, 102.0), -- the position of the object 
                Cam = {
                    from = {
                        pos = vector3(253.34, 227.3, 102.3),
                        rot = vector3(-25.0, 0.0, 15.0)
                    },
                    to = {
                        pos = vector3(254.62, 228.96, 102.3),
                        rot = vector3(-25.0, 0.0, 104.0)
                    },
                },
            },
            Vault = {
                Object = "v_ilev_bk_vaultdoor",
                Pos = vector3(253.75, 225.26, 101.88),
                Locked = 160.00048828125, -- the locked heading of the vault
                Unlocked = 15.0, -- the heading when the vault is unlocked
                Cam = { -- only shown for the hacker
                    from = {
                        pos = vector3(252.8, 227.24, 102.5),
                        rot = vector3(-5.0, 0.0, 200.0)
                    },
                    to = {
                        pos = vector3(254.81, 227.45, 102.5),
                        rot = vector3(-5.0, 0.0, 160.0)
                    },
                },
            },
            Trolleys = {
                {
                    Object = "hei_prop_hei_cash_trolly_01",
                    Empty = "hei_prop_hei_cash_trolly_03",
                    Position = vector4(265.11822509766, 212.18113708496, 101.68334960938, 38.766059875488),
                    Rewards = {
                        Money = {50000, 75000}, -- Minimum reward: 5k, max award: 10k
                    },
                    Cam = {
                        from = {
                            pos = vector3(264.12, 212.06, 102.3),
                            rot = vector3(-20.0, 0.0, 300.0)
                        },
                        to = {
                            pos = vector3(265.52, 211.83, 102.3),
                            rot = vector3(-25.0, 0.0, 38.76)
                        },
                    },
                },
                {
                    Object = "hei_prop_hei_cash_trolly_01",
                    Empty = "hei_prop_hei_cash_trolly_03",
                    Position = vector4(266.43881225586, 215.23796081543, 101.68334960938, 101.58773040771),
                    Rewards = {
                        Money = {50000, 75000},
                        Items = {
                            ["diamond"] = { -- you have a 100 % chance to get between 2-5 thermites
                                chance = 100,
                                amount = {2, 5},
                            },
                        },
                    },
                    Cam = {
                        from = {
                            pos = vector3(266.21, 215.57, 102.3),
                            rot = vector3(-20.0, 0.0, 170.0)
                        },
                        to = {
                            pos = vector3(266.71, 215.13, 102.3),
                            rot = vector3(-40.0, 0.0, 101.587)
                        },
                    },
                },
                {
                    Object = "hei_prop_hei_cash_trolly_01",
                    Empty = "hei_prop_hei_cash_trolly_03",
                    Position = vector4(261.7585144043, 213.36592102051, 101.68347167969, 293.56072998047),
                    Rewards = {
                        Money = {50000, 75000},
                    },
                    Cam = {
                        from = {
                            pos = vector3(261.28, 213.59, 102.3),
                            rot = vector3(-20.0, 0.0, 270.0)
                        },
                        to = {
                            pos = vector3(261.4585144043, 213.26592102051, 102.3),
                            rot = vector3(-30.0, 0.0, 293.56)
                        },
                    },
                },
                {
                    Object = "hei_prop_hei_cash_trolly_01",
                    Empty = "hei_prop_hei_cash_trolly_03",
                    Position = vector4(262.77642822266, 216.41893005371, 101.68347930908, 203.53129577637),
                    Rewards = {
                        Money = {50000, 75000},
                    },
                    Cam = {
                        from = {
                            pos = vector3(263.4, 216.5, 102.3),
                            rot = vector3(-20.0, 0.0, 166.11)
                        },
                        to = {
                            pos = vector3(262.57642822266, 216.61893005371, 102.3),
                            rot = vector3(-30.0, 0.0, 203.53)
                        },
                    },
                },
            },
            Drilling = {
                {
                    Scene = vector4(257.7, 214.0, 101.91334197998, 157.97628173828),
                    Rewards = {
                        Money = {50000, 75000}, -- Minimum reward: 5k, max reward: 10k
                    },
                    Cam = {
                        from = {
                            pos = vector3(257.29, 214.57, 102.3),
                            rot = vector3(-20.0, 0.0, 250.0)
                        },
                        to = {
                            pos = vector3(257.56, 215.46, 102.3),
                            rot = vector3(-25.0, 0.0, 187.14)
                        },
                    },
                },
            }
        },
        ["Fleeca [Hawick Ave]"] = {
            Cops = 4,
            Cooldown = 30 * minute, -- 30 minutes between each robbery
            Blip = vector3(314.91, -276.71, 54.17),
            Hacking = {
                Time = 10 * second,
                Attempts = 3,
                Speed = {min = 500, max = 1000},
                Pos = vector3(311.58, -284.62, 54.37),
                Heading = 250.0,
                Cam = {
                    from = {
                        pos = vector3(311.9, -282.81, 55.0),
                        rot = vector3(-10.0, 0.0, 170.0)
                    },
                    to = {
                        pos = vector3(309.68, -283.6, 55.0),
                        rot = vector3(-25.0, 0.0, 245.0)
                    },
                },
            },
            Vault = {
                Object = "v_ilev_gb_vauldr",
                Pos = vector3(311.66, -283.3, 54.16),
                Locked = 250.0, -- the locked heading of the vault
                Unlocked = 144.1, -- the heading when the vault is unlocked
            },
            Trolleys = {
                {
                    Object = "hei_prop_hei_cash_trolly_01",
                    Empty = "hei_prop_hei_cash_trolly_03",
                    Position = vector4(311.04287719727, -288.29632568359, 54.143035888672, 280.91351318359),
                    Rewards = {
                        Money = {25000, 50000},
                    },
                    Cam = {
                        from = {
                            pos = vector3(311.1, -286.93, 54.8),
                            rot = vector3(-20.0, 0.0, 175.13)
                        },
                        to = {
                            pos = vector3(310.75, -288.412568359, 54.8),
                            rot = vector3(-30.0, 0.0, 280.0)
                        },
                    },
                },
                {
                    Object = "hei_prop_hei_cash_trolly_01",
                    Empty = "hei_prop_hei_cash_trolly_03",
                    Position = vector4(314.11804199219, -289.36541748047, 54.143135070801, 32.497997283936),
                    Rewards = {
                        Money = {25000, 50000},
                    },
                    Cam = {
                        from = {
                            pos = vector3(314.85, -288.51, 54.8),
                            rot = vector3(-20.0, 0.0, 160.0)
                        },
                        to = {
                            pos = vector3(314.41804199219, -289.66541748047, 54.8),
                            rot = vector3(-30.0, 0.0, 30.0)
                        },
                    },
                },
            },
        },
    },
}