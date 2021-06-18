local PlayerData

ESX = nil


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)


local zones = {
	{ ['x'] = -1590.76, ['y'] = 5212.01, ['z'] = 4.04}, --spawn 
	{ ['x'] = -1617.76, ['y'] = 5273.01, ['z'] = 4.04}, --spawnhelipad
	{ ['x'] = -1580.76, ['y'] = 5170.01, ['z'] = 19.04}, --spawnoben		
	{ ['x'] = -1815.50, ['y'] = 5612.57, ['z'] = 296.06}, --spawnflugzeug oben		
	{ ['x'] = 257.64, ['y'] = -574.15, ['z'] = 42.92 },  --Krankenhaus  strasse
	{ ['x'] = 2645.64, ['y'] = 4444.15, ['z'] = 39.92 },  --weizen
	{ ['x'] = -2007.62, ['y'] = 3184.29, ['z'] = 32.04 },  --Spawnhalle 1
	{ ['x'] = -1987.62, ['y'] = 3219.29, ['z'] = 32.04 },  --Spawnhalle  2		
	{ ['x'] = 1096.56, ['y'] = -2000.29, ['z'] = 31.04 },  --Schmelze	
	{ ['x'] = 1066.56, ['y'] = -1959.29, ['z'] = 31.04 },  --Schmelze		2
	{ ['x'] = 852.56, ['y'] = -946.29, ['z'] = 26.04 },  --Fahrzeugherstellung		
	{ ['x'] = 3004.56, ['y'] = 2765.29, ['z'] = 42.04 },  --Eisenmine	
	{ ['x'] = 2946.56, ['y'] = 2838.29, ['z'] = 42.04 },  --Eisenmine	
	{ ['x'] = 2921.56, ['y'] = 2747.29, ['z'] = 42.04 },  --Eisenmine
	{ ['x'] = 2973.5, ['y'] = 2838.42, ['z'] = 45.79 },  --Eisenmine	
	{ ['x'] = 730.49, ['y'] = -1270.29, ['z'] = 25.31 },  --GLAS MANUFAKTUR	
	{ ['x'] = 1183.49, ['y'] = -3163.29, ['z'] = 6.31 },  --FruchtZucker
	{ ['x'] = -36.49, ['y'] = -2172.29, ['z'] = 6.31 },  --Beton
	{ ['x'] = 1137.49, ['y'] = 124.29, ['z'] = 70.31 },  --hub LS 2
	{ ['x'] = -85.49, ['y'] = 1879.29, ['z'] = 197.31 },  --Schweinebabys
	{ ['x'] = 1983.17, ['y'] = 5173.24, ['z'] = 46.5 },  --Mett
	{ ['x'] = -1135.56, ['y'] = 4967.29, ['z'] = 221.04 },  --Asche	
	{ ['x'] = 1974.56, ['y'] = 731.29, ['z'] = 166.04 },  --Kupfer		
	{ ['x'] = -211.56, ['y'] = -1323.29, ['z'] = 30.04 },  --Mechaniker		
	{ ['x'] = 358.56, ['y'] = 3411.29, ['z'] = 36.04 },  --Asche	verdichten	
	{ ['x'] = 320.56, ['y'] = 6657.29, ['z'] = 29.04 },  --Tabak	
	{ ['x'] = 2662.36, ['y'] = 3492.10, ['z'] = 62.30 },  --Sheriffzellen
	{ ['x'] = 318.36, ['y'] = -591.10, ['z'] = 42.30 },  --MD2
	{ ['x'] = -92.56, ['y'] = 6193.29, ['z'] = 31.04 },  --Tabak	verarbeiten
	{ ['x'] = 2510.48, ['y'] = 3785.87, ['z'] = 50.92 },  --Farbverdünner
	{ ['x'] = 950.03, ['y'] = -2659.12, ['z'] = 2.81 },  --Fische		
	{ ['x'] = 2351.56, ['y'] = 3133.29, ['z'] = 47.04 },  --Hub Sandy Shores	
	{ ['x'] = 2302.56, ['y'] = 3023.29, ['z'] = 6.04 },  --Hub Sandy Shores Safe
	{ ['x'] = 2720.56, ['y'] = 2895.29, ['z'] = 37.95 },  --Sand
	{ ['x'] = 592.72, ['y'] = 2784.03, ['z'] = 74.95 },  --Papier
	--{ ['x'] = -323.9, ['y'] = -130.21, ['z'] = 37.99 },  --Frostschutzmittel
	{ ['x'] = -554.65, ['y'] = 5370.15, ['z'] = 70.31 },  --Holz
	{ ['x'] = -509.1, ['y'] = 5257.83, ['z'] = 80.66 },  --Holzbretter
	{ ['x'] = -560.44, ['y'] = 5282.47, ['z'] = 72.57 },  --Holzfasern
	{ ['x'] = 429.56, ['y'] = 6468.71, ['z'] = 27.77 },  --Hub Paleto bay	
	--{ ['x'] = -41.6, ['y'] = -1115.54, ['z'] = 26.04 },  --TEMPORÄR
	{ ['x'] = 973.44, ['y'] = -2167.44, ['z'] = 28.42 },  --MD2
	{ ['x'] = -1606.53, ['y'] = -1049.84, ['z'] = 12.05 },  --HUB Los Santos	 
}

