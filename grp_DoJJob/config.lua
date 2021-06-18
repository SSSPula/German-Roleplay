Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = false -- enable if you're using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

	
Config.RemoveWeapon = false

Config.EnablePrice               = true
Config.Price                     = 1000

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'en'

Config.dojStations = {

	doj = {

		Blip = {
			Coords  = vector3(-437.73, 1105.59, 327.68),
			Sprite  = 60,
			Display = 2,
			Scale   = 1.0,
			Colour  = 11
		},

		Cloakrooms = {
			vector3(-423.52, 1100.88, 327.68)
		},

		Armories = {
			--vector3(-434.75, 1094.82, 327.69)
		},

		Vehicles = {
			{
				Spawner = vector3(-422.98, 1177.86, 325.8),

				InsideShop = vector3(-420.04, 1180.55, 325.64),
				SpawnPoints = {
					{ coords = vector3(-410.17, 1181.72, 325.64), heading = 256.73, radius = 6.0 }
				}
			},
		},


		Helicopters = {
			{
				Spawner = vector3(-459.23, 1132.51, 325.9),
				InsideShop = vector3(-439.63, 1135.48, 325.9),
				SpawnPoints = {
					{ coords = vector3(-457.43, 1140.81, 327.9), heading = 348.81, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(-439.84, 1102.42, 327.72)
		}

	}

}

--Config.AuthorizedWeapons = {
--	recruit = {
--		--{ weapon = 'WEAPON_REVOLVER', price = 0 }
--	},
--
--	officer = {
--		--{ weapon = 'WEAPON_REVOLVER', price = 0 }
--	},
--
--	sergeant = {
--		--{ weapon = 'WEAPON_REVOLVER', price = 0 }
--	},
--
--	intendent = {
--		
--		--{ weapon = 'WEAPON_REVOLVER', price = 0 }
--	},
--
--	lieutenant = {
--		
--		--{ weapon = 'WEAPON_REVOLVER', price = 0 }
--	},
--
--	swat = {
--		
--		--{ weapon = 'WEAPON_REVOLVER', price = 0 }
--	},
--
--	capitan = {
--		
--		--{ weapon = 'WEAPON_REVOLVER', price = 0 }
--	},
--
--	commander = {
--		
--		--{ weapon = 'WEAPON_REVOLVER', price = 0 }
--	},
--
--	chef = {
--		
--		--{ weapon = 'WEAPON_REVOLVER', price = 0 }
--	},
--
--	rang10 = {
--		
--		--{ weapon = 'WEAPON_REVOLVER', price = 0 }
--	},
--
--	rang11 = {
--		
--		--{ weapon = 'WEAPON_REVOLVER', price = 0 }
--	},
--
--	boss = {
--		
--		--{ weapon = 'WEAPON_REVOLVER', price = 0 }
--	}
--}

Config.AuthorizedVehicles = {
	Shared = {
		{ model = 'trualamo', label = 'DoJ Undercover', livery = 1, price = 20000 },
		{ model = 'cruiser', label = 'DoJ Cruiser', livery = 1, price = 5000 },
		{ model = 'fixter', label = 'DoJ fixter', livery = 1, price = 5000 },
		{ model = 'scorcher', label = 'DoJ scorcher', livery = 1, price = 5000 },
		{ model = 'tribike', label = 'DoJ tribike', livery = 1, price = 5000 },
		{ model = 'tribike2', label = 'DoJ tribike2', livery = 1, price = 5000 },
		{ model = 'tribike3', label = 'DoJ tribike3', livery = 1, price = 5000 },
		{ model = 'mower', label = 'DoJ Mower', livery = 1, price = 15000 },
	},

	recruit = {

		
	},

	officer = {

	},

	sergeant = {

	},

	intendent = {

	},

	lieutenant = {

	},

	swat = {

	},

	capitan = {


	},

	commander = {


	},

	chef = {



	},

	rang10 = {


	},

	rang11 = {


	},

	boss = {


	}
}

Config.AuthorizedHelicopters = {
	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	lieutenant = {
	--	{ model = 'maverick', label = 'doj Maverick', livery = 1, price = 30000 },
	--	{ model = 'frogger', label = 'doj Frogger', livery = 1, price = 30000 }
	},

	swat = {
	--	{ model = 'maverick', label = 'doj Maverick', livery = 1, price = 30000 },
	--	{ model = 'frogger', label = 'doj Frogger', livery = 1, price = 30000 }
	},

	capitan = {
	--	{ model = 'maverick', label = 'doj Maverick', livery = 1, price = 30000 },
	--	{ model = 'frogger', label = 'doj Frogger', livery = 1, price = 30000 }
	},

	commander = {
	--	{ model = 'maverick', label = 'doj Maverick', livery = 1, price = 30000 },
	--	{ model = 'frogger', label = 'doj Frogger', livery = 1, price = 30000 }
	},

	chef = {
		{ model = 'maverick', label = 'doj Maverick', livery = 1, price = 30000 },
		{ model = 'frogger', label = 'doj Frogger', livery = 1, price = 30000 }
	},

	rang10 = {
		{ model = 'maverick', label = 'doj Maverick', livery = 1, price = 30000 },
		{ model = 'frogger', label = 'doj Frogger', livery = 1, price = 30000 }
	},

	rang11 = {
		{ model = 'maverick', label = 'doj Maverick', livery = 1, price = 30000 },
		{ model = 'frogger', label = 'doj Frogger', livery = 1, price = 30000 }
	},

	boss = {
		{ model = 'maverick', label = 'doj Maverick', livery = 1, price = 30000 },
		{ model = 'frogger', label = 'doj Frogger', livery = 1, price = 30000 }
	}
}



Config.Uniforms = {
	bullet_wear = {
		male = {
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 24,   ['pants_2'] = 2,
			['shoes_1'] = 51,   ['shoes_2'] = 0,
			['helmet_1'] = 1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 27,  ['tshirt_2'] = 1,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 57,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	swat_wear = {
		male = { --fertig
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 53,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['bproof_1'] = 16,  ['bproof_2'] = 0,
			['arms'] = 35,
			['pants_1'] = 31,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 117,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = { --fertig
			['tshirt_1'] = 152,  ['tshirt_2'] = 0,
			['torso_1'] = 46,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['bproof_1'] = 18,  ['bproof_2'] = 0,
			['arms'] = 49,
			['pants_1'] = 30,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 116,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	anzug_wear = {
		male = { --fertig
			['tshirt_1'] = 66,  ['tshirt_2'] = 4,
			['torso_1'] = 4,   ['torso_2'] = 4,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['bproof_1'] = 24,  ['bproof_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 28,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = { --fertig
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
			['torso_1'] = 24,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['bproof_1'] = 26,  ['bproof_2'] = 0,
			['arms'] = 3,
			['pants_1'] = 6,   ['pants_2'] = 1,
			['shoes_1'] = 42,   ['shoes_2'] = 2,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 22,    ['chain_2'] = 6,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	
	mitjacke_wear = {
		male = { --fertig
			['tshirt_1'] = 66,  ['tshirt_2'] = 0,
			['torso_1'] = 39,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['bproof_1'] = 2,  ['bproof_2'] = 0,
			['arms'] = 4,
			['pants_1'] = 24,   ['pants_2'] = 2,
			['shoes_1'] = 9,   ['shoes_2'] = 2,
			['helmet_1'] = 1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {  --fertig
			['tshirt_1'] = 46,  ['tshirt_2'] = 0,
			['torso_1'] = 172,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['bproof_1'] = 16,  ['bproof_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	ohnejacke_wear = {
		male = { --fertig
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 24,   ['pants_2'] = 2,
			['shoes_1'] = 51,   ['shoes_2'] = 0,
			['helmet_1'] = 1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = { --fertig
			['tshirt_1'] = 27,  ['tshirt_2'] = 1,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 57,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},

	fahrrad_wear = {
		male = { --fertig
			['tshirt_1'] = 66,  ['tshirt_2'] = 4,
			['torso_1'] = 4,   ['torso_2'] = 4,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 12,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = 49,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = { --fertig
			['tshirt_1'] = 13,  ['tshirt_2'] = 0,
			['torso_1'] = 84,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['bproof_1'] = 16,  ['bproof_2'] = 0,
			['arms'] = 14,
			['pants_1'] = 4,   ['pants_2'] = 9,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 47,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	bike_wear = {
		male = { --fertig
			['tshirt_1'] = 11,  ['tshirt_2'] = 0,
			['torso_1'] = 100,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 1,
			['pants_1'] = 32,   ['pants_2'] = 0,
			['shoes_1'] = 13,   ['shoes_2'] = 0,
			['helmet_1'] = 17,  ['helmet_2'] = 3,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 27,  ['tshirt_2'] = 1,
			['torso_1'] = 24,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 57,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},

	dienstkleidung_doj = {
		male = { --fertig
			['tshirt_1'] = 31,  ['tshirt_2'] = 0,
			['torso_1'] = 29,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 28,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = 26,  ['helmet_2'] = 0,
			['chain_1'] = 13,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 27,  ['tshirt_2'] = 1,
			['torso_1'] = 24,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 57,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	dienstkleidung_doj2 = {
		male = { --fertig
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 72,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 28,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = 26,  ['helmet_2'] = 0,
			['chain_1'] = 29,    ['chain_2'] = 2,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 27,  ['tshirt_2'] = 1,
			['torso_1'] = 24,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 57,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	dienstkleidung_doj_leitungsebene = {
		male = { --fertig
			['tshirt_1'] = 31,  ['tshirt_2'] = 0,
			['torso_1'] = 29,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 28,   ['pants_2'] = 0,
			['shoes_1'] = 10,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 11,    ['chain_2'] = 2,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 27,  ['tshirt_2'] = 1,
			['torso_1'] = 24,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 57,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	gilet_wear = {
		male = {
			['bproof_1'] = 10,  ['bproof_2'] = 0, --wichtig
		},
		female = {
			['bproof_1'] = 10,  ['bproof_2'] = 0,
		}
	}

}

