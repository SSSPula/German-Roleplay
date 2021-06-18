local veh = nil
local tesla_blip = nil
local tesla_pilot = false
local tesla_pilot_ped = nil
local tesla_dance = false

local pilot = false
local crash = false
local dance = false
local crash_ped_fl = nil
local crash_ped_fr = nil
local crash_ped_rl = nil
local crash_ped_rr = nil
-----
function VehMarkbyDewen(source)
		if(IsPedInAnyVehicle(GetPlayerPed(-1)) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1)) then
			veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			minimap("[~r~GRP~w~] Autopilot: Fahrzeug markiert und Autopilot ~g~BEREIT")
			if(DoesBlipExist(tesla_blip)) then
				RemoveBlip(tesla_blip)
			end
			tesla_blip = AddBlipForEntity(veh)
			SetBlipSprite(tesla_blip, 595)
			SetBlipColour(tesla_blip, 26)
			BeginTextCommandSetBlipName("STRING")
      		AddTextComponentString("Vehicle")
			EndTextCommandSetBlipName(tesla_blip)
		else
			veh = nil
			minimap("[~r~GRP~w~] Autopilot: Fahrzeug nicht für Autopilot registriert")
			if(DoesBlipExist(tesla_blip)) then
				RemoveBlip(tesla_blip)
			end
			tesla_blip = nil
		end
end

RegisterNetEvent("grp_AutoDrive:vehmark") -- For triggering the AutoDrive from F3 Menu lel
AddEventHandler("grp_AutoDrive:vehmark", function()
    VehMarkbyDewen()
end)
-----


RegisterCommand("autopilotan", function(source)
	
	VehMarkbyDewen()

end)


function VehPilotbyDewen(source)
if(IsPedInAnyVehicle(GetPlayerPed(-1), false) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1)) then
		waypoint = Citizen.InvokeNative(0xFA7C7F0AADF25D09, GetFirstBlipInfoId(8), Citizen.ResultAsVector())
		--print(waypoint)
		
			if(pilot) then
				pilot = false
				exports['mythic_notify']:SendAlert('inform', 'GRP AutoPilot erfolgreich deaktiviert.', 3500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				--minimap("GRP Auto-Pilot ^7deaktiviert.")
				ClearPedTasks(GetPlayerPed(-1))
			else
				if(crash) then
					crash = false
					minimap("Crash-Avoidance deactivated.")
					--DeletePed(crash_ped_fl)
					DeleteEntity(crash_ped_fl)
					--DeletePed(crash_ped_fr)
					DeleteEntity(crash_ped_fr)
					--DeletePed(crash_ped_front)
					DeleteEntity(crash_ped_front)
					--DeletePed(crash_ped_rear)
					DeleteEntity(crash_ped_rear)
				end
				pilot = true
				exports['mythic_notify']:SendAlert('inform', 'GRP AutoPilot erfolgreich aktiviert.', 3500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				--minimap("GRP-Auto-Pilot aktiviert.")
				TaskVehicleDriveToCoord(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), 0), waypoint["x"], waypoint["y"], waypoint["z"], 100.0, 1.0, GetHashKey(GetVehiclePedIsIn(GetPlayerPed(-1), 0)), 2883621, 1.0, 1)
				Citizen.CreateThread(function()
					while pilot do
						Wait(100)
						if(GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1))["x"], GetEntityCoords(GetPlayerPed(-1))["y"], GetEntityCoords(GetPlayerPed(-1))["z"], waypoint["x"], waypoint["y"], waypoint["z"], 0) < 10.0) then
							while GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), 0)) - 1.0 > 0.0 do
								SetVehicleForwardSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), 0), GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), 0)) - 1.0)
								Wait(100)
							end
							pilot = false
							ClearPedTasks(GetPlayerPed(-1))
							exports['mythic_notify']:SendAlert('inform', 'GRP AutoPilot erfolgreich aktiviert.', 3500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
							--minimap("GRP-Auto-Pilot aktiviert.")
						end
					end
				end)
			end
		
	end
