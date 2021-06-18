ESX = nil
HasAlreadyEnteredMarker = false
LastZone = nil
CurrentAction = nil
CurrentActionMsg = nil
CurrentActionData = nil
isInMatch = false
isReady = false
currentTeam = ""
isEnableTeamDeathmatch = false
local isInMatch = false
--local isInMatch = true --XXXXX ÄNDERN XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
local soundan = false
local owner = PlayerPedId()
local netID = NetworkGetNetworkIdFromEntity(owner)
local matchvorbei = false
local spawnprotect = false
local inteamblau = 0
local inteamrot = 0
local meinekills = 0
local donator = 0
local autodraussen = false
local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}

--cinematic kamera deaktivieren
Citizen.CreateThread(function() 
  while true do
    N_0xf4f2c0d4ee209e20() 
    Wait(1000)
  end 
end)



--waffen ausserhalb entfernen
Citizen.CreateThread(function()
	while true do
	local sleep = 2500
		if isInMatch then
		sleep = 0
		if not HasPedGotWeapon(PlayerPedId(), GetHashKey(Config.Weapon), false) then
        GiveWeaponToPed(PlayerPedId(), GetHashKey(Config.Weapon), 250, false, true)
		SetPedCanSwitchWeapon(PlayerPedId(), false)
        end
        SetPedInfiniteAmmo(PlayerPedId(), true, GetHashKey(Config.Weapon))
	else
		if HasPedGotWeapon(PlayerPedId(), GetHashKey(Config.Weapon), false) and Config.RemoveWeapon then
		RemoveWeaponFromPed(PlayerPedId(), GetHashKey(Config.Weapon))
		end
		SetPedCanSwitchWeapon(PlayerPedId(), true)
		SetPedInfiniteAmmo(PlayerPedId(), false, GetHashKey(Config.Weapon))
	end
	Wait(sleep)
end
end)



Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	while not ESX.IsPlayerLoaded() do 
        Citizen.Wait(500)
	end
	
	if ESX.IsPlayerLoaded() then
		Citizen.Wait(81)

		ESX.TriggerServerCallback("grp_TDM:getStatus", function(result) 
			isEnableTeamDeathmatch = result
		end)
	end
end)

local firstSpawn = true
--first handling by grd

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
	PlayerLoaded = true
end)


AddEventHandler('esx:onPlayerSpawn', function()
	if firstSpawn then
		firstSpawn = false

			while not PlayerLoaded do
				Citizen.Wait(1000)
			end

			
		ESX.TriggerServerCallback('grp_TDM:welchdonohastdu', function (okay)
			if okay then
				donator = 1
			end
		end)
	end
end)






AddEventHandler('gameEventTriggered', function (name, args)
    if name == "CEventNetworkEntityDamage" and isInMatch then
        local victim = args[1]
        local attacker = args[2]
        local victimDied = args[4]
        
        if victimDied == 1 then 
            if IsEntityAPed(attacker) and IsPedAPlayer(attacker) and victim == PlayerPedId() then
				-- I am dead
				
				TriggerServerEvent("grp_TDM:iamDead", currentTeam)
				TriggerEvent('grp_TDM:newRound2', currentTeam)
				meinekills = 0
				autodraussen = false
			end
			if IsEntityAPed(attacker) and IsPedAPlayer(attacker) and attacker == PlayerPedId() then
				-- I killed 
				local ped = PlayerPedId()
				local hp = GetEntityHealth(ped)
				hp2 = hp + 25
				SetEntityHealth(ped, hp2)
				TriggerServerEvent("grp_TDM:iKilled", currentTeam)
				meinekills = meinekills + 1
				killpushen()
            end
        end
    end
end)








AddEventHandler('grp_TDM:hasEnterMarker', function(zone)
	CurrentAction     = 'shop_menu'
	CurrentActionMsg  = ""
	CurrentActionData = {zone = zone}
end)

AddEventHandler('grp_TDM:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

local inteamblau = 0
local inteamrot = 0

RegisterNetEvent("grp_TDM:teamplus")
AddEventHandler("grp_TDM:teamplus", function(team_name)
	local lel = team_name
	if lel == 'BlueTeam' then
	inteamblau = inteamblau + 1
	elseif lel == 'RedTeam' then
	inteamrot = inteamrot + 1
	end
end)

RegisterNetEvent("grp_TDM:teamminus")
AddEventHandler("grp_TDM:teamminus", function(team_name)
	local lel = team_name
	if lel == 'BlueTeam' then
	inteamblau = inteamblau - 1
	elseif lel == 'RedTeam' then
	inteamrot = inteamrot - 1
	end
end)

RegisterNetEvent("grp_TDM:teamreset")
AddEventHandler("grp_TDM:teamreset", function()
	inteamblau = 0
	inteamrot = 0
end)



local antiterror = {
	{ ['x'] = -1687.23, ['y'] = -1116.80, ['z'] = 12.15},  --lshub
	{ ['x'] = 1158.29, ['y'] = 78.01, ['z'] = 79.89},  --lshub2
	{ ['x'] = 2334.16, ['y'] = 3115.51, ['z'] = 47.21}, --sandy 
	{ ['x'] = 403.76, ['y'] = 6469.01, ['z'] = 27.86},  --paleto
}

local terror = {
	{ ['x'] = -1690.83, ['y'] = -1129.30, ['z'] = 12.15},  --lshub
	{ ['x'] = 1151.76, ['y'] = 76.01, ['z'] = 79.89},  --lshub2
	{ ['x'] = 2333.71, ['y'] = 3121.06, ['z'] = 47.20}, --sandy 
	{ ['x'] = 402.76, ['y'] = 6463.01, ['z'] = 27.81},  --paleto
}


local closestZoneblau = 1
local closestZonerot = 1
Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	
	while true do
		local playerPed = GetPlayerPed(-1)
		local x, y, z = table.unpack(GetEntityCoords(playerPed, true))
		local minDistance = 100000
		for i = 1, #antiterror, 1 do
			dist = Vdist(antiterror[i].x, antiterror[i].y, antiterror[i].z, x, y, z)
			if dist < minDistance then
				minDistance = dist
				closestZoneblau = i
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
		local playerPed = GetPlayerPed(-1)
		local x, y, z = table.unpack(GetEntityCoords(playerPed, true))
		local minDistance = 100000
		
		for i = 1, #terror, 1 do
			dist = Vdist(terror[i].x, terror[i].y, terror[i].z, x, y, z)
			if dist < minDistance then
				minDistance = dist
				closestZonerot = i
			end
		end
		Citizen.Wait(15000)
	end
end)


