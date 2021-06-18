CreateThread(function()
    while not Loaded do
        Wait(250)
    end

    ViewVehicles = function(garage, coords, heading, tpback)
        local viewing = true

        ClearAreaOfEverything(coords.xyz, 7.5, false, false, false, false)

        ESX.TriggerServerCallback("loaf_garage:getVehicles", function(vehicles)
            if vehicles and #vehicles > 0 then
                local current_vehicle, vehicle = 1, CreateLocalVehicle(vehicles[1], coords, heading)

                local PressDelay = GetGameTimer()
            
                FreezeEntityPosition(PlayerPedId(), true)
                local plate = ""
                while true do
                    Wait(0)
                    if vehicle then
                        plate = ESX.Game.GetVehicleProperties(vehicle).plate
                    end

                    if plate ~= vehicles[current_vehicle].plate then
                        plate = vehicles[current_vehicle].plate
                        if vehicle then
                            SetEntityAsMissionEntity(vehicle, true, true)
                            DeleteVehicle(vehicle)
                        end

                        vehicle = CreateLocalVehicle(vehicles[current_vehicle], coords, heading)
                    end

                    if PressDelay <= GetGameTimer() then
                        -- arrow left
                        if IsDisabledControlPressed(0, 174) then
                            PressDelay = GetGameTimer() + 250
                            if vehicles[current_vehicle - 1] then
                                current_vehicle = current_vehicle - 1
                            else
                                current_vehicle = #vehicles
                            end
                        -- arrow right
                        elseif IsDisabledControlPressed(0, 175) then
                            PressDelay = GetGameTimer() + 250
                            if vehicles[current_vehicle + 1] then
                                current_vehicle = current_vehicle + 1
                            else
                                current_vehicle = 1
                            end
                        end
                    end
                    
                    if IsDisabledControlJustReleased(0, 194) then
                        if DoesEntityExist(vehicle) then
                            SetEntityAsMissionEntity(vehicle, true, true)
                            DeleteVehicle(vehicle)
                        end
                        viewing = false

                        if tpback then
                            SetEntityCoords(PlayerPedId(), tpback.xyz)
                            SetEntityHeading(PlayerPedId(), tpback.w)
                        else
                            SetEntityCoords(PlayerPedId(), coords)
                            SetEntityHeading(PlayerPedId(), heading)
                        end

                        break
                    elseif IsDisabledControlJustReleased(0, 191) and (vehicles[current_vehicle].stored == 1 or vehicles[current_vehicle].stored == true) then
                        if DoesEntityExist(vehicle) then
                            SetEntityAsMissionEntity(vehicle, true, true)
                            DeleteVehicle(vehicle)
                        end

                        ESX.TriggerServerCallback("loaf_garage:takeOutVehicle", function(success)
                            if success then
                                local data = vehicles[current_vehicle]

                                local info = json.decode(data.vehicle)
                                local model = LoadModel(info.model)
                                if model.loaded then
                                    model = model.model
                                    local vehicle = CreateVehicle(model, coords, heading, true, true)
                                    ESX.Game.SetVehicleProperties(vehicle, info)
                                    if not Cache.TakenVehicles then Cache.TakenVehicles = {} end
                                    Cache.TakenVehicles[info.plate] = {veh = vehicle}

                                    if Config.Damages then
                                       -- SetDamages(vehicle, json.decode(data.damages))
                                    end

                                    SetEntityAsMissionEntity(vehicle, true, false)
                                    SetVehicleHasBeenOwnedByPlayer(vehicle, true)
                                    SetVehicleNeedsToBeHotwired(vehicle, false)
                                    SetModelAsNoLongerNeeded(model)
									
                                    while not HasCollisionLoadedAroundEntity(vehicle) do
                                        RequestCollisionAtCoord(coords)
                                        Wait(0)
                                    end

                                    SetVehicleOnGroundProperly(vehicle)

                                    SetVehRadioStation(vehicle, 'OFF')
                                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
									Citizen.Wait(1000)
									autoheilen()
                                end
                            end
                        end, plate)

                        viewing = false
                        break
                    end

                    if vehicles[current_vehicle].stored == 0 or vehicles[current_vehicle].stored == false then
                        HelpText(string.format(Strings["browsing_vehicles"], garage, plate, Strings["impounded"]))
                    else
                        HelpText(string.format(Strings["browsing_vehicles"], garage, plate, ""))
                    end
                end

                FreezeEntityPosition(PlayerPedId(), false)
            else
                ESX.ShowNotification(Strings["no_vehicles"])
                viewing = false
            end
        end, garage)

        while viewing do
            Wait(250)
        end

        FreezeEntityPosition(PlayerPedId(), false)

        if not IsPedInAnyVehicle(PlayerPedId()) then
            return false
        end
        return true
    end

    ViewImpound = function(vehtype, coords, heading)
        local viewing = true

        ESX.TriggerServerCallback("loaf_garage:getImpoundedVehicles", function(vehicles)
            if not vehicles then
                vehicles = {}
            end

            local elements = {}

            if #vehicles == 0 then
                table.insert(elements, {
                    label = Strings["no_impounded"], value = false
                })
            else
                for k, v in pairs(vehicles) do
                    table.insert(elements, {
                        label = string.format(Strings["retrieve_impound"], v.plate, Config.ImpoundPrice), value = v.plate
                    })
                end
            end

            ESX.UI.Menu.Open("default", GetCurrentResourceName(), "select_vehicle_retrieve", {
                title = Strings["impound"],
                align = "bottom-right",
                elements = elements
            }, function(data, menu)
                local plate = data.current.value

                if plate then
                    if not Cache.TakenVehicles then Cache.TakenVehicles = {} end
                    if Cache.TakenVehicles[plate] and DoesEntityExist(Cache.TakenVehicles[plate].veh) and not Config.AllowMultiple then
                        ESX.ShowNotification(Strings["already_out"])
                    else
                        TriggerServerEvent("loaf_garage:retrieveCar", plate, coords, heading)
                        viewing = false
                        menu.close()
						ESX.UI.Menu.CloseAll()
                    end
                end

            end, function(data, menu)
                viewing = false
                menu.close()
            end)
        end, vehtype)

        while viewing do
            Wait(250)
        end
    end

    StoreVehicle = function(garage)
        local vehicle = GetVehiclePedIsUsing(PlayerPedId())
        if DoesEntityExist(vehicle) and garage then
            local vehprops = ESX.Game.GetVehicleProperties(vehicle)
            local damages = {}
            if Config.Damages then
                damages = GetDamages(vehicle)
            end
            Cache[vehprops.plate] = vehicle
            TriggerServerEvent("loaf_garage:storeVehicle", garage, damages, vehprops)
        end
    end

    local vehicle = GetVehiclePedIsUsing(PlayerPedId())
    if DoesEntityExist(vehicle) then
        GetDamages(vehicle)
    end

    CreateThread(function()
        while true do
            Wait(2500)

            while Cache.NearbyGarage or Cache.NearbyImpound do
                Wait(0)

                if Cache.NearbyGarage then
                    for k, v in pairs(Cache.NearbyGarages) do
                        local vehicle = GetVehiclePedIsUsing(PlayerPedId())
                        if v.location then
                            if DoesEntityExist(vehicle) then
                                if Marker(v.location.xyz + vec3(0.0, 0.0, 0.8), Strings["store_vehicle"], 51, 3.0) then
                                    StoreVehicle(k)
                                end
                            end
                        else
                            if DoesEntityExist(vehicle) then
                                if Marker(v.spawn.xyz + vec3(0.0, 0.0, 0.8), Strings["store_vehicle"], 51, 3.0) then
                                    StoreVehicle(k)
                                end
                            elseif Marker(v.browse.xyz + vec3(0.0, 0.0, 0.8), Strings["enter_garage"]) then
                                if not ViewVehicles(k, v.spawn.xyz, v.spawn.w) then
                                    SetEntityCoords(PlayerPedId(), v.browse.xyz)
                                end
                            end
                        end
                    end
                end

               --[[
			   if Cache.NearbyImpound then
                    for k, v in pairs(Cache.NearbyImpounds) do
                        if not IsPedInAnyVehicle(PlayerPedId()) and Marker(v.Retrieve + vec3(0.0, 0.0, 0.8), Strings["enter_impound"]) then
                            ViewImpound(v.vehicletype or Config.DefaultType, v.Spawn.xyz, v.Spawn.w)
                        end
                    end
                end
				]]--
            end
        end
    end)

    RegisterNetEvent("loaf_garage:deleteStoredVehicle")
    AddEventHandler("loaf_garage:deleteStoredVehicle", function(plate)
        local vehicle = Cache[plate]
        if not Cache.TakenVehicles then Cache.TakenVehicles = {} end
        Cache.TakenVehicles[plate] = false
        if DoesEntityExist(vehicle) then
            while DoesEntityExist(vehicle) do
                Wait(250)
                SetEntityAsMissionEntity(vehicle, true, true)
                DeleteVehicle(vehicle)
            end
        end
    end)

    CreateThread(function()
        while true do
            Cache.NearbyGarages = {}
            Cache.NearbyImpounds = {}
            Cache.NearbyGarage = false
            Cache.NearbyImpound = false

            for k, v in pairs(Config.Garages) do
                if v.location then
                    if #(GetEntityCoords(PlayerPedId()) - v.location.xyz) <= 50.0 then
                        Cache.NearbyGarages[k] = v
                        Cache.NearbyGarage = true
                    end
                else
                    if #(GetEntityCoords(PlayerPedId()) - v.browse.xyz) <= 50.0 then
                        Cache.NearbyGarages[k] = v
                        Cache.NearbyGarage = true
                    end
                end
            end

            for k, v in pairs(Config.Impounds) do
                if #(GetEntityCoords(PlayerPedId()) - v.Retrieve) <= 50.0 then
                    Cache.NearbyImpounds[k] = v
                    Cache.NearbyImpound = true
                end
            end

            Wait(1500)
        end
    end)

    RegisterNetEvent("loaf_garage:spawnImpoundedCar")
    AddEventHandler("loaf_garage:spawnImpoundedCar", function(coords, heading, data)
        local info = json.decode(data.vehicle)
        local model = LoadModel(info.model)
        if model.loaded then
            model = model.model
            local vehicle = CreateVehicle(model, coords, heading, true, true)
            ESX.Game.SetVehicleProperties(vehicle, info)
            if not Cache.TakenVehicles then Cache.TakenVehicles = {} end
            Cache.TakenVehicles[info.plate] = {veh = vehicle}

            if Config.Damages then
               -- SetDamages(vehicle, json.decode(data.damages))
            end

            SetEntityAsMissionEntity(vehicle, true, false)
            SetVehicleHasBeenOwnedByPlayer(vehicle, true)
            SetVehicleNeedsToBeHotwired(vehicle, false)
            SetModelAsNoLongerNeeded(model)

            while not HasCollisionLoadedAroundEntity(vehicle) do
                RequestCollisionAtCoord(coords)
                Wait(0)
            end

            SetVehicleOnGroundProperly(vehicle)

            SetVehRadioStation(vehicle, 'OFF')
            TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
        end
    end)

    RegisterNetEvent("loaf_garage:viewVehicles")
    AddEventHandler("loaf_garage:viewVehicles", function(garage, coords, heading, cb, tpback)
        ViewVehicles(garage, coords, heading, tpback)
        cb()
    end)

    RegisterNetEvent("loaf_garage:store")
    AddEventHandler("loaf_garage:store", function(garage)
        if garage then
            StoreVehicle(garage)
        end
    end)
end)

