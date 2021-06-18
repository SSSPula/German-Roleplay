Config 						= {}

-- General Settings:
Config.ESXSHAREDOBJECT 		= "esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect"	-- Change your getshared object event here, in case you are using anti-cheat.
Config.HasItemLabel			= true					-- set to false if your ESX doesn't support item labels.
Config.T1GER_DeliveryJob 	= false					-- set to false if u don't own this script. 

-- Settings:
Config.BuyShopWithCash 	 	= true		-- Set to false to purchase shops with bank.money.
Config.SellPercent		 	= 0.75		-- Means player gets 75% in return from original paid price.
Config.AccountsInCash		= true		-- Set to false to deposit/withdraw money into and from shop account with bank-money instead of cash money.
Config.ItemCompatibility	= true		-- If disabled, it doesnt check for type compatibility in Config.Items, meaning weapon shop owner could add bread, redgull etc.
Config.OrderItemPercent		= 10		-- Set percent between 1 and 100 of how much of the default item price is reduced, when ordering stock.
Config.BasketCommand		= 'basketwolov'	-- Default command to open/view basket. | Deaktiviert weil ungenutzt
Config.InteractionMenuKey	= 167		-- Default [F6]-

	-----------------------------------------------------------------------------------------------------
	---------------------------------grp_Shops-----------------------------------------------------------
	---------------------------------Streetangel ist 1 Ehrenbre------------------------------------------
	-----------------------------------------------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------