-- Display markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if isEnableTeamDeathmatch then
			local coords = GetEntityCoords(PlayerPedId())
			local playerPed = GetPlayerPed(-1)
			local x, y, z = table.unpack(GetEntityCoords(playerPed, true))
			local minDistance = 100000
			local player = GetPlayerPed(-1)
			local dist = Vdist(terror[closestZonerot].x, terror[closestZonerot].y, terror[closestZonerot].z, x, y, z)
			local dist2 = Vdist(antiterror[closestZoneblau].x, antiterror[closestZoneblau].y, antiterror[closestZoneblau].z, x, y, z)
		
			for k,v in pairs(Config.Deathmatch) do
					if dist2 < 100 then
						DrawMarker(1, antiterror[closestZoneblau].x, antiterror[closestZoneblau].y, antiterror[closestZoneblau].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Size.x + 1, Config.Size.y + 1, Config.Size.z, 0, 0, 255, 100, false, true, 2, false, false, false, false)
						ESX.Game.Utils.DrawText3D(vector3(antiterror[closestZoneblau].x, antiterror[closestZoneblau].y, antiterror[closestZoneblau].z + 1.7), "Anti-Terroreinheit " .. inteamblau .. "/30", 1)
					end
					if dist < 100 then
						DrawMarker(1, terror[closestZonerot].x, terror[closestZonerot].y, terror[closestZonerot].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Size.x + 1, Config.Size.y + 1, Config.Size.z, 255, 0, 0, 100, false, true, 2, false, false, false, false)
						ESX.Game.Utils.DrawText3D(vector3(terror[closestZonerot].x, terror[closestZonerot].y, terror[closestZonerot].z + 1.7), "Terroreinheit " .. inteamrot .. "/30", 1)
					end
				if isInMatch then
					DisableControlAction(0, 303, true)
					DrawAdvancedText(0.891, 0.953, 0.005, 0.0028, 0.4, "Mit /verlassen kannst du Paintball verlassen.", 0, 191, 255, 255, 6, 0)
			
					if(GetDistanceBetweenCoords(coords, v.game_start_pos.x, v.game_start_pos.y, v.game_start_pos.z, true) < Config.DrawDistance) then
						ESX.Game.Utils.DrawText3D(vector3(v.game_start_pos.x, v.game_start_pos.y, v.game_start_pos.z + 1.7), "" .. v.name, 1)
					end
				end
			end
			--
			--if isInMatch or GetDistanceBetweenCoords(coords, -2214.4331054688,3030.0393066406,32.914123535156, true) < 750 then
		end
	end
end)


RegisterCommand("verlassen", function(source)	
	rausaustdm()
end)

RegisterNetEvent("grp_TDM:worein")
AddEventHandler("grp_TDM:worein", function()
	--lshub
	if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1686.8785400391,-1122.4709472656,13.152667999268, true) < 50 then
	TriggerServerEvent('grp_TDM:hierrein', 'ls')
	--lshub2 
	elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1137.2700195312,72.809547424316,80.756103515625, true) < 50 then
	TriggerServerEvent('grp_TDM:hierrein', 'ls2')
	--sandy
	elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 2344.7307128906,3134.3244628906,48.199394226074, true) < 50 then
	TriggerServerEvent('grp_TDM:hierrein', 'sandy')
	--paleto
	elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 402.08270263672,6474.7504882812,28.807786941528, true) < 50 then
	TriggerServerEvent('grp_TDM:hierrein', 'paleto')
	end
end)






function rausaustdm()

	local ped = PlayerPedId()
	local health = GetEntityHealth(ped)
	
	if isInMatch or GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -2214.4331054688,3030.0393066406,32.914123535156, true) < 750 then
		ESX.TriggerServerCallback('grp_TDM:waooereerrss', function (result)
			if result then
			local ort = result[1].tdmeingang
				if ort == 'ls' then
				TriggerServerEvent("grp_TDM:quit", currentTeam)
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
				end)
				SetPedInfiniteAmmo(PlayerPedId(), false, GetHashKey(Config.Weapon))
				RemoveWeaponFromPed(PlayerPedId(), GetHashKey(Config.Weapon))
				currentTeam = ""
				Citizen.Wait(1000)
				isInMatch = false
				matchvorbei = false
				FreezeEntityPosition(PlayerPedId(), true)
				soundan = false
				meinekills = 0
				isReady = false
				SetEntityInvincible(PlayerPedId(), false)
				HasAlreadyEnteredMarker = false
				SendNUIMessage({
					type = "endgame"
				})
				exports['mythic_notify']:DoHudText('error', 'Du hast das Team-Deathmatch verlassen.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				Citizen.Wait(1000)
				TriggerEvent('grp_TDM:avivels')
				Citizen.Wait(3000)
				FreezeEntityPosition(PlayerPedId(), false)
				funkraus()
				SetEntityCoords(ped, -1686.8785400391,-1122.4709472656,13.152667999268, false, false, false, true)
				SetEntityCoords(ped, -1686.8785400391,-1122.4709472656,13.152667999268, false, false, false, true)
				SetEntityCoords(ped, -1686.8785400391,-1122.4709472656,13.152667999268, false, false, false, true)
				elseif ort == 'ls2' then
				TriggerServerEvent("grp_TDM:quit", currentTeam)
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
				end)
				SetPedInfiniteAmmo(PlayerPedId(), false, GetHashKey(Config.Weapon))
				RemoveWeaponFromPed(PlayerPedId(), GetHashKey(Config.Weapon))
				currentTeam = ""
				Citizen.Wait(1000)
				isInMatch = false
				matchvorbei = false
				FreezeEntityPosition(PlayerPedId(), true)
				soundan = false
				meinekills = 0
				isReady = false
				SetEntityInvincible(PlayerPedId(), false)
				HasAlreadyEnteredMarker = false
				SendNUIMessage({
					type = "endgame"
				})
				exports['mythic_notify']:DoHudText('error', 'Du hast das Team-Deathmatch verlassen.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				Citizen.Wait(1000)
				TriggerEvent('grp_TDM:avivels2')
				Citizen.Wait(3000)
				FreezeEntityPosition(PlayerPedId(), false)
				funkraus()
				SetEntityCoords(ped, 1137.2700195312,72.809547424316,80.756103515625, false, false, false, true)
				SetEntityCoords(ped, 1137.2700195312,72.809547424316,80.756103515625, false, false, false, true)
				SetEntityCoords(ped, 1137.2700195312,72.809547424316,80.756103515625, false, false, false, true)
				elseif ort == 'sandy' then
				TriggerServerEvent("grp_TDM:quit", currentTeam)
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
				end)
				SetPedInfiniteAmmo(PlayerPedId(), false, GetHashKey(Config.Weapon))
				RemoveWeaponFromPed(PlayerPedId(), GetHashKey(Config.Weapon))
				currentTeam = ""
				Citizen.Wait(1000)
				isInMatch = false
				matchvorbei = false
				FreezeEntityPosition(PlayerPedId(), true)
				soundan = false
				meinekills = 0
				isReady = false
				SetEntityInvincible(PlayerPedId(), false)
				HasAlreadyEnteredMarker = false
				SendNUIMessage({
					type = "endgame"
				})
				exports['mythic_notify']:DoHudText('error', 'Du hast das Team-Deathmatch verlassen.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				Citizen.Wait(1000)
				TriggerEvent('grp_TDM:avivesandy')
				Citizen.Wait(3000)
				FreezeEntityPosition(PlayerPedId(), false)
				funkraus()
				SetEntityCoords(ped, 2344.7307128906,3134.3244628906,48.199394226074, false, false, false, true)
				SetEntityCoords(ped, 2344.7307128906,3134.3244628906,48.199394226074, false, false, false, true)
				SetEntityCoords(ped, 2344.7307128906,3134.3244628906,48.199394226074, false, false, false, true)
				elseif ort == 'paleto' then
				TriggerServerEvent("grp_TDM:quit", currentTeam)
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
				end)
				SetPedInfiniteAmmo(PlayerPedId(), false, GetHashKey(Config.Weapon))
				RemoveWeaponFromPed(PlayerPedId(), GetHashKey(Config.Weapon))
				currentTeam = ""
				Citizen.Wait(1000)
				isInMatch = false
				matchvorbei = false
				FreezeEntityPosition(PlayerPedId(), true)
				soundan = false
				meinekills = 0
				isReady = false
				SetEntityInvincible(PlayerPedId(), false)
				HasAlreadyEnteredMarker = false
				SendNUIMessage({
					type = "endgame"
				})
				exports['mythic_notify']:DoHudText('error', 'Du hast das Team-Deathmatch verlassen.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				Citizen.Wait(1000)
				TriggerEvent('grp_TDM:avivepaleto')
				Citizen.Wait(3000)
				FreezeEntityPosition(PlayerPedId(), false)
				funkraus()
				SetEntityCoords(ped, 402.08270263672,6474.7504882812,28.807786941528, false, false, false, true)
				SetEntityCoords(ped, 402.08270263672,6474.7504882812,28.807786941528, false, false, false, true)
				SetEntityCoords(ped, 402.08270263672,6474.7504882812,28.807786941528, false, false, false, true)
				TriggerServerEvent('grp_SanitaeterUndSo:setDeathStatus', false)
			end
			end
		end)
	end
