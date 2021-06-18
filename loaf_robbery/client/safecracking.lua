local CrackSafe

CreateThread(function()
    while not Cache or not Cache.loaded do Wait(500) end
    while true do
        for store, data in pairs(Config.Stores) do
            if data.Safe then
                local netid = GetStoreData(store, "safe_obj")
                if netid and NetworkDoesNetworkIdExist(netid) and DoesEntityExist(NetToObj(netid)) then
                    local safe = NetToObj(netid)
                    if GetStoreData(store, "safe_cracked") then
                        if not IsEntityPlayingAnim(safe, "mini@safe_cracking", "DOOR_OPEN_SUCCEED_STAND_SAFE", 3) then
                            PlayEntityAnim(safe, "DOOR_OPEN_SUCCEED_STAND_SAFE", LoadDict("mini@safe_cracking"), 8.0, false, true, 0, 0.96, 262144) -- make the door stay open
                        end
                    elseif not GetStoreData(store, "safe_cracking") then
                        if IsEntityPlayingAnim(safe, "mini@safe_cracking", "DOOR_OPEN_SUCCEED_STAND_SAFE", 3) then
                            StopEntityAnim(safe, "DOOR_OPEN_SUCCEED_STAND_SAFE", "mini@safe_cracking")
                        end

                        while #(Cache.coords - data.Safe.position.xyz) <= 1.5 and not GetStoreData(store, "safe_cracked") and not GetStoreData(store, "safe_cracking") and DoesEntityExist(safe) do
                            Wait(0)
                            HelpText(Strings["crack"], true)
                            if IsControlPressed(0, 51) then
                                ESX.TriggerServerCallback("loaf_robbery:crack_safe", function(allowed)
                                    if allowed then
                                        TakeControl(safe)
                                        TriggerServerEvent("loaf_robbery:finished_cracking", store, CrackSafe(store, safe))
                                    end
                                end, store)
                            end
                        end
                    end
                end
            end
        end
        Wait(500)
    end
end)

