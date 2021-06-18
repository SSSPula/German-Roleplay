-- Script made by JayJax aka Black Book --

-- Weapons BASE
if Config.DisableDrops then
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(250)
			RemoveWeaponDrops()
		end
	end)
end

-- Functions do not touch
-- WEAONS BASE
function RemoveWeaponDrops()
	local playerYeet = GetPlayerPed(PlayerId())
    local pickupList = {
		"PICKUP_AMMO_BULLET_MP",
		"PICKUP_AMMO_FIREWORK",
		"PICKUP_AMMO_FLAREGUN",
		"PICKUP_AMMO_GRENADELAUNCHER",
		"PICKUP_AMMO_GRENADELAUNCHER_MP",
		"PICKUP_AMMO_HOMINGLAUNCHER",
		"PICKUP_AMMO_MG",
		"PICKUP_AMMO_MINIGUN",
		"PICKUP_AMMO_MISSILE_MP",
		"PICKUP_AMMO_PISTOL",
		"PICKUP_AMMO_RIFLE",
		"PICKUP_AMMO_RPG",
		"PICKUP_AMMO_SHOTGUN",
		"PICKUP_AMMO_SMG",
		"PICKUP_AMMO_SNIPER",
		"PICKUP_ARMOUR_STANDARD",
		"PICKUP_CAMERA",
		"PICKUP_CUSTOM_SCRIPT",
		"PICKUP_GANG_ATTACK_MONEY",
		"PICKUP_HEALTH_SNACK",
		"PICKUP_HEALTH_STANDARD",
		"PICKUP_MONEY_CASE",
		"PICKUP_MONEY_DEP_BAG",
		"PICKUP_MONEY_MED_BAG",
		"PICKUP_MONEY_PAPER_BAG",
		"PICKUP_MONEY_PURSE",
		"PICKUP_MONEY_SECURITY_CASE",
		"PICKUP_MONEY_VARIABLE",
		"PICKUP_MONEY_WALLET",
		"PICKUP_PARACHUTE",
		"PICKUP_PORTABLE_CRATE_FIXED_INCAR",
		"PICKUP_PORTABLE_CRATE_UNFIXED",
		"PICKUP_PORTABLE_CRATE_UNFIXED_INCAR",
		"PICKUP_PORTABLE_CRATE_UNFIXED_INCAR_SMALL",
		"PICKUP_PORTABLE_CRATE_UNFIXED_LOW_GLOW",
		"PICKUP_PORTABLE_DLC_VEHICLE_PACKAGE",
		"PICKUP_PORTABLE_PACKAGE",
		"PICKUP_SUBMARINE",
		"PICKUP_VEHICLE_ARMOUR_STANDARD",
		"PICKUP_VEHICLE_CUSTOM_SCRIPT",
		"PICKUP_VEHICLE_CUSTOM_SCRIPT_LOW_GLOW",
		"PICKUP_VEHICLE_HEALTH_STANDARD",
		"PICKUP_VEHICLE_HEALTH_STANDARD_LOW_GLOW",
		"PICKUP_VEHICLE_MONEY_VARIABLE",
		"PICKUP_VEHICLE_WEAPON_APPISTOL",
		"PICKUP_VEHICLE_WEAPON_ASSAULTSMG",
		"PICKUP_VEHICLE_WEAPON_COMBATPISTOL",
		"PICKUP_VEHICLE_WEAPON_GRENADE",
		"PICKUP_VEHICLE_WEAPON_MICROSMG",
		"PICKUP_VEHICLE_WEAPON_MOLOTOV",
		"PICKUP_VEHICLE_WEAPON_PISTOL",
		"PICKUP_VEHICLE_WEAPON_PISTOL50",
		"PICKUP_VEHICLE_WEAPON_SAWNOFF",
		"PICKUP_VEHICLE_WEAPON_SMG",
		"PICKUP_VEHICLE_WEAPON_SMOKEGRENADE",
		"PICKUP_VEHICLE_WEAPON_STICKYBOMB",
		"PICKUP_WEAPON_ADVANCEDRIFLE",
		"PICKUP_WEAPON_APPISTOL",
		"PICKUP_WEAPON_ASSAULTRIFLE",
		"PICKUP_WEAPON_ASSAULTSHOTGUN",
		"PICKUP_WEAPON_ASSAULTSMG",
		"PICKUP_WEAPON_AUTOSHOTGUN",
		"PICKUP_WEAPON_BAT",
		"PICKUP_WEAPON_BATTLEAXE",
		"PICKUP_WEAPON_BOTTLE",
		"PICKUP_WEAPON_BULLPUPRIFLE",
		"PICKUP_WEAPON_BULLPUPSHOTGUN",
		"PICKUP_WEAPON_CARBINERIFLE",
		"PICKUP_WEAPON_COMBATMG",
		"PICKUP_WEAPON_COMBATPDW",
		"PICKUP_WEAPON_COMBATPISTOL",
		"PICKUP_WEAPON_COMPACTLAUNCHER",
		"PICKUP_WEAPON_COMPACTRIFLE",
		"PICKUP_WEAPON_CROWBAR",
		"PICKUP_WEAPON_DAGGER",
		"PICKUP_WEAPON_DBSHOTGUN",
		"PICKUP_WEAPON_FIREWORK",
		"PICKUP_WEAPON_FLAREGUN",
		"PICKUP_WEAPON_FLASHLIGHT",
		"PICKUP_WEAPON_GRENADE",
		"PICKUP_WEAPON_GRENADELAUNCHER",
		"PICKUP_WEAPON_GUSENBERG",
		"PICKUP_WEAPON_GOLFCLUB",
		"PICKUP_WEAPON_HAMMER",
		"PICKUP_WEAPON_HATCHET",
		"PICKUP_WEAPON_HEAVYPISTOL",
		"PICKUP_WEAPON_HEAVYSHOTGUN",
		"PICKUP_WEAPON_HEAVYSNIPER",
		"PICKUP_WEAPON_HOMINGLAUNCHER",
		"PICKUP_WEAPON_KNIFE",
		"PICKUP_WEAPON_KNUCKLE",
		"PICKUP_WEAPON_MACHETE",
		"PICKUP_WEAPON_MACHINEPISTOL",
		"PICKUP_WEAPON_MARKSMANPISTOL",
		"PICKUP_WEAPON_MARKSMANRIFLE",
		"PICKUP_WEAPON_MG",
		"PICKUP_WEAPON_MICROSMG",
		"PICKUP_WEAPON_MINIGUN",
		"PICKUP_WEAPON_MINISMG",
		"PICKUP_WEAPON_MOLOTOV",
		"PICKUP_WEAPON_MUSKET",
		"PICKUP_WEAPON_NIGHTSTICK",
		"PICKUP_WEAPON_PETROLCAN",
		"PICKUP_WEAPON_PIPEBOMB",
		"PICKUP_WEAPON_PISTOL",
		"PICKUP_WEAPON_PISTOL50",
		"PICKUP_WEAPON_POOLCUE",
		"PICKUP_WEAPON_PROXMINE",
		"PICKUP_WEAPON_PUMPSHOTGUN",
		"PICKUP_WEAPON_RAILGUN",
		"PICKUP_WEAPON_REVOLVER",
		"PICKUP_WEAPON_RPG",
		"PICKUP_WEAPON_SAWNOFFSHOTGUN",
		"PICKUP_WEAPON_SMG",
		"PICKUP_WEAPON_SMOKEGRENADE",
		"PICKUP_WEAPON_SNIPERRIFLE",
		"PICKUP_WEAPON_SNSPISTOL",
		"PICKUP_WEAPON_SPECIALCARBINE",
		"PICKUP_WEAPON_STICKYBOMB",
		"PICKUP_WEAPON_STUNGUN",
		"PICKUP_WEAPON_SWITCHBLADE",
		"PICKUP_WEAPON_VINTAGEPISTOL",
		"PICKUP_WEAPON_WRENCH"
	}
	local pedPos = GetEntityCoords(playerYeet, false)
	for a = 1, #pickupList do
		if IsPickupWithinRadius(GetHashKey(pickupList[a]), pedPos.x, pedPos.y, pedPos.z, 50.0) then
			RemoveAllPickupsOfType(GetHashKey(pickupList[a]))
		end
	end
