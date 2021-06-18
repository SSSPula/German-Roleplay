CreateThread(function()
    while not Cache.loaded do 
        Wait(250) 
    end

    -- FreezeEntityPosition(Cache.self, false)

    CreateThread(function()
        while true do
            Wait(1000)
            for k, v in pairs(Config.Banks or {}) do                
                if #(Cache.coords - v.Blip) <= 200.0 then
                    if GetBankData(k, "alarm") then
                        if GetBankData(k, "alarm") - GetBankData("TIME", "TIME") > 0 then -- alarm still playing?
                            Log(GetBankData(k, "alarm") - GetBankData("TIME", "TIME") .. "s before stopping alarm")
                            if not Cache.alarm or HasSoundFinished(Cache.alarm.id) then 
                                if Cache.alarm then
                                    Log("sound finished - restarting alarm")
                                    StopSound(Cache.alarm.id)
                                    ReleaseSoundId(Cache.alarm.id)
                                end
                                Cache.alarm = {
                                    id = GetSoundId(),
                                    bank = k,
                                }
                                while not RequestScriptAudioBank("ALARM_KLAXON_03", false, -1) do
                                    Wait(0)
                                end
                                PlaySoundFromCoord(Cache.alarm.id, "ALARMS_KLAXON_03_FAR", v.Blip, 0, true, 200, 0)
                                Log("started playing")
                            else
                                if Cache.alarm.bank ~= k then
                                    local otherDist, dist = #(Cache.coords - Config.Banks[Cache.alarm.bank].Blip), #(Cache.coords - v.Blip)
                                    if otherDist < dist then
                                        StopSound(Cache.alarm.id)
                                        ReleaseSoundId(Cache.alarm.id)
                                        Cache.alarm.bank = k
                                        Cache.alarm.id = GetSoundId()
                                        while not RequestScriptAudioBank("ALARM_KLAXON_03", false, -1) do
                                            Wait(0)
                                        end
                                        PlaySoundFromCoord(Cache.alarm.id, "ALARMS_KLAXON_03_FAR", v.Blip, 0, true, 200, 0)
                                        Log("switched bank")
                                    end
                                end
                            end
                        elseif Cache.alarm then
                            Log("stopped playing")
                            StopSound(Cache.alarm.id)
                            ReleaseSoundId(Cache.alarm.id)
                            ReleaseNamedScriptAudioBank("ALARM_KLAXON_03")
                            Cache.alarm = nil
                        end
                    end
                elseif Cache.alarm and Cache.alarm.bank == k then
                    Log("stopped playing")
                    StopSound(Cache.alarm.id)
                    ReleaseSoundId(Cache.alarm.id)
                    ReleaseNamedScriptAudioBank("ALARM_KLAXON_03")
                    Cache.alarm = nil
                end
            end
        end
    end)

    while true do
        Wait(500)

        for k, v in pairs(Config.Banks or {}) do
            if v.Thermals then
                for id, data in pairs(v.Thermals) do
                    if #(Cache.coords - data.Pos) <= 50.0 then
                        local door = GetClosestObjectOfType(data.Pos, 3.0, GetHashKey(data.Object))
                        if DoesEntityExist(door) then

                            if GetBankData(k, "thermal_"..id) == true then
                                FreezeEntityPosition(door, false)
                            else
                                if math.abs(GetEntityHeading(door) - data.Locked) >= 2.0 then
                                    SetEntityHeading(door, data.Locked)
                                end
                                FreezeEntityPosition(door, true)
                            end

                            while #(GetEntityCoords(Cache.self) - data.Pos) <= 2.0 and not GetBankData(k, "thermal_"..id) do
                                Wait(0)
                                DrawTxt3D(data.Pos, Strings["Melt"])
        
                                if IsControlJustReleased(0, 51) then
                                    local using = true
                                
                                    ESX.TriggerServerCallback("loaf_heist:use_thermal", function(success)
                                        if success then
                                            ToggleHud(false)

                                            if data.Cam then
                                                AnimateCameras(data.Cam.from, data.Cam.to, 10000)
                                            end

                                            FreezeEntityPosition(Cache.self, true)
                                            local offset, dict = GetOffsetFromEntityInWorldCoords(door, data.Offset), LoadDict("anim@heists@ornate_bank@thermal_charge")
                                            local bagM, chargeM = LoadModel("hei_p_m_bag_var22_arm_s").model, LoadModel("hei_prop_heist_thermite").model
                                            local bag, charge = CreateObject(bagM, offset, 1, 1, 0), CreateObject(chargeM, offset, 1, 1, 0)
                                            DisableCamCollisionForEntity(bag)
                                            DisableCamCollisionForEntity(chargeM)
                                            SetEntityVisible(charge, false)
        
                                            local scene = NetworkCreateSynchronisedScene(offset, 0.0, 0.0, GetEntityHeading(door), 2, true, false, 1065353216, 0, 1065353216)
                                            NetworkAddPedToSynchronisedScene(Cache.self, scene, dict, "thermal_charge", 1.25, -1.5, 3341, 16, 1.25, 0)
                                            NetworkAddEntityToSynchronisedScene(bag, scene, dict, "bag_thermal_charge_no_armour", 1000.0, -1000.0, 0)
                                            AttachEntityToEntity(charge, Cache.self, GetPedBoneIndex(Cache.self, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 2, 1)
                                            NetworkStartSynchronisedScene(scene)

                                            ToggleBag(false)
                                            Wait(1000)
                                            SetEntityVisible(charge, true)
                                            Wait(5000)
                                            TriggerServerEvent("loaf_heist:start_looped", data)
                                            Wait(6000)
                                            DeleteObject(charge)
                                            Wait(6000)
                                            NetworkStopSynchronisedScene(scene)
                                            ToggleBag(true)
                                            FreezeEntityPosition(Cache.self, false)
                                            DeleteObject(bag)
                                            ClearCams(1500)
                                            
                                            ToggleHud(true)
                                            using = false
                                        end
                                        using = false
                                    end, k, id)

                                    while using do
                                        Wait(250)
                                    end
                                end
                            end
                        end
                    end
                end
            end

            if v.Vault then
                if #(Cache.coords - v.Vault.Pos) <= 50.0 then
                    local vault = GetClosestObjectOfType(v.Vault.Pos, 5.0, GetHashKey(v.Vault.Object))
                    if DoesEntityExist(vault) then
                        FreezeEntityPosition(vault, true)
                        if not GetBankData(k, "robbable") or GetBankData(k, "vault_locked") then
                            if math.abs(GetEntityHeading(vault) - v.Vault.Locked) >= 2.0 then
                                SetEntityHeading(vault, v.Vault.Locked)
                            end

                            if Config.AllowLock and GetBankData(k, "vault_locked") then
                                while Cache.hasjob and #(Cache.coords - v.Vault.Pos) <= 2.0 do
                                    Wait(0)
                                    DrawTxt3D(v.Vault.Pos, Strings["OpenVault"])
                                    if IsControlJustReleased(0, 51) then
                                        TriggerServerEvent("loaf_heist:lock_vault", k, false)
                                        Wait(250)
                                        break
                                    end
                                end
                            end
                        else
                            if math.abs(GetEntityHeading(vault) - v.Vault.Unlocked) >= 5.0 then
                                -- clean "animation" when opening the vault
                                if GetEntityHeading(vault) > v.Vault.Unlocked then
                                    for i = 1, math.floor(GetEntityHeading(vault) - v.Vault.Unlocked) * 3 do
                                        SetEntityHeading(vault, v.Vault.Locked - i/3)
                                        Wait(0)
                                    end
                                else
                                    for i = 1, math.floor(v.Vault.Unlocked - GetEntityHeading(vault)) * 3 do
                                        SetEntityHeading(vault, v.Vault.Locked + i/3)
                                        Wait(0)
                                    end
                                end

                                SetEntityHeading(vault, v.Vault.Unlocked)
                            end

                            if Config.AllowLock then
                                while Cache.hasjob and #(Cache.coords - v.Vault.Pos) <= 2.0 do
                                    Wait(0)
                                    DrawTxt3D(v.Vault.Pos, Strings["LockVault"])
                                    if IsControlJustReleased(0, 51) then
                                        TriggerServerEvent("loaf_heist:lock_vault", k, true)
                                        Wait(250)
                                        break
                                    end
                                end
                            end
                        end
                    end
                end
            end

            if GetBankData(k, "robbable") then
                if v.Trolleys then
                    for trolley, data in pairs(v.Trolleys) do
                        if #(Cache.coords - data.Position.xyz) <= 75.0 then
                            local netId = GetBankData(k, "trolley_"..trolley)
                            if netId ~= true and (not netId or not DoesEntityExist(NetToObj(netId))) and not GetBankData(k, "grabbing_"..trolley) then
                            elseif type(netId) == "number" and DoesEntityExist(NetToObj(netId)) then
                                local object = NetToObj(netId)
                                -- Log(("Trolley #%s exists, not spawning."):format(trolley))
                                if #(Cache.coords - GetEntityCoords(object)) <= 75.0 then
                                    if GetEntityHeightAboveGround(object) >= 0.5 then
                                        Log("Taking control..")
                                        while not NetworkHasControlOfEntity(object) do
                                            NetworkRequestControlOfEntity(object)
                                            Wait(0)
                                        end
                                        Log("Took control")
                                        PlaceObjectOnGroundProperly(object)
                                        Log("Placed on ground")
                                    end
                                    if Config.CopLoot or not Cache.hasjob then
                                        while #(Cache.coords - GetEntityCoords(object)) <= 1.5 and not GetBankData(k, "grabbing_"..trolley) and GetBankData(k, "hasmoney_"..trolley) do
                                            Wait(0)
                                            DrawTxt3D(GetEntityCoords(object) + vec3(0.0, 0.0, 1.0), Strings["Grab"])
                                            if IsControlJustReleased(0, 51) then
                                                ESX.TriggerServerCallback("loaf_heist:grab_money", function(allowed)
                                                    if allowed then
                                                        GrabCash(object, k, trolley, data)
                                                    end
                                                end, k, trolley)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end

                if v.Drilling then
                    for id, data in pairs(v.Drilling) do
                        while #(Cache.coords - data.Scene.xyz) <= 2.0 and GetBankData(k, "drillable_"..id) and not GetBankData(k, "drilling_"..id) do
                            Wait(0)
                            DrawTxt3D(data.Scene.xyz + vec3(0.0, 0.0, 0.1), Strings["Drill"])
                            if IsControlJustReleased(0, 51) then
                                ESX.TriggerServerCallback("loaf_heist:drill", function(success)
                                    if success then
                                        if data.Cam then
                                            local cam = AnimateCameras(data.Cam.from, data.Cam.to, 500)
                                            ShakeCam(cam, "HAND_SHAKE", 0.1)
                                        end
    
                                        TriggerServerEvent("loaf_heist:stop_drill", k, id, Drill(data.Scene))
                                        
                                        if data.Cam then
                                            ClearCams(500)
                                        end
                                    end
                                end, k, id)
                            end
                        end
                    end
                end
            end

            if v.Hacking then
                if #(Cache.coords - v.Hacking.Pos) <= 2.0 then
                    local security_panel
                    if v.Hacking.Object then
                        security_panel = GetClosestObjectOfType(v.Hacking.Pos, 2.0, GetHashKey(v.Hacking.Object))
                    end

                    if DoesEntityExist(security_panel) or #(Cache.coords - v.Hacking.Pos) <= 2.0 then
                        while (#(GetEntityCoords(Cache.self) - GetEntityCoords(security_panel)) <= 2.0 or #(Cache.coords - v.Hacking.Pos) <= 2.0) and GetBankData(k, "hackable") and not GetBankData(k, "hacking") and not GetBankData(k, "robbable") do
                            Wait(0)
                            DrawTxt3D(v.Hacking.Pos, Strings["Hack"])

                            if IsControlJustReleased(0, 51) then
                                local using = true
                                ESX.TriggerServerCallback("loaf_heist:begin_hack", function(success)
                                    if success then
                                        ToggleHud(false)

                                        if v.Hacking.Cam then
                                            AnimateCameras(v.Hacking.Cam.from, v.Hacking.Cam.to, 10000)
                                        end
                                        local start_pos, heading = v.Hacking.Pos, v.Hacking.Heading or 0.0
                                        if security_panel then
                                            start_pos = GetOffsetFromEntityInWorldCoords(security_panel, 0.0, 0.07, 0.0)
                                            heading = GetEntityHeading(security_panel)
                                        end
                                        local hacked = BeginHack(start_pos, heading, k)
                                        ClearCams()
                                        TriggerServerEvent("loaf_heist:stop_hack", k, hacked)
                                        if hacked then
                                            if v.Vault then
                                                local cam
                                                if v.Vault.Cam then
                                                    cam = AnimateCameras(v.Vault.Cam.from, v.Vault.Cam.to, 6000)
                                                else
                                                    ClearCams(0)
                                                end

                                                while not RequestScriptAudioBank("Vault_Door", false, -1) do
                                                    Wait(0)
                                                end
                                                PlaySoundFromCoord(-1, "vault", v.Vault.Pos, "HACKING_DOOR_UNLOCK_SOUNDS", true, 30, 0)

                                                local vault = GetClosestObjectOfType(v.Vault.Pos, 5.0, GetHashKey(v.Vault.Object))
                                                if DoesEntityExist(vault) then
                                                    if math.abs(GetEntityHeading(vault) - v.Vault.Unlocked) >= 5.0 then
                                                        for i = 1, math.floor(GetEntityHeading(vault) - v.Vault.Unlocked) * 7 do
                                                            SetEntityHeading(vault, v.Vault.Locked - i/7)
                                                            Wait(0)
                                                        end
                        
                                                        SetEntityHeading(vault, v.Vault.Unlocked)
                                                    end
                                                end
                                                if cam then
                                                    while IsCamInterpolating(cam) do
                                                        Wait(0)
                                                    end
                                                end
                                                ClearCams(2500)
                                            end
                                        end
                                        
                                        ToggleHud(true)
                                    end
                                    using = false
                                end, k)
                                while using do
                                    Wait(250)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

GrabCash = function(object, bank, trolley, data)
    ToggleHud(false) -- disable ui, radar etc
    if data.Cam then
        local cam = AnimateCameras(data.Cam.from, data.Cam.to, 500)
        ShakeCam(cam, "HAND_SHAKE", 0.25)
    end
    -- load stuff
    local dict = LoadDict("anim@heists@ornate_bank@grab_cash")
    local bagM, cashM = LoadModel("hei_p_m_bag_var22_arm_s").model, LoadModel("hei_prop_heist_cash_pile").model
    FreezeEntityPosition(Cache.self, true)

    -- initial stuff needed
    local position = GetEntityCoords(object)
    local bag, cash = CreateObject(bagM, position, 1, 1, 0), CreateObject(cashM, position, 1, 1, 0)
    DisableCamCollisionForObject(bag)
    AttachEntityToEntity(cash, Cache.self, GetPedBoneIndex(Cache.self, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 2, 1)
    SetEntityVisible(cash, false, 0)

    -- create a scene for the intro
    local scene = NetworkCreateSynchronisedScene(GetEntityCoords(object, true), GetEntityRotation(object, 2), 2, true, false, 1065353216, 0, 1.0)
    NetworkAddPedToSynchronisedScene(Cache.self, scene, dict, "intro", 8.0, -8.0, 3341, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, scene, dict, "bag_intro", 8.0, -8.0, 0)
    NetworkStartSynchronisedScene(scene)
    ToggleBag(false)
    -- wait for the intro to finish
    while true do
        Wait(0)
        if GetSynchronizedScenePhase(NetworkConvertSynchronisedSceneToSynchronizedScene(scene)) > 0.9 then
            break
        end
    end

    -- create a new scene for grabbing cash
    scene = NetworkCreateSynchronisedScene(GetEntityCoords(object, true), GetEntityRotation(object, 2), 2, true, false, 1065353216, 0, 1.0)
    NetworkAddPedToSynchronisedScene(Cache.self, scene, dict, "grab", 4.0, -4.0, 13, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, scene, dict, "bag_grab", 1000.0, -1000.0, 0)
    NetworkAddEntityToSynchronisedScene(object, scene, dict, "cart_cash_dissapear", 1000.0, -4.0, 1)
    NetworkStartSynchronisedScene(scene)

    while true do
        Wait(0)
        -- update cash visibility so it looks good
        if HasAnimEventFired(Cache.self, GetHashKey("CASH_APPEAR")) then
            SetEntityVisible(cash, true, 0)
        elseif HasAnimEventFired(Cache.self, GetHashKey("RELEASE_CASH_DESTROY")) then
            SetEntityVisible(cash, false, 0)
        end

        -- wait until grabbing scene finishes
        if GetSynchronizedScenePhase(NetworkConvertSynchronisedSceneToSynchronizedScene(scene)) > 0.99 then
            while not NetworkHasControlOfEntity(object) do
                NetworkRequestControlOfEntity(object)
                Wait(0)
            end
            DeleteObject(object) -- delete the trolley
            local model = LoadModel(data.Empty)
            if model.loaded then
                object = CreateObject(model.model, data.Position.xyz, true) -- create a new, empty trolley
                PlaceObjectOnGroundProperly(object)
                SetEntityHeading(object, data.Position.w)
                FreezeEntityPosition(object, true)
                TriggerServerEvent("loaf_heist:replace_trolley", bank, trolley, ObjToNet(object)) -- replace the old trolley with the new one
            end

            DeleteObject(cash) -- delete cash object

            -- create a new scene for exiting the animation
            scene = NetworkCreateSynchronisedScene(GetEntityCoords(object, true), GetEntityRotation(object, 2), 2, true, false, 1065353216, 0, 1.25)
            NetworkAddEntityToSynchronisedScene(bag, scene, dict, "bag_exit", 1000.0, -1000.0, 0)
            NetworkAddPedToSynchronisedScene(Cache.self, scene, dict, "exit", 4.0, -1.5, 13, 16, 1148846080, 0)
            NetworkStartSynchronisedScene(scene)
            -- wait for the scene to finish

            -- delete the camera
            ClearCams(1000)
            while true do
                Wait(0)
                if GetSynchronizedScenePhase(NetworkConvertSynchronisedSceneToSynchronizedScene(scene)) > 0.9 then
                    break
                end
            end
            break
        end
    end

    ToggleBag(true)
    DeleteObject(bag)
    NetworkStopSynchronisedScene(scene)
    FreezeEntityPosition(Cache.self, false)
    ToggleHud(true)
end

BeginHack = function(offset, heading, bank)
    local success = false

    local dict = LoadDict("anim@heists@ornate_bank@hack")
    local laptopM, bagM, cardM = LoadModel("hei_prop_hst_laptop").model, LoadModel("hei_p_m_bag_var22_arm_s").model, LoadModel("hei_prop_heist_card_hack_02").model
    FreezeEntityPosition(Cache.self, true)

    local bag, laptop, card = CreateObject(bagM, offset, 1, 1, 0), CreateObject(laptopM, offset, 1, 1, 0), CreateObject(cardM, offset, 1, 1, 0)
    DisableCamCollisionForObject(bag)

    local scene = NetworkCreateSynchronisedScene(offset, 0.0, 0.0, heading, 2, true, false, 1065353216, 0, 1065353216)
    NetworkAddPedToSynchronisedScene(Cache.self, scene, dict, "hack_enter", 8.0, -8.0, 3341, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(card, scene, dict, "hack_enter_card", 8.0, -8.0, 0)
    NetworkAddEntityToSynchronisedScene(laptop, scene, dict, "hack_enter_laptop", 8.0, -8.0, 0)
    NetworkAddEntityToSynchronisedScene(bag, scene, dict, "hack_enter_bag", 8.0, -8.0, 0)
    NetworkStartSynchronisedScene(scene)
    ToggleBag(false)

    while true do
        Wait(0)

        if GetSynchronizedScenePhase(NetworkConvertSynchronisedSceneToSynchronizedScene(scene)) > 0.99 then
            scene = NetworkCreateSynchronisedScene(offset, 0.0, 0.0, heading, 2, false, true, 1065353216, 0, 1065353216)
            NetworkAddPedToSynchronisedScene(Cache.self, scene, dict, "hack_loop", 8.0, -8.0, 3341, 16, 1148846080, 0)
            NetworkAddEntityToSynchronisedScene(card, scene, dict, "hack_loop_card", 8.0, -8.0, 0)
            NetworkAddEntityToSynchronisedScene(laptop, scene, dict, "hack_loop_laptop", 8.0, -8.0, 0)
            NetworkAddEntityToSynchronisedScene(bag, scene, dict, "hack_loop_bag", 8.0, -8.0, 0)
            NetworkStartSynchronisedScene(scene)

            success = Hack(bank)

            scene = NetworkCreateSynchronisedScene(offset, 0.0, 0.0, heading, 2, false, true, 1065353216, 0, 1065353216)
            NetworkAddPedToSynchronisedScene(Cache.self, scene, dict, "hack_exit", 8.0, -8.0, 3341, 16, 1148846080, 0)
            NetworkAddEntityToSynchronisedScene(card, scene, dict, "hack_exit_card", 8.0, -8.0, 0)
            NetworkAddEntityToSynchronisedScene(laptop, scene, dict, "hack_exit_laptop", 8.0, -8.0, 0)
            NetworkAddEntityToSynchronisedScene(bag, scene, dict, "hack_exit_bag", 8.0, -8.0, 0)
            NetworkStartSynchronisedScene(scene)

            while true do
                Wait(0)
                if GetSynchronizedScenePhase(NetworkConvertSynchronisedSceneToSynchronizedScene(scene)) > 0.99 then
                    break
                end
            end
            break
        end
    end

    NetworkStopSynchronisedScene(scene)
    ToggleBag(true)
    DeleteObject(bag)
    DeleteObject(laptop)
    DeleteObject(card)
    FreezeEntityPosition(Cache.self, false)
    return success
end

Drill = function(pos)
    local success = false
    ToggleHud(false)
    ToggleBag(false)
    local speed, position, depth, temperature = 0.0, 0.0, 0.01, 0.0
    local scaleform = RequestScaleformMovie("DRILLING")
    while not HasScaleformMovieLoaded(scaleform) do
        Wait(0)
    end

    local drill = CreateObject(LoadModel(GetHashKey("hei_prop_heist_drill")).model, Cache.coords - vec3(0.0, 0.0, 4.0), true, false)
    SetEntityVisible(drill, false)
    AttachEntityToEntity(drill, Cache.self, GetPedBoneIndex(Cache.self, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 2, 1)
    -- AttachEntityToEntity(drill, Cache.self, GetPedBoneIndex(Cache.self, 57005), 0.125, 0.0, -0.05, 100.0, 300.0, 135.0, true, true, false, true, 1, true)
    SetEntityAsMissionEntity(drill, true, true)

    local bagM = LoadModel("hei_p_m_bag_var22_arm_s").model
    local bag = CreateObject(bagM, Cache.coords, 1, 1, 0)

    local dict = LoadDict("anim@heists@fleeca_bank@drilling")
    local scene = NetworkCreateSynchronisedScene(pos.xyz, 0.0, 0.0, pos.w, 2, true, false, 1065353216, 0, 1065353216)
    NetworkAddPedToSynchronisedScene(Cache.self, scene, dict, "intro", 1.25, -1.5, 3341, 16, 1.25, 0)
    NetworkAddEntityToSynchronisedScene(bag, scene, dict, "bag_intro_no_armour", 1000.0, -1000.0, 0)
    NetworkStartSynchronisedScene(scene)

    while true do
        Wait(0)
        if GetSynchronizedScenePhase(NetworkConvertSynchronisedSceneToSynchronizedScene(scene)) > 0.05 then
            SetEntityVisible(drill, true)
            if GetSynchronizedScenePhase(NetworkConvertSynchronisedSceneToSynchronizedScene(scene)) > 0.99 then
                break
            end
        end
    end

    NetworkStopSynchronisedScene(scene)
    AttachEntityToEntity(bag, Cache.self, GetPedBoneIndex(Cache.self, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 2, 1)

    RequestAmbientAudioBank("DLC_HEIST_FLEECA_SOUNDSET", 0)
    RequestAmbientAudioBank("DLC_MPHEIST\\HEIST_FLEECA_DRILL", 0)
    RequestAmbientAudioBank("DLC_MPHEIST\\HEIST_FLEECA_DRILL_2", 0)

    local drillSound
    local CurrentAnimation = "drill_straight_idle"

    local iParam0f_10, iParam0f_11 = 0.0, 0.0
    local tempCooldown, playedFail = false, false
    local pin1, pin2, pin3, pin4 = 0.325, 0.476, 0.626, 0.7752
    local played1, played2, played3, played4
    
    -- TaskPlayAnim(Cache.self, LoadDict("anim@heists@fleeca_bank@drilling"), CurrentAnimation, 8.0, 8.0, -1, 17, 1, false, false, false)

    -- heat, debris
    local ptfx = {}
    LoadPtfx("FM_Mission_Controler")
    ptfx.heat = StartNetworkedParticleFxLoopedOnEntity("scr_drill_overheat", drill, vector3(0.0, -0.6, 0.0), vector3(270.0, 0.0, 0.0), 1.0, vector3(0.0, 0.0, 0.0))
    SetParticleFxLoopedEvolution(ptfx.heat, "heat", 0.0, 0)

    LoadPtfx("FM_Mission_Controler")
    ptfx.debris = StartNetworkedParticleFxLoopedOnEntity("scr_drill_debris", drill, vector3(0.0, -0.6, 0.0), vector3(270.0, 0.0, 0.0), 1.0, vector3(0.0, 0.0, 0.0))
    SetParticleFxLoopedEvolution(ptfx.debris, "power", 0.0, 0)

    while true do
        Wait(0)

        -- ANIMATION PART
        if not IsEntityPlayingAnim(bag, "anim@heists@fleeca_bank@drilling", "bag_straight_idle_no_armour", 3) then
            PlayEntityAnim(bag, "bag_straight_idle_no_armour", LoadDict("anim@heists@fleeca_bank@drilling"), 1000.0, true, false, 0, 0.0, 0)
            ForceEntityAiAndAnimationUpdate(bag)
        end

        -- drill_straight_start_drill_bit
        if not IsEntityPlayingAnim(drill, "anim@heists@fleeca_bank@drilling", "drill_straight_idle_drill_bit", 3) then
            PlayEntityAnim(drill, "drill_straight_idle_drill_bit", LoadDict("anim@heists@fleeca_bank@drilling"), 1000.0, true, false, 0, 0.0, 0)
            ForceEntityAiAndAnimationUpdate(drill)
        end

        if not tempCooldown and not IsEntityPlayingAnim(Cache.self, "anim@heists@fleeca_bank@drilling", CurrentAnimation, 3) then
            TaskPlayAnim(Cache.self, LoadDict("anim@heists@fleeca_bank@drilling"), CurrentAnimation, 8.0, 8.0, -1, 1, 1, false, false, false)
        elseif tempCooldown then
            if not playedFail then
                TaskPlayAnim(Cache.self, LoadDict("anim@heists@fleeca_bank@drilling"), "drill_straight_fail", 8.0, 8.0, -1, 0, 1, false, false, false)
                playedFail = GetGameTimer() + (GetAnimDuration("anim@heists@fleeca_bank@drilling", "drill_straight_fail") * 1000) - 100
            elseif playedFail <= GetGameTimer() and not IsEntityPlayingAnim(Cache.self, "anim@heists@fleeca_bank@drilling", CurrentAnimation, 3) then
                TaskPlayAnim(Cache.self, LoadDict("anim@heists@fleeca_bank@drilling"), CurrentAnimation, 8.0, 8.0, -1, 1, 1, false, false, false)
            end
        end

        if speed > 0 then
            CurrentAnimation = "drill_straight_start"
            if not drillSound then
                drillSound = GetSoundId()
                PlaySoundFromEntity(drillSound, "Drill", drill, "DLC_HEIST_FLEECA_SOUNDSET", 1, 0)
            elseif HasSoundFinished(drillSound) then 
                ReleaseSoundId(drillSound)
                StopSound(drillSound)
                drillSound = GetSoundId()
                PlaySoundFromEntity(drillSound, "Drill", drill, "DLC_HEIST_FLEECA_SOUNDSET", 1, 0)
            end
        else
            CurrentAnimation = "drill_straight_idle"
            if drillSound then
                StopSound(drillSound)
                ReleaseSoundId(drillSound)
                drillSound = nil
            end
        end

        -- WHAT DOES THIS DO ???????????
        -- RequestTaskMoveNetworkStateTransition(Cache.self, "Cutting")
        -- SetTaskMoveNetworkSignalFloat(Cache.self, "drill_force", 1.0)
        -- SetTaskMoveNetworkSignalFloat(Cache.self, "z_axis", 1.0)

        local force, push = GetDisabledControlNormal(2, 229), (GetDisabledControlNormal(2, 273)*-1+0.0)
        if not tempCooldown then
            -- CALCULATION PART
            speed = (force * 0.79)

            local factor = 0.5
            if push > 0.0 then
                if (position > math.max(0.1, depth)) then
                    factor = speed * 0.25
                end
                position = position + (push * factor * Timestep()) 
                if position > depth and speed > 0 then
                    depth = position
                    if position >= 0.083 then
                        if push >= 0.04 then
                            temperature = math.min(1.0, temperature + 0.1 * push)
                        else
                            temperature = math.min(1.0, temperature + 0.1 * push^2)
                        end
                        if temperature == 1.0 then
                            tempCooldown = true
                            playedFail = false
                            speed = 0.0
                            SetParticleFxLoopedEvolution(ptfx.heat, "heat", 1.0, 0)
                            if drillSound then
                                StopSound(drillSound)
                                ReleaseSoundId(drillSound)
                                PlaySoundFromEntity(-1, "Drill_Jam", drill, "DLC_HEIST_FLEECA_SOUNDSET", 1, 0)
                                CurrentAnimation = "drill_straight_fail"
                            end
                        end
                    end

                    if position >= pin1 and position < pin2 and not played1 then
                        PlaySoundFrontend(-1, "Drill_Pin_Break", "DLC_HEIST_FLEECA_SOUNDSET", true)
                        played1 = true
                    elseif position >= pin2 and position < pin3 and not played2 then
                        PlaySoundFrontend(-1, "Drill_Pin_Break", "DLC_HEIST_FLEECA_SOUNDSET", true)
                        played2 = true
                    elseif position >= pin3 and position < pin4 and not played3 then
                        PlaySoundFrontend(-1, "Drill_Pin_Break", "DLC_HEIST_FLEECA_SOUNDSET", true)
                        played3 = true
                    elseif position >= pin4 and not played4 then
                        PlaySoundFrontend(-1, "Drill_Pin_Break", "DLC_HEIST_FLEECA_SOUNDSET", true)
                        played4 = true
                    end
                end
            else
                position = math.max(0.0, position + (push * Timestep()))
            end
        else
            if position > 0.0 then
                position = math.max(0.0, position - 0.025)
            end
        end

        if temperature > 0.0 then
            temperature = temperature - (Timestep()/(speed == 0.0 and 6 or 15))
            if temperature < 0.0 then temperature = 0.0 end
            if temperature <= 0.1 then tempCooldown = false end
        end

        -- HelpText(("POS: %s\nSPEED:%s\nDEPTH:%s\nTEMP: %s\nPUSH: %s"):format(position, speed, depth, temperature, push))
        if not tempCooldown then
            HelpText(Strings["Drilling"])
        else
            HelpText(Strings["Overheated"])
        end

        DisableAllControlActions(0)
        DisableAllControlActions(1)
        DisableAllControlActions(2)
        InvalidateIdleCam()

        -- SCALEFORM PART
        ThefeedHideThisFrame()
        HideHudAndRadarThisFrame()
        CallScaleformMovieMethodWithNumber(scaleform, "SET_SPEED", speed, -1082130432, -1082130432, -1082130432, -1082130432)
        CallScaleformMovieMethodWithNumber(scaleform, "SET_HOLE_DEPTH", depth, -1082130432, -1082130432, -1082130432, -1082130432)
        CallScaleformMovieMethodWithNumber(scaleform, "SET_DRILL_POSITION", position, -1082130432, -1082130432, -1082130432, -1082130432)
        CallScaleformMovieMethodWithNumber(scaleform, "SET_TEMPERATURE", temperature, -1082130432, -1082130432, -1082130432, -1082130432)
        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)

        -- SFX
        if drillSound then
            SetVariableOnSound(drillSound, "DrillState", ((position >= 0.083 and position >= depth and 1.0) or 0.0))
        end
        if not tempCooldown then
            SetParticleFxLoopedEvolution(ptfx.heat, "heat", 0.0, 0)
            if position >= 0.083 and position >= depth and speed > 0.0 then
                SetParticleFxLoopedEvolution(ptfx.debris, "power", 1.0, 0)
            else
                SetParticleFxLoopedEvolution(ptfx.debris, "power", 0.0, 0)
            end
        else
            SetParticleFxLoopedEvolution(ptfx.debris, "power", 0.0, 0)
            if temperature <= 0.925 then
                SetParticleFxLoopedEvolution(ptfx.heat, "heat", 0.0, 0)
            end
        end

        if IsDisabledControlJustReleased(0, 194) then
            break
        end
        
        if depth >= 0.8 then
            success = true
            break
        end
    end

    -- stop all particles
    for k, v in pairs(ptfx) do
        StopParticleFxLooped(v)
    end
    -- stop sound
    StopSound(drillSound)
    ReleaseSoundId(drillSound)
    
    DetachEntity(bag, 1, true)
    local dict = LoadDict("anim@heists@fleeca_bank@drilling")
    local scene = NetworkCreateSynchronisedScene(pos.xyz, 0.0, 0.0, pos.w, 2, true, false, 1065353216, 0, 1065353216)
    NetworkAddPedToSynchronisedScene(Cache.self, scene, dict, "outro", 1000.0, -8.0, 3341, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, scene, dict, "bag_outro_no_armour", 1000.0, -1000.0, 0)
    NetworkStartSynchronisedScene(scene)

    while true do
        Wait(0)
        if GetSynchronizedScenePhase(NetworkConvertSynchronisedSceneToSynchronizedScene(scene)) > 0.95 then
            DeleteEntity(drill)
            if GetSynchronizedScenePhase(NetworkConvertSynchronisedSceneToSynchronizedScene(scene)) > 0.99 then
                break
            end
        end
    end

    NetworkStopSynchronisedScene(scene)
    ToggleHud(true)
    ToggleBag(true)
    DeleteObject(bag)

    return success
end

RegisterNetEvent("loaf_heist:spawn_trolley")
AddEventHandler("loaf_heist:spawn_trolley", function(bank, trolley)
    TriggerServerEvent("loaf_heist:set_trolley", bank, trolley, 2)

    local data = Config.Banks[bank].Trolleys[trolley]
    local model = LoadModel(data.Object)
    if not GetBankData(bank, "hasmoney_"..trolley) then
        model = LoadModel(data.Empty)
    end
    if model.loaded then
        ClearAreaOfObjects(data.Position.xyz, 3.0, 1)
        Wait(50)
        local obj = CreateObject(model.model, data.Position.xyz, true)
        PlaceObjectOnGroundProperly(obj)
        SetEntityHeading(obj, data.Position.w)
        FreezeEntityPosition(obj, true)

        local netId = ObjToNet(obj)
        TriggerServerEvent("loaf_heist:set_trolley", bank, trolley, netId)
    end
end)

RegisterNetEvent("loaf_heist:sync_ptfx")
AddEventHandler("loaf_heist:sync_ptfx", function(data)
    local door = GetClosestObjectOfType(data.Pos, 3.0, GetHashKey(data.Object))
    if DoesEntityExist(door) then
        LoadPtfx("scr_ornate_heist")
        local smoke = StartNetworkedParticleFxLoopedOnEntity("scr_heist_ornate_thermal_burn", door, data.PtfxOffs, vector3(0.0, 0.0, 0.0), 0.5, vector3(0.0, 0.0, 0.0))
        Wait(6000)
        LoadPtfx("scr_ornate_heist")
        local drip = StartNetworkedParticleFxLoopedOnEntity("scr_heist_ornate_metal_drip", door, data.DripOffs, vector3(0.0, 0.0, 0.0), 1.0, vector3(0.0, 0.0, 0.0))
        Wait(5000)
        StopParticleFxLooped(smoke, 0)
        Wait(1000)
        SetParticleFxLoopedEvolution(drip, "DIE_OFF", 1.0, 0)
        Wait(3000)
        StopParticleFxLooped(drip, 0)
    end
end)

RegisterNetEvent("loaf_heist:delete_object")
AddEventHandler("loaf_heist:delete_object", function(netid)
    if NetworkDoesNetworkIdExist(netid) then
        local obj = NetToObj(netid)
        if DoesEntityExist(obj) then
            DeleteEntity(obj)
        end
    end
end)