local crosshair = true
local toggled = false
local aiming = false
Citizen.CreateThread(function()
    while true do
        Wait(100)
        if crosshair then
            if aiming then
                if not toggled then
                    toggled = true
                    SendNUIMessage({
                        display = "crosshairShow",
                    })
                end
            else
                SendNUIMessage({
                    display = "crosshairHide",
                })
            end
        else
            SendNUIMessage({
                display = "crosshairHide",
            })
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if IsPedArmed(PlayerPedId(), 6) then
            local carcam = GetFollowVehicleCamViewMode()
            local cam = GetFollowPedCamViewMode()
            if cam ~= 4 or carcam ~= 4 then
                if (IsPlayerFreeAiming(PlayerId()))  then
                    aiming = true
                else
                    aiming = false
                    toggled = false
                    Wait(100)
                end
            else
                aiming = false
                toggled = false
                SendNUIMessage({
                    display = "crosshairHide",
                })
                Wait(100)
            end
        else
            Wait(100)
        end
    end
end)



Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
        local ped = GetPlayerPed(-1)
        if IsPedShooting(ped) then
            local hasTarget, targetEntity = GetEntityPlayerIsFreeAimingAt(PlayerId())
            if hasTarget then    
                Citizen.CreateThread(function()
                    Citizen.Wait(30)
                    local messageSent = false
                    local timer = 20
                    while not messageSent and timer >=0 do
                        Citizen.Wait(50)
                        if GetEntityType(targetEntity) == 1 and IsPedDeadOrDying(targetEntity, true) then
                            
                            local deathTime, time = GetPedTimeOfDeath(targetEntity), GetGameTimer()
                            if GetPedSourceOfDeath(targetEntity) == ped and deathTime >= time - 500 then
                                messageSent = true
                                SendNUIMessage({
                                    display = 'hitMarkerChangeColor',
                                    color = 'red',
                                    scaleUp = true
                                })
                            else
                                timer = -1
                            end
                        end
                    end
                end)
            end
            
            local deathTime, time = GetPedTimeOfDeath(targetEntity), GetGameTimer()
            
            -- Hitting ped
            if GetEntityType(targetEntity) == 1 then
                if deathTime >= time - 500 or deathTime == 0 then
                    Citizen.CreateThread(function()
                        TriggerEvent('InteractSound_CL:PlayOnOne', 'hit-tick-sound', 0.6)
                        SendNUIMessage({
                            display = 'hitMarkerShow',
                            color = 'white'
                        })
                        Citizen.Wait(190)
                        SendNUIMessage({
                            display = 'hitMarkerHide'
                        })
                    end)
                end
                
                -- Hitting vehicle
            elseif GetEntityType(targetEntity) == 2 then
                TriggerEvent('InteractSound_CL:PlayOnOne', 'hit-tick-sound', 0.6)
                SendNUIMessage({
                    display = 'hitMarkerShow',
                    color = 'grey'
                })
                Citizen.Wait(190)
                SendNUIMessage({
                    display = 'hitMarkerHide'
                })
            end
        end
	end
end)

