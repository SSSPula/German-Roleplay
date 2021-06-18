

PlayerData = {}

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

windowRolled = false

menuOpen = false
-- Shop Thread:
Citizen.CreateThread(function()
	while true do
        Citizen.Wait(1)
		local player = GetPlayerPed(-1)
		local coords = GetEntityCoords(player)
		for k,v in pairs(Config.Locksmith) do
			local dist = GetDistanceBetweenCoords(v.Pos[1], v.Pos[2], v.Pos[3], coords.x, coords.y, coords.z, false)
			local mk = v.Marker
			if mk.Enable and dist <= mk.DrawDist and not menuOpen then
				DrawMarker(mk.Type, v.Pos[1], v.Pos[2], v.Pos[3]-0.97, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, mk.Scale.x, mk.Scale.y, mk.Scale.z, mk.Color.r, mk.Color.g, mk.Color.b, mk.Color.a, false, true, 2, false, false, false, false)
			end
			if dist <= 1.5 and not menuOpen then
				DrawText3Ds(v.Pos[1], v.Pos[2], v.Pos[3]+0.2, Lang['open_locksmith'])
				if IsControlJustPressed(0, v.Key) then
					OpenKeyShopMenu()
					Citizen.Wait(250)
				end
			end
		end
		for k,v in pairs(Config.AlarmShop) do
			local dist = GetDistanceBetweenCoords(v.Pos[1], v.Pos[2], v.Pos[3], coords.x, coords.y, coords.z, false)
			local mk = v.Marker
			if mk.Enable and dist <= mk.DrawDist and not menuOpen then
				DrawMarker(mk.Type, v.Pos[1], v.Pos[2], v.Pos[3]-0.97, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, mk.Scale.x, mk.Scale.y, mk.Scale.z, mk.Color.r, mk.Color.g, mk.Color.b, mk.Color.a, false, true, 2, false, false, false, false)
			end
		end
	end
end)

RegisterNetEvent('grp_keys:openKeyShop')
AddEventHandler('grp_keys:openKeyShop', function()
	OpenKeyShopMenu()
end)

RegisterNetEvent('grp_keys:openAlarmShop')
AddEventHandler('grp_keys:openAlarmShop', function()
	OpenAlarmShopMenu()
end)

RegisterCommand('givekeys', function(source, args)
	OwnedKeysActions()
end, false)

-- Function to open Key Shop 
function OpenKeyShopMenu()
	menuOpen = true
	local playerPed  = GetPlayerPed(-1)
	FreezeEntityPosition(playerPed, true)
	local elements = {}
	
	ESX.TriggerServerCallback("grp_keys:fetchData", function(vehicles)
		
		for k,v in pairs(vehicles) do
			local vehHash = v.vehicle.model
			local vehName = GetDisplayNameFromVehicleModel(vehHash)
			local vehLabel = GetLabelText(vehName)
			if v.gotKey == 0 then
				table.insert(elements,{ label = vehLabel.." ("..v.plate..")" , name = vehLabel, plate = v.plate,  gotKey = v.gotKey})
			end
		end
		
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), "shop_main_menu",
			{
				title    = Lang['shop_main_title'],
				align    = "center",
				elements = elements
			},
		function(data, menu)
			menu.close()
			OpenRegisterKeyMenu(data.current.plate, data.current.name, data.current.gotKey)
			FreezeEntityPosition(playerPed, false)
		end, function(data, menu)
			menu.close()
			ESX.UI.Menu.CloseAll()
			FreezeEntityPosition(playerPed, false)
			menuOpen = false
		end)
	end)
	
end

-- Function to confirm registering a new key
function OpenRegisterKeyMenu(plate)	
	local elements = {
		{ label = Lang['reg_key_accept'], value = "reg_accept" },
		{ label = Lang['reg_key_decline'], value = "reg_decline" },
	}
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "register_key_confirm",
		{
			title    = (Lang['reg_key_title']):format(Config.RegisterKeyPrice),
			align    = "center",
			elements = elements
		},
	function(data, menu)
		if(data.current.value == 'reg_accept') then
			TriggerServerEvent('grp_keys:registerNewKey', plate)
			ShowNotifyESX(Lang['key_reg_accepted'])
			menu.close()
			ESX.UI.Menu.CloseAll()
			FreezeEntityPosition(playerPed, false)
			menuOpen = false
		end
		if(data.current.value == 'reg_decline') then
			menu.close()
			ShowNotifyESX(Lang['key_reg_declined'])
			OpenKeyShopMenu()
		end
		menu.close()
	end, function(data, menu)
		menu.close()
		OpenKeyShopMenu()
	end)
