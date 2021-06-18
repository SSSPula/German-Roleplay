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
	--TriggerServerEvent('grp_PolizeiJob:forceBlip')
end)


CreateThread(function()
    while not Loaded do
        Wait(250)
    end

   -- AddBlip(MainCraft.Location, 326, 14, Strings["blip"])

    CreateThread(function()
        while true do
            Wait(500)
            
            -- main crafting
            while #(GetEntityCoords(PlayerPedId()) - MainCraft.Location) <= 2.0 do
                Wait(0)
                HelpText(Strings["press_craft"], true)
                if IsDisabledControlJustReleased(0, 51) then
                    ESX.UI.Menu.CloseAll()

                    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "select_category", {
                        title = Strings["select_category"],
                        align = "bottom-left",
                        elements = MainCraft.Categories
                    }, function(data, menu)

                        local category = data.current.label
                        local elements = {}
                        for k, v in pairs(MainCraft.Vehicles) do
                            v.id = k
                            if v.category == category then
                                table.insert(elements, {label = v.label, data = v})
                            end
                        end

                        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "select_vehicle", {
                            title = Strings["select_vehicle"],
                            align = "bottom-left",
                            elements = elements
                        }, function(data2, menu2)
                            local data = data2.current.data
                            
                            local elements = {
                                {label = string.format(Strings["craft"], data.label), value = "craft"},
                                {label = string.format(Strings["money"], data.price)}
                            }
                            local items = {}
                            for k, v in pairs(ESX.GetPlayerData().inventory) do
                                items[v.name] = v
                            end

                            for k, v in pairs(data.requirements) do
                                if not items[v.item] then items[v.item] = {} end
                                local itemdata = {
                                    amount = v.amount,
                                    label = items[v.item].label or v.item,
                                    has = items[v.item].count or 0
                                }

                                table.insert(elements, {
                                    label = string.format(Strings["required"], itemdata.amount, itemdata.label, itemdata.has)
                                })
                            end
                            ESX.UI.Menu.Open("default", GetCurrentResourceName(), "requirements", {
                                title = string.format(Strings["requirements"], data.label),
                                align = "bottom-left",
                                elements = elements
                            }, function(data3, menu3)
                                if data3.current.value == "craft" then
                                    ESX.UI.Menu.CloseAll()

                                    ESX.Game.SpawnVehicle(data.name, GetEntityCoords(PlayerPedId()) - vector3(0.0, 0.0, 25.0), 0.0, function(vehicle)
                                        if DoesEntityExist(vehicle) then
                                            FreezeEntityPosition(vehicle, true)
                                            local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
                                            vehicleProps.model = GetHashKey(data.name)

                                            ESX.TriggerServerCallback("loaf_craftvehicle:craft", function(success)
                                                if not success then
                                                    DeleteEntity(vehicle)
                                                else
                                                    vehicleProps.plate = success
                                                    SetVehicleNumberPlateText(vehicle, success)
													--hier
													
													
													local _initialText = { --first slide. Consists of 3 text lines.
														missionTextLabel = "~y~Fahrzeugproduktion~s~", 
														passFailTextLabel = "ERFOLGREICH.",
														messageLabel = "Du hast ein Auto gebaut.",
													}
													local _table = { --second slide. You can add as many "stats" as you want. They will appear from botton to top, so keep that in mind.
														{stat = "Du hast gebaut: ", value = data.label},
														--{stat = "value3", value = "~g~$~s~50000"},
														--{stat = "value2", value = "~b~1999~s~"},
														--{stat = "value1", value = "TEST"},
													}
													local _money = { --third slide. Incremental money. It will start from startMoney and increment to finishMoney. top and bottom text appear above/below the money string.
														startMoney = 0,
														finishMoney = 1,
														topText = "",
														bottomText = "",
														rightHandStat = "Jippi !",
														rightHandStatIcon = 0, --0 or 1 = checked, 2 = X, 3 = no icon
													}
													local _xp = { --fourth and final slide. XP Bar slide. Will start with currentRank and a xp bar filled with (xpBeforeGain - minLevelXP) and will add xpGained. If you rank up, it goes to "Level Up" slide.
														xpGained = 500,
														xpBeforeGain = 1400,
														minLevelXP = 600,
														maxLevelXP = 2360,
														currentRank = 2,
														nextRank = 3,
														rankTextSmall = "LEVEL UP.",
														rankTextBig = "~b~Sehr gut !.~s~",
													}
													TriggerEvent("cS.HeistFinale", _initialText, _table, _money, _xp, 10, true)
													
													
													--
                                                    SetEntityCoords(vehicle, MainCraft.VehicleSpawn.xyz)
                                                    SetEntityHeading(vehicle, MainCraft.VehicleSpawn.w)
                                                    FreezeEntityPosition(vehicle, false)
                                                    Wait(250)
                                                    SetVehicleOnGroundProperly(vehicle)
                                                    SetVehicleFixed(vehicle)

                                                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                                                    ESX.Game.DeleteVehicle(vehicle)
                                                    exports['mythic_notify']:DoHudText('inform', 'Dein Fahrzeug wurde in deine Garage geliefert.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })

                                                end
                                            end, data.id, vehicleProps) 
                                        end
                                    end)

                                end
                            end, function(data3, menu3)
                                menu3.close()
                            end)

                        end, function(data2, menu2)
                            menu2.close()
                        end)

                    end, function(data, menu)
                        menu.close()
                    end)
                end
            end
            ---------------------------------
                        -- CARDEALER Crafting
                        while #(GetEntityCoords(PlayerPedId()) - cardealer.Location) <= 2.0 do
                            Wait(0)
                            if IsDisabledControlJustReleased(0, 51) and PlayerData.job.name == 'cardealer' then
                                HelpText(Strings["press_craft"], true)

                                ESX.UI.Menu.CloseAll()
            
                                ESX.UI.Menu.Open("default", GetCurrentResourceName(), "select_category", {
                                    title = Strings["select_category"],
                                    align = "bottom-left",
                                    elements = cardealer.Categories
                                }, function(data, menu)
            
                                    local category = data.current.label
                                    local elements = {}
                                    for k, v in pairs(cardealer.Vehicles) do
                                        v.id = k
                                        if v.category == category then
                                            table.insert(elements, {label = v.label, data = v})
                                        end
                                    end
            
                                    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "select_vehicle", {
                                        title = Strings["select_vehicle"],
                                        align = "bottom-left",
                                        elements = elements
                                    }, function(data2, menu2)
                                        local data = data2.current.data
                                        
                                        local elements = {
                                            {label = string.format(Strings["craft"], data.label), value = "craft"},
                                            {label = string.format(Strings["money"], data.price)}
                                        }
                                        local items = {}
                                        for k, v in pairs(ESX.GetPlayerData().inventory) do
                                            items[v.name] = v
                                        end
            
                                        for k, v in pairs(data.requirements) do
                                            if not items[v.item] then items[v.item] = {} end
                                            local itemdata = {
                                                amount = v.amount,
                                                label = items[v.item].label or v.item,
                                                has = items[v.item].count or 0
                                            }
            
                                            table.insert(elements, {
                                                label = string.format(Strings["required"], itemdata.amount, itemdata.label, itemdata.has)
                                            })
                                        end
                                        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "requirements", {
                                            title = string.format(Strings["requirements"], data.label),
                                            align = "bottom-left",
                                            elements = elements
                                        }, function(data3, menu3)
                                            if data3.current.value == "craft" then
                                                ESX.UI.Menu.CloseAll()
            
                                                ESX.Game.SpawnVehicle(data.name, GetEntityCoords(PlayerPedId()) - vector3(0.0, 0.0, 25.0), 0.0, function(vehicle)
                                                    if DoesEntityExist(vehicle) then
                                                        FreezeEntityPosition(vehicle, true)
                                                        local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
                                                        vehicleProps.model = GetHashKey(data.name)
            
                                                        ESX.TriggerServerCallback("loaf_craftvehicle3:craft", function(success)
                                                            if not success then
                                                                DeleteEntity(vehicle)
                                                            else
                                                                vehicleProps.plate = success
                                                                SetVehicleNumberPlateText(vehicle, success)
            
                                                                SetEntityCoords(vehicle, cardealer.VehicleSpawn.xyz)
                                                                SetEntityHeading(vehicle, cardealer.VehicleSpawn.w)
                                                                FreezeEntityPosition(vehicle, false)
                                                                Wait(250)
                                                                SetVehicleOnGroundProperly(vehicle)
                                                                SetVehicleFixed(vehicle)
            
                                                                TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                                                                ESX.Game.DeleteVehicle(vehicle)
                                                                exports['mythic_notify']:DoHudText('inform', 'Dein Fahrzeug wurde in deine Garage geliefert.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
            
                                                            end
                                                        end, data.id, vehicleProps) 
                                                    end
                                                end)
            
                                            end
                                        end, function(data3, menu3)
                                            menu3.close()
                                        end)
            
                                    end, function(data2, menu2)
                                        menu2.close()
                                    end)
            
                                end, function(data, menu)
                                    menu.close()
                                end)
                            end
                        end
            ---------------------------------
             -- boat crafting
             while #(GetEntityCoords(PlayerPedId()) - boat.Location) <= 2.0 do
                Wait(0)
                HelpText("Drücke ~INPUT_CONTEXT~ um die ~b~Bootsproduktion~w~ zu öffnen.   ~p~Jetskis~w~ und ~p~Boote~w~ warten!", true)
                if IsDisabledControlJustReleased(0, 51) then
                    ESX.UI.Menu.CloseAll()

                    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "select_category", {
                        title = Strings["select_category"],
                        align = "bottom-left",
                        elements = boat.Categories
                    }, function(data, menu)

                        local category = data.current.label
                        local elements = {}
                        for k, v in pairs(boat.Vehicles) do
                            v.id = k
                            if v.category == category then
                                table.insert(elements, {label = v.label, data = v})
                            end
                        end

                        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "select_vehicle", {
                            title = Strings["select_vehicle"],
                            align = "bottom-left",
                            elements = elements
                        }, function(data2, menu2)
                            local data = data2.current.data
                            
                            local elements = {
                                {label = string.format(Strings["craft"], data.label), value = "craft"},
                                {label = string.format(Strings["money"], data.price)}
                            }
                            local items = {}
                            for k, v in pairs(ESX.GetPlayerData().inventory) do
                                items[v.name] = v
                            end

                            for k, v in pairs(data.requirements) do
                                if not items[v.item] then items[v.item] = {} end
                                local itemdata = {
                                    amount = v.amount,
                                    label = items[v.item].label or v.item,
                                    has = items[v.item].count or 0
                                }

                                table.insert(elements, {
                                    label = string.format(Strings["required"], itemdata.amount, itemdata.label, itemdata.has)
                                })
                            end
                            ESX.UI.Menu.Open("default", GetCurrentResourceName(), "requirements", {
                                title = string.format(Strings["requirements"], data.label),
                                align = "bottom-left",
                                elements = elements
                            }, function(data3, menu3)
                                if data3.current.value == "craft" then
                                    ESX.UI.Menu.CloseAll()

                                    ESX.Game.SpawnVehicle(data.name, GetEntityCoords(PlayerPedId()) - vector3(0.0, 0.0, 25.0), 0.0, function(vehicle)
                                        if DoesEntityExist(vehicle) then
                                            FreezeEntityPosition(vehicle, true)
                                            local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
                                            vehicleProps.model = GetHashKey(data.name)

                                            ESX.TriggerServerCallback("loaf_craftvehicle:craft2", function(success)
                                                if not success then
                                                    DeleteEntity(vehicle)
                                                else
                                                    vehicleProps.plate = success
                                                    SetVehicleNumberPlateText(vehicle, success)

                                                    SetEntityCoords(vehicle, boat.VehicleSpawn.xyz)
                                                    SetEntityHeading(vehicle, boat.VehicleSpawn.w)
                                                    FreezeEntityPosition(vehicle, false)
                                                    Wait(250)
                                                    SetVehicleOnGroundProperly(vehicle)
                                                    SetVehicleFixed(vehicle)

                                                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                                                    ESX.Game.DeleteVehicle(vehicle)
                                                    exports['mythic_notify']:DoHudText('inform', 'Dein Fahrzeug wurde in deine Garage geliefert.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })

                                                end
                                            end, data.id, vehicleProps) 
                                        end
                                    end)

                                end
                            end, function(data3, menu3)
                                menu3.close()
                            end)

                        end, function(data2, menu2)
                            menu2.close()
                        end)

                    end, function(data, menu)
                        menu.close()
                    end)
                end
            end

            if ESX.UI.Menu.IsOpen("default", GetCurrentResourceName(), "select_category") then
                ESX.UI.Menu.CloseAll()
            end
        end
    end)
