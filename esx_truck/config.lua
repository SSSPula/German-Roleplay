--Truck
Config	=	{}

 -- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 25000

-- Default weight for an item:
	-- weight == 0 : The item do not affect character inventory weight
	-- weight > 0 : The item cost place on inventory
	-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 100



-- If true, ignore rest of file
Config.WeightSqlBased = true

-- I Prefer to edit weight on the config.lua and I have switched Config.WeightSqlBased to false:

Config.localWeight = {

	--Waffenteile
	amo = 100,
	barrel = 100,
	deduction = 100,
	drum_magazine = 100,
	extended_clip = 100,
	flashlight = 100,
	grip = 100,
	gunpowder = 100,
	lead = 100,
	magazine = 100,
	scope = 100,
	shaft = 100,
	silencieux = 100,
   
	--Jobitems
--	fish = 100,
--	alive_chicken = 500,
--	slaughtered_chicken = 500,
--	packaged_chicken = 100,
--	petrol = 500,
--	petrol_raffin = 1000,
--	essence = 500,
--	wood = 500,
--	cutted_wood =500,
--	packaged_plank = 100,
--	stone = 1000,
--	washed_stone = 1000,
--	copper = 50,
	--iron = 50,
--	bandage = 50,
--	medikit = 100,
--	fixtool = 100,
--	fixkit = 100,
--	carotool = 100,
--	carokit = 100,
--	gazbottle = 100,
--	blowpipe = 100,

	--Waffen
	WEAPON_SMG = 1111000,
	WEAPON_FLARE = 1111000,
	WEAPON_KNIFE = 1111000,
	WEAPON_KNUCKLE = 1111000,
	WEAPON_NIGHTSTICK = 1111000,
	WEAPON_HAMMER = 1111000,
	WEAPON_BAT = 1111000,
	WEAPON_GOLFCLUB = 1111000,
	WEAPON_CROWBAR = 1111000,
	WEAPON_BOTTLE = 1111000,
	WEAPON_DAGGER = 1111000,
	WEAPON_HATCHET = 1111000,
	WEAPON_MACHETE = 1111000,
	WEAPON_FLASHLIGHT = 1111000,
	WEAPON_SWITCHBLADE = 1111000,
	WEAPON_BZGAS = 1111000,
	WEAPON_SMOKEGRENADE = 1111000,
	WEAPON_MOLOTOV = 1111000,
	WEAPON_FIREEXTINGUISHER = 1111000,
	WEAPON_PETROLCAN = 1111000,
	WEAPON_POOLCUE = 1111000,
	WEAPON_SNSPISTOL = 1111000,	
	WEAPON_PIPEWRENCH = 1111000,
	WEAPON_WRENCH = 1111000,	
	WEAPON_PISTOL = 1111000,
	WEAPON_MICROSMG = 1111000,
	WEAPON_COMBATPISTOL = 1111000,
	WEAPON_REVOLVER = 1111000,
	WEAPON_APPISTOL = 1111000,
	WEAPON_PISTOL50 = 1111000,
	WEAPON_VINTAGEPISTOL = 1111000,
	WEAPON_STUNGUN = 1111000,
	WEAPON_MINISMG = 1111000,
	WEAPON_ASSAULTSMG = 1111000,
	WEAPON_CARBINERIFLE = 1111000,
	WEAPON_MACHINEPISTOL = 1111000,
	WEAPON_COMBATPDW = 1111000,
	WEAPON_GUSENBERG = 1111000,
	WEAPON_ASSAULTRIFLE = 1111000,
	WEAPON_ADVANCEDRIFLE = 1111000,
	WEAPON_SPECIALCARBINE = 1111000,
	WEAPON_BULLPUPRIFLE = 1111000,
	WEAPON_COMPACTRIFLE = 1111000,
	WEAPON_PUMPSHOTGUN = 1111000,
	WEAPON_SAWNOFFSHOTGUN = 1111000,
	WEAPON_MUSKET = 1111000,
	WEAPON_DBSHOTGUN = 1111000,
	WEAPON_HEAVYSNIPER = 1111000,
	WEAPON_SNIPERRIFLE = 1111000,
	WEAPON_FIREWORK = 1111000,
	WEAPON_ASSAULTSHOTGUN = 1111000,
	WEAPON_COMBATMG = 1111000}


Config.VehicleLimit = {
    [0] = 100000, --Compact
    [1] = 200000, --Sedan
    [2] = 500000, --SUV
    [3] = 200000, --Coupes
    [4] = 300000, --Muscle
    [5] = 200000, --Sports Classics
    [6] = 200000, --Sports
    [7] = 75000, --Super
    [8] = 25000, --Motorcycles
    [9] = 500000, --Off-road
    [10] = 1000000, --Industrial
    [11] = 2000000, --Utility
    [12] = 700000, --Vans
    [13] = 0, --Cycles
    [14] = 50000, --Boats
    [15] = 200000, --Helicopters
    [16] = 50000, --Planes
    [17] = 400000, --Service
    [18] = 150000, --Emergency
    [19] = 0, --Military
    [20] = 1000000, --Commercial
    [21] = 0 --Trains
}
Config.VehiclePlate = {
	taxi        = "TAXI",
	cop         = "LSPD",
	ambulance   = "EMS0",
	mecano	    = "MECA",
}