end

--Enter Vehicle on any free Seat lel 


--tiempo = 800
--Citizen.CreateThread(function()
--	while true do
--	Citizen.Wait(tiempo)
--	tiempo = 800
--		
--		local ped = PlayerPedId()
--        local pco = GetEntityCoords(ped)
--        local vehicle = GetClosestVehicle(pco, 5.0, 0, 71)
--		if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) and IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1)) or DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) and GetPedInVehicleSeat(vehicle, -1) == 0 then
--		tiempo = 10
--			local bldoor = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "window_lr"))
--			local brdoor = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "window_rr"))
--			local frdoor = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "window_rf"))
--			local playerpos = GetEntityCoords(GetPlayerPed(-1), 1)
--			local distanceToBrdoor = GetDistanceBetweenCoords(brdoor, playerpos, 1)
--			local distanceToBldoor = GetDistanceBetweenCoords(bldoor, playerpos, 1)
--			local distanceToFrdoor = GetDistanceBetweenCoords(frdoor, playerpos, 1)
--				--print(distanceToBrdoor, distanceToBldoor, distanceToFrdoor)
--		    if distanceToBrdoor < 0.9 and DoesVehicleHaveDoor(vehicle, 3) and not DoesEntityExist(GetPedInVehicleSeat(vehicle, 2)) and GetVehicleDoorLockStatus(vehicle) ~= 2 then
--                DrawText3D(brdoor.x, brdoor.y, brdoor.z + 0.3, "⬆️")
--				if (IsControlJustPressed(1, 49)) then
--                 TaskEnterVehicle(PlayerPedId(), vehicle, 10000, 2, 1.0, 1, 0)
--                end
--			elseif distanceToBldoor < 0.9 and DoesVehicleHaveDoor(vehicle, 2) and not DoesEntityExist(GetPedInVehicleSeat(vehicle, 1)) and GetVehicleDoorLockStatus(vehicle) ~= 2 then
--                DrawText3D(bldoor.x, bldoor.y, bldoor.z + 0.3, "⬆️")
--				if (IsControlJustPressed(1, 49)) then
--                 TaskEnterVehicle(PlayerPedId(), vehicle, 10000, 1, 1.0, 1, 0)
--                end
--			elseif distanceToFrdoor < 0.9 and DoesVehicleHaveDoor(vehicle, 1) and not DoesEntityExist(GetPedInVehicleSeat(vehicle, 0)) and GetVehicleDoorLockStatus(vehicle) ~= 2 then
--                DrawText3D(frdoor.x, frdoor.y, frdoor.z + 0.3, "⬆️")
--                if (IsControlJustPressed(1, 49)) then
--                 TaskEnterVehicle(PlayerPedId(), vehicle, 10000, 0, 1.0, 1, 0)
--                end				
--			end
--		end
--		
--		
--		
--	end
--end)



function DrawText3D(x,y,z, text)
  local onScreen, _x, _y = World3dToScreen2d(x, y, z - 0.5)
  local p = GetGameplayCamCoords()
  local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
  local scale = (1 / distance) * 2
  local fov = (1 / GetGameplayCamFov()) * 100
  local scale = scale * fov
  if onScreen then
		SetTextScale(0.45, 0.45)
		SetTextFont(6)
		SetTextProportional(1)
		SetTextColour(0, 255, 0, 255)
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		DrawText(_x,_y)
    end
end