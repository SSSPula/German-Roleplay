ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end
end)
----------------------------------------------------------------------------------
RegisterNetEvent("esx_admin:killPlayer")
AddEventHandler("esx_admin:killPlayer", function()
	exports['mythic_notify']:SendAlert('inform', '[GRP-ADMIN]: Du hast jemanden "administrativ" getötet und sein Leben beendet! Du Cheater!', 7500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
  SetEntityHealth(PlayerPedId(), 0)
end)

RegisterNetEvent("esx_admin:freezePlayer")
AddEventHandler("esx_admin:freezePlayer", function(input)
    local player = PlayerId()
	local ped = PlayerPedId()
    if input == 'freeze' then
        SetEntityCollision(ped, false)
        FreezeEntityPosition(ped, true)
		SetPlayerInvincible(player, true)
		exports['mythic_notify']:SendAlert('inform', '[GRP-ADMIN]: Freeze gegeben!', 7500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
    elseif input == 'unfreeze' then
        SetEntityCollision(ped, true)
	    FreezeEntityPosition(ped, false)
		SetPlayerInvincible(player, false)
		exports['mythic_notify']:SendAlert('inform', '[GRP-ADMIN]: Freeze aufgehoben!', 7500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
    end
end)



-------- noclip --------------
local noclip = false
RegisterNetEvent("esx_admin:noclip")
AddEventHandler("esx_admin:noclip", function(input)
    local player = PlayerId()
	local ped = PlayerPedId
	
    local msg = "ausgeschaltet"
	if(noclip == false)then
		noclip_pos = GetEntityCoords(PlayerPedId(), false)
	end

	noclip = not noclip

	if(noclip)then
		msg = "eingeschaltet"
	end
	exports['mythic_notify']:SendAlert('inform', '[GRP-ADMIN]: NoClip wurde ein/ausgeschaltet!', 7500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })

	--TriggerEvent("chatMessage", "Noclip wurde ^2^*" .. msg)
	end)
	
	local heading = 0
	Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if(noclip)then
			SetEntityCoordsNoOffset(PlayerPedId(), noclip_pos.x, noclip_pos.y, noclip_pos.z, 0, 0, 0)

			if(IsControlPressed(1, 34))then
				heading = heading + 1.5
				if(heading > 360)then
					heading = 0
				end

				SetEntityHeading(PlayerPedId(), heading)
			end

			if(IsControlPressed(1, 9))then
				heading = heading - 1.5
				if(heading < 0)then
					heading = 360
				end

				SetEntityHeading(PlayerPedId(), heading)
			end

			if(IsControlPressed(1, 8))then
				noclip_pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, 0.0)
			end

			if(IsControlPressed(1, 32))then
				noclip_pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, -1.0, 0.0)
			end

			if(IsControlPressed(1, 27))then
				noclip_pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.0, 1.0)
			end

			if(IsControlPressed(1, 173))then
				noclip_pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.0, -1.0)
			end
		else
			Citizen.Wait(200)
		end
	end
end)

--Thanks to qalle for this code | https://github.com/qalle-fivem/esx_marker
RegisterNetEvent("esx_admin:tpm")
AddEventHandler("esx_admin:tpm", function()
    local WaypointHandle = GetFirstBlipInfoId(8)
    if DoesBlipExist(WaypointHandle) then
        local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

        for height = 1, 1000 do
            SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

            local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

            if foundGround then
                SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                break
            end

            Citizen.Wait(5)
        end
		--TriggerEvent('chatMessage', _U('teleported'))
		exports['mythic_notify']:SendAlert('inform', '[GRP-ADMIN]: Teleport erfolgeich ausgelöst!', 7500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })

    else
		--TriggerEvent('chatMessage', _U('set_waypoint'))
		exports['mythic_notify']:SendAlert('error', '[GRP-ADMIN]: Teleport benötigt gesetzen Wegpunkt auf der Karte. Was bist du denn für ein Admin?!', 7500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
		exports['mythic_notify']:SendAlert('error', '[GRP-ADMIN]: Memo von Dewen: Wir kommen mit Traktor, wenn du nicht lernst!', 7500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })

    end
end)
