
Config = {

BlipSprite = 237,
BlipColor = 26,
BlipText = 'Dewen hat bubu gebaut',

UseLimitSystem = false, -- Enable if your esx uses limit system

CraftingStopWithDistance = true, -- Crafting will stop when not near workbench

ExperiancePerCraft = 5, -- The amount of experiance added per craft (100 Experiance is 1 level)

HideWhenCantCraft = true, -- Instead of lowering the opacity it hides the item that is not craftable due to low level or wrong job

Categories = {

['MATS'] = {
	Label = 'Materialien',
	Image = 'steel_ingot',
	Jobs = {}
},
['vip'] = {
	Label = 'VIP',
	Image = 'viptoken',
	Jobs = {}
},
['kochen'] = {
	Label = 'Kochen',
	Image = 'cook',
	Jobs = {}
},
['mechanictools'] = {
	Label = '[Mechaniker] Werkzeug',
	Image = 'mechanic_tools',
	Jobs = {"mechanic","mechanic2","cardealer","cardealer2"}
},
['weaponsnahkampf'] = {
	Label = 'Nahkampf Waffen',
	Image = 'bat',
	Jobs = {}
},
['weaponsfernkampf'] = {
	Label = 'Handfeuer Waffen',
	Image = 'pistol',
	Jobs = {}
},
['drogenstrecken100g'] = {
	Label = '100g Strecken',
	Image = '100gcoke',
	Jobs = {}
},
['drogenstrecken1kg'] = {
	Label = '1kg Strecken',
	Image = '1kgcoke',
	Jobs = {}
},
['kriminell'] = {
	Label = 'Kriminell',
	Image = 'criminal',
	Jobs = {}
},
['Diverses'] = {
	Label = 'Diverses',
	Image = 'pdmkatalog',
	Jobs = {}
},
['mechanikerturbo'] = {
	Label = '[Mechaniker] Turbo',
	Image = 'turbo_lvl_1',
	Jobs = {"mechanic","mechanic2","cardealer","cardealer2"}
},

['mechanikeroele'] = {
	Label = '[Mechaniker] Öl',
	Image = 'stock_oil',
	Jobs = {"mechanic","mechanic2","cardealer","cardealer2"}
},

['mechanikermotoren'] = {
	Label = '[Mechaniker] Motor',
	Image = 'stock_engine',
	Jobs = {"mechanic","mechanic2","cardealer","cardealer2"}
},

['mechanikerreifen'] = {
	Label = '[Mechaniker] Reifen',
	Image = 'stock_tires',
	Jobs = {"mechanic","mechanic2","cardealer","cardealer2"}
},

['mechanikerbremsen'] = {
	Label = '[Mechaniker] Bremsen',
	Image = 'bremsen_lvl_2',
	Jobs = {"mechanic","mechanic2","cardealer","cardealer2"}
},

['weaponsfernkampfbig'] = {
	Label = 'Schwere Waffen',
	Image = 'smg',
	Jobs = {}
}


},

PermanentItems = { -- Items that dont get removed when crafting
	--['wrench'] = true
},

Recipes = { -- Enter Item name and then the speed value! The higher the value the more torque
 
['mechanic_tools'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanictools', -- The category item will be put in
	Desc = 'Aktuell ungenutzt',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {"mechanic","mechanic2","cardealer","cardealer2"}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 65, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['iron'] = 5, -- item name and count, adding items that dont exist in database will crash the script
		['wood_handle'] = 4,
		['wood'] = 55,
		['gold_ingot'] = 5,
		['silber_ingot'] = 5,
		['steel_ingot'] = 25,
		['packaged_vash'] = 5
	}
},

['pdmkatalog'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'Diverses', -- The category item will be put in
	Desc = 'Der Aktuelle Katalog!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 65, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['paper'] = 30 -- item name and count, adding items that dont exist in database will crash the script
	}
},

['fixtool'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'Diverses', -- The category item will be put in
	Desc = 'Für alle Fahrzeuge!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 25, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['copper_ingot'] = 5, -- item name and count, adding items that dont exist in database will crash the script
		['iron_ingot'] = 5 -- item name and count, adding items that dont exist in database will crash the script

	}
},


