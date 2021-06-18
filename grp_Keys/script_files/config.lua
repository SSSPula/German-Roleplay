Config = {}


Config.RegisterKeyPrice 	= 55000		
Config.KeyPayBankMoney		= true	
	


Config.AllowedJobs = {"police", "ambulance", "sheriff"}
Config.AlertBlip = {{
	Enable 	= true,			
	Time 	= 30,			
	Radius 	= 50.0,			
	Alpha 	= 250,			
	Color 	= 3				
}}


Config.Locksmith = {{
	Pos = {-603.18,-99.42,1.93},
	Key = 38,
	Marker = {
		Enable = true,
		DrawDist = 10.0,
		Type = 27,
		Scale = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 240, g = 52, b = 52, a = 100},
	},
	Blip = {
		Enable 	= false,
		Pos 	= {170.18,-1799.42,29.32},
		Sprite 	= 134,
		Color 	= 1,
		Name 	= "Autoschlüssel",
		Scale 	= 1.0,
		Display = 4,
	}
}}


Config.AlarmShop = {{
	Pos = {-194.48,-834.61,30.74},
	Key = 38,
	Marker = {
		Enable = false,
		DrawDist = 10.0,
		Type = 27,
		Scale = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 240, g = 52, b = 52, a = 100},
	},
	Blip = {
		Enable 	= false,
		Pos 	= {-194.48,-834.61,30.74},
		Sprite 	= 459,
		Color 	= 3,
		Name 	= "as",
		Scale 	= 0.7,
		Display = 4,
	}
}}


Config.WhitelistCars = {
    [1] = {model = GetHashKey('vchmp'), job = {"police", "ambulance"}},
    [2] = {model = GetHashKey('srpambulance'), job = {"ambulance"}},
    [3] = {model = GetHashKey('vapup'), job = {"police"}},
}

