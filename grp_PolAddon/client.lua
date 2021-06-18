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

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job

	Citizen.Wait(5000)
	
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 444.86956787109,-998.47595214844,34.970108032227, true) < 20 then
		DrawMarker(1, 444.86956787109,-998.47595214844,33.970108032227, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 0, 155, 255, 155, 0, 0, 2, 0, 0, 0, 0) 
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 444.86956787109,-998.47595214844,34.970108032227, true) < 1 then
            --was passiert wenn man im marker ist
            if (IsControlJustPressed(1, 38)) then
			
			local keyboard = exports["nh-keyboard"]:KeyboardInput({
			header = "Rundruf der Leitstelle", 
			rows = {
			{
            id = 0, 
            txt = "Text eingeben"
			}
			}
			})
			if keyboard ~= nil then
			ExecuteCommand("l1e32it3st2el2le361xx " .. keyboard)
			
			end
			
         end
         end
		
		end
	end
end)

RegisterNetEvent("grd_abschicken2")
AddEventHandler("grd_abschicken2", function(msg, msg2)
    local playerped = GetPlayerPed(-1)
	if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 446.31188964844,-998.02838134766,34.970142364502, true) < 9 then
    SendNUIMessage({
        type    = "alert",
        enable  = true,
        issuer  = msg,
        message = msg2,
        volume  = Config.GERD.Volume
    })
end
end)

RegisterNetEvent("grd_abschicken")
AddEventHandler("grd_abschicken", function(msg, msg2)
    local playerped = GetPlayerPed(-1)
	if (PlayerData.job and PlayerData.job.name == 'police') or (PlayerData.job and PlayerData.job.name == 'sheriff') or (PlayerData.job and PlayerData.job.name == 'hitman') then
    SendNUIMessage({
        type    = "alert",
        enable  = true,
        issuer  = msg,
        message = msg2,
        volume  = Config.GERD.Volume
    })
end
end)

