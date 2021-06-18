ESX = nil

Cache = {}

CreateThread(function()
    Wait(10000) -- wait for server to load esx
    while not NetworkIsSessionStarted() do -- wait for the client to load the game
        Wait(250)
    end
    
    while ESX == nil do
        TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(esx) -- get esx object
            ESX = esx 
        end)
        Wait(50)
    end
    
    while ESX.GetPlayerData().job == nil do -- wait until the character has a job (kashacters support)
        Wait(50)
    end

    -- load config SAFELY
    Config = nil
    Strings = nil
    RegisterNetEvent("loaf_markerfarm:set_config")
    AddEventHandler("loaf_markerfarm:set_config", function(cfg, str)
        Config = cfg
        Strings = str
    end)
    TriggerServerEvent("loaf_markerfarm:request_config")
    while not Config do
        Wait(50)
    end
    -- end of load config

    Cache.loaded = true

    Cache.checkpoints = {}
    Cache.sellers = {}

    for k, v in pairs(Config.Collectors) do
        -- lower each marker by 0.1 units
        v.position = v.position - vector3(0.0, 0.0, 0.1)
        if not v.marker then 
            v.marker = Config.DefaultMarker 
        end

        -- if blips are enabled, add a blip on the map
        if Config.Blips and not v.noblip then
            local blip = AddBlipForCoord(v.position)
    
            SetBlipSprite(blip, 103)
            SetBlipScale(blip, 0.9)
            SetBlipAsShortRange(blip, true)
    
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(v.label)
            EndTextCommandSetBlipName(blip)
        end
    end

    for k, v in pairs(Config.Sellers) do
        -- lower each marker by 0.1 units
        v.position = v.position - vector3(0.0, 0.0, 0.1)
        if not v.marker then 
            v.marker = Config.DefaultMarker 
        end

        -- if blips are enabled, add a blip on the map
        if Config.Blips and not v.noblip then
            local blip = AddBlipForCoord(v.position)
    
            SetBlipSprite(blip, 103)
            SetBlipScale(blip, 0.9)
            SetBlipAsShortRange(blip, true)
    
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(v.label)
            EndTextCommandSetBlipName(blip)
        end
    end

    -- this thread handles drawing all the markes
    CreateThread(function()
        while true do
            for k, v in pairs(Config.Collectors) do
                local id = tostring(k)
                if #(GetEntityCoords(PlayerPedId()) - v.position) <= 250.0 then
                    if not Cache.checkpoints[id] then
                        if v.marker.visible then
                            local checkPoint = CreateCheckpoint(45, v.position, v.position, v.marker.radius, v.marker.color.r, v.marker.color.g, v.marker.color.b, 255, 0)
                            SetCheckpointCylinderHeight(checkPoint, v.marker.height, v.marker.height, v.marker.radius)
                        end
                        Cache.checkpoints[id] = checkPoint or true
                    end
                else
                    Cache.checkpoints[id] = nil
                end
    
                Wait(50)
            end

            for k, v in pairs(Config.Sellers) do
                local id = tostring(k)
                if #(GetEntityCoords(PlayerPedId()) - v.position) <= 250.0 then
                    if not Cache.sellers[id] then
                        if v.marker.visible then
                            local checkPoint = CreateCheckpoint(45, v.position, v.position, v.marker.radius, v.marker.color.r, v.marker.color.g, v.marker.color.b, 255, 0)
                            SetCheckpointCylinderHeight(checkPoint, v.marker.height, v.marker.height, v.marker.radius)
                        end
                        Cache.sellers[id] = checkPoint or true
                    end
                else
                    Cache.sellers[id] = nil
                end
    
                Wait(50)
            end
    
            Wait(5000)
        end
    end)

    -- this thread handles the stuff with farming
    CreateThread(function()
        while true do
            for k, v in pairs(Cache.checkpoints) do
                if v then
                    local data = Config.Collectors[tonumber(k)]

                    while #(data.position - GetEntityCoords(PlayerPedId())) <= data.marker.radius do
                        Wait(0)
                        HelpText(string.format(Strings["farm"], data.label), true)
                        local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 3.0, 0, 70)
						if IsControlJustReleased(0, 51) then
                            if DoesEntityExist(vehicle) then
							exports['mythic_notify']:DoHudText('error', 'Du bist zu nah an einem Fahrzeug!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
							else
                            ESX.ShowNotification(string.format(Strings["farming"], data.label))
                            local timer = GetGameTimer() + data.time - 100
                            while true do
                                Wait(100)
                                --Dewens Edit um Fahrzeugfarming zu unterbinden | es war sehr einfach.
                               
							   --kein im kofferraum faremmn
							   if IsPedInAnyVehicle(PlayerPedId(), false) then
                                    ESX.ShowNotification("Du kannst in einem Fahrzeug nicht sammeln / verarbeiten! Steige aus um zu beginnen!")
                                    break
                                end
                                if #(data.position - GetEntityCoords(PlayerPedId())) <= data.marker.radius * 1.05 and timer <= GetGameTimer() then                                    
                                    if not data.challenge or PressRandomKey() then
                                        TriggerServerEvent("loaf_markerfarm:retreive", tonumber(k))
                                    else
                                        ESX.ShowNotification(Strings["didnt_press"])
                                        ESX.ShowNotification(Strings["stopped_farming"]:format(data.label))
                                        break
                                    end
                                    timer = timer + data.time - 100
                                elseif #(data.position - GetEntityCoords(PlayerPedId())) > data.marker.radius * 1.05 then
                                    ESX.ShowNotification(string.format(Strings["stopped_farming"], data.label))
                                    break
                                end
                            end
                            end
                        end
                    end
                end
            end

            for k, v in pairs(Cache.sellers) do
                if v then
                    local data = Config.Sellers[tonumber(k)]
                    if data then
                        while #(data.position - GetEntityCoords(PlayerPedId())) <= data.marker.radius do
                            Wait(0)
                            HelpText(string.format(Strings["sell"], data.label), true)
                            if IsControlJustReleased(0, 51) then
                                TriggerServerEvent("loaf_markerfarm:sell", tonumber(k))
                            end
                        end
                    end
                end
            end

            Wait(500)
        end
    end)