end
-----
RegisterNetEvent("grp_AutoDrive:vehpilot") -- For triggering the AutoDrive from F3 Menu lel trololol
AddEventHandler("grp_AutoDrive:vehpilot", function()
    VehMarkbyDewen()
	VehPilotbyDewen()
end)
-----
local hashud = 108
TriggerEvent('chat:addSuggestion', '/veh', 'GRP Autpilot Features', {{name="pilot|crash|dance|mark", help="Aktiviere Autopilot, Crash-Vermeidung, Tanzen, Fahrzeug für Autopilot markieren "}})
RegisterCommand("veh", function(source, args)
	if(args[1] == "mark") then
		if(IsPedInAnyVehicle(GetPlayerPed(-1)) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1)) then
			veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			--minimap("Rufe mit /veh pilot dein Fahrzeug zu dir.\nWenn du im Fahrzeug sitzt starte mit /veh pilot.")
			if(DoesBlipExist(tesla_blip)) then
				RemoveBlip(tesla_blip)
			end
			tesla_blip = AddBlipForEntity(veh)
			SetBlipSprite(tesla_blip, 595)
			SetBlipColour(tesla_blip, 26)
			BeginTextCommandSetBlipName("STRING")
      AddTextComponentString("Vehicle")
			EndTextCommandSetBlipName(tesla_blip)
		else
			veh = nil
			minimap("GRP Autopilot hat ~r~kein Fahrzeug~ gefunden!")
			if(DoesBlipExist(tesla_blip)) then
				RemoveBlip(tesla_blip)
			end
			tesla_blip = nil
		end
	else
		if(IsPedInAnyVehicle(GetPlayerPed(-1), false) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1)) then
			if(args[1] == "pilot") then
				waypoint = Citizen.InvokeNative(0xFA7C7F0AADF25D09, GetFirstBlipInfoId(8), Citizen.ResultAsVector())
				--print(waypoint)
				
					if(pilot) then
						pilot = false
						exports['mythic_notify']:SendAlert('inform', 'GRP AutoPilot erfolgreich deaktiviert.', 3500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
						--minimap("GRP Auto-Pilot ^7deaktiviert.")
						ClearPedTasks(GetPlayerPed(-1))
					else
						if(crash) then
							crash = false
							minimap("Crash-Avoidance deactivated.")
							--DeletePed(crash_ped_fl)
							DeleteEntity(crash_ped_fl)
							--DeletePed(crash_ped_fr)
							DeleteEntity(crash_ped_fr)
							--DeletePed(crash_ped_front)
							DeleteEntity(crash_ped_front)
							--DeletePed(crash_ped_rear)
							DeleteEntity(crash_ped_rear)
						end
						pilot = true
						exports['mythic_notify']:SendAlert('inform', 'GRP AutoPilot erfolgreich aktiviert.', 3500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
						--minimap("GRP-Auto-Pilot aktiviert.")
						TaskVehicleDriveToCoord(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), 0), waypoint["x"], waypoint["y"], waypoint["z"], 100.0, 1.0, GetHashKey(GetVehiclePedIsIn(GetPlayerPed(-1), 0)), 2883621, 1.0, 1)
						Citizen.CreateThread(function()
							while pilot do
								Wait(100)
								if(GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1))["x"], GetEntityCoords(GetPlayerPed(-1))["y"], GetEntityCoords(GetPlayerPed(-1))["z"], waypoint["x"], waypoint["y"], waypoint["z"], 0) < 10.0) then
									while GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), 0)) - 1.0 > 0.0 do
										SetVehicleForwardSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), 0), GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), 0)) - 1.0)
										Wait(100)
									end
									pilot = false
									ClearPedTasks(GetPlayerPed(-1))
									exports['mythic_notify']:SendAlert('inform', 'GRP AutoPilot erfolgreich aktiviert.', 3500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
									--minimap("GRP-Auto-Pilot aktiviert.")
								end
							end
						end)
					end
				
			elseif(args[1] == "crash") then
				if(crash) then
					crash = false
					exports['mythic_notify']:SendAlert('inform', 'GRP Unfallvermeidung erfolgreich deaktiviert.', 3500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					--minimap("GRP-Unfallvermeidung deaktiviert.")
					--DeletePed(crash_ped_fl)
					DeleteEntity(crash_ped_fl)
					--DeletePed(crash_ped_fr)
					DeleteEntity(crash_ped_fr)
					--DeletePed(crash_ped_front)
					DeleteEntity(crash_ped_front)
					--DeletePed(crash_ped_rear)
					DeleteEntity(crash_ped_rear)
				elseif(pilot) then
					exports['mythic_notify']:SendAlert('inform', 'GRP Unfallvermeidung erfolgreich deaktiviert.', 3500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					--minimap("GRP-Unfallvermeidung ist deaktiviert.")
				else
					RequestModel(225514697)
					while not HasModelLoaded(225514697) do
						Wait(5)
					end
					crash = true
					exports['mythic_notify']:SendAlert('inform', 'GRP Unfallvermeidung erfolgreich aktiviert.', 3500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					--minimap("GRP-Unfallvermeidung aktiviert.")
					crash_ped_fl = CreatePed(0, 225514697, GetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0))["x"], GetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0))["y"], GetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0))["z"], 0.0, false, true)
					SetEntityInvincible(crash_ped_fl, true)
					SetEntityVisible(crash_ped_fl, false, 0)
					SetEntityHealth(crash_ped_fl, hashud)
					crash_ped_fr = CreatePed(0, 225514697, GetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0))["x"], GetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0))["y"], GetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0))["z"], 0.0, false, true)
					SetEntityInvincible(crash_ped_fr, true)
					SetEntityVisible(crash_ped_fr, false, 0)
					SetEntityHealth(crash_ped_fr, hashud)
					crash_ped_front = CreatePed(0, 225514697, GetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0))["x"], GetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0))["y"], GetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0))["z"], 0.0, false, true)
					SetEntityInvincible(crash_ped_front, true)
					SetEntityVisible(crash_ped_front, false, 0)
					SetEntityHealth(crash_ped_front, hashud)
					crash_ped_rear = CreatePed(0, 225514697, GetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0))["x"], GetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0))["y"], GetEntityCoords(GetVehiclePedIsIn(GetPlayerPed(-1), 0))["z"], 0.0, false, true)
					SetEntityInvincible(crash_ped_rear, true)
					SetEntityVisible(crash_ped_rear, false, 0)
					SetEntityHealth(crash_ped_rear, hashud)
					AttachEntityToEntity(crash_ped_rear, GetVehiclePedIsIn(GetPlayerPed(-1), false), GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), "boot"), 0.0, -1.8, 0.0, -90.0, 0.0, 0.0, false, false, false, true, 0, true)
					Citizen.CreateThread(function()
						while crash do
							Wait(50)
							DetachEntity(crash_ped_front, false, false)
							DetachEntity(crash_ped_fl, false, false)
							DetachEntity(crash_ped_fr, false, false)
							if(GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) > 5.0) then
								if(GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) < 16.0) then
									AttachEntityToEntity(crash_ped_front, GetVehiclePedIsIn(GetPlayerPed(-1), false), GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), "bonnet"), 0.0, GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) / 2.0, 0.0, 90.0, 0.0, 0.0, false, false, false, true, 0, true)
									AttachEntityToEntity(crash_ped_fl, GetVehiclePedIsIn(GetPlayerPed(-1), false), GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), "headlight_l"), -0.8, GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) / 5.0, 0.0, 50.0, 90.0, 0.0, false, false, false, true, 0, true)
									AttachEntityToEntity(crash_ped_fr, GetVehiclePedIsIn(GetPlayerPed(-1), false), GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), "headlight_r"), 0.8, GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) / 5.0, 0.0, 50.0, -90.0, 0.0, false, false, false, true, 0, true)
								else
									AttachEntityToEntity(crash_ped_front, GetVehiclePedIsIn(GetPlayerPed(-1), false), GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), "bonnet"), 0.0, 8.0, 0.0, 90.0, 0.0, 0.0, false, false, false, true, 0, true)
									AttachEntityToEntity(crash_ped_fl, GetVehiclePedIsIn(GetPlayerPed(-1), false), GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), "headlight_l"), -0.8, 3.0, 0.0, 50.0, 90.0, 0.0, false, false, false, true, 0, true)
									AttachEntityToEntity(crash_ped_fr, GetVehiclePedIsIn(GetPlayerPed(-1), false), GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), "headlight_r"), 0.8, 3.0, 0.0, 50.0, -90.0, 0.0, false, false, false, true, 0, true)
								end
							else
								AttachEntityToEntity(crash_ped_front, GetVehiclePedIsIn(GetPlayerPed(-1), false), GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), "bonnet"), 0.0, 3.5, 0.0, 90.0, 0.0, 0.0, false, false, false, true, 0, true)
								AttachEntityToEntity(crash_ped_fl, GetVehiclePedIsIn(GetPlayerPed(-1), false), GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), "headlight_l"), -0.8, 0.7, 0.0, 50.0, 90.0, 0.0, false, false, false, true, 0, true)
								AttachEntityToEntity(crash_ped_fr, GetVehiclePedIsIn(GetPlayerPed(-1), false), GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), "headlight_r"), 0.8, 0.7, 0.0, 50.0, -90.0, 0.0, false, false, false, true, 0, true)
							end
							if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
								if(IsAnyObjectNearPoint(GetEntityCoords(crash_ped_fl)["x"], GetEntityCoords(crash_ped_fl)["y"], GetEntityCoords(crash_ped_fl)["z"], 1.4, false)) then
										if(GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))) > 3.0 then
											TaskVehicleTempAction(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 5, 45)
										else
											TaskVehicleTempAction(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 8, 45)
										end
								end
								if(IsAnyVehicleNearPoint(GetEntityCoords(crash_ped_fl)["x"], GetEntityCoords(crash_ped_fl)["y"], GetEntityCoords(crash_ped_fl)["z"], 1.4)) then
									if(GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))) > 3.0 then
										TaskVehicleTempAction(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 5, 45)
									else
										TaskVehicleTempAction(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 8, 45)
									end
								end
								--[[if(IsAnyPedNearPoint(GetEntityCoords(crash_ped_fl)["x"], GetEntityCoords(crash_ped_fl)["y"], GetEntityCoords(crash_ped_fl)["z"], 1.4)) then
									if(GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))) > 3.0 then
										TaskVehicleTempAction(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 5, 45)
									else
										TaskVehicleTempAction(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 8, 45)
									end
								end]]
								if(IsAnyObjectNearPoint(GetEntityCoords(crash_ped_fr)["x"], GetEntityCoords(crash_ped_fr)["y"], GetEntityCoords(crash_ped_fr)["z"], 1.4, false)) then
									if(GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))) > 3.0 then
										TaskVehicleTempAction(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 4, 45)
									else
										TaskVehicleTempAction(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 7, 45)
									end
								end
								if(IsAnyVehicleNearPoint(GetEntityCoords(crash_ped_fr)["x"], GetEntityCoords(crash_ped_fr)["y"], GetEntityCoords(crash_ped_fr)["z"], 1.4)) then
									if(GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))) > 3.0 then
										TaskVehicleTempAction(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 4, 45)
									else
										TaskVehicleTempAction(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 7, 45)
									end
								end
								--[[if(IsAnyPedNearPoint(GetEntityCoords(crash_ped_fr)["x"], GetEntityCoords(crash_ped_fr)["y"], GetEntityCoords(crash_ped_fr)["z"], 1.4)) then
									if(GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))) > 3.0 then
										TaskVehicleTempAction(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 4, 45)
									else
										TaskVehicleTempAction(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 7, 45)
									end
								end]]
								if(IsAnyObjectNearPoint(GetEntityCoords(crash_ped_front)["x"], GetEntityCoords(crash_ped_front)["y"], GetEntityCoords(crash_ped_front)["z"], 3.0, false)) then
									TaskVehicleTempAction(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 27, 45)
								end
								if(IsAnyVehicleNearPoint(GetEntityCoords(crash_ped_front)["x"], GetEntityCoords(crash_ped_front)["y"], GetEntityCoords(crash_ped_front)["z"], 3.0)) then
									TaskVehicleTempAction(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 27, 45)
								end
								--[[if(IsAnyPedNearPoint(GetEntityCoords(crash_ped_front)["x"], GetEntityCoords(crash_ped_front)["y"], GetEntityCoords(crash_ped_front)["z"], 3.0)) then
									TaskVehicleTempAction(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 27, 45)
								end]]
								if(IsAnyObjectNearPoint(GetEntityCoords(crash_ped_rear)["x"], GetEntityCoords(crash_ped_rear)["y"], GetEntityCoords(crash_ped_rear)["z"], 2.5, false)) then
									TaskVehicleTempAction(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 23, 45)
								end
								if(IsAnyVehicleNearPoint(GetEntityCoords(crash_ped_rear)["x"], GetEntityCoords(crash_ped_rear)["y"], GetEntityCoords(crash_ped_rear)["z"], 2.5)) then
									TaskVehicleTempAction(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 23, 45)
								end
								--[[if(IsAnyPedNearPoint(GetEntityCoords(crash_ped_rear)["x"], GetEntityCoords(crash_ped_rear)["y"], GetEntityCoords(crash_ped_rear)["z"], 2.5)) then
									TaskVehicleTempAction(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 23, 45)
								end]]
								if(HasEntityBeenDamagedByAnyObject(GetVehiclePedIsIn(GetPlayerPed(-1), false)) or HasEntityBeenDamagedByAnyVehicle(GetVehiclePedIsIn(GetPlayerPed(-1), false))) then
									crash = false
									minimap("Crash Avoidance canceled.")
									--DeletePed(crash_ped_fl)
									DeleteEntity(crash_ped_fl)
									--DeletePed(crash_ped_fr)
									DeleteEntity(crash_ped_fr)
									--DeletePed(crash_ped_front)
									DeleteEntity(crash_ped_front)
									--DeletePed(crash_ped_rear)
									DeleteEntity(crash_ped_rear)
									ClearEntityLastDamageEntity(GetVehiclePedIsIn(GetPlayerPed(-1), false))
								end
							else
								crash = false
								minimap("GRP-Unfallvermeidung deaktiviert.")
								--DeletePed(crash_ped_fl)
								DeleteEntity(crash_ped_fl)
								--DeletePed(crash_ped_fr)
								DeleteEntity(crash_ped_fr)
								--DeletePed(crash_ped_front)
								DeleteEntity(crash_ped_front)
								--DeletePed(crash_ped_rear)
								DeleteEntity(crash_ped_rear)
							end
						end
					end)
				end
			elseif(args[1] == "dance") then
				if(dance) then
					dance = false
					SetVehicleDoorsShut(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
					minimap("GRP-Autodisko deaktiviert.")
				else
					dance = true
					minimap("GRP-Autodisko gestartet.")
					Citizen.CreateThread(function()
						while dance do
							Wait(100)
							SetVehicleDoorOpen(GetVehiclePedIsIn(GetPlayerPed(-1), false), math.random(0, 6), false, false)
							SetVehicleDoorShut(GetVehiclePedIsIn(GetPlayerPed(-1), false), math.random(0, 6), false)
						end
					end)
				end
			else
				exports['mythic_notify']:SendAlert('error', 'Unbekannte Eingabe.', 3500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				--minimap("Unknown action.")
			end
		elseif(veh) then
			if(args[1] == "pilot") then
				if(tesla_pilot) then
					if(tesla_pilot_ped) then
						--DeletePed(tesla_pilot_ped)
						RemovePedElegantly(tesla_pilot_ped)
					end
					tesla_pilot = false
					tesla_pilot_ped = nil
					SetVehicleEngineOn(veh, false, false, false)
					minimap("GRP-Autopilot abgebrochen.")
				else
					RequestModel(225514697)
					while not HasModelLoaded(225514697) do
						Wait(5)
					end
					--minimap("GRP-Autopilot aktiviert.")
					exports['mythic_notify']:SendAlert('inform', 'GRP AutoPilot erfolgreich aktiviert.', 3500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					tesla_pilot = true
					tesla_pilot_ped = CreatePed(0, 225514697, GetEntityCoords(veh)["x"], GetEntityCoords(veh)["y"], GetEntityCoords(veh)["z"], 0.0, false, true)
					SetPedIntoVehicle(tesla_pilot_ped, veh, -1)
					SetEntityInvincible(tesla_pilot_ped, true)
					SetEntityVisible(tesla_pilot_ped, false, 0)
					SetEntityHealth(tesla_pilot_ped, hashud)
					player_coords = GetEntityCoords(GetPlayerPed(-1))
					TaskVehicleDriveToCoord(tesla_pilot_ped, veh, player_coords.x, player_coords.y, player_coords.z, 100.0, 1.0, GetHashKey(veh), 2883621, 1.0, 1)
					Citizen.CreateThread(function()
						while tesla_pilot do
							Wait(100)
							if(GetDistanceBetweenCoords(GetEntityCoords(veh)["x"], GetEntityCoords(veh)["y"], GetEntityCoords(veh)["z"], player_coords.x, player_coords.y, player_coords.z, 0) < 10.0) then
								while GetEntitySpeed(veh) - 1.0 > 0.0 do
									SetVehicleForwardSpeed(veh, GetEntitySpeed(veh) - 1.0)
									Wait(100)
								end
								tesla_pilot = false
								--DeletePed(tesla_pilot_ped)
								RemovePedElegantly(tesla_pilot_ped)
								tesla_pilot_ped = nil
								SetVehicleEngineOn(veh, false, false, false)
								--minimap("GRP-Autopilot deaktiviert.")
								exports['mythic_notify']:SendAlert('inform', 'GRP AutoPilot erfolgreich deaktiviert.', 3500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
							end
						end
					end)
				end
			elseif(args[1] == "dance") then
				if(tesla_dance) then
					tesla_dance = false
					SetVehicleDoorsShut(veh, false)
					--minimap("GRP-Autodisko deaktiviert.")
					exports['mythic_notify']:SendAlert('inform', 'GRP AutoDisco erfolgreich aktiviert.', 3500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })

				else
					tesla_dance = true
					--minimap("GRP-Autodisko gestarted.")
					exports['mythic_notify']:SendAlert('inform', 'GRP AutoDisco erfolgreich deaktiviert.', 3500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					Citizen.CreateThread(function()
						while tesla_dance do
							Wait(100)
							SetVehicleDoorOpen(veh, math.random(0, 6), false, false)
							SetVehicleDoorShut(veh, math.random(0, 6), false)
						end
					end)
				end
			end
		else
			exports['mythic_notify']:SendAlert('inform', 'Markiere zuerst ein Fahrzeug', 4500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
			--minimap("Markiere zuerst ein Fahrzeug mit /veh mark.")
		end
	end
end, false)

function minimap(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(0,1)
end

function translatespeed(float)
local speed = float + 11
return speed
end

autopilotenabled = false
Citizen.CreateThread(function()
    while true do
			local waypointBlip = GetFirstBlipInfoId(8) -- 8 = Waypoint ID
			local x,y,z = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09, waypointBlip, Citizen.ResultAsVector()))
			local px,py,pz = table.unpack(GetEntityCoords(PlayerPedId()))
			local distbetween = Vdist(x,y,z,px,py,pz)
			if IsControlPressed(1,36) then
				if IsControlJustPressed(1,21) then
					if GetEntityModel(GetVehiclePedIsUsing(PlayerPedId())) == -1894894188 or GetEntityModel(GetVehiclePedIsUsing(PlayerPedId())) == -429774847 or GetEntityModel(GetVehiclePedIsUsing(PlayerPedId())) == -1622444098 or GetEntityModel(GetVehiclePedIsUsing(PlayerPedId())) == 884483972 or GetEntityModel(GetVehiclePedIsUsing(PlayerPedId())) == 569305213 or GetEntityModel(GetVehiclePedIsUsing(PlayerPedId())) == -1285460620 or GetEntityModel(GetVehiclePedIsUsing(PlayerPedId())) == -1529242755 or GetEntityModel(GetVehiclePedIsUsing(PlayerPedId())) == -429774847 then
							autopilotenabled = not autopilotenabled
							if autopilotenabled then
								SetNotificationTextEntry("STRING")
								AddTextComponentString("~y~GRP-Autopilot ~g~an")
								DrawNotification(false, true)
								if(not IsWaypointActive())then
									SetNotificationTextEntry("STRING")
									AddTextComponentString("~r~ERROR:~w~ Kein Wegpunkt gesetzt.")
									DrawNotification(true, true)
									autopilotenabled = false
									SetNotificationTextEntry("STRING")
									AddTextComponentString("~y~GRP-Autopilot ~r~deaktiviert")
									DrawNotification(true, true)
									TaskPause(PlayerPedId(), 10)
								else
									defaultspeed = 20.0  --1 = 3 MPH 5 = 11 MPH
									TaskVehicleDriveToCoordLongrange(PlayerPedId(),GetVehiclePedIsUsing(PlayerPedId()), x,y,z, defaultspeed, 2883621, 1.0) --262579
								end
							else
								SetNotificationTextEntry("STRING")
								AddTextComponentString("~y~GRP-Autopilot ~r~deaktiviert")
								DrawNotification(false, true)
								TaskPause(PlayerPedId(), 10)
							end
					else
						SetNotificationTextEntry("STRING")
						AddTextComponentString("Dieses Fahrzeug hat keinen ~y~GRP-Autopilot~w~!")
						DrawNotification(false, true)
					end
				end			
			end
			
			if autopilotenabled then
				if IsControlJustPressed(0, 71) and GetLastInputMethod( 0 ) then
										defaultspeed = defaultspeed + 1.0
										TaskVehicleDriveToCoordLongrange(PlayerPedId(),GetVehiclePedIsUsing(PlayerPedId()), x,y,z, defaultspeed, 2883621, 1.0)
				end
				if IsControlJustPressed(0,72) and GetLastInputMethod( 0 ) then
										defaultspeed = defaultspeed - 1.0
										TaskVehicleDriveToCoordLongrange(PlayerPedId(),GetVehiclePedIsUsing(PlayerPedId()), x,y,z, defaultspeed, 2883621, 1.0)
				end				
				if IsControlJustPressed(0,76) and GetLastInputMethod( 0 ) then
										defaultspeed = 0.0
										TaskVehicleDriveToCoordLongrange(PlayerPedId(),GetVehiclePedIsUsing(PlayerPedId()), x,y,z, defaultspeed, 2883621, 1.0)
										SetNotificationTextEntry("STRING")
										AddTextComponentString("~y~[GRP-Autopilot]~r~ Notfallbremsung ausgelöst")
										DrawNotification(true, true)
										SetNotificationTextEntry("STRING")
										AddTextComponentString("~y~GRP-Autopilot ~r~Deaktiviert")
										DrawNotification(false, true)
										TaskPause(PlayerPedId(), 10)
										autopilotenabled = false
										
				end
			end
        Citizen.Wait(0)
    end
end)