CreateThread(function()
    while not Cache.loaded do
        Wait(0)
    end

    CreateThread(function()
        while true do
            Wait(1000)
            for store, data in pairs(Config.Stores) do
                if #(Cache.coords - data.Spawn.xyz) <= 50.0 then
                    local clerk = GetClerk(store)
                    if DoesEntityExist(clerk) then
                        if GetInteriorFromEntity(clerk) == GetInteriorFromEntity(Cache.self) then
                            if Config.Greet and not IsEntityPlayingAnim(clerk, "mp_am_hold_up", "cower_loop", 3) then
                                PlayPedAmbientSpeechWithVoiceNative(clerk, "SHOP_GREET", "MP_M_SHOPKEEP_01_PAKISTANI_MINI_01", "SPEECH_PARAMS_FORCE", 1)
                            end
                            while GetInteriorFromEntity(clerk) == GetInteriorFromEntity(Cache.self) do
                                Wait(500)
                            end
                        end
                    end
                end
            end
        end
    end)
    
    while true do
        Wait(500)
        for store, data in pairs(Config.Stores) do
            if #(Cache.coords - data.Spawn.xyz) <= 50.0 then
                local clerk = GetClerk(store)
                while clerk and DoesEntityExist(clerk) and #(Cache.coords - GetEntityCoords(clerk)) <= 25.0 do
                    Wait(250)
                    if GetStoreData(store, "robbable") then
                        local till = GetClosestObjectOfType(GetEntityCoords(clerk), 5.0, GetHashKey("p_till_01_s"))
                        if TakeControl(till) then
                            SetEntityAsMissionEntity(till, true, true)
                            DeleteEntity(till)
                        end
                        if #(Cache.coords-GetEntityCoords(clerk)) <= 7.5 and not IsPedDeadOrDying(clerk) and not IsPedRagdoll(clerk) and GetEntityHealth(clerk) > 0 and IsPedFacingPed(Cache.self, clerk, 80.0) and IsPlayerFreeAiming(PlayerId()) and IsPedArmed(Cache.self, Config.ArmedFlag) then
                            local aimed = true
                            if Config.Start then
                                local X, Y, W, H = 0.0125
                                
                                aimed = false
                                local aims = 0
                                while aims <= 500 and not IsPedDeadOrDying(clerk) and not IsPedRagdoll(clerk) and GetEntityHealth(clerk) > 0 and IsPedFacingPed(Cache.self, clerk, 80.0) and IsPlayerFreeAiming(PlayerId()) and IsPedArmed(Cache.self, Config.ArmedFlag) do
                                    Wait(0)
                                    W = ((aims/500) * (0.085 / 0.85)) * 0.85
                                    local correction = ((1.0 - GetSafeZoneSize()) * 100) * 0.005
                                    X, Y = 0.49 - correction, 0.53 - correction
                            
                                    DrawRect(X + 0.0275, Y, 0.09, 0.02, 0, 0, 0, 150)
                                    DrawRect(X + 0.0275, Y, 0.085, 0.0125, 30, 80, 120, 180)
                                    DrawRect(X - 0.015 + (W / 2), Y, W, 0.0125, 25, 120, 210, 180)
                            
                                    SetTextColour(255, 255, 255, 255)
                                    SetTextFont(0)
                                    SetTextScale(0.4, 0.4)
                                    SetTextCentre(true)
                                    SetTextEntry("STRING")
                                    AddTextComponentString(Strings["starting"])
                                    DrawText(0.5, 0.45)

                                    aims = aims + 1
                                end

                                if aims >= 500 then
                                    aimed = true
                                end
                            end
                            if aimed then
                                local triggered, allowed
                                ESX.TriggerServerCallback("loaf_robbery:rob", function(success)
                                    triggered = true
                                    allowed = success
                                    
                                    if allowed then
                                        -- variables used
                                        local dict = LoadDict("mp_am_hold_up")
                                        local rot = GetAnimInitialOffsetRotation(dict, "holdup_victim_20s", GetEntityCoords(clerk), GetEntityRotation(clerk, 2), 0, 2)
                                        local pos = GetAnimInitialOffsetPosition(dict, "holdup_victim_20s", GetEntityCoords(clerk), GetEntityRotation(clerk, 2), 0, 2)

                                        -- till
                                        local till = GetClosestObjectOfType(GetEntityCoords(clerk), 5.0, GetHashKey("prop_till_01"))
                                        if DoesEntityExist(till) then
                                            local oldPos, oldRot = GetEntityCoords(till), GetEntityRotation(till, 2)
                                            CreateModelHide(GetEntityCoords(till), 1.0, GetHashKey("prop_till_01"), true)
                                            till = CreateObject(LoadModel("p_till_01_s").model, GetEntityCoords(register), true)
                                            FreezeEntityPosition(till, true)
                                            SetEntityCoordsNoOffset(till, oldPos - vec3(0.0, 0.0, 0.025))
                                            SetEntityRotation(till, oldRot)
                                        else
                                            till = GetClosestObjectOfType(GetEntityCoords(clerk), 5.0, GetHashKey("p_till_01_s"))
                                        end
                                        
                                        -- scene, cred to devjames & PlutoDev for helping me
                                        if DoesEntityExist(till) then
                                            pos, rot = GetEntityCoords(till) - vec3(0.0, 0.0, 0.1), GetEntityRotation(till) - vec3(0.0, 0.0, 180.0)
                                        end
                                        local scene = NetworkCreateSynchronisedScene(pos, rot, 2, true, false, 1065353216, 0, 1065353216)
                                        NetworkAddPedToSynchronisedScene(clerk, scene, dict, "holdup_victim_20s", 8.0, -8.0, 3341, 16, 1148846080, 0)
                                        local model, bag = LoadModel("prop_poly_bag_01")
                                        if model.loaded then
                                            bag = CreateObject(model.model, GetEntityCoords(clerk), true, false)
                                            SetEntityVisible(bag, false)
                                            NetworkAddEntityToSynchronisedScene(bag, scene, dict, "holdup_victim_20s_bag", 4.0, -4.0, 137)
                                        end
                                        if DoesEntityExist(till) then
                                            NetworkAddEntityToSynchronisedScene(till, scene, dict, "holdup_victim_20s_till", 4.0, -4.0, 137)
                                        end
                                        NetworkStartSynchronisedScene(scene)

                                        while not IsSynchronizedSceneRunning(NetworkConvertSynchronisedSceneToSynchronizedScene(scene)) do
                                            Wait(50)
                                        end
                                        PlayPedAmbientSpeechWithVoiceNative(clerk, "SHOP_SCARED", "MP_M_SHOPKEEP_01_PAKISTANI_MINI_01", "SPEECH_PARAMS_FORCE", 1)
                                        local synchronized = NetworkConvertSynchronisedSceneToSynchronizedScene(scene)
                                        local rate, shot_multiplier, aiming, aiming_clerk = 1.0, 0.0
                                        while IsSynchronizedSceneRunning(synchronized) do
                                            Wait(0)

                                            local X, Y, W, H = 0.0125
                                            local Duration = 7500

                                            while not HasStreamedTextureDictLoaded("timerbars") do
                                                RequestStreamedTextureDict("timerbars")
                                                Wait(0)
                                            end

                                            W = (GetSynchronizedScenePhase(synchronized) * (0.085 / 0.85))
                                            if W <= 0.085 then
                                                local correction = ((1.0 - GetSafeZoneSize()) * 100) * 0.005
                                                X, Y = 0.9255 - correction, 0.98 - correction

                                                DrawSprite("timerbars", "all_black_bg", X, Y, 0.15, 0.0325, 0.0, 255, 255, 255, 180)
                                                DrawRect(X + 0.0275, Y, 0.085, 0.0125, 30, 80, 120, 180)
                                                DrawRect(X - 0.015 + (W / 2), Y, W, 0.0125, 25, 120, 210, 180)

                                                SetTextColour(255, 255, 255, 180)
                                                SetTextFont(0)
                                                SetTextScale(0.3, 0.3)
                                                SetTextCentre(true)
                                                SetTextEntry("STRING")
                                                AddTextComponentString(Strings["intimidation"])
                                                DrawText(X - 0.06, Y - 0.012)
                                            end

                                            if IsPlayerFreeAiming(PlayerId()) then
                                                if not aiming then
                                                    rate = rate + 0.1
                                                    aiming = true
                                                end
                                                if IsPlayerFreeAimingAtEntity(PlayerId(), clerk) and not aiming_clerk then
                                                    rate = rate + 0.15
                                                    aiming_clerk = true
                                                elseif not IsPlayerFreeAimingAtEntity(PlayerId(), clerk) and aiming_clerk then
                                                    rate = rate - 0.15
                                                    aiming_clerk = false
                                                end
                                            elseif aiming then
                                                aiming = false
                                                rate = rate - 0.1
                                            end
                                            
                                            local shot = GetPedLastWeaponImpactCoord(Cache.self)
                                            if shot then
                                                shot_multiplier = 0.8
                                                if not IsAmbientSpeechPlaying(clerk) then
                                                    PlayPedAmbientSpeechWithVoiceNative(clerk, "SHOP_HURRYING", "MP_M_SHOPKEEP_01_PAKISTANI_MINI_01", "SPEECH_PARAMS_FORCE", 1)
                                                end
                                            end

                                            if shot_multiplier > 0.0 then
                                                shot_multiplier = math.max(0.0, shot_multiplier - 0.01)
                                            end

                                            SetSynchronizedSceneRate(synchronized, rate + rate * shot_multiplier)

                                            if IsPedDeadOrDying(clerk) then
                                                DeleteEntity(bag)
                                                return NetworkStopSynchronisedScene(scene)
                                            end

                                            if GetSynchronizedScenePhase(synchronized) > 0.46 then
                                                SetEntityVisible(bag, true)
                                                if GetSynchronizedScenePhase(synchronized) >= 0.95 then
                                                    NetworkStopSynchronisedScene(scene)
                                                end
                                            end
                                        end

                                        TaskPlayAnim(clerk, dict, "cower_intro", 8.0, -8.0, -1, 0, 0, false, false, false)
                                        timer = GetGameTimer() + 2500

                                        while DoesEntityExist(bag) do
                                            if IsEntityTouchingEntity(Cache.self, bag) then
                                                PlaySoundFrontend(-1, "ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", true)
                                                TriggerServerEvent("loaf_robbery:claim_reward", store)
                                                while DoesEntityExist(bag) do
                                                    Wait(50)
                                                    if TakeControl(bag) then
                                                        SetEntityAsMissionEntity(bag, true, true)
                                                        DeleteEntity(bag)
                                                    end
                                                end
                                            end
                                            if timer <= GetGameTimer() then
                                                TaskPlayAnim(clerk, dict, "cower_loop", 8.0, -8.0, -1, 1, 0, false, false, false)
                                            end

                                            Wait(15)
                                        end

                                        while timer > GetGameTimer() do
                                            Wait(50)
                                        end
                                        TaskPlayAnim(clerk, dict, "cower_loop", 8.0, -8.0, -1, 1, 0, false, false, false)
                                        Wait(math.floor(Config.Cooldown * 0.6) * 1000)
                                        ClearPedTasks(clerk)
                                    end
                                end, store)
                                while not triggered do
                                    Wait(250)
                                end
                                if allowed then 
                                    while GetStoreData(store, "robbable") do
                                        Wait(0)
                                    end
                                end
                            end
                        end
                    else
                        local till = GetClosestObjectOfType(GetEntityCoords(clerk), 5.0, GetHashKey("prop_till_01"))
                        if DoesEntityExist(till) then
                            CreateModelHide(GetEntityCoords(till), 1.0, GetHashKey("prop_till_01"), true)
                        end
                    end
                end
            end
        end
    end
end)