end


RegisterNetEvent("grp_keys:OpenByServer") -- For opening the keysystem menu from another resource.
AddEventHandler("grp_keys:OpenByServer", function()
    OpenCarMenu()
end)



-- Function to open car menu: 
function OpenCarMenu()
	local plyPed = GetPlayerPed(-1)
	local coords = GetEntityCoords(plyPed, true)
	local car = nil
	if IsPedInAnyVehicle(plyPed,  false) then
		car = GetVehiclePedIsIn(plyPed, false)
	else
		car = GetClosestVehicle(coords.x, coords.y, coords.z, 6.0, 0, 71)
	end
	
	local elements = {
		{ label = Lang['your_keys'], value = "your_keys_btn" },
		{ label = Lang['veh_windows_menu'], value = "veh_window_menu" },
		{ label = Lang['veh_door_menu'], value = "veh_door_menu" },
		{ label = Lang['veh_engine_label'], value = "veh_eng_btn" },
		--{ label = Lang['veh_neon_label'], value = "veh_neon_btn" },
	}
	

	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "register_key_confirm",
		{
			title    = Lang['car_menu_title'],
			align    = "center",
			elements = elements
		},
	function(data, menu)
		
		-- KEYS:
		if (data.current.value == 'your_keys_btn') then
			OwnedKeysActions()
		
		-- WINDOWS:
		elseif (data.current.value == 'veh_window_menu') then
			local elements = {}
			if DoesEntityExist(car) then
				local windowLabel = {{
					[0] = Lang['window_front_r'],
					[1] = Lang['window_front_l'],
					[2] = Lang['window_rear_r'],
					[3] = Lang['window_rear_l'],
				}}
				for i = 0,3 do
					if DoesVehicleHaveDoor(car, i) then
						local labelTxt = ''
						for k,v in pairs(windowLabel) do
							labelTxt = v[i]
							table.insert(elements,{ label = labelTxt , windowIndex = i})
						end
					end
				end
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), "veh_window_choose_menu", {
					title    = Lang['veh_windows_menu_title'],
					align    = "center",
					elements = elements
				},
				function(data2, menu2)
					if not windowRolled then 
						RollDownWindow(car, data2.current.windowIndex)
						windowRolled = true
					else 
						RollUpWindow(car, data2.current.windowIndex)
						windowRolled = false
					end	
				end, function(data2, menu2)
					menu2.close()
					ESX.UI.Menu.CloseAll()
					OpenCarMenu()
				end)
			else
				ShowNotifyESX(Lang['no_veh_nearby'])
			end
		
		-- DOORS:
		elseif (data.current.value == 'veh_door_menu') then
			local elements = {}
			if DoesEntityExist(car) then
				local doorLabel = {{
					[0] = Lang['door_front_left'],
					[1] = Lang['door_front_right'],
					[2] = Lang['door_rear_left'],
					[3] = Lang['door_rear_right'],
					[4] = Lang['door_hood'],
					[5] = Lang['door_trunk'],
				}}
				local CarDoors = GetNumberOfVehicleDoors(car)
				for i = 0,CarDoors do
					if DoesVehicleHaveDoor(car, i) then
						local labelTxt = ''
						for k,v in pairs(doorLabel) do
							labelTxt = v[i]
							table.insert(elements,{ label = labelTxt , doorIndex = i})
						end
					end
				end
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), "veh_door_choose_menu", {
					title    = Lang['veh_door_menu_title'],
					align    = "center",
					elements = elements
				},
				function(data2, menu2)
					if GetVehicleDoorAngleRatio(car, data2.current.doorIndex) > 0.0 then 
						SetVehicleDoorShut(car, data2.current.doorIndex, false)
					else 
						SetVehicleDoorOpen(car, data2.current.doorIndex, false)
					end	
				end, function(data2, menu2)
					menu2.close()
					ESX.UI.Menu.CloseAll()
					OpenCarMenu()
				end)
			else
				ShowNotifyESX(Lang['no_veh_nearby'])
			end
		
		-- ENGINE:
		elseif (data.current.value == 'veh_eng_btn') then
			if DoesEntityExist(car) then
				if GetIsVehicleEngineRunning(car) then
					SetVehicleEngineOn(car,false,true,true)
				else
					SetVehicleEngineOn(car,true,true,true)
				end
			else
				ShowNotifyESX(Lang['no_veh_nearby'])
			end
		
		-- NEON:
		elseif (data.current.value == 'veh_neon_btn') then
			if DoesEntityExist(car) then
				if GetIsVehicleEngineRunning(car) then
					for i=0,3,1 do
						if IsVehicleNeonLightEnabled(car,i) then
							SetVehicleNeonLightEnabled(car,i,false)
						else
							SetVehicleNeonLightEnabled(car,i,true)
						end
					end
				else
					ShowNotifyESX(Lang['eng_not_running'])
				end
			else
				ShowNotifyESX(Lang['no_veh_nearby'])
			end
		
		-- INSURANCE:
		elseif (data.current.value == 'open_insurance_menu') then
			local elements = {}
			
			ESX.TriggerServerCallback("grp_keys:fetchInsuranceData", function(insuredCars)
				if insuredCars ~= nil then
					for k,v in pairs(insuredCars) do
						local vehHash = v.vehicle.model
						local vehName = GetDisplayNameFromVehicleModel(vehHash)
						local vehLabel = GetLabelText(vehName)
						table.insert(elements,{ label = vehLabel.." ("..v.plate..")" , name = vehLabel, plate = v.plate, insurance = v.insurance})
						
						ESX.UI.Menu.Open('default', GetCurrentResourceName(), "see_insured_cars",
							{
								title    = Lang['insured_cars_title'],
								align    = "center",
								elements = elements
							},
						function(data2, menu2)
							menu2.close()
						end, function(data2, menu2)
							menu.close()
							ESX.UI.Menu.CloseAll()
							OpenCarMenu()
						end)
						
					end
				else
					ShowNotifyESX(Lang['no_insured_cars'])
				end
			end)
			
		end	
				
	end, function(data, menu)
		car = nil
		menu.close()
		ESX.UI.Menu.CloseAll()
	end)
	