function autoheilen()

    local ped = GetPlayerPed(-1)
    local car = GetVehiclePedIsUsing(ped)
	
		SetVehicleFixed(car)
		SetVehicleDirtLevel(car, 0.0)

end


local scootergenommen = false
RegisterNetEvent('loaf_garage:scoot')
AddEventHandler('loaf_garage:scoot', function()

	if not scootergenommen then
	ESX.TriggerServerCallback('grrasdda:welchdonohastdu', function (okay)
		if okay then
			local ModelHash = `serv_electricscooter` -- Use Compile-time hashes to get the hash of this model
			if not IsModelInCdimage(ModelHash) then return end
			RequestModel(ModelHash) 
			while not HasModelLoaded(ModelHash) do -- Waits for the model to load with a check so it does not get stuck in an infinite loop
			  Citizen.Wait(10)
			end
			exports['mythic_notify']:DoHudText('inform', 'Unterstützer-Scooter ausgeparkt', { ['background-color'] = '#ffffff', ['color'] = '#000000' })

			local MyPed = PlayerPedId()
			local Vehicle = CreateVehicle(ModelHash, GetEntityCoords(MyPed), GetEntityHeading(MyPed), true, false) -- Spawns a networked vehicle on your current coords
			SetModelAsNoLongerNeeded(ModelHash)
			TaskWarpPedIntoVehicle(PlayerPedId(), Vehicle, -1)
			scootergenommen = true
		else
		exports['mythic_notify']:DoHudText('error', 'Du musst Unterstützer sein!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
		Citizen.Wait(2000)
		exports['mythic_notify']:DoHudText('error', 'Infos dazu findest du im Discord! oder auf www.shop.grp.gg', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
		
		

		end
	end)
	else
	exports['mythic_notify']:DoHudText('error', 'Du kannst nur alle 2 Stunden einen Scooter ausparken!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
		
	end
	
	Citizen.CreateThread(function()
		while scootergenommen do
			Citizen.Wait(7200000)

			scootergenommen = false

		end	
	end)
	
end)

RegisterNetEvent('loaf_garage:openbped')
AddEventHandler('loaf_garage:openbped', function()
for k, v in pairs(Cache.NearbyGarages) do
ViewVehicles(k, v.location.xyz, v.location.w)
end
end)

RegisterNetEvent('loaf_garage:abschlepphofped')
AddEventHandler('loaf_garage:abschlepphofped', function()
for k, v in pairs(Cache.NearbyImpounds) do
ViewImpound(v.vehicletype or Config.DefaultType, v.Spawn.xyz, v.Spawn.w)
end
end)

Citizen.CreateThread(function()
    local eitemgaraggg = {
        -1405574011,
        -78626473,
    }
    exports['bt-target']:AddTargetModel(eitemgaraggg, {
        options = {
            {
                event = "loaf_garage:openbped",
                icon = "fas fa-car",
                label = "Garage öffnen",
            },
			{
                event = "loaf_garage:abschlepphofped",
                icon = "fas fa-trailer",
                label = "Abschlepphof öffnen",
            },
			{
                event = "loaf_garage:scoot",
                icon = "fas fa-filter",
                label = "[VIP] Scooter ausparken",
            },
        },
        job = {"all"},
        distance = 2.5
    })
end)



	