end




function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end



function menuraus()
	ESX.UI.Menu.CloseAll()
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gg', {
		title    = 'Möchtest du das Team Deathmatch verlassen?',
		align    = 'top-left',
		elements = {
			{label = ('Ja'), value = 'ja'},
			{label = ('Nein'), value = 'nein'},
			
	}}, function(data, menu)
			
			local playerPed = GetPlayerPed(-1)
		    if data.current.value == 'ja' then
			rausaustdm()
		    elseif data.current.value == 'nein' then
			
			end
		menu.close()
		
	end)
end

RegisterNetEvent("grp_TDM:donojoinedd")
AddEventHandler("grp_TDM:donojoinedd", function(name)
	if isInMatch then
		exports['mythic_notify']:DoHudText('inform', "VIP: " .. name .. ' hat das Spiel betreten!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
		TriggerEvent("InteractSound_CL:PlayOnOne", "tdmvip", 0.5)
	end
end)

RegisterNetEvent("grp_TDM:tripplekcl")
AddEventHandler("grp_TDM:tripplekcl", function(name)
	if isInMatch then
	TriggerEvent("InteractSound_CL:PlayOnOne", "monsterkill", 0.2)
	TriggerEvent("cS.Credits", "Monsterkill", name .. " hat einen Monsterkill (4x)", 0.4, 0.45, 4, true)
	end
end)

RegisterNetEvent("grp_TDM:tripplekcl2")
AddEventHandler("grp_TDM:tripplekcl2", function(name)
	if isInMatch then
	TriggerEvent("InteractSound_CL:PlayOnOne", "holyshit", 0.2)
	TriggerEvent("cS.MidsizeBanner", "HOLY SH$%!.", name .. " hat eine 5er Streak !", 3, true)
	end
end)


RegisterNetEvent("grp_TDM:tripplekcl3")
AddEventHandler("grp_TDM:tripplekcl3", function(name)
	if isInMatch then
	TriggerEvent("InteractSound_CL:PlayOnOne", "godlike", 0.2)
	TriggerEvent("cS.MidsizeBanner", "Gottesgleich!.", name .. "~w~ ist ~b~GODLIKE!.!", 3, true)
	end
end)


function killpushen()
		if meinekills == 1 then
		TriggerEvent("InteractSound_CL:PlayOnOne", "rampage", 0.2)
		elseif meinekills == 2 then
		TriggerEvent("cS.Credits", "Doublekill", " du hast einen Doublekill", 0.7, 0.75, 4, true)
		TriggerEvent("InteractSound_CL:PlayOnOne", "doublekill", 0.2)
		elseif meinekills == 3 then
		TriggerEvent("cS.Credits", "Tripplekill", " du hast einen Tripplekill)", 0.7, 0.25, 4, true)
		TriggerEvent("InteractSound_CL:PlayOnOne", "tripplekill", 0.2)
		elseif meinekills == 4 then
		TriggerServerEvent('grp_TDM:tripplek')
		elseif meinekills == 5 then
		TriggerServerEvent('grp_TDM:tripplek2')
		elseif meinekills == 6 then
		TriggerServerEvent('grp_TDM:tripplek3')
		end
end


-- Menu Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if isEnableTeamDeathmatch then
			
			--autos etc
			DrawMarker(1, -2862.2399902344,3350.8999023438,31.811214447021, 0, 0, 0, 0, 0, 0, 3.0, 3.0, 0.5, 255, 0, 0, 155, 0, 0, 2, 1, 0, 0, 0) 
			DrawMarker(1, -1709.6300048828,2853.5500488281,31.889999389648, 0, 0, 0, 0, 0, 0, 3.0, 3.0, 0.5, 0, 0, 255, 155, 0, 0, 2, 1, 0, 0, 0) 
			
			if isInMatch then
			DrawMarker(36, -1721.1131591797,2853.3422851562,32.802257537842, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 2.5, 0, 0, 255, 155, 0, 0, 2, 1, 0, 0, 0) 
			DrawMarker(36, -2846.6411132812,3343.2722167969,32.841697692871, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 2.5, 255, 0, 0, 155, 0, 0, 2, 1, 0, 0, 0) 
			DrawMarker(37, -2841.2131347656,3351.5092773438,32.811779022217, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 2.5, 255, 0, 0, 155, 0, 0, 2, 1, 0, 0, 0) 
			DrawMarker(39, -1725.5853271484,2844.9855957031,32.80647277832, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 2.5, 0, 0, 255, 155, 0, 0, 2, 1, 0, 0, 0) 
			DrawMarker(39, -2854.25,3331.1164550781,32.811779022217, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 2.5, 255, 0, 0, 155, 0, 0, 2, 1, 0, 0, 0) 
			DrawMarker(37, -1717.6682128906,2859.595703125,32.806324005127, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 2.5, 0, 0, 255, 155, 0, 0, 2, 1, 0, 0, 0) 
			DrawMarker(1, -2834.9321289062,3336.1547851562,31.906715393066, 0, 0, 0, 0, 0, 0, 5.0, 5.0, 0.5, 255, 0, 0, 155, 0, 0, 2, 1, 0, 0, 0) 
			DrawMarker(1, -1731.087890625,2854.6674804688,31.806499481201, 0, 0, 0, 0, 0, 0, 5.0, 5.0, 0.5, 0, 0, 255, 155, 0, 0, 2, 1, 0, 0, 0) 
			if IsControlJustReleased(0, Keys['E']) and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1731.3933105469,2854.7395019531,32.806499481201, true) < 3 and isInMatch then
			local playerPed = PlayerPedId()
			local vehicle = GetVehiclePedIsIn(playerPed)
			ESX.Game.DeleteVehicle(vehicle)
			autodraussen = false
			end
			if IsControlJustReleased(0, Keys['E']) and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -2834.9321289062,3336.1547851562,32.906715393066, true) < 3 and isInMatch then
			local playerPed = PlayerPedId()
			local vehicle = GetVehiclePedIsIn(playerPed)
			ESX.Game.DeleteVehicle(vehicle)
			end
			if IsControlJustReleased(0, Keys['E']) and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1721.1898193359,2853.2353515625,32.806301116943, true) < 3 and isInMatch then
				if not autodraussen then
				menuautoblau()
				else
				exports['mythic_notify']:DoHudText('error', 'Du hast bereits ein Auto ausgeparkt!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				Citizen.Wait(1000)
				exports['mythic_notify']:DoHudText('error', 'Du kannst Dein Auto in dem großen Kreis einparken!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				end
			end
			if IsControlJustReleased(0, Keys['E']) and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1717.9893798828,2859.5747070312,32.806545257568, true) < 3 and isInMatch then
				if not autodraussen then
				menubikeblau()
				else
				exports['mythic_notify']:DoHudText('error', 'Du hast bereits ein Auto ausgeparkt!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				Citizen.Wait(1000)
				exports['mythic_notify']:DoHudText('error', 'Du kannst Dein Auto in dem großen Kreis einparken!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				end
			end
			if IsControlJustReleased(0, Keys['E']) and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1725.2894287109,2844.908203125,31.806484222412, true) < 3 and isInMatch then
					if donator == 1 then
						if not autodraussen then
						menulkwblau()
						else
						exports['mythic_notify']:DoHudText('error', 'Du hast bereits ein Auto ausgeparkt!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
						Citizen.Wait(1000)
						exports['mythic_notify']:DoHudText('error', 'Du kannst Dein Auto in dem großen Kreis einparken!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
						end
					else
					exports['mythic_notify']:DoHudText('error', 'Du musst Unterstützer sein!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					Citizen.Wait(2000)
					exports['mythic_notify']:DoHudText('error', 'Infos dazu findest du im Discord! oder auf www.shop.grp.gg', { ['background-color'] = '#ffffff', ['color'] = '#000000' })	
					end
			end
			
			if IsControlJustReleased(0, Keys['E']) and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -2847.3208007812,3343.6987304688,32.811748504639, true) < 3 and isInMatch then
				if not autodraussen then
				menuautorot()
				else
				exports['mythic_notify']:DoHudText('error', 'Du hast bereits ein Auto ausgeparkt!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				Citizen.Wait(1000)
				exports['mythic_notify']:DoHudText('error', 'Du kannst Dein Auto in dem großen Kreis einparken!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				end
			end
			if IsControlJustReleased(0, Keys['E']) and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -2841.5510253906,3351.37109375,32.811748504639, true) < 3 and isInMatch then
				if not autodraussen then
				menubikerot()
				else
				exports['mythic_notify']:DoHudText('error', 'Du hast bereits ein Auto ausgeparkt!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				Citizen.Wait(1000)
				exports['mythic_notify']:DoHudText('error', 'Du kannst Dein Auto in dem großen Kreis einparken!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				end
			end
			if IsControlJustReleased(0, Keys['E']) and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -2854.26171875,3330.8815917969,32.811786651611, true) < 3 and isInMatch then
				
					if donator == 1 then
						if not autodraussen then
						menulkwrot()
						else
						exports['mythic_notify']:DoHudText('error', 'Du hast bereits ein Auto ausgeparkt!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
						Citizen.Wait(1000)
						exports['mythic_notify']:DoHudText('error', 'Du kannst Dein Auto in dem großen Kreis einparken!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
						end
					else
					exports['mythic_notify']:DoHudText('error', 'Du musst Unterstützer sein!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					Citizen.Wait(2000)
					exports['mythic_notify']:DoHudText('error', 'Infos dazu findest du im Discord! oder auf www.shop.grp.gg', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					Citizen.Wait(1000)
					exports['mythic_notify']:DoHudText('error', 'Du kannst Dein Auto in dem großen Kreis einparken!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					end
			end
		end
			--match verlassen 
			local coords      = GetEntityCoords(PlayerPedId())
			if GetDistanceBetweenCoords(coords, -2862.2399902344,3350.8999023438,32.8112449646, true) < 3 or GetDistanceBetweenCoords(coords, -1709.6376953125,2853.4357910156,32.889038085938, true) < 3 then
					ESX.ShowHelpNotification("Drücke ~g~[E] ~w~um das Spiel zu verlassen!")
							if IsControlJustReleased(0, 38) then
								menuraus()
							end
					end

			for i = 1, #antiterror, 1 do
				if IsControlJustReleased(0, Keys['E']) and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), antiterror[i].x, antiterror[i].y, antiterror[i].z, true) < 3 and not isInMatch then
					--balance
					local inteamrot2 = inteamrot + 2
					local inteamblau2 = inteamblau + 2
					
					if donator == 1 then
					JoinTeam('BlueTeam')
					TriggerServerEvent('grp_TDM:donojoined')
					
					exports['mythic_notify']:DoHudText('error', 'Du besitzt das Paintball-Paket und wurdest direkt ins Spiel gebracht.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					else
					if inteamblau > inteamrot2 then
					exports['mythic_notify']:DoHudText('error', 'Die Teams sind nicht ausbalanciert.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					else
						if inteamblau < 30 then
						JoinTeam('BlueTeam')
						Citizen.Wait(1000)
						else
						exports['mythic_notify']:DoHudText('error', 'Dieses Team ist bereits voll', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
						end
					end	
					end	
				end	
			end
			for i = 1, #terror, 1 do
				if IsControlJustReleased(0, Keys['E']) and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), terror[i].x, terror[i].y, terror[i].z, true) < 3 and not isInMatch then
					local inteamrot2 = inteamrot + 1
					local inteamblau2 = inteamblau + 1
					
					if donator == 1 then
					JoinTeam('RedTeam')
					exports['mythic_notify']:DoHudText('error', 'Du besitzt das Paintball-Paket und wurdest direkt ins Spiel gebracht.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					TriggerServerEvent('grp_TDM:donojoined')
					else
					if inteamrot > inteamblau2 then
					exports['mythic_notify']:DoHudText('error', 'Die Teams sind nicht ausbalanciert.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					else
						if inteamrot < 30 then
						JoinTeam('RedTeam')
						Citizen.Wait(1000)
						else
						exports['mythic_notify']:DoHudText('error', 'Dieses Team ist bereits voll', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
						end
					end	
					end	
				end
			end
		end
	end
end)


function menuautoblau()
	ESX.UI.Menu.CloseAll()
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gg', {
		title    = 'Paintball Automenü',
		align    = 'top-left',
		elements = {
			{label = ('Baller'), value = 'bufallo'},
			{label = ('Schafter'), value = 'granger'},
			{label = ('menü schliessen'), value = 'dddd'},
			
	}}, function(data, menu)
			local coordsrunter = { x = -1652.73,  y = -919.64, z = 0.46}
			local playerPed = GetPlayerPed(-1)
		   
		   if data.current.value == 'bufallo' then
			local ModelHash = `baller4` -- Use Compile-time hashes to get the hash of this model
			if not IsModelInCdimage(ModelHash) then return end
			RequestModel(ModelHash) 
			while not HasModelLoaded(ModelHash) do -- Waits for the model to load with a check so it does not get stuck in an infinite loop
			  Citizen.Wait(10)
			end
			local MyPed = PlayerPedId()
			local Vehicle = CreateVehicle(ModelHash, GetEntityCoords(MyPed), GetEntityHeading(MyPed), true, false) -- Spawns a networked vehicle on your current coords
			SetModelAsNoLongerNeeded(ModelHash)
			TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
			SetVehicleNumberPlateText(Vehicle, 'grp.gg')
			autotimer(Vehicle)
			
		    elseif data.current.value == 'granger' then
			local ModelHash = `schafter4` -- Use Compile-time hashes to get the hash of this model
			if not IsModelInCdimage(ModelHash) then return end
			RequestModel(ModelHash) 
			while not HasModelLoaded(ModelHash) do -- Waits for the model to load with a check so it does not get stuck in an infinite loop
			  Citizen.Wait(10)
			end
			local MyPed = PlayerPedId()
			local Vehicle = CreateVehicle(ModelHash, GetEntityCoords(MyPed), GetEntityHeading(MyPed), true, false) -- Spawns a networked vehicle on your current coords
			SetModelAsNoLongerNeeded(ModelHash)
			TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
			SetVehicleNumberPlateText(Vehicle, 'grp.gg')
			autotimer(Vehicle)
			
			end
		menu.close()
		end, function(data, menu)
		menu.close()
	end)
end


function menuautorot()
	ESX.UI.Menu.CloseAll()
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gg', {
		title    = 'Paintball Automenü',
		align    = 'top-left',
		elements = {
			{label = ('Bodhi Pickup'), value = 'bufallo'},
			{label = ('Schafter'), value = 'granger'},
			{label = ('menü schliessen'), value = 'dddd'},
			
	}}, function(data, menu)
			local coordsrunter = { x = -1652.73,  y = -919.64, z = 0.46}
			local playerPed = GetPlayerPed(-1)
		    if data.current.value == 'bufallo' then
			
			local ModelHash = `bodhi2` -- Use Compile-time hashes to get the hash of this model
			if not IsModelInCdimage(ModelHash) then return end
			RequestModel(ModelHash) 
			while not HasModelLoaded(ModelHash) do -- Waits for the model to load with a check so it does not get stuck in an infinite loop
			  Citizen.Wait(10)
			end
			local MyPed = PlayerPedId()
			local Vehicle = CreateVehicle(ModelHash, GetEntityCoords(MyPed), GetEntityHeading(MyPed), true, false) -- Spawns a networked vehicle on your current coords
			SetModelAsNoLongerNeeded(ModelHash)
			TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
			SetVehicleNumberPlateText(Vehicle, 'grp.gg')
			autotimer(Vehicle)
			
			
		    elseif data.current.value == 'granger' then
			local ModelHash = `schafter4` -- Use Compile-time hashes to get the hash of this model
			if not IsModelInCdimage(ModelHash) then return end
			RequestModel(ModelHash) 
			while not HasModelLoaded(ModelHash) do -- Waits for the model to load with a check so it does not get stuck in an infinite loop
			  Citizen.Wait(10)
			end
			local MyPed = PlayerPedId()
			local Vehicle = CreateVehicle(ModelHash, GetEntityCoords(MyPed), GetEntityHeading(MyPed), true, false) -- Spawns a networked vehicle on your current coords
			SetModelAsNoLongerNeeded(ModelHash)
			TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
			SetVehicleNumberPlateText(Vehicle, 'grp.gg')
			autotimer(Vehicle)
			
			end
		menu.close()
		
		end, function(data, menu)
		menu.close()
	end)
end

function menulkwrot() --donatorfeature
ESX.UI.Menu.CloseAll()
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gg', {
		title    = 'Paintball Automenü',
		align    = 'top-left',
		elements = {
			{label = ('Insurgent(gepanzert)'), value = 'policet'},
			{label = ('Army Truppentransporter'), value = 'riot'},
			{label = ('menü schliessen'), value = 'dddd'},
			
	}}, function(data, menu)
			local coordsrunter = { x = -1652.73,  y = -919.64, z = 0.46}
			local playerPed = GetPlayerPed(-1)
		    if data.current.value == 'riot' then
			local ModelHash = `barracks3` -- Use Compile-time hashes to get the hash of this model
			if not IsModelInCdimage(ModelHash) then return end
			RequestModel(ModelHash) 
			while not HasModelLoaded(ModelHash) do -- Waits for the model to load with a check so it does not get stuck in an infinite loop
			  Citizen.Wait(10)
			end
			local MyPed = PlayerPedId()
			local Vehicle = CreateVehicle(ModelHash, GetEntityCoords(MyPed), GetEntityHeading(MyPed), true, false) -- Spawns a networked vehicle on your current coords
			SetModelAsNoLongerNeeded(ModelHash)
			TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
			SetVehicleNumberPlateText(Vehicle, 'grp.gg')
			autotimer(Vehicle)
			
		    elseif data.current.value == 'policet' then
			local ModelHash = `insurgent2` -- Use Compile-time hashes to get the hash of this model
			if not IsModelInCdimage(ModelHash) then return end
			RequestModel(ModelHash) 
			while not HasModelLoaded(ModelHash) do -- Waits for the model to load with a check so it does not get stuck in an infinite loop
			  Citizen.Wait(10)
			end
			local MyPed = PlayerPedId()
			local Vehicle = CreateVehicle(ModelHash, GetEntityCoords(MyPed), GetEntityHeading(MyPed), true, false) -- Spawns a networked vehicle on your current coords
			SetModelAsNoLongerNeeded(ModelHash)
			TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
			SetVehicleNumberPlateText(Vehicle, 'grp.gg')
			autotimer(Vehicle)
			
			end
		menu.close()
		
		end, function(data, menu)
		menu.close()
	end)
end
function menubikerot()
	ESX.UI.Menu.CloseAll()
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gg', {
		title    = 'Paintball Automenü',
		align    = 'top-left',
		elements = {
			{label = ('Hexer'), value = 'polbike'},
			{label = ('menü schliessen'), value = 'dddd'},
			
	}}, function(data, menu)
			local coordsrunter = { x = -1652.73,  y = -919.64, z = 0.46}
			local playerPed = GetPlayerPed(-1)
		    if data.current.value == 'hexer' then
			local ModelHash = `kawasaki` -- Use Compile-time hashes to get the hash of this model
			if not IsModelInCdimage(ModelHash) then return end
			RequestModel(ModelHash) 
			while not HasModelLoaded(ModelHash) do -- Waits for the model to load with a check so it does not get stuck in an infinite loop
			  Citizen.Wait(10)
			end
			local MyPed = PlayerPedId()
			local Vehicle = CreateVehicle(ModelHash, GetEntityCoords(MyPed), GetEntityHeading(MyPed), true, false) -- Spawns a networked vehicle on your current coords
			SetModelAsNoLongerNeeded(ModelHash)
			TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
		    SetVehicleNumberPlateText(Vehicle, 'grp.gg')
			autotimer(Vehicle)
			
			end
		menu.close()
		
		end, function(data, menu)
		menu.close()
	end)
end

function menubikeblau()
	ESX.UI.Menu.CloseAll()
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gg', {
		title    = 'Paintball Automenü',
		align    = 'top-left',
		elements = {
			{label = ('Polizeimotorrad'), value = 'polbike'},
			{label = ('menü schliessen'), value = 'dddd'},
			
	}}, function(data, menu)
			local coordsrunter = { x = -1652.73,  y = -919.64, z = 0.46}
			local playerPed = GetPlayerPed(-1)
		    if data.current.value == 'polbike' then
			local ModelHash = `kawasaki` -- Use Compile-time hashes to get the hash of this model
			if not IsModelInCdimage(ModelHash) then return end
			RequestModel(ModelHash) 
			while not HasModelLoaded(ModelHash) do -- Waits for the model to load with a check so it does not get stuck in an infinite loop
			  Citizen.Wait(10)
			end
			local MyPed = PlayerPedId()
			local Vehicle = CreateVehicle(ModelHash, GetEntityCoords(MyPed), GetEntityHeading(MyPed), true, false) -- Spawns a networked vehicle on your current coords
			SetModelAsNoLongerNeeded(ModelHash)
			TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
		    SetVehicleNumberPlateText(Vehicle, 'grp.gg')
			autotimer(Vehicle)
			
			end
		menu.close()
		
		end, function(data, menu)
		menu.close()
	end)
end


function menulkwblau() --donatorfeature
ESX.UI.Menu.CloseAll()
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gg', {
		title    = 'Paintball Automenü',
		align    = 'top-left',
		elements = {
			{label = ('Army Truppentransporter'), value = 'riot'},
			{label = ('Insurgent'), value = 'policet'},
			{label = ('menü schliessen'), value = 'dddd'},
			
	}}, function(data, menu)
			local coordsrunter = { x = -1652.73,  y = -919.64, z = 0.46}
			local playerPed = GetPlayerPed(-1)
		    if data.current.value == 'riot' then
			local ModelHash = `barracks3` -- Use Compile-time hashes to get the hash of this model
			if not IsModelInCdimage(ModelHash) then return end
			RequestModel(ModelHash) 
			while not HasModelLoaded(ModelHash) do -- Waits for the model to load with a check so it does not get stuck in an infinite loop
			  Citizen.Wait(10)
			end
			local MyPed = PlayerPedId()
			local Vehicle = CreateVehicle(ModelHash, GetEntityCoords(MyPed), GetEntityHeading(MyPed), true, false) -- Spawns a networked vehicle on your current coords
			SetModelAsNoLongerNeeded(ModelHash)
			TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
			SetVehicleNumberPlateText(Vehicle, 'grp.gg')
			autotimer(Vehicle)
			
		    elseif data.current.value == 'policet' then
			local ModelHash = `insurgent2` -- Use Compile-time hashes to get the hash of this model
			if not IsModelInCdimage(ModelHash) then return end
			RequestModel(ModelHash) 
			while not HasModelLoaded(ModelHash) do -- Waits for the model to load with a check so it does not get stuck in an infinite loop
			  Citizen.Wait(10)
			end
			local MyPed = PlayerPedId()
			local Vehicle = CreateVehicle(ModelHash, GetEntityCoords(MyPed), GetEntityHeading(MyPed), true, false) -- Spawns a networked vehicle on your current coords
			SetModelAsNoLongerNeeded(ModelHash)
			TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
			SetVehicleNumberPlateText(Vehicle, 'grp.gg')
			autotimer(Vehicle)
			
			end
		menu.close()
		
		end, function(data, menu)
		menu.close()
	end)
