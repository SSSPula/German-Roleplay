Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}

Config.ReviveReward               = 150  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = true -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'en'


Config.EarlyRespawnTimer          = 60000 * 10  -- time til respawn is available
Config.BleedoutTimer              = 60000 * 10 -- time til the player bleeds out

Config.EnablePlayerManagement     = true

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

--Spieler kann sich früher rauskaufen = true Kann nicht = false
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 10000

Config.RespawnPoint = {coords = vector3(304.56, -587.12, 43.28), heading = 240.11}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(296.94, -583.96, 43.13),
			sprite = 61,
			scale  = 1.2,
			color  = 2
		},

		AmbulanceActions = {
			vector3(300.6, -597.65, 42.30), --medic
			vector3(176.23, -643.47, -163.55) --feuerwehr
		},

		Pharmacies = {
			vector3(307.38, -600.29, 0.28)
		},

		Vehicles = {
			{
				Spawner = vector3(296.43, -602.34, 43.28),
				InsideShop = vector3(291.42, -582.37, 49.74),
				Marker = {type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(296.56, -605.31, 43.32), heading = 70.03, radius = 4.0},
					{coords = vector3(293.05, -613.88, 43.40), heading = 70.03, radius = 4.0},
					{coords = vector3(283.59, -611.37, 43.70), heading = 70.03, radius = 4.0}					
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(341.17, -593.21, 74.18),
				InsideShop = vector3(313.68, -575.9, 94.18),
				Marker = {type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true},
				SpawnPoints = {
				{coords = vector3(351.93, -587.89, 74.17), heading = 74.0, radius = 10.0}
				}
			}
		},

		FastTravels = {

			--Nachtclub Eingang
			{	
				From = vector3(-98.41, 367.49, 113.27),
				To = {coords = vector3(-1569.82, -3013.35, -74.41), heading = 88.9},
				Marker = {type = 0, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},
			--Nachtclub Ausgang
			{	
				From = vector3(-1569.39, -3016.14, -74.41),
				To = {coords = vector3(-103.03, 366.72, 112.90), heading = 88.9},
				Marker = {type = 0, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},
			
		},

		FastTravelsPrompt = {

		}

	}
}

Config.AuthorizedVehicles = {
	car = {
		lehrling = {
		{ model = 'fdnyambo', label = 'Krankenwagen', livery = 1, price = 1 }
		},

		sanitaeter = {
		{ model = 'fdnyambo', label = 'Krankenwagen', livery = 1, price = 1 }
		},

		azubichirurg = {
		{ model = 'fdnyambo', label = 'Krankenwagen', livery = 1, price = 1 }
		},

		assistenzarzt = {
		{ model = 'fdnyambo', label = 'Krankenwagen', livery = 1, price = 1 },
		{ model = 'dodgeems', label = 'Dodge', livery = 1, price = 1 }
		},

		assistenzchirurg = {
		{ model = 'fdnyambo', label = 'Krankenwagen', livery = 1, price = 1 },
		{ model = 'dodgeems', label = 'Dodge', livery = 1, price = 1 }
		},

		arzt = {
		{ model = 'fdnyambo', label = 'Krankenwagen', livery = 1, price = 1 },
		{ model = 'dodgeems', label = 'Dodge', livery = 1, price = 1 }
		},

		chirurg = {
		{ model = 'fdnyambo', label = 'Krankenwagen', livery = 1, price = 1 },
		{ model = 'dodgeems', label = 'Dodge', livery = 1, price = 1 }
		},

		chefarzt = {
		{ model = 'fdnyambo', label = 'Krankenwagen', livery = 1, price = 1 },
		{ model = 'dodgeems', label = 'Dodge', livery = 1, price = 1 }
		},

		chefchirurg = {
		{ model = 'fdnyambo', label = 'Krankenwagen', livery = 1, price = 1 },
		{ model = 'dodgeems', label = 'Dodge', livery = 1, price = 1 }
		},

		personalleiter = {
		{ model = 'fdnyambo', label = 'Krankenwagen', livery = 1, price = 1 },
		{ model = 'firetruk', label = 'Feuerwehrwagen', livery = 1, price = 1 },
		--{ model = 'fdsuv', label = 'Jeep', livery = 1, price = 1 },
		{ model = 'dodgeems', label = 'Dodge', livery = 1, price = 1 }
		},

		vizechief = {
		{ model = 'fdnyambo', label = 'Krankenwagen', livery = 1, price = 1 },
		--{ model = 'fdsuv', label = 'Jeep', livery = 1, price = 1 },
		{ model = 'firetruk', label = 'Feuerwehrwagen', livery = 1, price = 1 },
		{ model = 'dodgeems', label = 'Dodge', livery = 1, price = 1 }
		},

		boss = {
		{ model = 'fdnyambo', label = 'Krankenwagen', livery = 1, price = 1 },
		{ model = 'firetruk', label = 'Feuerwehrwagen', livery = 1, price = 1 },
		--{ model = 'fdsuv', label = 'Jeep', livery = 1, price = 1 },
		{ model = 'dodgeems', label = 'Dodge', livery = 1, price = 1 }
		}
	},

	helicopter = {
		boss = {
			{model = 'mh65c', price = 10000}
		}
	}
}

Config.Uniforms = {

	bullet_wear = {
		male = {
			['bproof_1'] = 12,  ['bproof_2'] = 3
		},
		female = {
			['bproof_1'] = 13,  ['bproof_2'] = 1
		}
	},
	feuerwehr = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 77,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 165,		['arms2'] = 6,
			['pants_1'] = 43,   ['pants_2'] = 0,
			['shoes_1'] = 33,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 64,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 206,		['arms2'] = 6,
			['pants_1'] = 18,   ['pants_2'] = 0,
			['shoes_1'] = 9,   ['shoes_2'] = 0,
			['helmet_1'] = 44,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	medickleidung = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 118,   ['torso_2'] = 6,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 4,		['arms2'] = 0,
			['bproof_1'] = 32,  ['bproof_2'] = 0,
			['pants_1'] = 22,   ['pants_2'] = 3,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 122,  ['helmet_2'] = 0,
			['chain_1'] = 127,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 6,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 3,		['arms2'] = 6,
			['pants_1'] = 3,   ['pants_2'] = 3,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = 121,  ['helmet_2'] = 0,
			['chain_1'] = 97,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	medickleidungop = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 118,   ['torso_2'] = 6,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 4,		['arms2'] = 0,
			['bproof_1'] = 32,  ['bproof_2'] = 0,
			['pants_1'] = 22,   ['pants_2'] = 3,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 122,  ['helmet_2'] = 0,
			['chain_1'] = 127,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 18,   ['torso_2'] = 6,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 3,		['arms2'] = 6,
			['pants_1'] = 3,   ['pants_2'] = 3,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = 121,  ['helmet_2'] = 0,
			['chain_1'] = 97,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	gilet_wear = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 1
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1
		}
	}

}
