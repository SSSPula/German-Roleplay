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

    RegisterNetEvent("esx:setJob")
    AddEventHandler("esx:setJob", function(jobdata)
        Cache.hasjob = false
        for _, job in pairs(Config.CopJobs) do
            if jobdata.name == job then
                Cache.hasjob = true
            end
        end
    end)

    Cache.loaded = true
    --[[
    for k, v in pairs(Config.Banks) do
        if v.Blip then
            AddBlip(v.Blip, Config.Blips.Sprite, Config.Blips.Colour, k, Config.Blips.Scale)
        end
    end
    ]]
    Cache.radar = not IsRadarHidden()

    ESX.TriggerServerCallback("loaf_heist:get_blips", function(blips)
        for k, v in pairs(blips) do
            if not Cache.AlertBlips[v.bank] then
                local blip = AddBlip(Config.Banks[v.bank].Blip, 161, 3, Strings["Robbery"], 2.0)
                PulseBlip(blip)
        
                Cache.AlertBlips[v.bank] = {
                    blip = blip,
                    stop = GetGameTimer() + v.time
                }

                ESX.ShowNotification(Strings["BankRobbery"]:format(v.bank))
            end
        end
    end)

    local clear_garbage = GetGameTimer() + 15000
    while true do
        Cache.self = PlayerPedId()
        Cache.coords = GetEntityCoords(Cache.self)

        if clear_garbage <= GetGameTimer() then
            clear_garbage = GetGameTimer() + 15000
            collectgarbage()
        end

        for k, v in pairs(Cache.AlertBlips) do
            if v then
                if v.stop <= GetGameTimer() then
                    RemoveBlip(v.blip)
                    Cache.AlertBlips[k] = nil
                end
            end
        end

        Wait(250)
    end
end)

CreateMarker = function(coords, rgba)
    coords = coords - vector3(0.0, 0.0, 1.0)
    local checkPoint = CreateCheckpoint(45, coords, coords, 0.3, rgba.r, rgba.g, rgba.b, rgba.a, 0)
    SetCheckpointCylinderHeight(checkPoint, 0.3, 0.3, 0.3)
    
    return checkPoint
end

HelpText = function(text, sound)
    text = tostring(text)
    AddTextEntry(GetCurrentResourceName(), text)
    BeginTextCommandDisplayHelp(GetCurrentResourceName())
    EndTextCommandDisplayHelp(0, 0, (sound == true), -1)
end

DrawTxt3D = function(coords, text, sound)
    if Config.Use3DText == false then
        return HelpText(text, sound)
    elseif Config.Use3DText == true then
        local str = text

        local start, stop = string.find(text, "~([^~]+)~")

        if start and start > 1 then
            start = start - 2
            stop = stop + 2
            str = ""
            str = str .. string.sub(text, 0, start) .. "   " .. string.sub(text, start+2, stop-2) .. string.sub(text, stop, #text)
        end

        AddTextEntry(GetCurrentResourceName(), str)
        BeginTextCommandDisplayHelp(GetCurrentResourceName())
        EndTextCommandDisplayHelp(2, false, false, -1)

        SetFloatingHelpTextWorldPosition(1, coords)
        SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    elseif Config.Use3DText == nil then
        SetDrawOrigin(coords)
        text = text:gsub("~INPUT_CONTEXT~", "~g~[~s~E~g~]~s~")
        local height = 0.03
        local _, count = string.gsub(text, "\n", "")
        height = height + 0.02 * count

        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextEntry('STRING')
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(0.0, 0.0 - 0.01 * count)

        DrawRect(0.0, 0.0125, 0.015 + text:gsub("~.-~", ""):len() / 350, height, 45, 45, 45, 150)

        ClearDrawOrigin()
    end
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

LoadDict = function(Dict)
    while not HasAnimDictLoaded(Dict) do 
        Wait(0)
        RequestAnimDict(Dict)
    end

    return Dict
end

LoadPtfx = function(ptfx)
    while not HasNamedPtfxAssetLoaded(ptfx) do
        Wait(0)
        RequestNamedPtfxAsset(ptfx)
    end
    UseParticleFxAssetNextCall(ptfx)

    return ptfx
end


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

GetBankData = function(bank, data)
    return GlobalState[GetCurrentResourceName() .. bank .. data]
end

ToggleHud = function(enabled)
    if enabled then
        ESX.UI.HUD.SetDisplay(1.0)
        TriggerEvent("es:setMoneyDisplay", 1.0)
        TriggerEvent("esx_status:setDisplay", 1.0)
        DisplayRadar(Cache.radar)
    else
        ESX.UI.HUD.SetDisplay(0.0)
        TriggerEvent("es:setMoneyDisplay", 0.0)
        TriggerEvent("esx_status:setDisplay", 0.0)
        DisplayRadar(false)
    end
end

AnimateCameras = function(cam1, cam2, duration)
    local cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    RenderScriptCams(1, 0, 0, 1, 1)
    SetCamCoord(cam, cam1.pos)
    SetCamRot(cam, cam1.rot or vector3(0.0, 0.0, 0.0))

    local NewCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    RenderScriptCams(1, 0, 0, 1, 1)
    SetCamCoord(NewCam, cam2.pos)
    SetCamRot(NewCam, cam2.rot or vector3(0.0, 0.0, 0.0))

    SetCamActiveWithInterp(NewCam, cam, duration or 2000, 500, 0)
    return NewCam
end

ClearCams = function(ease)
    DestroyAllCams(true)
    RenderScriptCams(false, ease and true or false, ease or 0, 1, 0)
    InvalidateIdleCam()
end

ToggleBag = function(enabled)
    if enabled then
        local busy = true
        ESX.TriggerServerCallback("esx_skin:getPlayerSkin", function(skin)
            local bag = skin and skin["bags_1"] or 0
            if bag == 40 or bag == 41 or bag == 44 or bag == 45 then
                SetPedComponentVariation(Cache.self, 5, bag, 0, 0)
            else
                SetPedComponentVariation(Cache.self, 5, 45, 0, 0)
            end
            busy = false
        end)
        while busy do
            Wait(0)
        end
    else
        SetPedComponentVariation(Cache.self, 5, 0, 0, 0)
    end
end
RegisterNetEvent("loaf_heist:alert_police")
AddEventHandler("loaf_heist:alert_police", function(bank)
    if not Cache.AlertBlips[bank] then
        local blip = AddBlip(Config.Banks[bank].Blip, 161, 3, Strings["Robbery"], 2.0)
        PulseBlip(blip)

        Cache.AlertBlips[bank] = {
            blip = blip,
            stop = GetGameTimer() + 5 * 60 * 1000
        }

        while not ESX do Wait(0) end
        ESX.ShowNotification(Strings["BankRobbery"]:format(bank))
    else
        Cache.AlertBlips[bank].stop = GetGameTimer() + 5 * 60 * 1000
    end
end)

Log = function(txt)
    print("^1DEBUG:^0 " .. tostring(txt))
end