['mikrofasertuch'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'Diverses', -- The category item will be put in
	Desc = 'Zum Reinigen von Fahrzeugen',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 15, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['paper'] = 1, -- item name and count, adding items that dont exist in database will crash the script
		['colorthinner'] = 1 -- item name and count, adding items that dont exist in database will crash the script

	}
},

['warndreieck'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'Diverses', -- The category item will be put in
	Desc = 'Zum Absichern einer Unfallstelle! Drip!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 60, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['copper_ingot'] = 5, -- item name and count, adding items that dont exist in database will crash the script
		['packaged_vcoal'] = 3,
		['iron_ingot'] = 5 -- item name and count, adding items that dont exist in database will crash the script

	}
},

['knife'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'weaponsnahkampf', -- The category item will be put in
	Desc = 'Sehr scharf!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 35, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['iron'] = 5, -- item name and count, adding items that dont exist in database will crash the script
		['wood_handle'] = 1,
		['iron_blade'] = 2
	}
},

['bat'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'weaponsnahkampf', -- The category item will be put in
	Desc = 'Aus massivem Eisen!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 25, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['wood_plank'] = 8, -- item name and count, adding items that dont exist in database will crash the script
		['wood_handle'] = 2,
		['iron'] = 2
	}
},

['knuckle'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'weaponsnahkampf', -- The category item will be put in
	Desc = 'Der Meinungsverstärker!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 40, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['iron_ingot'] = 2, -- item name and count, adding items that dont exist in database will crash the script
		['steel_ingot'] = 2,
		['copper'] = 9
	}
},

['flashlight'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'weaponsnahkampf', -- The category item will be put in
	Desc = 'Lumos!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 25, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['gold_ingot'] = 7, -- item name and count, adding items that dont exist in database will crash the script
		['battery_acid'] = 1
	}
},

['hammer'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'weaponsnahkampf', -- The category item will be put in
	Desc = 'Nicht auf die Finger!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 22, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['iron_ingot'] = 5, -- item name and count, adding items that dont exist in database will crash the script
		['steel_ingot'] = 2,
		['wood_handle'] = 2
	}
},

['golfclub'] = {
	Level = 0, -- From what level this item will be craftable
	Desc = 'Für den gehobenen Einsatz!',
	Desc2 = 'Großer text!',
	Category = 'weaponsnahkampf', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 50, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['iron_ingot'] = 9, -- item name and count, adding items that dont exist in database will crash the script
		['steel_ingot'] = 2,
		['copper'] = 8,
		['wood_handle'] = 2
	}
},

['crowbar'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'weaponsnahkampf', -- The category item will be put in
	Desc = 'Klassisches Brechi!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 50, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['iron_ingot'] = 9, -- item name and count, adding items that dont exist in database will crash the script
		['steel_ingot'] = 5,
		['copper'] = 8,
		['graphit'] = 2
	}
},

['dagger'] = {
	Level = 5, -- From what level this item will be craftable
	Category = 'weaponsnahkampf', -- The category item will be put in
	Desc = 'Hinterhältig!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 45, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['iron_ingot'] = 9, -- item name and count, adding items that dont exist in database will crash the script
		['steel_ingot'] = 5,
		['iron_blade'] = 2,
		['wood_handle'] = 1
	}
},

['battleaxe'] = {
	Level = 5, -- From what level this item will be craftable
	Category = 'weaponsnahkampf', -- The category item will be put in
	Desc = 'Für den König!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 60, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['iron_blade'] = 2, -- item name and count, adding items that dont exist in database will crash the script
		['wood_handle'] = 2,
		['steel_ingot'] = 5
	}
},

['hatchet'] = {
	Level = 5, -- From what level this item will be craftable
	Category = 'weaponsnahkampf', -- The category item will be put in
	Desc = 'Schwer und scharf!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 60, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['iron_blade'] = 2, -- item name and count, adding items that dont exist in database will crash the script
		['wood_handle'] = 2,
		['steel_ingot'] = 5
	}
},

