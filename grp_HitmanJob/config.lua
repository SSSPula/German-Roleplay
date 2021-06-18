Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale = 'de'

Config.PoliceStations = {

	Lcn = {

		Cloakrooms = {
			vector3(-2093.68, -1013.67, 5.88)
		},

		Armories = {
			vector3(-788.86, 320.87, 187.31)
		},

		Vehicles = {
			{
				Spawner = vector3(-1560.73,-907.86,9.15),
				InsideShop = vector3(-1569.96,-907.66,8.39),
				SpawnPoints = {
					{ coords = vector3(-1569.96,-907.66,8.39), heading = 91.35, radius = 6.0 },
					{ coords = vector3(-1559.96,-900.66,9.12), heading = 52.35, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-2049.07, -1029.57, 11.91),
				InsideShop = vector3(-2044.03, -1031.43, 10.98),
				SpawnPoints = {
					{coords = vector3(-2044.03, -1031.43, 10.98), heading = 250.35, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(-792.22,330.01,186.31)
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

	chef = {
		
		
	},

	boss = {
		
		
	}
}

Config.AuthorizedVehicles = {
	Shared = {
		{ model = 'kamacho', label = 'Hitman Kamacho', price = 1 },
		{ model = 'dbx', label = 'Hitman Aston Martin', price = 1 },
		{ model = 'lp700', label = 'Hitman Lamborghini', price = 1 },
		{ model = 'm4f82', label = 'Hitman M4', price = 20000000 },		
		{ model = 'rmodx6', label = 'Hitman BMW X6', price = 1 },
		{ model = 'demon', label = 'Hitman Challenger', price = 1 },
		{ model = 'bmwm8', label = 'Hitman BMW M8', price = 1 },
		{ model = 'm3e36', label = 'Hitman M3 E36', price = 1 },
		{ model = 'penumbra', label = 'Hitman 370z', price = 1 },
		{ model = 'g65amg', label = 'Hitman G 65', price = 1 },
		{ model = 'pol718', label = 'Hitman Cop Porsche', price = 1 },
		{ model = 'ghispo2', label = 'Hitman Cop Maserati', price = 1 },
		{ model = 'dodgeEMS', label = 'Hitman Medic Dodge', price = 1 },
		{ model = 'ambulance', label = 'Hitman Krankenwagen', price = 1 },
		{ model = 'amggt63s', label = 'Hitman GT63', price = 1 },
		{ model = 'zx10', label = 'Hitman Bike', price = 1 },
		{ model = 'schlagen', label = 'Hitman Schlagen', price = 1 },
		{ model = 'schwarzer', label = 'Hitman Schwarzer', price = 1 },
		{ model = 'stretch', label = 'Hitman Stretch', price = 1 },
		{ model = 'boxville2', label = 'Hitman boxville', price = 1 },
		{ model = 'lectro', label = 'Hitman Lectro', price = 1 }
	},

	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	lieutenant = {},

	chef = {},

	boss = {}
}

Config.AuthorizedBoats = {
	recruit = {
		{model = 'submersible', label = 'Hitman uboot', props = {modLivery = 0}, price = 1}
		
	},

	officer = {
		{model = 'submersible', label = 'Hitman uboot', props = {modLivery = 0}, price = 1}
	},

	sergeant = {
		{model = 'submersible', label = 'Hitman uboot', props = {modLivery = 0}, price = 1}
	},

	intendent = {
		{model = 'submersible', label = 'Hitman uboot', props = {modLivery = 0}, price = 1}
	},

	lieutenant = {
		{model = 'submersible', label = 'Hitman uboot', props = {modLivery = 0}, price = 1}
	},

	chef = {
		{model = 'submersible', label = 'Hitman uboot', props = {modLivery = 0}, price = 1}
	},

	boss = {
		{model = 'submersible', label = 'Hitman uboot', props = {modLivery = 0}, price = 1}
	}
}

Config.AuthorizedHelicopters = {
	recruit = {
		{model = 'buzzard2', label = 'Hitman buzzard', props = {modLivery = 0}, price = 1},
		{model = 'havok', label = 'Hitman havok', props = {modLivery = 0}, price = 1}
		
	},

	officer = {
		{model = 'buzzard2', label = 'Hitman buzzard', props = {modLivery = 0}, price = 1},
		{model = 'havok', label = 'Hitman havok', props = {modLivery = 0}, price = 1}
	},

	sergeant = {
		{model = 'buzzard2', label = 'Hitman buzzard', props = {modLivery = 0}, price = 1},
		{model = 'havok', label = 'Hitman havok', props = {modLivery = 0}, price = 1}
	},

	intendent = {
		{model = 'buzzard2', label = 'Hitman buzzard', props = {modLivery = 0}, price = 1},
		{model = 'havok', label = 'Hitman havok', props = {modLivery = 0}, price = 1}
	},

	lieutenant = {
		{model = 'buzzard2', label = 'Hitman buzzard', props = {modLivery = 0}, price = 1},
		{model = 'havok', label = 'Hitman havok', props = {modLivery = 0}, price = 1}
	},

	chef = {
		{model = 'buzzard2', label = 'Hitman buzzard', props = {modLivery = 0}, price = 1},
		{model = 'havok', label = 'Hitman havok', props = {modLivery = 0}, price = 1}
	},

	boss = {
		{model = 'buzzard2', label = 'Hitman buzzard', props = {modLivery = 0}, price = 1},
		{model = 'havok', label = 'Hitman havok', props = {modLivery = 0}, price = 1}
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {},
	officer_wear = {},
	sergeant_wear = {},
	intendent_wear = {},
	lieutenant_wear = {},
	chef_wear = {},
	boss_wear = { },
	bullet_wear = {
		male = {
			
		},
		female = {
			
		}
	},
	gilet_wear = {
		male = {
			
		},
		female = {
			
		}
	}

}