CrackSafe = function(store, safe)
    local dict = LoadDict("mini@safe_cracking")
    TaskPlayAnimAdvanced(PlayerPedId(), dict, "step_into", GetOffsetFromEntityInWorldCoords(safe, 0.05, -1.175, 0.2479), vector3(0.0, 0.0, GetEntityHeading(safe)), 4.0, 0.1, -1, 1835009, 0, 2, 0)
    Wait(GetAnimDuration(dict, "step_into") * 800)

    local locks = {}
    for i = 1, Config.Stores[store].Safe.locks or 3 do
        table.insert(locks, {"lock_closed", math.random(0, 359)})
    end
    local rotation, lockStart = 0.0, 0.5
    for i = 1, math.floor(#locks/2) do
        lockStart = lockStart - 0.02375
    end
    RequestAmbientAudioBank("SAFE_CRACK")
    local currentLock, nextAudio = 1, 0
    local attempts = Config.Stores[store].Safe.attempts or 5

    local pos = GetOffsetFromEntityInWorldCoords(safe, -0.2152, -0.8895, 0.2479)
    local dict = LoadDict("mini@safe_cracking")
    TaskPlayAnimAdvanced(PlayerPedId(), dict, "idle_base", pos, GetEntityRotation(safe, 2), 4.0, 0.1, -1, 1835009, 0, 2, 0)
    local sound = GetSoundId()
    while true do
        Wait(0)
        local aspect_ratio = GetAspectRatio(true)

        while not HasStreamedTextureDictLoaded("MPSafeCracking") do
            Wait(0)
            RequestStreamedTextureDict("MPSafeCracking", true)
        end

        DrawSprite("MPSafeCracking", "Dial_BG", 0.5, 0.3, 0.3, aspect_ratio * 0.3, 0, 255, 255, 255, 255)
        DrawSprite("MPSafeCracking", "Dial", 0.5, 0.3, 0.3 * 0.5, 0.3 * aspect_ratio * 0.5, rotation, 255, 255, 255, 255)
        
        local offset = 0.0
        for k, v in pairs(locks) do
            DrawSprite("MPSafeCracking", v[1], lockStart + offset, 0.1, 0.03, aspect_ratio * 0.025, 0, 255, 255, 255, 255)
            offset = offset + 0.025
        end

        local speed = 0.5
        if math.abs(locks[currentLock][2] - rotation) <= 15.0 then
            speed = 0.3
        end

        HelpText(Strings["cracking"]:format(attempts), false)

        if IsControlPressed(0, 175) or IsControlPressed(0, 174) then
            if nextAudio <= GetGameTimer() then
                StopSound(sound)
                PlaySoundFrontend(sound, "TUMBLER_TURN", "SAFE_CRACK_SOUNDSET", 1)
                if speed == 0.5 then
                    nextAudio = GetGameTimer() + 125
                else
                    nextAudio = GetGameTimer() + 160
                end
            end
            if IsControlPressed(0, 175) then
                if rotation <= 0.0 then rotation = 360.0 end
                rotation = rotation - speed
                if not IsEntityPlayingAnim(PlayerPedId(), dict, "dial_turn_anti_fast", 3) then
                    TaskPlayAnimAdvanced(PlayerPedId(), dict, "dial_turn_anti_fast", pos, GetEntityRotation(safe, 2), 4.0, 0.1, -1, 1835009, 0, 2, 0)
                end
            elseif IsControlPressed(0, 174) then
                rotation = rotation + speed
                if rotation >= 360.0 then rotation = 0.0 end
                if not IsEntityPlayingAnim(PlayerPedId(), dict, "dial_turn_clock_fast", 3) then
                    TaskPlayAnimAdvanced(PlayerPedId(), dict, "dial_turn_clock_fast", pos, GetEntityRotation(safe, 2), 4.0, 0.1, -1, 1835009, 0, 2, 0)
                end
            end
        else
            if not IsEntityPlayingAnim(PlayerPedId(), dict, "idle_base", 3) then
                TaskPlayAnimAdvanced(PlayerPedId(), dict, "idle_base", pos, GetEntityRotation(safe, 2), 4.0, 0.1, -1, 1835009, 0, 2, 0)
            end
        end

        if IsControlJustPressed(0, 191) then
            if math.abs(locks[currentLock][2] - rotation) <= 4.0 then
                if locks[currentLock + 1] then
                    locks[currentLock][1] = "lock_open"
                    currentLock = currentLock + 1
                    StopSound(sound)
                    PlaySoundFrontend(sound, "TUMBLER_PIN_FALL", "SAFE_CRACK_SOUNDSET", 1)
                    nextAudio = GetGameTimer() + 750
                else
                    Wait(750)
                    ClearPedTasks(PlayerPedId())

                    local dict = LoadDict("mini@safe_cracking")
                    local rotation = GetEntityRotation(safe, 2) + vector3(0.0, 0.0, 90.0)
                    local pos = GetEntityCoords(safe, true) - GetAnimInitialOffsetPosition(dict, "DOOR_OPEN_SUCCEED_STAND_SAFE", 0.0, 0.0, 0.0, rotation, 0, 2)

                    local scene = NetworkCreateSynchronisedScene(pos, rotation, 2, false, false, 1065353216, 0, 1065353216)
                    NetworkAddPedToSynchronisedScene(PlayerPedId(), scene, dict, "DOOR_OPEN_SUCCEED_STAND", 8.0, -8.0, 1421, 16, 1148846080, 0)
                    NetworkAddEntityToSynchronisedScene(safe, scene, dict, "DOOR_OPEN_SUCCEED_STAND_SAFE", 8.0, -8.0, 137)
                    NetworkStartSynchronisedScene(scene)
                    local loot = CreateObject(LoadModel("prop_drug_package_02").model, GetOffsetFromEntityInWorldCoords(safe, 0.0, 0.0, 0.1), true, false)

                    local played_spin, played_door
                    while true do
                        Wait(0)
                        local phase = GetSynchronizedScenePhase(NetworkConvertSynchronisedSceneToSynchronizedScene(scene))
                        if phase >= 0.096 then
                            if not played_spin then
                                PlaySoundFromCoord(-1, "Safe_Handle_Spin", GetEntityCoords(safe), "DLC_Biker_Cracked_Sounds", false, 0, 0)
                                played_spin = true
                            end
                            if phase >= 0.362 then
                                if not played_door then
                                    PlaySoundFromCoord(-1, "Safe_Door_Open", GetEntityCoords(safe), "DLC_Biker_Cracked_Sounds", false, 0, 0)
                                    played_door = true
                                end
                                if phase > 0.99 then
                                    break
                                end
                            end
                        end
                    end
                    PlayEntityAnim(safe, "DOOR_OPEN_SUCCEED_STAND_SAFE", dict, 8.0, false, true, 0, 0.96, 262144) -- make the door stay open
                    TaskPlayAnimAdvanced(PlayerPedId(), LoadDict("anim@am_hold_up@male"), "shoplift_mid", GetOffsetFromEntityInWorldCoords(safe, -0.1152, -0.8895, 0.2479), GetEntityRotation(safe, 2), 4.0, 0.1, -1, 1835009, 0, 2, 0)
                    Wait(400)
                    StopSound(sound)
                    PlaySoundFrontend(sound, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", true)
                    DeleteEntity(loot)
                    Wait(1300)
                    ClearPedTasksImmediately(PlayerPedId())
                    return true
                end
            else
                attempts = attempts - 1
                if attempts <= 0 then
                    local dict = LoadDict("mini@safe_cracking")
                    TaskPlayAnimAdvanced(PlayerPedId(), dict, "step_out", GetOffsetFromEntityInWorldCoords(safe, -0.2152, -0.8895, 0.2479), vector3(0.0, 0.0, GetEntityHeading(safe)), 4.0, 0.1, -1, 1835009, 0, 2, 0)
                    Wait(GetAnimDuration(dict, "step_out") * 950)
                    ClearPedTasksImmediately(PlayerPedId())
                    return false
                end
            end
        elseif IsControlJustPressed(0, 194) then
            local dict = LoadDict("mini@safe_cracking")
            TaskPlayAnimAdvanced(PlayerPedId(), dict, "step_out", GetOffsetFromEntityInWorldCoords(safe, -0.2152, -0.8895, 0.2479), vector3(0.0, 0.0, GetEntityHeading(safe)), 4.0, 0.1, -1, 1835009, 0, 2, 0)
            Wait(GetAnimDuration(dict, "step_out") * 950)
            ClearPedTasksImmediately(PlayerPedId())
            return false
        end
    end
end