-- Shops:
Config.Shops = {

	-----------------------------------------------------------------------------------------------------
	-------------------------------------"NORMAL-SHOPS"-------------------------------------------------- | Für alle Spieler zugänglich.
	-----------------------------------------------------------------------------------------------------
	[1] = {owned = false, type = "normal", price = 7000000, buyable = false, b_menu = {-44.14,-1749.44,29.42}, cashier = {-47.29,-1756.7,29.42}, delivery = {-40.67,-1751.6,29.42}},
	[2] = {owned = false, type = "normal", price = 7000000, buyable = false, b_menu = {28.84,-1339.35,29.5}, cashier = {25.81,-1345.25,29.5}, delivery = {24.67,-1339.09,29.5}},
	[4] = {owned = false, type = "normal", price = 7000000, buyable = false, b_menu = {-709.68,905.4,19.22}, cashier = {-707.32,-912.9,19.22}, delivery = {-705.08,-904.4,19.22}},
	[5] = {owned = false, type = "pawnshop", price = 7000000, buyable = false, b_menu = {1125.99,-980.38,45.42}, cashier = {1135.68,-982.85,46.42}, delivery = {1130.4,-979.64,46.42}},
	[6] = {owned = false, type = "normal", price = 7000000, buyable = false, b_menu = {1159.77,-315.23,69.21}, cashier = {1163.39,-322.21,69.21}, delivery = {1163.9,-313.6,69.21}},
	[7] = {owned = false, type = "normal", price = 7000000, buyable = false, b_menu = {378.8,333.1,103.57}, cashier = {373.59,325.52,103.57}, delivery = {374.88,334.51,103.57}},
	[8] = {owned = false, type = "pawnshop", price = 7000000, buyable = false, b_menu = {-1478.56,-375.04,39.16}, cashier = {-1487.67,-378.54,40.16}, delivery = {-1481.33,-377.97,40.16}},
	[9] = {owned = false, type = "pawnshop", price = 7000000, buyable = false, b_menu = {-1220.54,-916.4,11.33}, cashier = {-1222.23,-906.82,12.33}, delivery = {-1222.86,-913.26,12.33}},
	[10] = {owned = false, type = "pawnshop", price = 7000000, buyable = false, b_menu = {1394.95,3608.62,34.98}, cashier = {1392.59,3605.07,34.98}, delivery = {1387.42,3607.84,34.98}},
	[11] = {owned = false, type = "normal", price = 7000000, buyable = false, b_menu = {-1828.29,797.87,138.19}, cashier = {-1821.45,793.84,138.11}, delivery = {-1825.97,801.41,138.11}},
	[12] = {owned = false, type = "normal", price = 7000000, buyable = false, b_menu = {-3048.0,586.32,7.91}, cashier = {-3038.78,585.85,7.91}, delivery = {-3047.06,582.23,7.91}},
	[13] = {owned = false, type = "normal", price = 7000000, buyable = false, b_menu = {-3249.82,1005.02,12.83}, cashier = {-3241.54,1001.14,12.83}, delivery = {-3250.63,1000.98,12.83}},
	[14] = {owned = false, type = "pawnshop", price = 7000000, buyable = false, b_menu = {-2959.18,387.12,14.04}, cashier = {-2967.74,391.57,15.04}, delivery = {-2963.1,387.19,15.04}},
	[15] = {owned = false, type = "normal", price = 7000000, buyable = false, b_menu = {545.77,2662.87,42.16}, cashier = {547.77,2671.75,42.16}, delivery = {549.89,2662.95,42.16}},
	[16] = {owned = false, type = "pawnshop", price = 7000000, buyable = false, b_menu = {1169.23,2718.18,37.16}, cashier = {1165.29,2709.35,38.16}, delivery = {1169.38,2714.34,38.16}},
	[17] = {owned = false, type = "normal", price = 7000000, buyable = false, b_menu = {2673.21,3287.1,55.24}, cashier = {2679.15,3280.13,55.24}, delivery = {2670.82,3283.75,55.24}},
	[18] = {owned = false, type = "normal", price = 7000000, buyable = false, b_menu = {1959.9,3749.09,32.34}, cashier = {1961.42,3740.09,32.34}, delivery = {1956.12,3747.44,32.34}},
	[19] = {owned = false, type = "normal", price = 7000000, buyable = false, b_menu = {1706.87,4921.07,42.06}, cashier = {1699.27,4923.54,42.06}, delivery = {1705.28,4917.2,42.07}},
	[20] = {owned = false, type = "normal", price = 7000000, buyable = false, b_menu = {1735.31,6420.41,35.04}, cashier = {1728.69,6414.18,35.04}, delivery = {1731.85,6422.65,35.04}},
	[29] = {owned = false, type = "festival", price = 7000000, buyable = false, b_menu = {1777.07,3236.22,0.31}, cashier = {1777.07,3236.22,42.31}, delivery = {-324.43,6078.36,0.45}},
	[36] = {owned = false, type = "normal", price = 7000000, buyable = false, b_menu = {1735.31,6420.41,35.04}, cashier = {190.1,-889.36,30.71}, delivery = {1731.85,6422.65,35.04}},
	[37] = {owned = false, type = "normal", price = 7000000, buyable = false, b_menu = {-1593.87,5198.52,4.36}, cashier = {-1593.87,5198.52,4.36}, delivery = {1731.85,6422.65,35.04}},
	[54] = {owned = false, type = "normal", price = 7000000, buyable = false, b_menu = {1129.84,145.71,80.89}, cashier = {1129.84,145.71,80.89}, delivery = {1129.84,145.71,80.89}},

	-----------------------------------------------------------------------------------------------------
	-------------------------------------MUNITION--------------------------------------------------------	| Für alle Spieler zugänglich.
	-----------------------------------------------------------------------------------------------------
	[3] = {owned = false, type = "weapon", price = 7000000, buyable = false, b_menu = {846.24,-1030.89,28.19}, cashier = {842.18,-1034.01,28.19}, delivery = {841.65,-1025.63,28.19}},
	[21] = {owned = false, type = "weapon", price = 7000000, buyable = false, b_menu = {13.89,-1106.35,29.8}, cashier = {22.35,-1106.8,29.8}, delivery = {18.05,-1111.11,29.8}},
	[22] = {owned = false, type = "weapon", price = 7000000, buyable = false, b_menu = {-666.62,-933.68,21.83}, cashier = {-662.0,-934.88,21.83}, delivery = {-661.8,-943.33,21.83}},
	[23] = {owned = false, type = "weapon", price = 7000000, buyable = false, b_menu = {817.97,-2155.28,29.62}, cashier = {809.84,-2157.76,29.62}, delivery = {812.6,-2152.32,29.62}},
	[24] = {owned = false, type = "weapon", price = 7000000, buyable = false, b_menu = {255.21,-46.38,69.94}, cashier = {252.48,-50.46,69.94}, delivery = {244.47,-49.97,69.94}},
	[25] = {owned = false, type = "weapon", price = 7000000, buyable = false, b_menu = {2572.32,292.75,108.73}, cashier = {2567.53,293.86,108.73}, delivery = {2567.29,302.36,108.73}},
	[26] = {owned = false, type = "weapon", price = 7000000, buyable = false, b_menu = {-1122.17,2696.71,18.55}, cashier = {-1117.8,2699.0,18.55}, delivery = {-1111.99,2692.91,18.55}},
	[27] = {owned = false, type = "weapon", price = 7000000, buyable = false, b_menu = {1689.3,3757.76,34.71}, cashier = {1693.37,3760.3,34.71}, delivery = {1699.71,3754.64,34.71}},
	[51] = {owned = false, type = "weapon", price = 7000000, buyable = false, b_menu = {-334.67,6081.79,31.45}, cashier = {-330.33,6084.49,31.45}, delivery = {-324.43,6078.36,31.45}},
	[56] = {owned = false, type = "weapon", price = 7000000, buyable = false, b_menu = {-3172.67,1088.79,20.45}, cashier = {-3172.67,1088.79,20.45}, delivery = {-3172.67,1088.79,20.45}},

	-----------------------------------------------------------------------------------------------------
	-------------------------------------POLIZEI--------------------------------------------------------- 	| Für alle Polizisten zugänglich. | grp_Polizei
	-----------------------------------------------------------------------------------------------------
	[35] = {owned = false, type = "PoliceArmoryMunition", price = 7000000, buyable = false, b_menu = {487.95581054688,-996.97338867188,29.492681503296}, cashier = {487.09176635742,-997.01788330078,25.68967628479}, delivery = {-324.43,6078.36,31.45}},
	
	-----------------------------------------------------------------------------------------------------
	-------------------------------------BARKEEPER-------------------------------------------------------	| Für alle Spieler zugänglich.
	-----------------------------------------------------------------------------------------------------
	--3 Barkeeper für die Creative Hubs | Verkaufen Getränke
	[38] = {owned = false, type = "barkeeper", price = 7000000, buyable = false, b_menu = {-1621.3,-1081.75,12.68}, cashier = {-1621.3,-1081.75,12.68}, delivery = {-1621.3,-1081.75,12.68}},
	[39] = {owned = false, type = "barkeeper", price = 7000000, buyable = false, b_menu = {2340.94,3128.02,48.21}, cashier = {2340.94,3128.02,48.21}, delivery = {2340.94,3128.02,48.21}},
	[40] = {owned = false, type = "barkeeper", price = 7000000, buyable = false, b_menu = {421.23,6468.2,28.81}, cashier = {421.23,6468.2,28.81}, delivery = {421.23,6468.2,28.81}},
	[41] = {owned = false, type = "barkeeper", price = 7000000, buyable = false, b_menu = {295.26,-925.01,51.82}, cashier = {295.26,-925.01,51.82}, delivery = {295.26,-925.01,51.82}},
	[52] = {owned = false, type = "barkeeper", price = 7000000, buyable = false, b_menu = {1170.4,133.42,80.890846252441}, cashier = {1170.4,133.42,80.890846252441}, delivery = {1170.4,133.42,80.890846252441}}, --lshub2

	-----------------------------------------------------------------------------------------------------
	-------------------------------------REZEPTE---------------------------------------------------------	| Für alle Spieler zugänglich. | crafting
	-----------------------------------------------------------------------------------------------------
	[42] = {owned = false, type = "RezeptShopCreativeHub", price = 7000000, buyable = false, b_menu = {426.51,6477.82,27.33}, cashier = {426.51,6477.82,27.33}, delivery = {-324.43,6078.36,0.45}},
	[43] = {owned = false, type = "RezeptShopCreativeHub", price = 7000000, buyable = false, b_menu = {2341.63,3139.15,47.21}, cashier = {2341.63,3139.15,47.21}, delivery = {-324.43,6078.36,0.45}},
	[30] = {owned = false, type = "RezeptShopCreativeHub", price = 7000000, buyable = false, b_menu = {-595.51,-84.82,0.33}, cashier = {-1617.3,-1045.75,13.17}, delivery = {-324.43,6078.36,0.45}},
	[53] = {owned = false, type = "RezeptShopCreativeHub", price = 7000000, buyable = false, b_menu = {1117.5357666016,89.584312438965,80.891777038574}, cashier = {1117.5357666016,89.584312438965,80.891777038574}, delivery = {1117.5357666016,89.584312438965,80.891777038574}},
	[31] = {owned = false, type = "RezeptShopGrosseWaffen", price = 7000000, buyable = false, b_menu = {-386.45,-2588.86,0.33}, cashier = {-387.03,-2589.11,13.65}, delivery = {-324.43,6078.36,0.45}},
	[33] = {owned = false, type = "RezeptShopAlkohol", price = 7000000, buyable = false, b_menu = {-386.45,-2588.86,0.33}, cashier = {590.9,2744.23,42.05}, delivery = {-324.43,6078.36,0.45}},
	[34] = {owned = false, type = "RezeptShopBarren", price = 7000000, buyable = false, b_menu = {-386.45,-2588.86,0.33}, cashier = {-869.15,-333.12,38.98}, delivery = {-324.43,6078.36,0.45}},
	-----------------------------------------------------------------------------------------------------
	-------------------------------------HITMAN----------------------------------------------------------	Für alle Hitmans zugänglich. | grp_HitmanJob
	-----------------------------------------------------------------------------------------------------
	[44] = {owned = false, type = "Hitmanshop", price = 7000000, buyable = false, b_menu = {-2098.923828125,-1014.9221191406,5.8843441009521}, cashier = {-2098.923828125,-1014.9221191406,5.8843441009521}, delivery = {-2098.923828125,-1014.9221191406,5.8843441009521}},

	-----------------------------------------------------------------------------------------------------
	-------------------------------------PC-JOB----------------------------------------------------------	Für alle Spieler zugänglich. | grp_DesktopJob
	-----------------------------------------------------------------------------------------------------
	[45] = {owned = false, type = "PCSHOP", price = 7000000, buyable = false, b_menu = {1241.91,-567.75,65.7}, cashier = {1241.91,-567.75,65.7}, delivery = {1241.91,-567.75,65.7}},

	-----------------------------------------------------------------------------------------------------
	-------------------------------------O-AMT----------------------------------------------------------	Für Ordnungsamt zugänglich. | grp_Ordnungsamt
	-----------------------------------------------------------------------------------------------------
	[50] = {owned = false, type = "ordnungsamt", price = 7000000, buyable = false, b_menu = {369.89,-1679.38,27.31}, cashier = {369.89,-1679.38,27.31}, delivery = {369.89,-1679.38,27.31}},
	[55] = {owned = false, type = "SheriffArmoryMunition", price = 7000000, buyable = false, b_menu = {1858.70,3691.94,34.27}, cashier = {1858.70,3691.94,34.27}, delivery = {1858.70,3691.94,34.27}},
	[57] = {owned = false, type = "Fibshop", price = 7000000, buyable = false, b_menu = {143.87, -763.69, 240.15}, cashier = {143.87, -763.69, 240.15}, delivery = {143.87, -763.69, 240.15}},
	[65] = {owned = false, type = "dojshop", price = 7000000, buyable = false, b_menu = {-437.11, 1107.68, 327.69}, cashier = {-437.11, 1107.68, 327.69}, delivery = {-437.11, 1107.68, 327.69}},
	
	
}

