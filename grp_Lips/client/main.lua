--ESX = nil
--
--Citizen.CreateThread(function()
--	while ESX == nil do
--		TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
--		Citizen.Wait(0)
--	end
--
--	while ESX.GetPlayerData().job == nil do
--		Citizen.Wait(100)
--	end
--
--	PlayerLoaded = true
--	ESX.PlayerData = ESX.GetPlayerData()
--end)
--
--RegisterNetEvent('esx:playerLoaded')
--AddEventHandler('esx:playerLoaded', function(xPlayer)
--	ESX.PlayerData = xPlayer
--	PlayerLoaded = true
--end)
--
--RegisterNetEvent('esx:setJob')
--AddEventHandler('esx:setJob', function(job)
--	ESX.PlayerData.job = job
--end)



local blipswichtig = { 
	{title="Creative Hub", colour=46, id=565, x = -1607.36, y = -1053.71, z = 1.33}, --los santos
	{title="Creative Hub", colour=46, id=565, x = 1137.27, y = 72.81, z = 1.33}, --los santos2
    {title="Creative Hub", colour=46, id=565, x = 2346.36, y = 3129.71, z = 1.33}, --sandy shores
    {title="Creative Hub", colour=46, id=565, x = 424.36, y = 6472.71, z = 1.33}, --Paleto bay (bitte noch einfügen)
}

local blipsgroesser = { 
	

	{title="Justiz", colour=47, id=526, x = -438.02, y = 1107.12, z = 30.39},
    {title="Polizei", colour=58, id=60, x = 444.95, y = -981.95, z = 30.39},
    {title="Sheriff Department", colour=56, id=60, x = 1856.95, y = 3682.95, z = 20.39},
	{title="FIB", colour=25, id=60, x = 100.36, y = -743.81, z = 45.75},    
   -- {title="Ordnungsamt", colour=84, id=60, x = 352.95, y = -1685.95, z = 30.39},
    {title="Krankenhaus", colour=43, id=61, x = 302.15, y = -598.27, z = 30.39}, --ls
	{title="Gefängnis", colour=81, id=188, x = 1803.41, y = 2605.11, z = 45.57},

}