end)


--Zum auto craften das geht direkt in die garage rein das auto 
RegisterNetEvent('esx_craftvehicle:spawnVehicle')
AddEventHandler('esx_craftvehicle:spawnVehicle', function (model)
    ESX.Game.SpawnVehicle(model, Config.VehicleSpawn.position, Config.VehicleSpawn.heading, function (vehicle)
        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)

        local newPlate     = GeneratePlate()
        local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
        vehicleProps.plate = newPlate
        SetVehicleNumberPlateText(vehicle, newPlate)

	  --  TriggerServerEvent('grp_AutoHaus2:setVehicleOwn333ed', vehicleProps)
	  
	  TriggerServerEvent('esx_craftvehicle:save', newPlate, model) 
	  --HIERMIT WIRD DAS AUTO IN DIE GARAGE GEPACKT 
	  -- INFO VOM DEV: DAS MÜSSEN WIR ÄNDERN SONNST KÖNNEN MODDER DAS NUTZEN UM SICH AUTOS ZU GEBEN NEEDS FIX ASAP!(so wie rocky) lol
    end)
end)





RegisterNetEvent("esx_craftvehicle2:OpenByServer") -- For opening the craftvehicle2 menu from another resource.
AddEventHandler("esx_craftvehicle2:OpenByServer", function()

    for k, v in pairs(MainCraft.Vehicles) do
        if v.category == "QUESTLINE" then
            local data = v
            ESX.Game.SpawnVehicle(data.name, GetEntityCoords(PlayerPedId()) - vector3(0.0, 0.0, 25.0), 0.0, function(vehicle)
                if DoesEntityExist(vehicle) then
                    FreezeEntityPosition(vehicle, true)
                    local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
                    vehicleProps.model = GetHashKey(data.name)
    
                    ESX.TriggerServerCallback("loaf_craftvehicle:craft", function(success)
                        if not success then
                            DeleteEntity(vehicle)
                        else
                            vehicleProps.plate = success
                            SetVehicleNumberPlateText(vehicle, success)
    
                            SetEntityCoords(vehicle, QuestCraft.VehicleSpawn.xyz)
                            SetEntityHeading(vehicle, QuestCraft.VehicleSpawn.w)
                            FreezeEntityPosition(vehicle, false)
                            Wait(250)
                            SetVehicleOnGroundProperly(vehicle)
                            SetVehicleFixed(vehicle)
    
                            TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                        end
                    end, k, vehicleProps) 
                end
            end)

            break
        end
    end
end)