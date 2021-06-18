Config                            = {}
Config.DrawDistance               = 50.0
Config.MarkerColor                = { r = 120, g = 120, b = 240 }
Config.EnablePlayerManagement     = true  -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.EnableOwnedVehicles        = true
Config.EnableSocietyOwnedVehicles = false -- use with EnablePlayerManagement disabled, or else it wont have any effects

Config.Finance			  = false -- using Cryptos esx_finance?
Config.LicensePlate 		  = false  -- using jsfour-licenseplate?

Config.Locale                     = 'en'

Config.PlateLetters  = 3
Config.PlateNumbers  = 3
Config.PlateUseSpace = true

Config.Zones = {

	ShopEntering = {
		Pos   = { x = -34.36, y = -1100.04, z = 0.42 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = 1,
	},

	ShopInside = {
		Pos     = { x = -46.37, y = -1098.23, z = 0.42 },
		Size    = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = 296.13,
		Type    = -1,
	},

	ShopOutside = {
		Pos     = { x = -27.88, y = -1082.62, z = 0.61 },
		Size    = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = 39.0,
		Type    = -1,
	},

	BossActions = {
		Pos   = { x = -31.07, y = -1113.39, z = 0.43 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1,
	},

	GiveBackVehicle = {
		Pos   = { x = -37.64, y = -1088.13, z = 1.42 },
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Type  = (Config.EnablePlayerManagement and 1 or -1),
	},
--noch machen
	BlankPlate = {
		Pos   = { x = 1828.59, y = 2544.57, z = 0.88 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1,
	},

	MakePlate = {
		Pos   = { x = -1134.8, y = -1696.98, z = 0.45 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1,
	}

}