['machete'] = {
	Level = 5, -- From what level this item will be craftable
	Category = 'weaponsnahkampf', -- The category item will be put in
	Desc = 'Macht Eindruck!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 60, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['iron_blade'] = 4, -- item name and count, adding items that dont exist in database will crash the script
		['wood_handle'] = 2,
		['steel_ingot'] = 5
	}
},

['switchblade'] = {
	Level = 5, -- From what level this item will be craftable
	Category = 'weaponsnahkampf', -- The category item will be put in
	Desc = 'Kompromisslos und cool!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 75, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['iron_blade'] = 2, -- item name and count, adding items that dont exist in database will crash the script
		['wood_handle'] = 1,
		['steel_ingot'] = 1,
		['iron_ingot'] = 5
	}
},

['wrench'] = {
	Level = 5, -- From what level this item will be craftable
	Category = 'weaponsnahkampf', -- The category item will be put in
	Desc = 'Pragmatisch!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 60, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['iron_ingot'] = 5, -- item name and count, adding items that dont exist in database will crash the script
		['steel_ingot'] = 2
	}
},




['snspistol'] = {
	Level = 3, -- From what level this item will be craftable
	Category = 'weaponsfernkampf', -- The category item will be put in
	Desc = 'Klein und fies!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['weaponpart'] = 2, -- item name and count, adding items that dont exist in database will crash the script
		['steel_ingot'] = 6,
		['abzug'] = 1,
		['wood_handle'] = 1,
		['magazinhalter'] = 2
	}
},

['snspistol_mk2'] = {
	Level = 5, -- From what level this item will be craftable
	Category = 'weaponsfernkampf', -- The category item will be put in
	Desc = 'Klein und tödlich!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['weaponpart'] = 5, -- item name and count, adding items that dont exist in database will crash the script
		['steel_ingot'] = 6,
		['abzug'] = 1,
		['wood_handle'] = 1,
		['visier'] = 1,
		['lauf'] = 1,
		['magazinhalter'] = 2
	}
},

['pistol'] = {
	Level = 3, -- From what level this item will be craftable
	Category = 'weaponsfernkampf', -- The category item will be put in
	Desc = 'Der Klassiker!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['weaponpart'] = 3, -- item name and count, adding items that dont exist in database will crash the script
		['steel_ingot'] = 10,
		['abzug'] = 1,
		['wood_handle'] = 1,
		['magazinhalter'] = 2
	}
},

['pistol_mk2'] = {
	Level = 6, -- From what level this item will be craftable
	Category = 'weaponsfernkampf', -- The category item will be put in
	Desc = 'Handfeuer - Speerspitze!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['weaponpart'] = 6, -- item name and count, adding items that dont exist in database will crash the script
		['steel_ingot'] = 5,
		['iron_ingot'] = 10,
		['abzug'] = 1,
		['schaft'] = 1,
		['lauf'] = 1,
		['wood_handle'] = 1,
		['magazinhalter'] = 1
	}
},

['smg'] = {
	Level = 10, -- From what level this item will be craftable
	Category = 'weaponsfernkampfbig', -- The category item will be put in
	Desc = 'Kriminelle Königsklasse!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 60, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['abzug'] = 1, -- item name and count, adding items that dont exist in database will crash the script
		['visier'] = 1,
		['magazinhalter'] = 1,
		['wood_handle'] = 2,
		['muendung'] = 1,
		['weaponpart'] = 2,
		['schaft'] = 1,
		['lauf'] = 1
	}
},


-------------------
--DROGEN STRECKEN--
-------------------
---------
--100g--
---------

['100gmeth_cut'] = {
	Level = 3, -- From what level this item will be craftable
	Category = 'drogenstrecken100g', -- The category item will be put in
	Desc = 'Walther wäre stolz!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 60, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['100gmeth'] = 1, -- item name and count, adding items that dont exist in database will crash the script
		['diamond'] = 100
	}
},

['100glsd_cut'] = {
	Level = 3, -- From what level this item will be craftable
	Category = 'drogenstrecken100g', -- The category item will be put in
	Desc = 'Bunte Farben!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 60, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['100glsd'] = 1, -- item name and count, adding items that dont exist in database will crash the script
		['frostschutzmittel'] = 50,
		['colorthinner'] = 50
	}
},

