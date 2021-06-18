CreateThread(function()
    local CachedPeds = {} -- here all peds that have been spawned will be saved

    while not NetworkIsSessionStarted() do
        Wait(500)
    end
    --[[ 
        new function for creating peds, so retard script kiddies can't do:
        CreatePed = function(_, _, x, y, z) 
            print(x,y,z) -- wow now they would have coords
        end
    --]]
    local createPed = function(pedType, modelHash, coords)
        if pedType and modelHash and coords then
            local model = type(modelHash) == "number" or GetHashKey(modelHash)
            while not HasModelLoaded(model) do
                Wait(50)
                RequestModel(model)
            end
            local ped = Citizen.InvokeNative(0xD49F9B0955C367DE, pedType, model, coords.x, coords.y, coords.z, coords.w, false, true)
            SetModelAsNoLongerNeeded(model)
            return ped
        end
    end

    -- decode the table that was encoded server side, i don't believe some fivem masterhacker will crack this but who knows
    local K, F = GlobalState[GetCurrentResourceName()].key, 16384
    local peds = json.decode((GlobalState[GetCurrentResourceName()].peds:gsub("%x%x", function(c)
        local L = K % 274877906944  -- 2^38
        local H = (K - L) / 274877906944
        local M = H % 128
        c = tonumber(c, 16)
        local m = (c + (H - M) / 128) * (2*M + 1) % 256
        K = L * F + H + c + m
        
        return string.char(m)
    end)))

    local GarbageTimer = 0
    -- this is the actual part where the script spawns peds
    if peds then
        while true do
            local coords = GetEntityCoords(PlayerPedId())
            for k, v in pairs(peds) do
                if #(coords - vec3(v.coords.x, v.coords.y, v.coords.z)) <= 300.0 then
                    if not CachedPeds[tostring(k)] or not DoesEntityExist(CachedPeds[tostring(k)]) then
                        local ped = createPed(v.type or 4, v.model, v.coords)
                        SetEntityInvincible(ped, true)
                        SetEntityHealth(ped, 108)
                        FreezeEntityPosition(ped, true)
                        SetBlockingOfNonTemporaryEvents(ped, true)
                        TaskSetBlockingOfNonTemporaryEvents(ped, true)
                        if v.animation then
                            RequestAnimDict(v.animation.dict)
                            while not HasAnimDictLoaded(v.animation.dict) do
                                Wait(0)
                            end
                            TaskPlayAnim(ped, v.animation.dict, v.animation.anim, 8.0, 0.0, -1, v.animation.flag or 1, 0, false, false, false)
                        end
                        CachedPeds[tostring(k)] = ped
                    end
                elseif CachedPeds[tostring(k)] then
                    DeleteEntity(CachedPeds[tostring(k)])
                    CachedPeds[tostring(k)] = nil
                end
            end

            if GarbageTimer <= GetGameTimer() then
                collectgarbage()
                GarbageTimer = GetGameTimer() + 20000
            end
            
            Wait(5000)
        end
    end

    AddEventHandler("onResourceStop", function(resource)
        if resource == GetCurrentResourceName() then
            for k, v in pairs(CachedPeds) do
                DeleteEntity(v)
            end
        end
    end)
end)