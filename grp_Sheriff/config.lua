Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = false -- enable if you're using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

	
Config.RemoveWeapon =true

Config.EnablePrice               = true
Config.Price                     = 1000

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'en'

Config.sheriffStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(2767.66, 3466.73, 50.50),
			Sprite  = 60,
			Display = 2,
			Scale   = 1.0,
			Colour  = 36
		},

		Cloakrooms = {
			vector3(1846.74, 3693.24, 34.27)
		},

		Armories = {
			vector3(1849.76, 3694.70, 30.27)
		},

		Vehicles = {
			{
				Spawner = vector3(1857.73, 3679.29, 33.75),

				InsideShop = vector3(1862.13, 3679.82, 33.68),
				SpawnPoints = {
					{ coords = vector3(1862.13, 3679.82, 33.68), heading = 216.63, radius = 6.0 },
					{ coords = vector3(1854.13, 3675.82, 33.68), heading = 216.63, radius = 6.0 },
					{ coords = vector3(1868.13, 3683.82, 33.68), heading = 216.63, radius = 6.0 },
					{ coords = vector3(1848.13, 3671.82, 33.68), heading = 216.63, radius = 6.0 }
				}
			},
		},
		Helicopters = {
			{
				Spawner = vector3(1835.22, 3639.22, 35.99),
				InsideShop = vector3(1840.22, 3635.22, 35.99),
				SpawnPoints = {
					{ coords = vector3(1840.22, 3635.22, 35.99), heading = 31.6, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(1857.06, 3689.77, 38.07)
		}

	}

}

Config.AuthorizedWeapons = {
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

Config.AuthorizedVehicles = {
	Shared = {
	{ model = 'pbus', label = 'Gefangenen Transport', livery = 1, price = 5000 }	
	},

	recruit = {
	{ model = 'sheriff', label = 'Sheriff Limo', livery = 1, price = 5000 },
	{ model = 'sheriff2', label = 'Sheriff SUV', livery = 1, price = 5000 }
		
	},

	officer = {
	{ model = 'sheriff', label = 'Sheriff Limo', livery = 1, price = 5000 },
	{ model = 'sheriff2', label = 'Sheriff SUV', livery = 1, price = 5000 }
	},

	sergeant = {
	{ model = 'sheriff', label = 'Sheriff Limo', livery = 1, price = 5000 },
	{ model = 'policeb', label = 'Sheriff Motorrad', livery = 1, price = 5000 },
	{ model = 'trualamo', label = 'Sheriff Undercover', price = 15000 },
	{ model = 'sheriff2', label = 'Sheriff SUV', livery = 1, price = 5000 }
	},

	intendent = {
	{ model = 'sheriff', label = 'Sheriff Limo', livery = 1, price = 5000 },
	{ model = 'policeb', label = 'Sheriff Motorrad', livery = 1, price = 5000 },
	{ model = 'trualamo', label = 'Sheriff Undercover', price = 15000 },
	{ model = 'kawasaki', label = 'Sheriff Kawasaki', livery = 1, price = 5000 },
	{ model = 'sheriff2', label = 'Sheriff SUV', livery = 1, price = 5000 }
	},

	lieutenant = {
	{ model = 'sheriff', label = 'Sheriff Limo', livery = 1, price = 5000 },
	{ model = 'policeb', label = 'Sheriff Motorrad', livery = 1, price = 5000 },
	{ model = 'trualamo', label = 'Sheriff Undercover', price = 15000 },
	{ model = 'kawasaki', label = 'Sheriff Kawasaki', livery = 1, price = 5000 },
	{ model = 'sheriff2', label = 'Sheriff SUV', livery = 1, price = 5000 }
	},

	swat = {
	{ model = 'sheriff', label = 'Sheriff Limo', livery = 1, price = 5000 },
	{ model = 'policeb', label = 'Sheriff Motorrad', livery = 1, price = 5000 },
	{ model = 'trualamo', label = 'Sheriff Undercover', price = 15000 },
	{ model = 'kawasaki', label = 'Sheriff Kawasaki', livery = 1, price = 5000 },
	{ model = 'sheriff2', label = 'Sheriff SUV', livery = 1, price = 5000 }
	},

	capitan = {
	{ model = 'sheriff', label = 'Sheriff Limo', livery = 1, price = 5000 },
	{ model = 'policeb', label = 'Sheriff Motorrad', livery = 1, price = 5000 },
	{ model = 'trualamo', label = 'Sheriff Undercover', price = 15000 },
	{ model = 'kawasaki', label = 'Sheriff Kawasaki', livery = 1, price = 5000 },
	{ model = 'sheriff2', label = 'Sheriff SUV', livery = 1, price = 5000 }

	},

	commander = {
	{ model = 'sheriff', label = 'Sheriff Limo', livery = 1, price = 5000 },
	{ model = 'policeb', label = 'Sheriff Motorrad', livery = 1, price = 5000 },
	{ model = 'trualamo', label = 'Sheriff Undercover', price = 15000 },
	{ model = 'kawasaki', label = 'Sheriff Kawasaki', livery = 1, price = 5000 },
	{ model = 'sheriff2', label = 'Sheriff SUV', livery = 1, price = 5000 }
	},

	chef = {
	{ model = 'sheriff', label = 'Sheriff Limo', livery = 1, price = 5000 },
	{ model = 'policeb', label = 'Sheriff Motorrad', livery = 1, price = 5000 },
	{ model = 'trualamo', label = 'Sheriff Undercover', price = 15000 },
	{ model = 'kawasaki', label = 'Sheriff Kawasaki', livery = 1, price = 5000 },
	{ model = 'sheriff2', label = 'Sheriff SUV', livery = 1, price = 5000 }
	},

	rang10 = {
	{ model = 'sheriff', label = 'Sheriff Limo', livery = 1, price = 5000 },
	{ model = 'policeb', label = 'Sheriff Motorrad', livery = 1, price = 5000 },
	{ model = 'trualamo', label = 'Sheriff Undercover', price = 15000 },
	{ model = 'kawasaki', label = 'Sheriff Kawasaki', livery = 1, price = 5000 },
	{ model = 'sheriff2', label = 'Sheriff SUV', livery = 1, price = 5000 }
	},

	rang11 = {
	{ model = 'sheriff', label = 'Sheriff Limo', livery = 1, price = 5000 },
	{ model = 'policeb', label = 'Sheriff Motorrad', livery = 1, price = 5000 },
	{ model = 'trualamo', label = 'Sheriff Undercover', price = 15000 },
	{ model = 'kawasaki', label = 'Sheriff Kawasaki', livery = 1, price = 5000 },
	{ model = 'sheriff2', label = 'Sheriff SUV', livery = 1, price = 5000 }
	},

	boss = {
	{ model = 'sheriff', label = 'Sheriff Limo', livery = 1, price = 5000 },
	{ model = 'policeb', label = 'Sheriff Motorrad', livery = 1, price = 5000 },
	{ model = 'trualamo', label = 'Sheriff Undercover', price = 15000 },
	{ model = 'kawasaki', label = 'Sheriff Kawasaki', livery = 1, price = 5000 },
	{ model = 'sheriff2', label = 'Sheriff SUV', livery = 1, price = 5000 }
	}
}

Config.AuthorizedHelicopters = {
	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	lieutenant = {},

	swat = {
	},

	capitan = {
		{ model = 'as350', label = 'Police Maverick', livery = 0, price = 30000 }
	},

	commander = {
		{ model = 'as350', label = 'Police Maverick', livery = 0, price = 30000 }
	},

	chef = {
		{ model = 'as350', label = 'Police Maverick', livery = 0, price = 30000 }
	},

	rang10 = {
		{ model = 'as350', label = 'Police Maverick', livery = 0, price = 30000 }
	},

	rang11 = {
		{ model = 'as350', label = 'Police Maverick', livery = 0, price = 30000 }
	},

	boss = {
		{ model = 'as350', label = 'Police Maverick', livery = 0, price = 30000 }
	}
}



Config.Uniforms = {
	bullet_wear = {  --standart
		male = {
			['tshirt_1'] = 42,  ['tshirt_2'] = 0,
			['torso_1'] = 166,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 1,
			['pants_1'] = 22,   ['pants_2'] = 0,
			['shoes_1'] = 2,   ['shoes_2'] = 0,
			['helmet_1'] = 33,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 31,  ['tshirt_2'] = 0,
			['torso_1'] = 163,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 7,
			['pants_1'] = 27,   ['pants_2'] = 0,
			['shoes_1'] = 62,   ['shoes_2'] = 20,
			['helmet_1'] = 32,  ['helmet_2'] = 0,
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
		male = { --fertig sheriff
			['tshirt_1'] = 72,  ['tshirt_2'] = 1,
			['torso_1'] = 103,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 1,
			['pants_1'] = 22,   ['pants_2'] = 0,
			['shoes_1'] = 2,   ['shoes_2'] = 0,
			['helmet_1'] = 33,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 31,  ['tshirt_2'] = 0,
			['torso_1'] = 163,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 7,
			['pants_1'] = 27,   ['pants_2'] = 0,
			['shoes_1'] = 62,   ['shoes_2'] = 20,
			['helmet_1'] = 32,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},
	ohnejacke_wear = {
		male = { --fertig sheriff
			['tshirt_1'] = 42,  ['tshirt_2'] = 0,
			['torso_1'] = 166,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 1,
			['pants_1'] = 22,   ['pants_2'] = 0,
			['shoes_1'] = 2,   ['shoes_2'] = 0,
			['helmet_1'] = 33,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		},
		female = {
			['tshirt_1'] = 31,  ['tshirt_2'] = 0,
			['torso_1'] = 163,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 7,
			['pants_1'] = 27,   ['pants_2'] = 0,
			['shoes_1'] = 62,   ['shoes_2'] = 20,
			['helmet_1'] = 32,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0
		}
	},

	fahrrad_wear = {
		male = { --fertig
			['tshirt_1'] = 49,  ['tshirt_2'] = 0,
			['torso_1'] = 93,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['bproof_1'] = 14,  ['bproof_2'] = 0,
			['arms'] = 19,
			['pants_1'] = 12,   ['pants_2'] = 0,
			['shoes_1'] = 2,   ['shoes_2'] = 0,
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
			['tshirt_1'] = 20,  ['tshirt_2'] = 0,
			['torso_1'] = 200,   ['torso_2'] = 2,
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
	gilet_wear = {
		male = {
			['bproof_1'] = 10,  ['bproof_2'] = 0, --wichtig
		},
		female = {
			['bproof_1'] = 10,  ['bproof_2'] = 0,
		}
	}

}