Config.MarkerSettings = { -- Marker Settings:
	['boss'] = { enable = false, drawDist = 10.0, type = 20, scale = {x = 0.35, y = 0.35, z = 0.35}, color = {r = 240, g = 52, b = 52, a = 100} },
	['shelves'] = { enable = false, drawDist = 10.0, type = 20, scale = {x = 0.30, y = 0.30, z = 0.30}, color = {r = 240, g = 52, b = 52, a = 100} },
	['cashier'] = { enable = true, drawDist = 10.0, type = 20, scale = {x = 0.30, y = 0.30, z = 0.30}, color = {r = 0, g = 200, b = 70, a = 100} }
}
-- Blip Settings:
Config.BlipSettings = { -- Blip Settings:
	['normal'] = { enable = true, sprite = 52, display = 4, scale = 0.65, color = 2, name = "Shop" },
	['weapon'] = { enable = true, sprite = 110, display = 4, scale = 0.65, color = 6, name = "Munition" },
	['pawnshop'] = { enable = true, sprite = 59, display = 4, scale = 0.65, color = 5, name = "Zwielichtiger Laden" },
	['festival'] = { enable = false, sprite = 59, display = 4, scale = 0.65, color = 5, name = "Festival Shop" },
	['RezeptShopCreativeHub'] = { enable = false, sprite = 59, display = 4, scale = 0.65, color = 5, name = "Rezept Shop" },
	['RezeptShopGrosseWaffen'] = { enable = false, sprite = 59, display = 4, scale = 0.65, color = 5, name = "Rezept Shop2" },
	['RezeptShopAlkohol'] = { enable = false, sprite = 59, display = 4, scale = 0.65, color = 5, name = "Rezept Shop3" },
	['RezeptShopBarren'] = { enable = false, sprite = 59, display = 4, scale = 0.65, color = 5, name = "Rezept Shop4" },
	['PoliceArmoryMunition'] = { enable = false, sprite = 59, display = 4, scale = 0.65, color = 5, name = "PoliceArmoryMunition" },
	['barkeeper'] = { enable = false, sprite = 59, display = 4, scale = 0.65, color = 5, name = "barkeeper HUBS" },
	['ordnungsamt'] = { enable = false, sprite = 59, display = 4, scale = 0.65, color = 5, name = "barkeeper HUBS" },
	['dojshop'] = { enable = false, sprite = 59, display = 4, scale = 0.65, color = 5, name = "dojshop" },
	['PCSHOP'] = { enable = false, sprite = 59, display = 4, scale = 0.65, color = 5, name = "PC Hardware Shop" }
}