['100gcroc_cut'] = {
	Level = 3, -- From what level this item will be craftable
	Category = 'drogenstrecken100g', -- The category item will be put in
	Desc = 'Chemisches Meisterwerk!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 60, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['100gcroc'] = 1, -- item name and count, adding items that dont exist in database will crash the script
		['coal'] = 50,
		['colorthinner'] = 50
	}
},

['100gmdma_cut'] = {
	Level = 3, -- From what level this item will be craftable
	Category = 'drogenstrecken100g', -- The category item will be put in
	Desc = 'Konzentriertes Glück!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 60, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['100gmdma'] = 1, -- item name and count, adding items that dont exist in database will crash the script
		['coal'] = 50,
		['frostschutzmittel'] = 50
	}
},

['100gheroin_cut'] = {
	Level = 3, -- From what level this item will be craftable
	Category = 'drogenstrecken100g', -- The category item will be put in
	Desc = 'Raffinierter Schlafmohn!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 60, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['100gheroin'] = 1, -- item name and count, adding items that dont exist in database will crash the script
		['hefe_pilz'] = 50,
		['fruit_sugar'] = 50
	}
},


['100gweed_cut'] = {
	Level = 3, -- From what level this item will be craftable
	Category = 'drogenstrecken100g', -- The category item will be put in
	Desc = 'Northern Lights und $ Signs!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 60, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['100gweed'] = 1, -- item name and count, adding items that dont exist in database will crash the script
		['glass'] = 50,
		['sand'] = 50
	}
},

['100gcoke_cut'] = {
	Level = 3, -- From what level this item will be craftable
	Category = 'drogenstrecken100g', -- The category item will be put in
	Desc = 'Weißer Reichtum mit Tas!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 60, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['100gcoke'] = 1, -- item name and count, adding items that dont exist in database will crash the script
		['glass'] = 50,
		['mehl'] = 50
	}
},

---------
--1KG--
---------
['1kgmeth_cut'] = {
	Level = 10, -- From what level this item will be craftable
	Category = 'drogenstrecken1kg', -- The category item will be put in
	Desc = 'Big Business Beyda!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 120, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['1kgmeth'] = 1, -- item name and count, adding items that dont exist in database will crash the script
		['diamond'] = 1000
	}
},

['1kglsd_cut'] = {
	Level = 10, -- From what level this item will be craftable
	Category = 'drogenstrecken1kg', -- The category item will be put in
	Desc = 'Die Welt träumt!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 120, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['1kglsd'] = 1, -- item name and count, adding items that dont exist in database will crash the script
		['frostschutzmittel'] = 500,
		['colorthinner'] = 500
	}
},

['1kgcroc_cut'] = {
	Level = 10, -- From what level this item will be craftable
	Category = 'drogenstrecken1kg', -- The category item will be put in
	Desc = 'Kann eine Stadt töten!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 120, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['1kgcroc'] = 1, -- item name and count, adding items that dont exist in database will crash the script
		['coal'] = 500,
		['colorthinner'] = 500
	}
},

['1kgmdma_cut'] = {
	Level = 10, -- From what level this item will be craftable
	Category = 'drogenstrecken1kg', -- The category item will be put in
	Desc = 'Chemische Perfektion!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 120, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['1kgmdma'] = 1, -- item name and count, adding items that dont exist in database will crash the script
		['coal'] = 500,
		['frostschutzmittel'] = 500
	}
},

['1kgheroin_cut'] = {
	Level = 10, -- From what level this item will be craftable
	Category = 'drogenstrecken1kg', -- The category item will be put in
	Desc = 'Golden Shot oder Money Drop?!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 120, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['1kgheroin'] = 1, -- item name and count, adding items that dont exist in database will crash the script
		['hefe_pilz'] = 500,
		['fruit_sugar'] = 500
	}
},


['1kgweed_cut'] = {
	Level = 10, -- From what level this item will be craftable
	Category = 'drogenstrecken1kg', -- The category item will be put in
	Desc = 'Amnesia - Göttin der Träume!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 120, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['1kgweed'] = 1, -- item name and count, adding items that dont exist in database will crash the script
		['glass'] = 500,
		['sand'] = 500
	}
},