end

RegisterCommand("autoauf", function(source)
	local ped = PlayerPedId()
	local loll = IsPedDeadOrDying(ped, true)
	if not loll then
	ToggleVehicleLock()
	end
end)



-- Thread For Key Binding to Toggle Car Locks:


-- Lock Toggle Anim Function /w effects:
function LockToggleEffects(car,locked)
	local plyPed = GetPlayerPed(-1)
	local prop = GetHashKey('p_car_keys_01')
	local animDict = 'anim@mp_player_intmenu@key_fob@'
	local animLib = 'fob_click'
	SetCurrentPedWeapon(plyPed, GetHashKey("WEAPON_UNARMED")) 
	RequestModel(prop)
	while not HasModelLoaded(prop) do
	    Citizen.Wait(10)
	end
	local keyFob = CreateObject(prop, 1.0, 1.0, 1.0, 1, 1, 0)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(1)
	end
	AttachEntityToEntity(keyFob, plyPed, GetPedBoneIndex(plyPed, 57005), 0.09, 0.04, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
	TaskPlayAnim(plyPed, animDict, animLib, 15.0, -10.0, 1500, 49, 0, false, false, false)
	PlaySoundFromEntity(-1, "Remote_Control_Fob", plyPed, "PI_Menu_Sounds", 1, 0)
	SetVehicleLights(car,2)
	Citizen.Wait(200)
	SetVehicleLights(car,1)
	Citizen.Wait(200)
	SetVehicleLights(car,2)
	Citizen.Wait(200)
	
	if locked then
		SetVehicleDoorsLocked(car, 1)
		PlayVehicleDoorOpenSound(car, 0)
		PlaySoundFromEntity(-1, "Remote_Control_Open", car, "PI_Menu_Sounds", 1, 0)
		ShowNotifyESX(Lang['car_unlocked'])
		
	elseif not locked then
		SetVehicleDoorsLocked(car, 2)
		PlayVehicleDoorCloseSound(car, 0)
		PlaySoundFromEntity(-1, "Remote_Control_Close", car, "PI_Menu_Sounds", 1, 0)
		ShowNotifyESX(Lang['car_locked'])
	end
	
	Citizen.Wait(200)
	SetVehicleLights(car,1)
	SetVehicleLights(car,0)
	Citizen.Wait(200)
	DeleteEntity(keyFob)
end