end

function autotimer(Vehicle)
	local vehicle = Vehicle
	local playerPed = PlayerPedId()
	autodraussen = true
	ESX.UI.Menu.CloseAll()
	Citizen.Wait(120000)
	local imauto = GetPedInVehicleSeat(Vehicle, -1)
	if imauto == 0 then
	ESX.Game.DeleteVehicle(vehicle)
	end
end

function JoinTeam(name)
	local elements = {}
	
    table.insert(elements, {
		label = "Ja",
		value   = "yes"
	})
	table.insert(elements, {
		label = "Nein",
		value   = "no"
	})
	TriggerServerEvent("grp_TDM:rechnugnzahlen")
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tpnrp_deathmatch_ask1', {
        title    = "" .. Config.Deathmatch[name].name .. " beitreten?<br/>GRP - Team Deathmatch!",
        align    = 'top-left',
        elements = elements
    }, function(data, menu)
        if data.current.value == "yes" then
            TriggerServerEvent("grp_TDM:joinTeam", name)
			TriggerEvent('grp_TDM:worein')
			
			
			
			
        end
        -- menuIsShowed = false
        menu.close()
    end, function(data, menu)
        -- menuIsShowed = false
        menu.close()
    end)
end

function ToggleScoreboard(_val)
	SendNUIMessage({
		type = "show_game_scoreboard",
		show = _val
	})
