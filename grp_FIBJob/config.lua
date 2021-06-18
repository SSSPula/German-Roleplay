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
			vector3(132.35, -769.6, 242.15)
		},

		Armories = {
			--bt target shit 
		},

		Vehicles = {
			{
				Spawner = vector3(103.18,-720.19,33.13),
				InsideShop = vector3(103.18,-720.19,33.13),
				SpawnPoints = {
					{ coords = vector3(111.57,-723.7,33.13), heading = 249.35, radius = 6.0 },
					{ coords = vector3(124.68,-728.68,33.13), heading = 249.35, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-75.62, -818.04, 326.18),
				InsideShop = vector3(-75.62, -818.04, 326.18),
				SpawnPoints = {
					{coords = vector3(-75.62, -818.04, 326.18), heading = 199.13, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(124.56,-733.33,242.15)
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
	--	{ model = 'kamacho', label = 'fib Kamacho', price = 1 },
	--	{ model = 'dbx', label = 'fib Aston Martin', price = 1 },
	--	{ model = 'lp700', label = 'fib Lamborghini', price = 1 },
	--	{ model = 'm4f82', label = 'fib M4', price = 20000000 },		
	--	{ model = 'rmodx6', label = 'fib BMW X6', price = 1 },
	--	{ model = 'demon', label = 'fib Challenger', price = 1 },
	--	{ model = 'bmwm8', label = 'fib BMW M8', price = 1 },
	--	{ model = 'm3e36', label = 'fib M3 E36', price = 1 },
	--	{ model = 'penumbra', label = 'fib 370z', price = 1 },
	--	{ model = 'g65amg', label = 'fib G 65', price = 1 },
	--	{ model = 'pol718', label = 'fib Cop Porsche', price = 1 },
	--	{ model = 'ghispo2', label = 'fib Cop Maserati', price = 1 },
	--	{ model = 'dodgeEMS', label = 'fib Medic Dodge', price = 1 },
	--	{ model = 'ambulance', label = 'fib Krankenwagen', price = 1 },
	--	{ model = 'amggt63s', label = 'fib GT63', price = 1 },
	--	{ model = 'zx10', label = 'fib Bike', price = 1 },
	--	{ model = 'schlagen', label = 'fib Schlagen', price = 1 },
		{ model = 'fbi', label = 'Fib Dienstfahrzeug I', price = 1 },
		{ model = 'fbi2', label = 'Fib Dienstfahrzeug II', price = 1 },
		--{ model = 'stretch', label = 'fib Stretch', price = 1 },
		--{ model = 'boxville2', label = 'fib boxville', price = 1 },
		{ model = 'trualamo', label = 'Fib Undercover', price = 1 },
		{ model = 'police4', label = 'FIB Unmarked', price = 1 }
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
--	recruit = {
--		{model = 'submersible', label = 'fib uboot', props = {modLivery = 0}, price = 1}
--		
--	},
--
--	officer = {
--		{model = 'submersible', label = 'fib uboot', props = {modLivery = 0}, price = 1}
--	},
--
--	sergeant = {
--		{model = 'submersible', label = 'fib uboot', props = {modLivery = 0}, price = 1}
--	},
--
--	intendent = {
--		{model = 'submersible', label = 'fib uboot', props = {modLivery = 0}, price = 1}
--	},
--
--	lieutenant = {
--		{model = 'submersible', label = 'fib uboot', props = {modLivery = 0}, price = 1}
--	},
--
--	chef = {
--		{model = 'submersible', label = 'fib uboot', props = {modLivery = 0}, price = 1}
--	},
--
--	boss = {
--		{model = 'submersible', label = 'fib uboot', props = {modLivery = 0}, price = 1}
--	}
}

Config.AuthorizedHelicopters = {
	recruit = {
		{model = 'buzzard2', label = 'fib buzzard', props = {modLivery = 0}, price = 1},
		{model = 'frogger', label = 'fib frogger', props = {modLivery = 0}, price = 1}
		
	},

	officer = {
		{model = 'buzzard2', label = 'fib buzzard', props = {modLivery = 0}, price = 1},
		{model = 'frogger', label = 'fib frogger', props = {modLivery = 0}, price = 1}
	},

	sergeant = {
		{model = 'buzzard2', label = 'fib buzzard', props = {modLivery = 0}, price = 1},
		{model = 'frogger', label = 'fib frogger', props = {modLivery = 0}, price = 1}
	},

	intendent = {
		{model = 'buzzard2', label = 'fib buzzard', props = {modLivery = 0}, price = 1},
		{model = 'frogger', label = 'fib frogger', props = {modLivery = 0}, price = 1}
	},

	lieutenant = {
		{model = 'buzzard2', label = 'fib buzzard', props = {modLivery = 0}, price = 1},
		{model = 'frogger', label = 'fib frogger', props = {modLivery = 0}, price = 1}
	},

	chef = {
		{model = 'buzzard2', label = 'fib buzzard', props = {modLivery = 0}, price = 1},
		{model = 'frogger', label = 'fib frogger', props = {modLivery = 0}, price = 1}
	},

	boss = {
		{model = 'buzzard2', label = 'fib buzzard', props = {modLivery = 0}, price = 1},
		{model = 'frogger', label = 'fib frogger', props = {modLivery = 0}, price = 1}
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