local blips = {
	--{title="Vanilla Unicorn", colour=8, id=121, x = 125.69, y = -1289.11, z = 25.39},
	--{title="Nachtclub", colour=7, id= 439, x = -109.12, y = 353.01, z = 112.7},
	{title="Import Showroom", colour=46, id=523, x = -1394.69, y = -3265.11, z = 30.39},
	{title="Bootsproduktion", colour=83, id=427, x = 714.22, y = 4102.45, z = 35.63},
	{title="Fahrzeugproduktion", colour=83, id=326, x = -442.69, y = -2177.11, z = 30.39},
	{title="PDM", colour=84, id=523, x = -45.95, y = -1098.95, z = 30.39},
	{title="Rich Car GmbH", colour=84, id=617, x = 130.41, y = -149.22, z = 30.39},
	--{title="Luxury Cars", colour=84, id=304, x = -796.08, y = -218.98, z = 37.44},
	{title="Garage", colour=38, id=290, x = -316.29, y = -1026.18, z = 30.39}, 
	{title="Garage", colour=38, id=290, x = 232.29, y = -792.44, z = 30.39},   
	{title="Garage", colour=38, id=290, x = 288.29, y = -339.44, z = 30.39},   
	{title="Garage", colour=38, id=290, x = 1857.29, y = 2720.44, z = 30.39},   
	{title="Garage", colour=38, id=290, x = 1548.29, y = 3781.44, z = 30.39},   
	{title="Garage", colour=38, id=290, x = -1056.29, y = -1411.44, z = 30.39},   
	{title="Garage", colour=38, id=290, x = -1669.29, y = 66.44, z = 30.39},   
	{title="Garage", colour=38, id=290, x = 56.29, y = 6385.44, z = 30.39},   
	{title="Garage", colour=38, id=290, x = 1059.29, y = -1969.44, z = 30.39},   
	{title="Garage", colour=38, id=290, x = 782.29, y = -2977.44, z = 30.39},   
	{title="Garage", colour=38, id=290, x = -742.29, y = -2473.44, z = 30.39},   
	{title="Garage", colour=38, id=290, x = -63.29, y = -1838.44, z = 30.39},   
	{title="Garage", colour=38, id=290, x = 405.29, y = -1641.44, z = 30.39},   
	{title="Garage", colour=38, id=290, x = -162.29, y = -1303.44, z = 30.39},   
	{title="Garage", colour=38, id=290, x = -633.29, y = -74.44, z = 30.39},   
	--{title="Garage", colour=38, id=290, x = -1537.29, y = 884.44, z = 30.39},   
	{title="Garage", colour=38, id=290, x = -405.29, y = 1213.44, z = 30.39},   
	--{title="Garage", colour=38, id=290, x = 1405.29, y = 1118.44, z = 30.39},   
	{title="Garage", colour=38, id=290, x = -2525.29, y = 2348.44, z = 30.39},   
	{title="Garage", colour=38, id=290, x = 2742.29, y = 4405.44, z = 30.39},   
	--{title="Ikea", colour=47, id=605, x = 51.02, y = -1735.12, z = 30.39},
	{title="Kleidungsladen", colour=0, id=73, x = -703.78, y = -152.26, z = 30.39},
	{title="Kleidungsladen", colour=0, id=73, x = 78.63, y = -1390.6, z = 29.37},
	{title="Kleidungsladen", colour=0, id=73, x = 428.69, y = -800.11, z = 30.39},
	{title="Kleidungsladen", colour=0, id=73, x = -828.69, y = -1074.11, z = 30.39},
	{title="Friseur", colour=0, id=71, x = 1931.69, y = 3729.11, z = 30.39},
	{title="Friseur", colour=0, id=71, x = -277.69, y = 6228.11, z = 30.39},
	{title="Friseur", colour=0, id=71, x = -33.69, y = -155.11, z = 30.39},
	{title="Friseur", colour=0, id=71, x = 137.69, y = -1707.11, z = 30.39},
	{title="Fahrschule", colour=0, id=545, x = 690.23, y = 601.64, z = 30.39},
	{title="Tattoo Shop", colour=0, id=75, x = 322.1, y = 180.4, z = 30.39},
    {title="Tattoo Shop", colour=0, id=75, x = 1324.01, y = -1652.4, z = 30.39},
    {title="Tattoo Shop", colour=0, id=75, x = -3170.01, y = 1074.4, z = 30.39},
    {title="Tattoo Shop", colour=0, id=75, x = 1863.01, y = 3749.4, z = 2.39},
    {title="Tattoo Shop", colour=0, id=75, x = -293.01, y = 6200.4, z = 2.39},
	--{title="Maskenladen", colour=47, id=362, x = -1338.1, y = -1278.2, z = 30.39},
	{title="Mechaniker", colour=46, id=446, x = -214.61, y = -1326.76, z = 30.39},
	{title="Händlerankauf", colour=25, id=480, x = 412.73, y = 313.56, z = 30.39},
	{title="Händlerankauf", colour=25, id=480, x = 182.96, y = -1319.31, z = 30.39},  
	{title="Händlerankauf", colour=25, id=480, x = 1866.96, y = 306.31, z = 30.39},  
	{title="Asche verdichten & verpacken", colour=28, id=467, x = 360.10, y = 3406.31, z = 32.39},  
	{title="Kohle verdichten & verpacken", colour=28, id=467, x = 2892.48, y = 4419.02, z = 49.39}, 
	{title="Tabak Verarbeitung", colour=28, id=467, x = -113.96, y = 6211.31, z = 3.39},  
	{title="Fruchtzucker Lieferung", colour=28, id=467, x = 1183.96, y = -3162.31, z = 3.39},  
	{title="Kevlar Herstellung", colour=28, id=467, x = 2632.96, y = 2933.31, z = 30.39},  
	{title="Glas Manufaktur", colour=28, id=467, x = 733.96, y = -1270.31, z = 25.39},  
	{title="Gießerei", colour=28, id=467, x = 1066.96, y = -1965.31, z = 3.39},  
	{title="Sägewerk", colour=28, id=467, x = -554.96, y = 5370.31, z = 3.39},  
	{title="Papier", colour=45, id=478, x = 591.96, y = 2783.31, z = 3.39},  
	{title="Mett", colour=45, id=171, x = 1983.17, y = 5173.24, z = 46.5},
	{title="Beton", colour=45, id=478, x = -36.96, y = -2171.31, z = 3.39},  
	{title="Eisen", colour=45, id=478, x = 2928.96, y = 2761.31, z = 3.39},  
	{title="Kupfer", colour=45, id=478, x = 1975.96, y = 725.31, z = 30.39},  
	{title="Sand", colour=45, id=478, x = 2722.96, y = 2894.31, z = 30.39},  
	{title="Asche", colour=45, id=478, x = -1145.96, y = 4969.31, z = 30.39},  
	{title="Tabak", colour=45, id=478, x = 324.96, y = 6653.31, z = 30.39},
	{title="Öl", colour=45, id=478, x = 103.25, y = 6623.26, z = 31.39},
	{title="Fischen", colour=45, id=478, x = 950.16, y = -2658.98, z = 3.7},  
	{title="Weizen", colour=45, id=478, x = 2645.23, y = 4444.6, z = 40.39},
	{title="Farbverdünner", colour=45, id=478, x = 2510.48, y = 3785.87, z = 50.92},
	{title="Hefepilze pflücken", colour=45, id=478, x = -1552.96, y = 4431.31, z = 30.39}, 
	{title="Kartoffeln", colour=45, id=478, x = 2076.46, y = 4916.94, z = 40.09},
	{title="Holzkohle", colour=28, id=467, x = 2726.02, y = 1539.84, z = 49.53},
	{title="Schweinefarm", colour=45, id=478, x = -85.67, y = 1879.94, z = 196.3},
	{title="Bootsgarage", colour=29, id=427, x = -1800.48, y = -1224.35, z = 1.59},
	{title="Bootsgarage", colour=29, id=427, x = -788.3, y = -1490.3, z = 1.59},
	{title="Bootsgarage", colour=29, id=427, x = 1333.5, y = 4273.4, z = 31.95},
	{title="Bootsgarage", colour=29, id=427, x = 3858.53, y = 4459.12, z = 1.83},
	{title="Bootsgarage", colour=29, id=427, x = -3283.39, y = 966.06, z = 8.35},
	{title="Bootsgarage", colour=29, id=427, x = -210.92, y = 6573.19, z = 11.02},
	{title="Bootsgarage", colour=29, id=427, x = 1420.66, y = 3823.4, z = 31.93},



}