end

RegisterNetEvent("grp_TDM:joinedMatch")
AddEventHandler("grp_TDM:joinedMatch", function(name, game_data)
	local _playerPed = PlayerPedId()
	isInMatch = true
	-- den tp nutzen für erst teleport
	TriggerEvent("InteractSound_CL:PlayOnOne", "readybitte4", 0.2) 
	ESX.Game.Teleport(_playerPed, vector3(Config.Deathmatch[name].game_start_pos.x,Config.Deathmatch[name].game_start_pos.y, Config.Deathmatch[name].game_start_pos.z),function() 
		TriggerEvent('skinchanger:getSkin', function(skin)
			if skin.sex == 0 then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Deathmatch[name].skin.male)
			else
				TriggerEvent('skinchanger:loadClothes', skin, Config.Deathmatch[name].skin.female)
			end
		end)
		ToggleScoreboard(true)
		exports['mythic_notify']:DoHudText('inform', "Du bist im Team: " .. Config.Deathmatch[name].name .. " !", { ['background-color'] = '#ffffff', ['color'] = '#000000' })

		currentTeam = name
		SendNUIMessage({
			type = "show_game_ui"
		})
		SendNUIMessage({
			type = "update_game_ui",
			game_ui = reMapData(game_data)
		})
		FreezeEntityPosition(PlayerPedId(), true)
		isReady = true
		TriggerServerEvent("grp_TDM:playerReady", currentTeam)
	end)
	funkrein()