['1kgcoke_cut'] = {
	Level = 10, -- From what level this item will be craftable
	Category = 'drogenstrecken1kg', -- The category item will be put in
	Desc = 'Kein Persil!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 120, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['1kgcoke'] = 1, -- item name and count, adding items that dont exist in database will crash the script
		['glass'] = 500,
		['mehl'] = 500
	}
},
-----------------
--VIP-STUFF------
-----------------
['viptoken'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'vip', -- The category item will be put in
	Desc = 'Nobilis!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 2, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 120, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['vipmotor'] = 1
	}
},

['neuesimkarte'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'vip', -- The category item will be put in
	Desc = 'Neue Nummer wer da?!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['viptoken'] = 1
	}
},

['HausKaufbarMachen'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'vip', -- The category item will be put in
	Desc = 'Wähle deinen Standort!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['viptoken'] = 6
	}
},

['skinpaket'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'vip', -- The category item will be put in
	Desc = 'Exklusives Bang Bang!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['viptoken'] = 2
	}
},

['tierpaket'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'vip', -- The category item will be put in
	Desc = 'Wuff! Miau?',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['viptoken'] = 2
	}
},

['neuebankkarte'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'vip', -- The category item will be put in
	Desc = 'Für den smarten Anleger!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['viptoken'] = 1
	}
},

['marktpaket'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'vip', -- The category item will be put in
	Desc = 'Arbeite klug nicht viel!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['viptoken'] = 1
	}
},


['neuanfang'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'vip', -- The category item will be put in
	Desc = 'Neues Glück!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['viptoken'] = 1
	}
},



-----------------
--KOCHEN---------
-----------------
['chips'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'kochen', -- The category item will be put in
	Desc = 'Lecker!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 25, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['kartoffel'] = 2
	}
},
['fishandchips'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'kochen', -- The category item will be put in
	Desc = 'Fettig!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 40, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 35, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['chips'] = 40,
		['fried_fish'] = 40,
		['paper'] = 1
	}
},
-----------------
--MECHANIKER-----
-----------------
['turbo_lvl_1'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanikerturbo', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {"mechanic","mechanic2","cardealer","cardealer2"}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 30, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['steel_ingot'] = 10, -- item name and count, adding items that dont exist in database will crash the script
		['silber_ingot'] = 5
	}
},

['turbo_lvl_2'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanikerturbo', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {"mechanic","mechanic2","cardealer","cardealer2"}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 45, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['steel_ingot'] = 20, -- item name and count, adding items that dont exist in database will crash the script
		['gold_ingot'] = 5
	}
},

['turbo_lvl_3'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanikerturbo', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {"mechanic","mechanic2","cardealer","cardealer2"}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 60, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['steel_ingot'] = 30, -- item name and count, adding items that dont exist in database will crash the script
		['bernstein'] = 25
	}
},

['turbo_lvl_4'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanikerturbo', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {"mechanic","mechanic2","cardealer","cardealer2"}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 75, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['steel_ingot'] = 40, -- item name and count, adding items that dont exist in database will crash the script
		['diamond'] = 1
	}
},

['turbo_lvl_5'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanikerturbo', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {"mechanic","mechanic2","cardealer","cardealer2"}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 80, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['steel_ingot'] = 55, -- item name and count, adding items that dont exist in database will crash the script
		['smaragd'] = 5,
		['diamond'] = 1
	}
},

['oil_lvl_2'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanikeroele', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {"mechanic","mechanic2","cardealer","cardealer2"}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 30, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['oil'] = 25, -- item name and count, adding items that dont exist in database will crash the script
		['colorthinner'] = 25
	}
},

['oil_lvl_3'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanikeroele', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {"mechanic","mechanic2","cardealer","cardealer2"}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 45, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['oil'] = 100, -- item name and count, adding items that dont exist in database will crash the script
		['frostschutzmittel'] = 75,
		['colorthinner'] = 75
	}
},

