Config = {}

Config.Locale = 'en'

Config.Delays = {
	WeedProcessing = 600 * 10,
	MethProcessing = 600 * 10,
	CokeProcessing = 600 * 10,
	lsdProcessing = 600 * 10,
	HeroinProcessing = 600 * 10,
	thionylchlorideProcessing = 600 * 10,
}

Config.DrugDealerItems = {
	heroin = 100,
	marijuana = 100,
	meth = 130,
	coke = 120,
	lsd = 170,
}

Config.ChemicalsConvertionItems = {
	hydrochloric_acid = 0,
	sodium_hydroxide = 0,
	sulfuric_acid = 0,
	lsa = 0,
}

Config.ChemicalsLicenseEnabled = false --Will Enable or Disable the need for a Chemicals License.
Config.MoneyWashLicenseEnabled = true --Will Enable or Disable the need for a MoneyWash License.

Config.LicensePrices = {
	--weed_processing = {label = _U('license_weed'), price = 15000}
}

Config.Licenses = {
	moneywash = 750000,
	chemicalslisence = 1000000,
}

Config.GiveBlack = true -- give black money? if disabled it'll give regular cash.

Config.EnableMapsBlimps = false -- Enables the blimps on the map.

Config.CircleZones = {
	
	--License -- ok
	LicenseShop = {coords = vector3(707.17, -962.5, 30.4), blimpcoords = vector3(707.17, -962.5, 30.4), name = _U('blip_licenseshop'),color = 9, sprite = 498, radius = 0.0, enabled = true},

	--DrugDealer -- ok
	--DrugDealer = {coords = vector3(-617.82, -1620.95, 33.01), blimpcoords = vector3(-617.82, -1620.95, 33.01), name = _U('blip_drugdealer'), color = 6, sprite = 378, radius = 0.0, enabled = true},
	
	--MoneyWash -- ok 
	MoneyWash = {coords = vector3(-32.00, 6453.56, 24.34), blimpcoords = vector3(-1672.58, 372.2, 85.12), name = _U('blip_moneywash'), color = 1, sprite = 500, radius = 0.0, enabled = true},
}