end)

RegisterNetEvent("grp_TDM:startMatch")
AddEventHandler("grp_TDM:startMatch", function() 
	if not soundan then 
	soundan = true
	TriggerEvent("InteractSound_CL:PlayOnOne", "spielbeginnt2", 0.2)
	end
	FreezeEntityPosition(PlayerPedId(), false)
	SendNUIMessage({
		type = "match_start"
	})
end)

RegisterNetEvent("grp_TDM:updateGameUI")
AddEventHandler("grp_TDM:updateGameUI", function(game_data)
	SendNUIMessage({
		type = "update_game_ui",
		game_ui = reMapData(game_data)
	})
end)

RegisterNetEvent("grp_TDM:youWon")
AddEventHandler("grp_TDM:youWon", function(game_data, winTeam)
	TriggerEvent("InteractSound_CL:PlayOnOne", "rundegewonnen2", 0.2) -- businessmänner gewinnen
	SendNUIMessage({
		type = "update_game_ui_win",
		game_ui = reMapData(game_data),
		win_team = winTeam
	})
	Citizen.Wait(5000)
	DoScreenFadeOut(1000)
end)

RegisterNetEvent("grp_TDM:youLose")
AddEventHandler("grp_TDM:youLose", function(game_data, winTeam) 
	TriggerEvent("InteractSound_CL:PlayOnOne", "rundeverloren", 0.2) --strandgänger gewinnen
	SendNUIMessage({
		type = "update_game_ui_lose",
		game_ui = reMapData(game_data),
		win_team = winTeam
	})
	Citizen.Wait(5000)
	DoScreenFadeOut(1000)
end)
--[[
RegisterNetEvent("grp_TDM:newRound")
AddEventHandler("grp_TDM:newRound", function(team_name)
	local _playerPed = PlayerPedId()
	SendNUIMessage({
		type = "new_round"
	})
	-- Tele player back to spawn point
		zumanfang(team_name)
		Citizen.Wait(1000)
		ESX.Game.Teleport(_playerPed, vector3(Config.Deathmatch[team_name].game_start_pos.x,Config.Deathmatch[team_name].game_start_pos.y, Config.Deathmatch[team_name].game_start_pos.z),function() 
		SetEntityCoords(_playerPed, vector3(Config.Deathmatch[team_name].game_start_pos.x,Config.Deathmatch[team_name].game_start_pos.y, Config.Deathmatch[team_name].game_start_pos.z), false, false, false, true)
		DoScreenFadeIn(1000)
		TriggerEvent("InteractSound_CL:PlayOnOne", "rundebeginnt2", 0.2)
		SetEntityHealth(_playerPed, 200)
		SetPedArmour(_playerPed, 25)
		exports['mythic_notify']:DoHudText('inform', "Die Runde startet!", { ['background-color'] = '#ffffff', ['color'] = '#000000' })
		funkrein()
	end)
end)
]]

