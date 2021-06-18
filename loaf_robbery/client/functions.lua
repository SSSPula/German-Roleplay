ESX = nil
Cache = {AlertBlips = {}}

CreateThread(function()
    while not ESX do
        Wait(500)
        TriggerEvent("esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect", function(esx)
            ESX = esx
        end)
    end

    while not ESX.GetPlayerData() or not ESX.GetPlayerData().job or not ESX.GetPlayerData().job.name do
        Wait(500)
    end

    Cache.hasjob = false
    for _, job in pairs(Config.CopJobs) do
        if ESX.GetPlayerData().job.name == job then
            Cache.hasjob = true
        end
    end

    if Config.Blips.Enabled then
        for _, data in pairs(Config.Stores) do
            AddBlip(data.Spawn.xyz, Config.Blips.Sprite, Config.Blips.Colour, Config.Blips.Label, Config.Blips.Scale)
        end
    end

    Cache.loaded = true
    local collect = 0
    while true do
        Cache.self = PlayerPedId()
        Cache.coords = GetEntityCoords(Cache.self)

        if collect <= GetGameTimer() then
            collectgarbage()
            collect = GetGameTimer() + 15000
        end
        Wait(500)
    end
end)

-- add blip
AddBlip = function(coords, sprite, colour, label, scale, category)
    local blip = AddBlipForCoord(coords)
    if category then
        SetBlipCategory(blip, category)
    end
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, colour)
    SetBlipScale(blip, scale or 1.0)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(label)
    EndTextCommandSetBlipName(blip)

    return blip
end

-- events
AddEvent = function(eventname, handler)
    RegisterNetEvent(eventname)
    AddEventHandler(eventname, handler)
end

AddEvent("esx:setJob", function(jobdata)
    Cache.hasjob = false
    for _, job in pairs(Config.CopJobs) do
        if jobdata.name == job then
            Cache.hasjob = true
        end
    end
end)

-- load models etc
LoadDict = function(Dict)
    while not HasAnimDictLoaded(Dict) do 
        Wait(0)
        RequestAnimDict(Dict)
    end

    return Dict
end

LoadModel = function(model)
    if type(model) == "string" then 
        model = GetHashKey(model) 
    elseif type(model) ~= "number" then
        return {loaded = false, model = model} 
    end

    local timer = GetGameTimer() + 20000 -- 20 seconds to load
    if not HasModelLoaded(model) and IsModelInCdimage(model) then
        RequestModel(model)
        while not HasModelLoaded(model) and timer >= GetGameTimer() do -- give it time to load
            Wait(50)
        end
    end

    if HasModelLoaded(model) then
        return {loaded = true, model = model}
    else
        return {loaded = false, model = model}
    end
end

TakeControl = function(ent)
    if DoesEntityExist(ent) then
        local timer = GetGameTimer() + 7500
        while not NetworkHasControlOfEntity(ent) do
            Wait(50)
            NetworkRequestControlOfEntity(ent)
            if timer < GetGameTimer() or not DoesEntityExist(ent) then 
                return false 
            end
        end
        return true
    end
    return false
end

-- handle peds
AddEvent("loaf_robbery:request_spawn", function(store)
    local storeData = Config.Stores[store]
    local hashud = 108
    local model = LoadModel(storeData.Ped)
    if model.loaded then
        local ped = CreatePed(4, model.model, storeData.Spawn, true, true)
        FreezeEntityPosition(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        TaskSetBlockingOfNonTemporaryEvents(ped, true)

        SetEntityCoordsNoOffset(ped, storeData.Spawn.xyz)
        SetEntityHeading(ped, storeData.Spawn.w)
        SetEntityHealth(ped, hashud)
        TriggerServerEvent("loaf_robbery:set_ped", store, PedToNet(ped))
    end
end)

AddEvent("loaf_robbery:delete_ped", function(net)
    local ped = GetPed(net)
    local timer = GetGameTimer() + 5000
    while DoesEntityExist(ped) and timer > GetGameTimer() do
        if TakeControl(ped) then
            DeleteEntity(ped)
        end
        Wait(0)
    end
end)

-- hande safes
AddEvent("loaf_robbery:delete_object", function(net)
    local timer = GetGameTimer() + 5000
    if NetworkDoesNetworkIdExist(net) then
        local ent = NetToObj(net)
        while DoesEntityExist(ent) and timer > GetGameTimer() do
            if TakeControl(ent) then
                DeleteEntity(ent)
            end
            Wait(0)
        end
    end
end)

AddEvent("loaf_robbery:spawn_safe", function(store)
    local storeData = Config.Stores[store]
    local model = LoadModel("p_v_43_safe_s")
    if model.loaded and storeData.Safe then
        local safe = CreateObject(LoadModel("p_v_43_safe_s").model, storeData.Safe.position.xyz, true, false)
        SetEntityHeading(safe, storeData.Safe.position.w)
        FreezeEntityPosition(safe, true)

        TriggerServerEvent("loaf_robbery:set_safe", store, ObjToNet(safe))
    end
end)

-- police blips 
AddEvent("loaf_robbery:alert_police", function(store, robber)
    local blip = AddBlip(Config.Stores[store].Spawn.xyz, 161, 3, Strings["robbery"], 2.0)
    PulseBlip(blip)
    while not ESX do Wait(0) end
    if Config.CCTVImage then
        local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(GetPlayerFromServerId(robber)))
        if mugshot and mugshotStr then
            ESX.ShowAdvancedNotification(Config.Stores[store].Name, Strings["robbery"], Strings["robbery_notification"], mugshotStr, 4)
            UnregisterPedheadshot(mugshot)
        else
            ESX.ShowNotification(Strings["robbery_notification"])
        end
    else
        ESX.ShowNotification(Strings["robbery_notification"])
    end
    Wait(60*1000)
    RemoveBlip(blip)
end)

-- other
GetStoreData = function(store, data)
    return GlobalState[GetCurrentResourceName() .. store .. data]
end

GetClerk = function(store)
    return GetPed(GetStoreData(store, "ped"))
end

GetPed = function(net)
    if NetworkDoesNetworkIdExist(net) then
        local ped = NetToPed(net)
        if ped and DoesEntityExist(ped) then
            return ped
        end
    end
    return false
end

HelpText = function(text, sound)
    AddTextEntry(GetCurrentResourceName(), text)
    BeginTextCommandDisplayHelp(GetCurrentResourceName())
    EndTextCommandDisplayHelp(0, 0, (sound == true), -1)
end