--job blips





--medics
local medicblips = {

    {title="Krankenhaus", colour=43, id=61, x = -1632.15, y = 4735.27, z = 30.39}, --spawn
    {title="Krankenhaus", colour=43, id=61, x = 1840.15, y = 3669.27, z = 30.39}, --sandy shores
    {title="Krankenhaus", colour=43, id=61, x = -1626.42, y = -1015.96, z = 12.15}, --HUB
    {title="Krankenhaus", colour=43, id=61, x = 1152.27, y = -1527.96, z = 33.15}, --st fiacre hospital
    {title="Krankenhaus", colour=43, id=61, x = -449.11, y = -340.77, z = 33.50}, --mount zonah KH

}



--Citizen.CreateThread(function()
--    if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
--	for _, info in pairs(medicblips) do
--      info.blip = AddBlipForCoord(info.x, info.y, info.z)
--      SetBlipSprite(info.blip, info.id)
--      SetBlipDisplay(info.blip, 4)
--
--      SetBlipScale(info.blip, 0.7)
--      SetBlipColour(info.blip, info.colour)
--      SetBlipAsShortRange(info.blip, true)
--	  BeginTextCommandSetBlipName("STRING")
--      AddTextComponentString(info.title)
--      EndTextCommandSetBlipName(info.blip)
--    end
--	end
--end)





--die kleinen (unwichtigeren)
Citizen.CreateThread(function()
    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)

      SetBlipScale(info.blip, 0.7)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

--mittel groß
Citizen.CreateThread(function()

    for _, info in pairs(blipsgroesser) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)

      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

--die größten
Citizen.CreateThread(function()

    for _, info in pairs(blipswichtig) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.5)
	  SetBlipPriority(info.blip, 100)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)
