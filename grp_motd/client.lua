RegisterNUICallback('discord', function(data, sb)
	local url = data.url
	local s_dui = CreateDui(url, 50, 50)
	Wait(5000)
	DestroyDui(s_dui)
end)

RegisterNUICallback('close', function(data, cb)
	SendNUIMessage({
		type = 'hideMOTD'
	})
	SetNuiFocus(false, false)
end)

Citizen.CreateThread(function()
	Wait(100)
	
	RegisterCommand(config.command, function(source, args, raw)
		SendNUIMessage({
			type = 'showMOTD',
			username = GetPlayerName(PlayerId(-1))
		})
		--print(inspawn)
		SetNuiFocus(true, true)
	end)
		
end)

local spawned = false


AddEventHandler("playerSpawned", function ()
	Citizen.Wait(3000)
	
	if config.openOnSpawn then
		if not spawned then
		local inspawn = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1999.0891113281,3199.4633789062,33.039474487305, true) < 100
			if not inspawn then
			SendNUIMessage({
				type = 'showMOTD',
				username = GetPlayerName(PlayerId(-1))
			})
			SetNuiFocus(true, true)
			spawned = true
			end
		end
	end

	if config.openOnSpawnOnce then
		TriggerServerEvent('EMERG:MOTD:Spawned')
	end
end)

RegisterNetEvent('EMERG:MOTD:OpenMOTD')
AddEventHandler('EMERG:MOTD:OpenMOTD', function()
	SendNUIMessage({
		type = 'showMOTD',
		username = GetPlayerName(PlayerId(-1))
	})
	SetNuiFocus(true, true)
end)

