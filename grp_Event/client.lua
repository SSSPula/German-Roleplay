ESX = nil

Citizen.CreateThread(function ()
	while ESX == nil do
		TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterCommand('eventan', function(source, args, blipname)
	ESX.TriggerServerCallback('grd_Pets:Gruppegetten', function(plyGroup)
	if plyGroup == 'superadmin' then
	
	if args[1] == nil or args[2] == nil then
		exports['mythic_notify']:DoHudText('error', 'So geht das: /eventan NAME BLIPNUMMER', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	else
		local targetCoords = GetEntityCoords(PlayerPedId())
		local blipname = args[1]
		local icon = args[2]
		--print(blipname)
		TriggerServerEvent('grp_Event:eventstart', targetCoords, blipname, icon)
	end
	
	else
	exports['mythic_notify']:SendAlert('error', 'Du musst Admin sein.!', 2500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	end
	end)
	
	
	
	
	
end)


RegisterNetEvent('grp_Event:coordsuebergabe')
AddEventHandler('grp_Event:coordsuebergabe', function(targetCoords, blipname, icon)
		local targetCoords = targetCoords
		local blip = AddBlipForCoord(targetCoords.x, targetCoords.y, targetCoords.z)
		local blipname = blipname
		local icon = icon
		--print(icon)
		exports['mythic_notify']:DoHudText('inform', 'Event: ' .. blipname .. " gestartet! Schau auf deine Karte!", { ['background-color'] = '#ffffff', ['color'] = '#000000' })


		TriggerEvent("InteractSound_CL:PlayOnOne", "eventan", 0.3) 
		SetBlipSprite (blip, tonumber(icon)) --icon übergeben
		SetBlipScale  (blip, 1.5)
		SetBlipColour (blip, 5)
		SetBlipAsShortRange(blip, true)
		if not IsWaypointActive() then
		DeleteWaypoint()
		SetNewWaypoint(targetCoords)
		exports['mythic_notify']:DoHudText('inform', 'Der Standort wurde auf deinem Navi markiert!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
		end
		--print(blipname)
		BeginTextCommandSetBlipName("STRING");
		AddTextComponentString(tostring(blipname))
		EndTextCommandSetBlipName(blip)
		PulseBlip(blip)
			RegisterNetEvent('grp_Event:coordsuebergabeaus')
			AddEventHandler('grp_Event:coordsuebergabeaus', function()
				RemoveBlip(blip)
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), targetCoords, true) < 120 then
				exports['mythic_notify']:DoHudText('inform', 'Das Event wurde beendet. Vielen Dank fürs dabei sein!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				end
			end)
end)


RegisterCommand('eventaus', function(source)
	ESX.TriggerServerCallback('grd_Pets:Gruppegetten', function(plyGroup)
	if plyGroup == 'superadmin' then
	
	TriggerServerEvent('grp_Event:eventaus')
	
	else
	exports['mythic_notify']:SendAlert('error', 'Du musst Admin sein.!', 2500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	end
	end)	
end)