['oil_lvl_4'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanikeroele', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {"mechanic","mechanic2","cardealer","cardealer2"}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 60, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['oil'] = 200, -- item name and count, adding items that dont exist in database will crash the script
		['frostschutzmittel'] = 100,
		['colorthinner'] = 100
	}
},

['oil_lvl_5'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanikeroele', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {"mechanic","mechanic2","cardealer","cardealer2"}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 120, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['oil'] = 300, -- item name and count, adding items that dont exist in database will crash the script
		['frostschutzmittel'] = 200,
		['colorthinner'] = 200
	}
},


['motor_lvl_2'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanikermotoren', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {"mechanic","mechanic2","cardealer","cardealer2"}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 30, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['oil'] = 25, -- item name and count, adding items that dont exist in database will crash the script
		['frostschutzmittel'] = 25,
		['iron_ingot'] = 25,
		['steel_ingot'] = 10
	}
},

['motor_lvl_3'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanikermotoren', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {"mechanic","mechanic2","cardealer","cardealer2"}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 60, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['oil'] = 90, -- item name and count, adding items that dont exist in database will crash the script
		['frostschutzmittel'] = 35,
		['gold_ingot'] = 25,
		['iron_ingot'] = 55
	}
},

['motor_lvl_4'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanikermotoren', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {"mechanic","mechanic2","cardealer","cardealer2"}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 80, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['oil'] = 300, -- item name and count, adding items that dont exist in database will crash the script
		['frostschutzmittel'] = 200,
		['gold_ingot'] = 55,
		['vash'] = 55,
		['colorthinner'] = 200
	}
},

['reifen_lvl_2'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanikerreifen', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {"mechanic","mechanic2","cardealer","cardealer2"}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 80, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['oil'] = 200, -- item name and count, adding items that dont exist in database will crash the script
		['frostschutzmittel'] = 125,
		['gold_ingot'] = 15,
		['vash'] = 15,
		['colorthinner'] = 75
	}
},

['bremsen_lvl_2'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'mechanikerbremsen', -- The category item will be put in
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {"mechanic","mechanic2","cardealer","cardealer2"}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 80, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['oil'] = 50, -- item name and count, adding items that dont exist in database will crash the script
		['frostschutzmittel'] = 125,
		['steel_ingot'] = 35,
		['vash'] = 15,
		['colorthinner'] = 75
	}
},

-----------------
--BANK HEIST--
-----------------
['thermit'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'kriminell', -- The category item will be put in
	Desc = 'Sprengstoff für sichere Schlösser!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 3, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 60, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['oil'] = 20, -- item name and count, adding items that dont exist in database will crash the script
		['frostschutzmittel'] = 25,
		['aluminium_ingot'] = 5,
		['iron_ingot'] = 8,
		['colorthinner'] = 25
	}
},
['laptop'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'kriminell', -- The category item will be put in
	Desc = 'Hacking leichtgemacht!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 60, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['diamond'] = 5, -- item name and count, adding items that dont exist in database will crash the script
		['gold_ingot'] = 5,
		['silber_ingot'] = 8,
		['copper'] = 120
	}
},
['hacking_device'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'kriminell', -- The category item will be put in
	Desc = 'Hacking OS!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 60, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['diamond'] = 5, -- item name and count, adding items that dont exist in database will crash the script
		['gold_ingot'] = 15,
		['silber_ingot'] = 3,
		['vash'] = 40
	}
},


['drill_bank_heist'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'kriminell', -- The category item will be put in
	Desc = 'Aufbohren? Kein Problem!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 60, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['diamond'] = 25, -- item name and count, adding items that dont exist in database will crash the script
		['gold_ingot'] = 15,
		['silber_ingot'] = 9,
		['vash'] = 23,
		['packaged_vcoal'] = 3,
	}
},
-----------------
--CRAFTING MATS--
-----------------
--['diamond'] = {
--	Level = 25, -- From what level this item will be craftable
--	Category = 'MATS', -- The category item will be put in
--	isGun = false, -- Specify if this is a gun so it will be added to the loadout
--	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
--	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
--	Amount = 10, -- The amount that will be crafted
--	SuccessRate = 100, --  100% you will recieve the item
--	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
--	Time = 35, -- Time in seconds it takes to craft this item
--	Ingredients = { -- Ingredients needed to craft this item
--		['coal'] = 1000
--	}
--},