end)

HelpText = function(text, sound)
    AddTextEntry(GetCurrentResourceName(), text)
    BeginTextCommandDisplayHelp(GetCurrentResourceName())
    EndTextCommandDisplayHelp(0, 0, (sound == true), -1)
end

PressRandomKey = function()
    collectgarbage() -- ram leak fix
    local keys = Config.keys
    local randomKey = math.random(1, #keys)

    local time = math.random(100, 125) * 25
    local timer = GetGameTimer() + time
    while timer >= GetGameTimer() or (timer - GetGameTimer() > 0) do
        AddTextEntry("randomKey", Strings["press"]:format(keys[randomKey][1]))
        BeginTextCommandDisplayHelp("randomKey")
        EndTextCommandDisplayHelp(1, 0, 0, 0)
        SetFloatingHelpTextScreenPosition(0, 0.405, 0.55)

        DrawPercent(((timer - GetGameTimer()) / time) * 100, 0.5, 0.6)

        DisableAllControlActions(0)
        DisableAllControlActions(1)
        DisableAllControlActions(2)

        for k, v in pairs(keys) do
            if k ~= randomKey then
                if IsDisabledControlJustReleased(0, v[2]) then
                    return false
                end
            end
        end

        if IsDisabledControlJustReleased(0, keys[randomKey][2]) then
            return true
        end

        Wait(0)
    end

    return false
end

DrawPercent = function(percent, x, y)
    if percent > 0 and percent <= 100 then
        DrawRect(x, y, 0.203, 0.02, 0, 0, 0, 255)
        DrawRect(x, y, 0.2, 0.015, 255, 35, 40, 255)
        DrawRect(x, y, (percent*2)/1000, 0.015, 35, 255, 40, 255) -- https://gyazo.com/b5585d3baa709374c7f4752040461599
        -- DrawRect(x - (100 - percent) / 1000, y, (percent*2)/1000, 0.015, 35, 255, 40, 255) -- https://gyazo.com/fe695dfc06f23ca362cc7c0b244a8184
        -- DrawRect(x + (100 - percent) / 1000, y, (percent*2)/1000, 0.015, 35, 255, 40, 255) -- https://gyazo.com/0d8d884b8f98893550daedff4873202c
    end
end