RegisterNetEvent("grp_TDM:newRound2")
AddEventHandler("grp_TDM:newRound2", function(team_name)
	local _playerPed = PlayerPedId()
	-- Tele player back to spawn point
		zumanfang(team_name)
		
		Citizen.Wait(1000)
		--TriggerEvent('grp_SanitaeterUndSo:redewenspantossindnice1337vive')
		ESX.Game.Teleport(_playerPed, vector3(Config.Deathmatch[team_name].game_start_pos.x,Config.Deathmatch[team_name].game_start_pos.y, Config.Deathmatch[team_name].game_start_pos.z),function() 
		SetEntityCoords(_playerPed, vector3(Config.Deathmatch[team_name].game_start_pos.x,Config.Deathmatch[team_name].game_start_pos.y, Config.Deathmatch[team_name].game_start_pos.z), false, false, false, true)
		DoScreenFadeIn(1000)
		SetEntityHealth(_playerPed, 200)
		SetPedArmour(_playerPed, 25)
		funkrein()
		spawnprotect = true
		Citizen.Wait(1500)
		spawnprotect = false
		SetEntityInvincible(_playerPed, false)
	end)
end)


RegisterNetEvent("grp_TDM:endMatch")
AddEventHandler("grp_TDM:endMatch", function(team_name, win_team) 
	local _playerPed = PlayerPedId()
		ESX.Game.Teleport(_playerPed, vector3(Config.Deathmatch[team_name].enter_pos.x,Config.Deathmatch[team_name].enter_pos.y, Config.Deathmatch[team_name].enter_pos.z),function() 
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
			TriggerEvent('skinchanger:loadSkin', skin)
		end)
		exports['mythic_notify']:DoHudText('inform', "" .. Config.Deathmatch[win_team].name .. " hat gewonnen!", { ['background-color'] = '#ffffff', ['color'] = '#000000' })
		HasAlreadyEnteredMarker = false
		FreezeEntityPosition(_playerPed, false)
		-- reset data
        RemoveWeaponFromPed(PlayerPedId(), GetHashKey(Config.Weapon))
		currentTeam = ""
		isInMatch = false
		matchvorbei = false
		isReady = false
		SendNUIMessage({
			type = "endgame"
		})
		soundan = false
	end)
end)


RegisterNetEvent("grp_TDM:matchFinished")
AddEventHandler("grp_TDM:matchFinished", function(game_data, win_team) 
	local ped = PlayerPedId()
	
	
	if Config.Deathmatch[win_team].name == 'Anti-Terroreinheit' then
	TriggerEvent("cS.MidsizeBanner", "~w~Die ~b~Anti-Terroreinheit ~w~hat gewonnen!", "Vielen Dank fürs Mitspielen und viel Spaß auf grp.gg! ", 12, true)
	elseif Config.Deathmatch[win_team].name == 'Terroreinheit' then
	TriggerEvent("cS.MidsizeBanner", "~w~Die ~r~Terroreinheit ~w~hat gewonnen!", "Vielen Dank fürs Mitspielen und viel Spaß auf grp.gg! ", 12, true)
	end
	FreezeEntityPosition(ped, true)
	TriggerEvent("InteractSound_CL:PlayOnOne", "tdmbeendet2", 0.2)
	SendNUIMessage({
		type = "update_game_ui_win_finished",
		game_ui = reMapData(game_data),
		win_team = win_team
	})
	matchvorbei = true
	Citizen.Wait(6000)
	matchvorbei = false
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		if isInMatch then
			if matchvorbei then
				DisableAllControlActions(tonumber("0"))		
			end
			if spawnprotect then
			DrawAdvancedText(0.500, 0.953, 0.005, 0.0028, 0.4, "Spawnprotection 1,5 Sekunden aktiviert.", 255, 255, 255, 255, 6, 0)
			SetEntityInvincible(ped, true)
			end
			if autodraussen then
			Citizen.Wait(60000)
			autodraussen = false
			end
		else
		Citizen.Wait(10000)
		end
	end
end)



RegisterNetEvent("grp_TDM:doToggle")
AddEventHandler("grp_TDM:doToggle", function(enable) 
	TriggerServerEvent("grp_TDM:toggleTeamdeathmatch")
end)

RegisterNetEvent("grp_TDM:toggleTeamdeathmatch")
AddEventHandler("grp_TDM:toggleTeamdeathmatch", function(enable) 
	isEnableTeamDeathmatch = enable
end)

function zumanfang(team_name)
	if team_name == 'RedTeam' then
	TriggerEvent('grp_TDM:aviverot')
	else
	TriggerEvent('grp_TDM:aviveblau')
	end
end

--marker ende


RegisterNetEvent("grp_TDM:anountVoice")
AddEventHandler("grp_TDM:anountVoice", function(_type, _kill) 
	SendNUIMessage({
		type = "voice_anount",
		team = _type,
		kill = _kill
	})
end)

--[[
function ShowBuyMenu(type)
	local elements = {}
	local is_buy = false
	local ped = PlayerPedId()
	if type == nil then
		type = "main_buy"
		
		for k,v in pairs(Config.BuyMenu) do
			table.insert(elements, {
				label = "Verlassen",
				value = "verlass"
		})
			
		end
		
			
		

		
		is_buy = false
		if not isReady then
			table.insert(elements, {
				label = "Bereit melden",
				value = "ready"
			})
		end
	else
		for k,v in pairs(Config.BuyMenu[type].list) do
			table.insert(elements, {
				label = v.label,
				value = v.key
			})
		end
		is_buy = true
	end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'buy_menu_' .. type, {
        title    = "GRP - TDM",
        align    = 'top-left',
        elements = elements
    }, function(data, menu)
		if is_buy then
			-- print("Do buy " .. data.current.value)
			GiveWeaponToPed(PlayerPedId(), GetHashKey(data.current.value), 200, false, true)
			menuIsShowed = false
        	menu.close()
		else 
			if data.current.value ~= "ready" then
				ShowBuyMenu(data.current.value)
			else 
				TriggerServerEvent("grp_TDM:playerReady", currentTeam)
				exports['mythic_notify']:DoHudText('inform', 'bereit!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })

				
				isReady = true
			end
		end
		if data.current.value ~= "verlass" then
		
		SetEntityCoords(ped, -1678.3802490234,-1118.6372070312,13.148250579834, false, false, false, true)
		end
        -- menuIsShowed = false
        -- menu.close()
    end, function(data, menu)
        menuIsShowed = false
        menu.close()
    end)
end
]]