['iron'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'MATS', -- The category item will be put in
	Desc = 'So alt wie die Zeit!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 24, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 35, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['iron_ingot'] = 5
	}
},

['copper'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'MATS', -- The category item will be put in
	Desc = 'Schimmert leicht!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 24, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 35, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['copper_ingot'] = 5
	}
},

['ash'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'MATS', -- The category item will be put in
	Desc = 'Staubig und ölig!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 14, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 45, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['vash'] = 1
	}
},

['vash'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'MATS', -- The category item will be put in
	Desc = 'Fest und zäh!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 2, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 60, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['packaged_vash'] = 1
	}
},

['vcoal'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'MATS', -- The category item will be put in
	Desc = 'Sehr dunkel!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 2, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 60, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['packaged_vcoal'] = 1
	}
},

['coal'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'MATS', -- The category item will be put in
	Desc = 'Bröckelt leicht!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 29, -- The amount that will be crafted
	SuccessRate = 100, --  100% you will recieve the item
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 60, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['vcoal'] = 1
	}
},

['steel_ingot'] = {
	Level = 0, -- From what level this item will be craftable
	Category = 'MATS', -- The category item will be put in
	Desc = 'Werkzeug oder Waffe?!',
	Desc2 = 'Großer text!',
	isGun = false, -- Specify if this is a gun so it will be added to the loadout
	Jobs = {}, -- What jobs can craft this item, leaving {} allows any job
	JobGrades = {}, -- What job grades can craft this item, leaving {} allows any grade
	Amount = 1, -- The amount that will be crafted
	SuccessRate = 100, -- 90% That the craft will succeed! If it does not you will lose your ingredients
	requireBlueprint = false, -- Requires a blueprint whitch you need to add in the database yourself TEMPLATE: itemname_blueprint EXAMPLE: bandage_blueprint
	Time = 20, -- Time in seconds it takes to craft this item
	Ingredients = { -- Ingredients needed to craft this item
		['iron_ingot'] = 10, -- item name and count, adding items that dont exist in database will crash the script
		['wood_coal'] = 2,
		['graphit'] = 1 -- item name and count, adding items that dont exist in database will crash the script

	}
}

},

Workbenches = { -- Every workbench location, leave {} for jobs if you want everybody to access

	--	{coords = vector3(700.11,575.71,131.46), jobs = {}, blip = false, recipes = {}, radius = 3.0 },	--DIESE MUSS RAUS
	--	{coords = vector3(106.99,6628.97,32.79), jobs = {"mechanic"}, blip = false, recipes = {}, radius = 3.0 }
	{coords = vector3(-1627.86,-1055.23,14.15), jobs = {}, blip = false, recipes = {}, radius = 3.0 },
	{coords = vector3(2341.85,3139.52,49.21), jobs = {}, blip = false, recipes = {}, radius = 3.0 },
	{coords = vector3(427.58,6477.6,29.8), jobs = {}, blip = false, recipes = {}, radius = 3.0 },
	{coords = vector3(1124.77,90.093,81.94), jobs = {}, blip = false, recipes = {}, radius = 3.0 }
},
 

Text = {

    ['not_enough_ingredients'] = 'Dir fehlen die notwendigen Materialien!',
    ['you_cant_hold_item'] = 'Du trägst bereits zu viel bei dir!',
    ['item_crafted'] = 'Gegenstand hergestellt!',
    ['wrong_job'] = 'Diese Werkbank kannst du nicht öffnen!',
    ['workbench_hologram'] = '[~b~E~w~] Werkbank',
    ['wrong_usage'] = 'Der Befehl wurde falsch angewandt!',
    ['inv_limit_exceed'] = 'Inventar voll!',
    ['crafting_failed'] = 'Dir sind die Materialien heruntergefallen, schade!'

}

}



function SendTextMessage(msg)

        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0,1)

        --EXAMPLE USED IN VIDEO
        exports['mythic_notify']:SendAlert('inform', msg)

end