-- Shop Items:
Config.Items = {
	-----------------------------------------------------------------------------------------------------
	-------------------------------------REZEPTE--------------------------------------------------------- | crafting
	-----------------------------------------------------------------------------------------------------
	--Rezepte Creative Hub
	{label = "Rezept: Baseballschläger", item = "recipe_bat", type = {"RezeptShopCreativeHub"}, price = 3570},
	{label = "Rezept: Kampf Axt", item = "recipe_battleaxe", type = {"RezeptShopCreativeHub"}, price = 3570},
	{label = "Rezept: Dolch", item = "recipe_dagger", type = {"RezeptShopCreativeHub"}, price = 3570},
	{label = "Rezept: Golfschläger", item = "recipe_golfclub", type = {"RezeptShopCreativeHub"}, price = 3570},
	{label = "Rezept: Hammer", item = "recipe_hammer", type = {"RezeptShopCreativeHub"}, price = 3570},
	{label = "Rezept: Axt", item = "recipe_hatchet", type = {"RezeptShopCreativeHub"}, price = 3570},
	{label = "Rezept: Messer", item = "recipe_knife", type = {"RezeptShopCreativeHub"}, price = 3570},
	{label = "Rezept: Schlagring", item = "recipe_knuckle", type = {"RezeptShopCreativeHub"}, price = 3570},
	{label = "Rezept: Machete", item = "recipe_machete", type = {"RezeptShopCreativeHub"}, price = 3570},
	{label = "Rezept: Billige Knarre", item = "recipe_snspistol", type = {"RezeptShopCreativeHub"}, price = 3570},

	--Rezepte Big Weapon
	{label = "Rezept: SMG", item = "recipe_smg", type = {"RezeptShopGrosseWaffen"}, price = 12650},

	--RezeptShop Alkohol
	{label = "Rezept: Alkohol", item = "recipe_alcohol", type = {"RezeptShopAlkohol"}, price = 17980},
	{label = "Rezept: Leere Flasche", item = "recipe_bottle", type = {"RezeptShopAlkohol"}, price = 14980},

	--RezeptShop Stahlbarren
	{label = "Rezept: Stahlbarren", item = "recipe_steel_ingot", type = {"RezeptShopBarren"}, price = 22500},

	--Festival Tokens
	{label = "Festival Token", item = "ftoken", type = {"festival"}, price = 26},

	-----------------------------------------------------------------------------------------------------
	-------------------------------------"NORMALE-SHOPS"------------------------------------------------- | Da wo die Ehrenbres ihr Zeug coppen
	-----------------------------------------------------------------------------------------------------
	--Normale Shops & Pawnshops
	{label = "Wasser", item = "water", type = {"normal", "pawnshop"}, price = 125},
	{label = "Handy", item = "phone", type = {"normal", "pawnshop"}, price = 1200},
	{label = "Bier", item = "beer", type = {"normal", "pawnshop"}, price = 150},
	{label = "Feuerzeug", item = "lighter", type = {"normal", "pawnshop"}, price = 175},
	{label = "Sandwich", item = "sandwich", type = {"normal", "pawnshop"}, price = 150},
	{label = "Brot", item = "bread", type = {"normal", "pawnshop"}, price = 125},
	{label = "Schokolade", item = "chocolate", type = {"normal", "pawnshop"}, price = 125},
	--{label = "Funkgerät", item = "radio", type = {"normal", "pawnshop"}, price = 1250},
	{label = "Bündel Kabelbinder", item = "kabelbinder", type = {"normal", "pawnshop"}, price = 2337},
	{label = "Auto-Kit", item = "fixtool", type = {"normal", "pawnshop"}, price = 1900},
	{label = "Rasierer", item = "shaver", type = {"normal", "pawnshop"}, price = 95},
	-----------------------------------------------------------------------------------------------------
	-------------------------------------MUNITION IN "WAFFENLÄDEN"--------------------------------------- | Munition für alle Spieler
	-----------------------------------------------------------------------------------------------------
	--Munition
	{label = "Pistolenmunition", item = "pistol_ammo", type = {"weapon"}, price = 7},
	{label = "Gewehrmunition", item = "rifle_ammo", type = {"weapon"}, price = 12},
	{label = "SMG-Munition", item = "smg_ammo", type = {"weapon"}, price = 12},
	{label = "Shotgunmunition", item = "shotgun_ammo", type = {"weapon"}, price = 13},
	{label = "Pistolenmunition 100x", item = "100pistol_ammo", type = {"weapon"}, price = 700},
	{label = "Gewehrmunition 100x", item = "100rifle_ammo", type = {"weapon"}, price = 1200},
	{label = "Smgmunition 100x", item = "100smg_ammo", type = {"weapon"}, price = 1200},
	{label = "Handy", item = "phone", type = {"weapon"}, price = 1200},
	
	

	-----------------------------------------------------------------------------------------------------
	-------------------------------------HITMAN----------------------------------------------------------
	-----------------------------------------------------------------------------------------------------
	--Hitman Waffen
	{label = "Scharfschützengewehr", item = "sniperrifle", type = {"Hitmanshop"}, price = 1},
	{label = "Spezial Karabiner", item = "specialcarbine_mk2", type = {"Hitmanshop"}, price = 1},
	{label = "Schwere Pistole", item = "heavypistol", type = {"Hitmanshop"}, price = 1},

	--Hitman Munition		
	{label = "Pistolenmunition 100x", item = "100pistol_ammo", type = {"Hitmanshop"}, price = 100},
	{label = "Gewehrmunition 100x", item = "100rifle_ammo", type = {"Hitmanshop"}, price = 100},
	{label = "SMG-Munition 100x", item = "100smg_ammo", type = {"Hitmanshop"}, price = 100},
	{label = "Sniper munition 100x", item = "100sniper_ammo", type = {"Hitmanshop"}, price = 100},

	--Hitman Ausrüstung
	{label = "Auto-Kit", item = "fixtool", type = {"Hitmanshop"}, price = 1590},
	--{label = "Funkgerät", item = "radio", type = {"Hitmanshop"}, price = 911},
	{label = "Handy", item = "phone", type = {"Hitmanshop"}, price = 1500},
	{label = "Taschenlampe", item = "flashlight", type = {"Hitmanshop"}, price = 5000},

	-----------------------------------------------------------------------------------------------------
	-------------------------------------POLIZEI---------------------------------------------------------	| grp_Polizei
	-----------------------------------------------------------------------------------------------------
	--Polizei Munition
	{label = "Pistolenmunition 100x", item = "100pistol_ammo_cop", type = {"PoliceArmoryMunition"}, price = 100},
	--{label = "Gewehrmunition 100x", item = "100rifle_ammo", type = {"PoliceArmoryMunition"}, price = 100},
	{label = "SMG-Munition 100x", item = "100smg_ammo_cop", type = {"PoliceArmoryMunition"}, price = 100},
	{label = "Shotgunmunition", item = "shotgun_ammo", type = {"PoliceArmoryMunition"}, price = 1},

	--Polizei Ausrüstung
	{label = "Auto-Kit", item = "fixtool", type = {"PoliceArmoryMunition"}, price = 1590},
	{label = "[WICHTIG] Panicbutton", item = "panicbuttonx", type = {"PoliceArmoryMunition"}, price = 1},
	
	--{label = "Funkgerät", item = "radio", type = {"PoliceArmoryMunition"}, price = 911},
	{label = "Kabelbinder", item = "kabelbinder", type = {"PoliceArmoryMunition"}, price = 100},
	{label = "Dienstmarke LSPD", item = "dienstmarkelspd", type = {"PoliceArmoryMunition"}, price = 1},
	{label = "Taschenlampe", item = "flashlight", type = {"PoliceArmoryMunition"}, price = 1},


	--Polizei Waffen
	{label = "Schwere Pistole", item = "heavypistol", type = {"PoliceArmoryMunition"}, price = 1},
	{label = "Schlagstock", item = "nightstick", type = {"PoliceArmoryMunition"}, price = 1},
	{label = "Geschwindigkeitsmesser", item = "vintagepistol", type = {"PoliceArmoryMunition"}, price = 15},
	{label = "Kampf-SMG", item = "assaultsmg", type = {"PoliceArmoryMunition"}, price = 1},
	{label = "Pumpgun", item = "pumpshotgun", type = {"PoliceArmoryMunition"}, price = 1},
	{label = "Leuchtfackel", item = "flare", type = {"PoliceArmoryMunition"}, price = 1},
	{label = "Tazer", item = "stungun", type = {"PoliceArmoryMunition"}, price = 1},
	{label = "Polizei-Schutzweste", item = "polweste", type = {"PoliceArmoryMunition"}, price = 250},

--fib shop
	{label = "Pistolenmunition 100x", item = "100pistol_ammo_cop", type = {"Fibshop"}, price = 100},
	--{label = "Gewehrmunition 100x", item = "100rifle_ammo", type = {"Fibshop"}, price = 100},
	{label = "SMG-Munition 100x", item = "100smg_ammo_cop", type = {"Fibshop"}, price = 100},
	{label = "Shotgunmunition", item = "shotgun_ammo", type = {"Fibshop"}, price = 1},

	--Polizei Ausrüstung
	{label = "Auto-Kit", item = "fixtool", type = {"Fibshop"}, price = 1590},
	{label = "[WICHTIG] Panicbutton", item = "panicbuttonx", type = {"Fibshop"}, price = 1},
	
	--{label = "Funkgerät", item = "radio", type = {"Fibshop"}, price = 911},
	{label = "Kabelbinder", item = "kabelbinder", type = {"Fibshop"}, price = 100},
	{label = "Dienstmarke FIB", item = "dienstmarkefib", type = {"Fibshop"}, price = 1},
	{label = "Taschenlampe", item = "flashlight", type = {"Fibshop"}, price = 1},

	--Polizei Waffen
	{label = "Schwere Pistole", item = "heavypistol", type = {"Fibshop"}, price = 1},
	{label = "Schlagstock", item = "nightstick", type = {"Fibshop"}, price = 1},
	{label = "Geschwindigkeitsmesser", item = "vintagepistol", type = {"Fibshop"}, price = 15},
	{label = "Kampf-SMG", item = "assaultsmg", type = {"Fibshop"}, price = 1},
	{label = "Pumpgun", item = "pumpshotgun", type = {"Fibshop"}, price = 1},
	{label = "Leuchtfackel", item = "flare", type = {"Fibshop"}, price = 1},
	{label = "Tazer", item = "stungun", type = {"Fibshop"}, price = 1},
	{label = "FIB-Schutzweste", item = "fibweste", type = {"Fibshop"}, price = 250},

	--sheriff waffen
	{label = "Pistolenmunition 100x", item = "100pistol_ammo_cop", type = {"SheriffArmoryMunition"}, price = 100},
	{label = "SMG-Munition 100x", item = "100smg_ammo_cop", type = {"SheriffArmoryMunition"}, price = 100},
	{label = "Geschwindigkeitsmesser", item = "vintagepistol", type = {"SheriffArmoryMunition"}, price = 15},

	--Polizei Ausrüstung
	{label = "[WICHTIG] Panicbutton", item = "panicbuttonx", type = {"SheriffArmoryMunition"}, price = 1},
	{label = "Kabelbinder", item = "kabelbinder", type = {"SheriffArmoryMunition"}, price = 100},
	{label = "Taschenlampe", item = "flashlight", type = {"SheriffArmoryMunition"}, price = 1},
	{label = "UV Lampe", item = "uvlight", type = {"SheriffArmoryMunition"}, price = 15},
	{label = "Sheriff-Schutzweste", item = "sheriffweste", type = {"SheriffArmoryMunition"}, price = 250},
	--Polizei Waffen
	{label = "Revolver", item = "doubleaction", type = {"SheriffArmoryMunition"}, price = 1},
	{label = "Schlagstock", item = "nightstick", type = {"SheriffArmoryMunition"}, price = 1},
	{label = "Kampf-SMG", item = "assaultsmg", type = {"SheriffArmoryMunition"}, price = 1},
	{label = "Leuchtfackel", item = "flare", type = {"SheriffArmoryMunition"}, price = 1},
	{label = "Tazer", item = "stungun", type = {"SheriffArmoryMunition"}, price = 1},
	
	-----------------------------------------------------------------------------------------------------
	-------------------------------------BARKEEPER-------------------------------------------------------
	-----------------------------------------------------------------------------------------------------
	--BARKEEPER STUFF
	{label = "Bier", item = "beer", type = {"barkeeper"}, price = 120},
	{label = "Vodka", item = "vodka", type = {"barkeeper"}, price = 175},
	{label = "Wein", item = "wine", type = {"barkeeper"}, price = 220},
	{label = "Eistee", item = "icetea", type = {"barkeeper"}, price = 65},
	{label = "Fanta", item = "MCDS_FANTA", type = {"barkeeper"}, price = 65},

	-----------------------------------------------------------------------------------------------------
	-------------------------------------PC-JOB----------------------------------------------------------	| grp_DesktopJob
	-----------------------------------------------------------------------------------------------------
	--PC-Shop | grp_DesktopJob
	{label = "Core i3 10100", item = "corei310100", type = {"PCSHOP"}, price = 108},
	{label = "Core i5 10400", item = "corei510400", type = {"PCSHOP"}, price = 216},
	{label = "Core i9 10850k", item = "corei910850k", type = {"PCSHOP"}, price = 378},
	{label = "Core i7 10700", item = "corei710700", type = {"PCSHOP"}, price = 324},
	{label = "Ryzen 5 3600", item = "ryzen53600", type = {"PCSHOP"}, price = 216},
	{label = "Ryzen 5 5600X", item = "ryzen55600x", type = {"PCSHOP"}, price = 270},
	{label = "Ryzen 7 3800XT", item = "ryzen73800xt", type = {"PCSHOP"}, price = 324},
	{label = "Ryzen 7 5800X", item = "ryzen75800x", type = {"PCSHOP"}, price = 378},
	{label = "Nvidia RTX 3080", item = "rtx3080", type = {"PCSHOP"}, price = 432},
	{label = "Nvidia RTX 3070", item = "rtx3070", type = {"PCSHOP"}, price = 378},
	{label = "Nvidia RTX 3060-ti", item = "rtx3060ti", type = {"PCSHOP"}, price = 324},
	{label = "Nvidia GTX 1660", item = "gtx1660", type = {"PCSHOP"}, price = 270},
	{label = "Nvidia GTX 1650", item = "gtx1650", type = {"PCSHOP"}, price = 238},
	{label = "TridentZ Royal 3600 2x8GB", item = "tridenzroyaldou", type = {"PCSHOP"}, price = 108},
	{label = "Micron Balistic 3200 4x8GB", item = "micronbalisticquad", type = {"PCSHOP"}, price = 216},
	{label = "Corsair Vengence 3600 4x16GB", item = "corsairvengencequad", type = {"PCSHOP"}, price = 324},
	{label = "Z490 Msi Gaming", item = "z490msig", type = {"PCSHOP"}, price = 200},
	{label = "Asus B460M-A", item = "b460ma", type = {"PCSHOP"}, price = 200},
	{label = "Asus ROG Strix B450-F", item = "b450fg", type = {"PCSHOP"}, price = 200},
	{label = "MSI B550 Gaming", item = "b550g", type = {"PCSHOP"}, price = 200},
	{label = "Gigabyte B450 Elite", item = "b450elite", type = {"PCSHOP"}, price = 200},
	{label = "900W Crucial Gold+", item = "900wcrucialg", type = {"PCSHOP"}, price = 120},
	{label = "600W Green Bronze+", item = "600wgreenb", type = {"PCSHOP"}, price = 125},
	{label = "750W Be Quiet 80+ Bronze", item = "750wbequiet", type = {"PCSHOP"}, price = 130},
	{label = "650W Corsair RGB", item = "650wcorsair", type = {"PCSHOP"}, price = 140},
	{label = "NVME M.2 1TB Samsung Pro", item = "m2nvme1tbsamsung", type = {"PCSHOP"}, price = 98},
	{label = "Samsung SSD 860 Evo 1TB", item = "ssd860evosamsung", type = {"PCSHOP"}, price = 54},
	{label = "HDD 1TB Hard Drive Green", item = "hdd1tbgreen", type = {"PCSHOP"}, price = 22},

	-----------------------------------------------------------------------------------------------------
	-------------------------------------O-AMT----------------------------------------------------------	Für Ordnungsamt zugänglich. | grp_Ordnungsamt
	-----------------------------------------------------------------------------------------------------
	{label = "Tazer", item = "stungun", type = {"ordnungsamt"}, price = 1},
	{label = "Geschwindigkeitsmesser", item = "vintagepistol", type = {"ordnungsamt"}, price = 1},
	-----------------------------------------------------------------------------------------------------
	-------------------------------------DOJ------------------------------------------------------------	Für Ordnungsamt zugänglich. | grp_Ordnungsamt
	-----------------------------------------------------------------------------------------------------
	{label = "Dienstmarke DOJ", item = "dienstmarkedoj", type = {"dojshop"}, price = 1},
	{label = "DoJ - Schutzweste", item = "dojweste", type = {"dojshop"}, price = 1},
	{label = "DoJ - Tazer", item = "stungun", type = {"dojshop"}, price = 1},

	
	{label = "Pistolenmunition 100x", item = "100pistol_ammo_cop", type = {"dojshop"}, price = 100},
	{label = "SMG-Munition 100x", item = "100smg_ammo_cop", type = {"dojshop"}, price = 100},
	{label = "Revolver", item = "doubleaction", type = {"SheriffArmoryMunition"}, price = 1},
	{label = "Schlagstock", item = "nightstick", type = {"SheriffArmoryMunition"}, price = 1},
	{label = "Kampf-SMG", item = "assaultsmg", type = {"SheriffArmoryMunition"}, price = 1},
	{label = "Leuchtfackel", item = "flare", type = {"SheriffArmoryMunition"}, price = 1},
	{label = "Tazer", item = "stungun", type = {"SheriffArmoryMunition"}, price = 1},
}




--Was machst du in dieser Datei? Auf GRP ist es leider nicht allzu einfach Trigger zu finden, verständlich, aber hier wirst du leider keine davon finden :(
	--Abonniert Gerd Hansen auf YouTube dann war dein LUA Executor auch nicht umsonst.
		--Und jetzt GTFO :*
--2021|grp_Shops|