local notifIn = false
local notifOut = false
local closestZone = 1


Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	
	while true do
		local playerPed = GetPlayerPed(-1)
		local x, y, z = table.unpack(GetEntityCoords(playerPed, true))
		local minDistance = 100000
		for i = 1, #zones, 1 do
			dist = Vdist(zones[i].x, zones[i].y, zones[i].z, x, y, z)
			if dist < minDistance then
				minDistance = dist
				closestZone = i
			end
		end
		Citizen.Wait(15000)
	end
end)

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	
	while true do
		Citizen.Wait(0)
		local player = GetPlayerPed(-1)
		local x,y,z = table.unpack(GetEntityCoords(player, true))
		local dist = Vdist(zones[closestZone].x, zones[closestZone].y, zones[closestZone].z, x, y, z)
		local vehicle = GetVehiclePedIsIn(player, false)
		local speed = 10.0
		local speed2 = 999.0
		
		--DrawMarker(1, 1135.0303955078,120.57656860352,80.900779724121, 0, 0, 0, 0, 0, 0, 80.0, 80.0, 0.5, 0, 155, 255, 155, 0, 0, 2, 2, 0, 0, 0)
		--DrawMarker(1, 1086.3168945312,55.827449798584,80.890869140625, 0, 0, 0, 0, 0, 0, 80.0, 80.0, 0.5, 0, 155, 255, 155, 0, 0, 2, 2, 0, 0, 0)
		--DrawMarker(1, zones[closestZone].x, zones[closestZone].y, zones[closestZone].z, 0, 0, 0, 0, 0, 0, 80.0, 80.0, 0.5, 0, 155, 255, 155, 0, 0, 2, 2, 0, 0, 0)
		--if dist <= 40.0 then  
		if dist <= 40.0 then  
			if not notifIn then			
			
				NetworkSetFriendlyFireOption(false)
				ClearPlayerWantedLevel(PlayerId())
				
				SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)

				notifIn = true
				Citizen.CreateThread(function()
				TriggerEvent("cS.Credits", "Du hast", "eine Safezone betreten", 0.4, 0.5, 8, true)
				
				end)
				notifOut = false
			end
			
		else
			if not notifOut then
				NetworkSetFriendlyFireOption(true)
				SetEntityMaxSpeed(vehicle, speed2)
				notifOut = true
				Citizen.CreateThread(function()
				
				TriggerEvent("cS.Credits", "Du hast", "die Safezone verlassen", 1.0, 0.15, 8, false)
				end)
				notifIn = false
			end
		
		end
		if notifIn then
		if PlayerData.job and (PlayerData.job.name == 'police' or PlayerData.job.name == 'sheriff' or PlayerData.job.name == 'doj' or PlayerData.job.name == 'fib') then		
			--nixs
			else
		SetEntityMaxSpeed(vehicle, speed)
		
		DisableControlAction(1, 140, true) -- R
		DisableControlAction(2, 37, true) -- disable weapon wheel (Tab)
		DisablePlayerFiring(player,true) -- Disables firing all together if they somehow bypass inzone Mouse Disable
      	DisableControlAction(0, 106, true) -- Disable in-game mouse controls
			if IsDisabledControlJustPressed(2, 37) then --if Tab is pressed, send error message
				SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true) -- if tab is pressed it will set them to unarmed (this is to cover the vehicle glitch until I sort that all out)
			end

			end
			end
		end
		-- Comment out lines 142 - 145 if you dont want a marker.
	 		--DrawMarker(type, float posX, float posY, float posZ, float dirX, float dirY, float dirZ, float rotX, float rotY, float rotZ, float scaleX, float scaleY, float scaleZ, int red, int green, int blue, int alpha, BOOL bobUpAndDown, BOOL faceCamera, int p19(LEAVE AS 2), BOOL rotate, char* textureDict, char* textureName, BOOL drawOnEnts)
end)

--[[

RegisterNetEvent('g:duuuurchsuchen')
AddEventHandler('g:duuuurchsuchen', function()
	if not notifIn then
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		local playerPed = PlayerPedId()
		TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
		exports['progressBars']:startUI(2500, "Durchsuche Person...") 
		TriggerServerEvent('grp_PolizeiJob:message', GetPlayerServerId(closestPlayer), ("Du wirst durchsucht."))				
		TriggerServerEvent('grp_PolizeiJob:message', GetPlayerServerId(closestPlayer), ("Dir dürfen maximal insgesamt 500 legale Gegenstände abgenommen werden."))				
		TriggerServerEvent('grp_PolizeiJob:message', GetPlayerServerId(closestPlayer), ("Illegale Gegenstände unterliegen keiner Obergrenze."))				
		Citizen.Wait(2500)
		ClearPedTasksImmediately(playerPed)
		TriggerEvent('grp_neuesinv:duxurhrchscnen')
	end
	else
		exports['mythic_notify']:DoHudText('inform', 'Du kannst in der Safezone niemanden durchsuchen.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	end
end)

RegisterNetEvent('grp_neuesinv:duxurhrchscnen') 
AddEventHandler('grp_neuesinv:duxurhrchscnen', function()
		local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
		if closestPlayer ~= -1 and closestDistance <= 3.0 then
			local ziel = GetPlayerServerId(closestPlayer)
			TriggerEvent('chezz-inventory:openPlayerInventory2', ziel)
		end
end)

]]



