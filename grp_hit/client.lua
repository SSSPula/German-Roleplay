local inTrunk

ESX = nil
Citizen.CreateThread(function()
    while true do
        Wait(0)
        if inTrunk then
            local vehicle = GetEntityAttachedTo(PlayerPedId())
            if DoesEntityExist(vehicle) or not IsPedDeadOrDying(PlayerPedId()) or not IsPedFatallyInjured(PlayerPedId()) then
                local coords = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, 'boot'))
                SetEntityCollision(PlayerPedId(), false, false)
                DrawText3D(coords, '[E] Verlasse Kofferraum')

                if GetVehicleDoorAngleRatio(vehicle, 5) < 0.9 then
                    SetEntityVisible(PlayerPedId(), false, false)
                else
                    if not IsEntityPlayingAnim(PlayerPedId(), 'timetable@floyd@cryingonbed@base', 3) then
                        loadDict('timetable@floyd@cryingonbed@base')
                        TaskPlayAnim(PlayerPedId(), 'timetable@floyd@cryingonbed@base', 'base', 8.0, -8.0, -1, 1, 0, false, false, false)

                        SetEntityVisible(PlayerPedId(), true, false)
                    end
                end
                if IsControlJustReleased(0, 38) and inTrunk then
                    SetCarBootOpen(vehicle)
                    SetEntityCollision(PlayerPedId(), true, true)
                    Wait(750)
                    inTrunk = false
                    DetachEntity(PlayerPedId(), true, true)
                    SetEntityVisible(PlayerPedId(), true, false)
                    ClearPedTasks(PlayerPedId())
                    SetEntityCoords(PlayerPedId(), GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, -1.5, -0.75))
                    Wait(250)
                    SetVehicleDoorShut(vehicle, 5)
                end
            else
                SetEntityCollision(PlayerPedId(), true, true)
                DetachEntity(PlayerPedId(), true, true)
                SetEntityVisible(PlayerPedId(), true, false)
                ClearPedTasks(PlayerPedId())
                SetEntityCoords(PlayerPedId(), GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, -0.5, -0.75))
            end
        end
    end
end)   

Citizen.CreateThread(function()
	while ESX == nil do TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end) Wait(0) end
    while not NetworkIsSessionStarted() or ESX.GetPlayerData().job == nil do Wait(0) end
    while true do
        local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 10.0, 0, 70)
        if DoesEntityExist(vehicle) then
            local trunk = GetEntityBoneIndexByName(vehicle, 'boot')
            if trunk ~= -1 then
                local coords = GetWorldPositionOfEntityBone(vehicle, trunk)
                if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), coords, true) <= 1.5 then
                    if not inTrunk then
                        if GetVehicleDoorAngleRatio(vehicle, 5) < 0.9 then
                            DrawText3D(coords, '[E] Verstecke in Kofferaum\n[H] Öffne Kofferraum')
                            if IsControlJustReleased(0, 74) then
                                SetVehicleDoorOpen(vehicle, 5, false)
                            end
                        else
                            DrawText3D(coords, '[E] Verstecke in Kofferaum\n[H] Öffne Kofferraum')
                            if IsControlJustReleased(0, 74) then
                                SetVehicleDoorShut(vehicle, 5)
                            end
                        end
                    end
                    if IsControlJustReleased(0, 38) and not inTrunk then
                        local player = ESX.Game.GetClosestPlayer()
                        local playerPed = GetPlayerPed(player)
                        if DoesEntityExist(playerPed) then
                            if not IsEntityAttached(playerPed) or GetDistanceBetweenCoords(GetEntityCoords(playerPed), GetEntityCoords(PlayerPedId()), true) >= 5.0 then
                                SetCarBootOpen(vehicle)
                                Wait(350)
                                local offsetXYZ, offsetZ = tonumber('-'..GetDistanceBetweenCoords(GetEntityCoords(vehicle), coords, true)), coords.z - GetEntityCoords(vehicle).z
                                AttachEntityToEntity(PlayerPedId(), vehicle, -1, vector3(0.0, offsetXYZ, offsetZ), vector3(360.0, 360.0, 360.0), false, false, false, true, 20, true)	
                                loadDict('timetable@floyd@cryingonbed@base')
                                TaskPlayAnim(PlayerPedId(), 'timetable@floyd@cryingonbed@base', 'base', 8.0, -8.0, -1, 1, 0, false, false, false)
                                Wait(50)
                                inTrunk = true

                                Wait(1500)
                                SetVehicleDoorShut(vehicle, 5)
                            else
                                ESX.ShowNotification('Da ist schon jemand drin!')
                            end
                        end
                    end
                end
            end
        end
        Wait(0)
    end
end)

loadDict = function(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
end

function DrawText3D(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
  
    SetTextScale(0.4, 0.4)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextColour(255, 255, 255, 255)
    SetTextOutline()
  
    AddTextComponentString(text)
    DrawText(_x, _y)
end


--grd anticheat

Citizen.CreateThread(function()
        Citizen.Wait(10000) 
        while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		local posx,posy,posz = table.unpack(GetEntityCoords(ped,true))
		local still = IsPedStill(ped)
		local vel = GetEntitySpeed(ped)
		local ped = PlayerPedId()
		Wait(3000) 

		local newx,newy,newz = table.unpack(GetEntityCoords(ped,true))
		local newPed = PlayerPedId() 
		local sichtbar = not IsEntityVisibleToScript(ped)
		local sichtbar2 = not IsEntityVisible(ped)
		
		if GetDistanceBetweenCoords(posx,posy,posz, newx,newy,newz) > 200 and still == IsPedStill(ped) and vel == GetEntitySpeed(ped) and ped == newPed then
			local tot = IsPedDeadOrDying(ped, true)
			if not tot and not inTrunk then
				if sichtbar or sichtbar2 then
					TriggerServerEvent("grd_Anticheat:NoClip", GetDistanceBetweenCoords(posx,posy,posz, newx,newy,newz))
				end
			end
		end
	end
end)

RegisterNetEvent('esx:getSharedObject')
AddEventHandler('esx:getSharedObject', function()
	TriggerServerEvent("grd_Anticheat:ModderESX", "Modder gefunden, er wollte unser Netevent auslesen.", 
						"grd_Anticheat: " .. "Modder");
end)
