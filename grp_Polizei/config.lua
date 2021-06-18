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

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(444.95, -981.95, 30.7),
			Sprite  = 60,
			Display = 2,
			Scale   = 1.0,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(460.51, -998.91, 30.69)
		},

		Armories = {
			vector3(479.23, -996.69, 0.69) --30 Z
		},

		Vehicles = {
			{
				Spawner = vector3(452.37, -1019.35, 28.42),

				InsideShop = vector3(462.56, -1015.54, 40.02),
				SpawnPoints = {
					{ coords = vector3(448.44, -1015.93, 28.77), heading = 91.63, radius = 6.0 },
					{ coords = vector3(449.25, -1024.37, 28.69), heading = 6.28, radius = 6.0 },
					{ coords = vector3(438.32, -1025.52, 28.93), heading = 5.93, radius = 6.0 }
				}
			},
		},
		--	{
		--		Spawner = vector3(473.3, -1018.8, -100.0),
		--		InsideShop = vector3(228.5, -993.5, -99.0),
		--		SpawnPoints = {
		--			{ coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 6.0 },
		--			{ coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0 }
		--		}
		--	}
		--},

		Helicopters = {
			{
				Spawner = vector3(461.1, -981.5, 43.6),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{ coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(463.12, -985.34, 30.73)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 70 },
		{ weapon = 'WEAPON_ASSAULTSMG', price = 0 },
		{ weapon = 'WEAPON_FLARE', price = 0 },		
		{ weapon = 'WEAPON_STUNGUN', price = 0 }
	},

	officer = {
		{ weapon = 'WEAPON_HEAVYPISTOL', price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 70 },
		{ weapon = 'WEAPON_ASSAULTSMG', price = 0 },	
		{ weapon = 'WEAPON_FLARE', price = 0 },		
		{ weapon = 'WEAPON_STUNGUN', price = 0 }
	},

	sergeant = {
		
		{ weapon = 'WEAPON_HEAVYPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 70 },
		{ weapon = 'WEAPON_ASSAULTSMG', price = 0 },	
		{ weapon = 'WEAPON_FLARE', price = 0 },		
		{ weapon = 'WEAPON_STUNGUN', price = 0 }
	},

	intendent = {
		
		{ weapon = 'WEAPON_HEAVYPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 70 },
		{ weapon = 'WEAPON_ASSAULTSMG', price = 0 },	
		{ weapon = 'WEAPON_FLARE', price = 0 },		
		{ weapon = 'WEAPON_STUNGUN', price = 0 }
	},

	lieutenant = {
		
		{ weapon = 'WEAPON_HEAVYPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 70 },
		{ weapon = 'WEAPON_ASSAULTSMG', price = 0 },	
		{ weapon = 'WEAPON_FLARE', price = 0 },		
		{ weapon = 'WEAPON_STUNGUN', price = 0 }
	},

	swat = {
		
		{ weapon = 'WEAPON_HEAVYPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 70 },
		{ weapon = 'WEAPON_ASSAULTSMG', price = 0 },	
		{ weapon = 'WEAPON_FLARE', price = 0 },		
		{ weapon = 'WEAPON_STUNGUN', price = 0 }
	},

	capitan = {
		
		{ weapon = 'WEAPON_HEAVYPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 70 },
		{ weapon = 'WEAPON_ASSAULTSMG', price = 0 },	
		{ weapon = 'WEAPON_FLARE', price = 0 },		
		{ weapon = 'WEAPON_STUNGUN', price = 0 }
	},

	commander = {
		
		{ weapon = 'WEAPON_HEAVYPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 70 },
		{ weapon = 'WEAPON_ASSAULTSMG', price = 0 },	
		{ weapon = 'WEAPON_FLARE', price = 0 },		
		{ weapon = 'WEAPON_STUNGUN', price = 0 }
	},

	chef = {
		
		{ weapon = 'WEAPON_HEAVYPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 70 },
		{ weapon = 'WEAPON_ASSAULTSMG', price = 0 },	
		{ weapon = 'WEAPON_FLARE', price = 0 },		
		{ weapon = 'WEAPON_STUNGUN', price = 0 }
	},

	rang10 = {
		
		{ weapon = 'WEAPON_HEAVYPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 70 },
		{ weapon = 'WEAPON_ASSAULTSMG', price = 0 },	
		{ weapon = 'WEAPON_FLARE', price = 0 },		
		{ weapon = 'WEAPON_STUNGUN', price = 0 }
	},

	rang11 = {
		
		{ weapon = 'WEAPON_HEAVYPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 70 },
		{ weapon = 'WEAPON_ASSAULTSMG', price = 0 },	
		{ weapon = 'WEAPON_FLARE', price = 0 },			
		{ weapon = 'WEAPON_STUNGUN', price = 0 }
	},

	boss = {
		
		{ weapon = 'WEAPON_HEAVYPISTOL', components = { 0, 0, 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 0, 0, nil }, price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 70 },
		{ weapon = 'WEAPON_ASSAULTSMG', price = 0 },	
		{ weapon = 'WEAPON_FLARE', price = 0 },			
		{ weapon = 'WEAPON_STUNGUN', price = 0 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {
	{ model = 'pbus', label = 'Gefangenen Transport', livery = 1, price = 5000 },
	{ model = 'ghispo2', label = 'Polizei Maserati Ghibli', livery = 1, price = 5000 },
	{ model = 'police', label = 'Polizei Rekrut Vapid', livery = 1, price = 5000 }
	--{ model = 'policet', label = 'Polizei Van', livery = 1, price = 5000 }
	
	},

	recruit = {
	{ model = 'police', label = 'Polizei Rekrut Vapid', livery = 1, price = 5000 }
		
	},

	officer = {
	{ model = 'police4', label = 'Polizei Ford', livery = 1, price = 5000 },
	{ model = 'police2', label = 'Polizei Vapid Cruiser', livery = 1, price = 5000 }
	--{ model = 'police5', label = 'Polizei Ford Van', livery = 1, price = 5000 },
	--{ model = 'police6', label = 'Polizei Ford SUV K9', livery = 1, price = 5000 }
	},

	sergeant = {
	{ model = 'police4', label = 'Polizei Ford', livery = 1, price = 5000 },
	{ model = 'police2', label = 'Polizei Vapid Cruiser', livery = 1, price = 5000 },
--	{ model = 'police5', label = 'Polizei Ford Van', livery = 1, price = 5000 },
	{ model = 'trualamo', label = 'Polizei Undercover', price = 15000 },

--	{ model = 'police5', label = 'Polizei Ford Van', livery = 1, price = 5000 },

	{ model = 'riot', label = 'Swat gepanzert', livery = 1, price = 5000 }
--	{ model = 'police6', label = 'Polizei Ford SUV K9', livery = 1, price = 5000 }	
	},

	intendent = {
	{ model = 'police4', label = 'Polizei Ford', livery = 1, price = 5000 },
--	{ model = 'police5', label = 'Polizei Ford Van', livery = 1, price = 5000 },
--	{ model = 'police5', label = 'Polizei Ford Van', livery = 1, price = 5000 },
	{ model = 'riot', label = 'Swat gepanzert', livery = 1, price = 5000 },
	{ model = 'police2', label = 'Polizei Vapid Cruiser', livery = 1, price = 5000 },
	{ model = 'trualamo', label = 'Polizei Undercover', price = 15000 },
--	{ model = 'police6', label = 'Polizei Ford SUV K9', livery = 1, price = 5000 },
	{ model = 'bcat', label = 'Polizei Swat', livery = 1, price = 5000 }	
	},

	lieutenant = {
	{ model = 'police4', label = 'Polizei Ford', livery = 1, price = 5000 },
	{ model = 'police2', label = 'Polizei Vapid Cruiser', livery = 1, price = 5000 },
	{ model = 'kawasaki', label = 'Polizei Kawasaki', livery = 1, price = 5000 },
--	{ model = 'police5', label = 'Polizei Ford Van', livery = 1, price = 5000 },
--	{ model = 'police5', label = 'Polizei Ford Van', livery = 1, price = 5000 },
	{ model = 'riot', label = 'Swat gepanzert', livery = 1, price = 5000 },
	{ model = 'trualamo', label = 'Polizei Undercover', price = 15000 },
	--{ model = 'police6', label = 'Polizei Ford SUV K9', livery = 1, price = 5000 },
	--{ model = 'ucballer', label = 'Undercover Baller', livery = 1, price = 5000 },
	--{ model = 'uccomet', label = 'Undercover Comet', livery = 1, price = 5000 },
	--{ model = 'uccoquette', label = 'Undercover Coquette', livery = 1, price = 5000 },
	--{ model = 'ucprimo', label = 'Undercover Primo', livery = 1, price = 5000 },
	--{ model = 'ucrancher', label = 'Undercover Rancher', livery = 1, price = 5000 },
	{ model = 'bcat', label = 'Polizei Swat', livery = 1, price = 5000 }
	},

	swat = {
	{ model = 'police4', label = 'Polizei Ford', livery = 1, price = 5000 },
	{ model = 'police2', label = 'Polizei Vapid Cruiser', livery = 1, price = 5000 },
	{ model = 'kawasaki', label = 'Polizei Kawasaki', livery = 1, price = 5000 },
--	{ model = 'police5', label = 'Polizei Ford Van', livery = 1, price = 5000 },
--	{ model = 'police5', label = 'Polizei Ford Van', livery = 1, price = 5000 },
	{ model = 'riot', label = 'Swat gepanzert', livery = 1, price = 5000 },
	{ model = 'trualamo', label = 'Polizei Undercover', price = 15000 },
--	{ model = 'police6', label = 'Polizei Ford SUV K9', livery = 1, price = 5000 },
	--{ model = 'ucballer', label = 'Undercover Baller', livery = 1, price = 5000 },
	--{ model = 'uccomet', label = 'Undercover Comet', livery = 1, price = 5000 },
	--{ model = 'uccoquette', label = 'Undercover Coquette', livery = 1, price = 5000 },
	--{ model = 'ucprimo', label = 'Undercover Primo', livery = 1, price = 5000 },
	--{ model = 'ucrancher', label = 'Undercover Rancher', livery = 1, price = 5000 },
	{ model = 'bcat', label = 'Polizei Swat', livery = 1, price = 5000 }
	},

	capitan = {
	--{ model = 'fdsuv', label = 'Jeep', livery = 1, price = 5000 },
	{ model = 'police4', label = 'Polizei Ford', livery = 1, price = 5000 },
	{ model = 'police2', label = 'Polizei Vapid Cruiser', livery = 1, price = 5000 },
	{ model = 'kawasaki', label = 'Polizei Kawasaki', livery = 1, price = 5000 },
	{ model = 'trualamo', label = 'Polizei Undercover', price = 15000 },
--	{ model = 'police5', label = 'Polizei Ford Van', livery = 1, price = 5000 },
--	{ model = 'police5', label = 'Polizei Ford Van', livery = 1, price = 5000 },
	{ model = 'riot', label = 'Swat gepanzert', livery = 1, price = 5000 },
--	{ model = 'police6', label = 'Polizei Ford SUV K9', livery = 1, price = 5000 },
	--{ model = 'ucballer', label = 'Undercover Baller', livery = 1, price = 5000 },
	--{ model = 'uccomet', label = 'Undercover Comet', livery = 1, price = 5000 },
	--{ model = 'uccoquette', label = 'Undercover Coquette', livery = 1, price = 5000 },
	--{ model = 'ucprimo', label = 'Undercover Primo', livery = 1, price = 5000 },
	--{ model = 'ucrancher', label = 'Undercover Rancher', livery = 1, price = 5000 },
	{ model = 'bcat', label = 'Polizei Swat', livery = 1, price = 5000 }

	},

	commander = {
--	{ model = 'fdsuv', label = 'Jeep', livery = 1, price = 5000 },
	{ model = 'police4', label = 'Polizei Ford', livery = 1, price = 5000 },
--	{ model = 'police5', label = 'Polizei Ford Van', livery = 1, price = 5000 },
--	{ model = 'police5', label = 'Polizei Ford Van', livery = 1, price = 5000 },
	{ model = 'kawasaki', label = 'Polizei Kawasaki', livery = 1, price = 5000 },
	{ model = 'riot', label = 'Swat gepanzert', livery = 1, price = 5000 },
	{ model = 'police2', label = 'Polizei Vapid Cruiser', livery = 1, price = 5000 },
	{ model = 'trualamo', label = 'Polizei Undercover', price = 15000 },
--	{ model = 'police6', label = 'Polizei Ford SUV K9', livery = 1, price = 5000 },
	--{ model = 'ucballer', label = 'Undercover Baller', livery = 1, price = 5000 },
	--{ model = 'uccomet', label = 'Undercover Comet', livery = 1, price = 5000 },
	--{ model = 'uccoquette', label = 'Undercover Coquette', livery = 1, price = 5000 },
	--{ model = 'ucprimo', label = 'Undercover Primo', livery = 1, price = 5000 },
	--{ model = 'ucrancher', label = 'Undercover Rancher', livery = 1, price = 5000 },
	{ model = 'pol718', label = 'Polizei Porsche 718', livery = 1, price = 25000 },
	{ model = 'bcat', label = 'Polizei Swat', livery = 1, price = 5000 }

	},

	chef = {
--	{ model = 'fdsuv', label = 'Jeep', livery = 1, price = 5000 },
	{ model = 'police4', label = 'Polizei Ford', livery = 1, price = 5000 },
	{ model = 'kawasaki', label = 'Polizei Kawasaki', livery = 1, price = 5000 },
--	{ model = 'police5', label = 'Polizei Ford Van', livery = 1, price = 5000 },
--	{ model = 'police5', label = 'Polizei Ford Van', livery = 1, price = 5000 },
	{ model = 'riot', label = 'Swat gepanzert', livery = 1, price = 5000 },
	{ model = 'trualamo', label = 'Polizei Undercover', price = 15000 },
	{ model = 'police2', label = 'Polizei Vapid Cruiser', livery = 1, price = 5000 },
--	{ model = 'police6', label = 'Polizei Ford SUV K9', livery = 1, price = 5000 },
--	{ model = 'ucballer', label = 'Undercover Baller', livery = 1, price = 5000 },
--	{ model = 'uccomet', label = 'Undercover Comet', livery = 1, price = 5000 },
--	{ model = 'uccoquette', label = 'Undercover Coquette', livery = 1, price = 5000 },
--	{ model = 'ucprimo', label = 'Undercover Primo', livery = 1, price = 5000 },
--	{ model = 'ucrancher', label = 'Undercover Rancher', livery = 1, price = 5000 },
	{ model = 'pol718', label = 'Polizei Porsche 718', livery = 1, price = 25000 },
	{ model = 'bcat', label = 'Polizei Swat', livery = 1, price = 5000 }


	},

	rang10 = {
--	{ model = 'fdsuv', label = 'Jeep', livery = 1, price = 5000 },
	{ model = 'police4', label = 'Polizei Ford', livery = 1, price = 5000 },
	{ model = 'police2', label = 'Polizei Vapid Cruiser', livery = 1, price = 5000 },
--	{ model = 'police5', label = 'Polizei Ford Van', livery = 1, price = 5000 },
--	{ model = 'police5', label = 'Polizei Ford Van', livery = 1, price = 5000 },
	{ model = 'riot', label = 'Swat gepanzert', livery = 1, price = 5000 },
--	{ model = 'police6', label = 'Polizei Ford SUV K9', livery = 1, price = 5000 },
--	{ model = 'ucballer', label = 'Undercover Baller', livery = 1, price = 5000 },
--	{ model = 'uccomet', label = 'Undercover Comet', livery = 1, price = 5000 },
--	{ model = 'uccoquette', label = 'Undercover Coquette', livery = 1, price = 5000 },
--	{ model = 'ucprimo', label = 'Undercover Primo', livery = 1, price = 5000 },
--	{ model = 'ucrancher', label = 'Undercover Rancher', livery = 1, price = 5000 },
	{ model = 'pol718', label = 'Polizei Porsche 718', livery = 1, price = 25000 },
	{ model = 'bcat', label = 'Polizei Swat', livery = 1, price = 5000 }
	},

	rang11 = {
--	{ model = 'fdsuv', label = 'Jeep', livery = 1, price = 5000 },
	{ model = 'police4', label = 'Polizei Ford', livery = 1, price = 5000 },
	{ model = 'police2', label = 'Polizei Vapid Cruiser', livery = 1, price = 5000 },
	{ model = 'riot', label = 'Swat gepanzert', livery = 1, price = 5000 },
--	{ model = 'ucballer', label = 'Undercover Baller', livery = 1, price = 5000 },
--	{ model = 'uccomet', label = 'Undercover Comet', livery = 1, price = 5000 },
--	{ model = 'uccoquette', label = 'Undercover Coquette', livery = 1, price = 5000 },
--	{ model = 'ucprimo', label = 'Undercover Primo', livery = 1, price = 5000 },
--	{ model = 'ucrancher', label = 'Undercover Rancher', livery = 1, price = 5000 },
	{ model = 'pol718', label = 'Polizei Porsche 718', livery = 1, price = 25000 },
	{ model = 'bcat', label = 'Polizei Swat', livery = 1, price = 5000 }
	},

	boss = {
--		{ model = 'fdsuv', label = 'Jeep', livery = 1, price = 5000 },
		{ model = 'police4', label = 'Polizei Ford', livery = 1, price = 5000 },
		{ model = 'police2', label = 'Polizei Vapid Cruiser', livery = 1, price = 5000 },
		{ model = 'riot', label = 'Swat gepanzert', livery = 1, price = 5000 },
	--	{ model = 'ucballer', label = 'Undercover Baller', livery = 1, price = 5000 },
	--	{ model = 'uccomet', label = 'Undercover Comet', livery = 1, price = 5000 },
	--	{ model = 'uccoquette', label = 'Undercover Coquette', livery = 1, price = 5000 },
	--	{ model = 'ucprimo', label = 'Undercover Primo', livery = 1, price = 5000 },
	--	{ model = 'ucrancher', label = 'Undercover Rancher', livery = 1, price = 5000 },
		{ model = 'pol718', label = 'Polizei Porsche 718', livery = 1, price = 25000 },
		{ model = 'bcat', label = 'Polizei Swat', livery = 1, price = 5000 }
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
		{ model = 'polmav', label = 'Police Classic', livery = 0, price = 30000 },
		{ model = 'as350', label = 'Police Maverick', livery = 0, price = 30000 }
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
			['tshirt_1'] = 122,  ['tshirt_2'] = 0,
			['torso_1'] = 200,   ['torso_2'] = 8,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 32,   ['pants_2'] = 1,
			['shoes_1'] = 13,   ['shoes_2'] = 0,
			['helmet_1'] = 52,  ['helmet_2'] = 0,
			['bproof_1'] = 12,  ['bproof_2'] = 3,
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