function reMapData(game_data)
	-- print(dump(game_data))
	-- RED
	local cntRed = 0
	local _redList = game_data["RedTeam"].player_list
	game_data["RedTeam"].player_list = {}
	for k,v in pairs(_redList) do
		cntRed = cntRed + 1
		game_data["RedTeam"].player_list[cntRed] = v
	end
	-- BLUE
	local cntBlue = 0
	local _blueList = game_data["BlueTeam"].player_list
	game_data["BlueTeam"].player_list = {}
	for k,v in pairs(_blueList) do
		cntBlue = cntBlue + 1
		game_data["BlueTeam"].player_list[cntBlue] = v
	end
	-- print(dump(game_data))
	return game_data
end

function dump(o)
	if type(o) == 'table' then
	   local s = '{ '
	   for k,v in pairs(o) do
		  if type(k) ~= 'number' then k = '"'..k..'"' end
		  s = s .. '['..k..'] = ' .. dump(v) .. ','
	   end
	   return s .. '} '
	else
	   return tostring(o)
	end
end


RegisterNetEvent('grp_TDM:avivels')
AddEventHandler('grp_TDM:avivels', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	
	DoScreenFadeOut(800)
	cleanPlayer(playerPed)
	while not IsScreenFadedOut() do
		Citizen.Wait(50)
	end

	local formattedCoords = {
		x = -1681.40,
		y = -1123.64,
		z = 13.15
	}

	Respawn1Ped(playerPed, formattedCoords, 0.0)
	StopScreenEffect('DeathFailOut')
	kleidung()
	DoScreenFadeIn(800)
end)

RegisterNetEvent('grp_TDM:avivels2')
AddEventHandler('grp_TDM:avivels2', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	
	DoScreenFadeOut(800)
	cleanPlayer(playerPed)
	while not IsScreenFadedOut() do
		Citizen.Wait(50)
	end

	local formattedCoords = {
		x = 1147.40,
		y = 75.64,
		z = 79.89
	}

	Respawn1Ped(playerPed, formattedCoords, 0.0)
	StopScreenEffect('DeathFailOut')
	kleidung()
	DoScreenFadeIn(800)
end)

RegisterNetEvent('grp_TDM:avivesandy')
AddEventHandler('grp_TDM:avivesandy', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	
	DoScreenFadeOut(800)
	cleanPlayer(playerPed)
	while not IsScreenFadedOut() do
		Citizen.Wait(50)
	end

	local formattedCoords = {
		x = 2334.40,
		y = 3118.64,
		z = 48.89
	}

	Respawn1Ped(playerPed, formattedCoords, 0.0)
	StopScreenEffect('DeathFailOut')
	kleidung()
	DoScreenFadeIn(800)
end)

RegisterNetEvent('grp_TDM:avivepaleto')
AddEventHandler('grp_TDM:avivepaleto', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	
	DoScreenFadeOut(800)
	cleanPlayer(playerPed)
	while not IsScreenFadedOut() do
		Citizen.Wait(50)
	end

	local formattedCoords = {
		x = 403.40,
		y = 6466.64,
		z = 27.81
	}

	Respawn1Ped(playerPed, formattedCoords, 0.0)
	StopScreenEffect('DeathFailOut')
	kleidung()
	DoScreenFadeIn(800)
end)


RegisterNetEvent('grp_TDM:aviverot')
AddEventHandler('grp_TDM:aviverot', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	
	DoScreenFadeOut(800)
	cleanPlayer(playerPed)
	while not IsScreenFadedOut() do
		Citizen.Wait(50)
	end

	local formattedCoords = {
		x = -2862.24,
		y = 3350.64,
		z = 31.81
	}

	Respawn1Ped(playerPed, formattedCoords, 0.0)
	StopScreenEffect('DeathFailOut')
	DoScreenFadeIn(800)
end)

RegisterNetEvent('grp_TDM:aviveblau')
AddEventHandler('grp_TDM:aviveblau', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	
	DoScreenFadeOut(800)
	cleanPlayer(playerPed)
	while not IsScreenFadedOut() do
		Citizen.Wait(50)
	end

	local formattedCoords = {
		x = -1709.39,
		y = 2853.378,
		z = 31.89
	}

	Respawn1Ped(playerPed, formattedCoords, 0.0)
	StopScreenEffect('DeathFailOut')
	DoScreenFadeIn(800)
end)
 
function Respawn1Ped(ped, coords, heading)
	SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
	SetPlayerInvincible(ped, false)
	ClearPedBloodDamage(ped)

	TriggerServerEvent('esx:onPlayerSpawn')
	TriggerEvent('esx:onPlayerSpawn')
	TriggerEvent('playerSpawned') -- compatibility with old scripts, will be removed soon
end



function cleanPlayer(playerPed)
	SetPedArmour(playerPed, 0)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	--ResetPedMovementClipset(playerPed, 0)
end


function kleidung()
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
		local isMale = skin.sex == 0

		TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
				TriggerEvent('esx:restoreLoadout')
			end)
		end)

	end)
end






function funkrein()

local playerName = GetPlayerName(PlayerId())
  local data = exports.saltychat:GetRadioChannel(true)
	
	
	if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1707.9807128906,2849.8286132812,32.895469665527, true) < 26 then
	if data == nil then
	ExecuteCommand("joinradio 6712")
		
	else 
	ExecuteCommand("leaveradio " .. data)
	ExecuteCommand("joinradio 6712")
	end
	else
	if data == nil then
	ExecuteCommand("joinradio 6713")
		--exports['mythic_notify']:DoHudText('inform', 'Du bist mit deinem Team im Funk', { ['background-color'] = '#ffffff', ['color'] = '#000000' })

	else 
	ExecuteCommand("leaveradio " .. data)
	ExecuteCommand("joinradio 6713")
	--exports['mythic_notify']:DoHudText('inform', 'Du bist mit deinem Team im Funk', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	end
end
end

function funkraus()
	local data = exports.saltychat:GetRadioChannel(true)
	
	
	if data == nil then
	--nix
	else 
	ExecuteCommand("leaveradio " .. data)
	end
end

--[[
--wieder hoch tpn
Citizen.CreateThread(function()
	while true do
	Citizen.Wait(3000)	
		-- get the details
		if isInMatch then
		_ped = PlayerPedId()
		
		_coords = GetEntityCoords(_ped)
		_, z = GetGroundZFor_3dCoord(_coords.x, _coords.y, 150.0, 0) -- starting at 150.0 at Z since it works up-down, but not down-up	
		-- is ped lower than the z co-ordinate we want to look at
		if _coords.z < 2 then
			-- flag checking per config file for: ped is swimming/falling/inside
			local flag_swimming, flag_falling, flag_inside = true, true, true
			if (IsPedSwimming(_ped) or IsPedSwimmingUnderWater(_ped)) then
				flag_swimming = false
			end
			if not IsPedFalling(_ped) then
				flag_falling = false
			end
			if not IsPedFalling(_ped) and z > _coords.z then 
				flag_inside = false
			end
				ClearPedTasksImmediately(_ped)

					SetEntityCoords(_ped, -2606.7055664062,-1099.2728271484,4.8378562927246, true, false, false, false)
					print(currentTeam)
					exports['mythic_notify']:DoHudText('error', 'Bitte versuch in der Arena zu bleiben!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
		end
		
		::m_next::
		Citizen.Wait(5)
	end
	end
end)
]]


