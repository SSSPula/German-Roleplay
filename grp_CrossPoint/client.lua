local crosshair = false
local toggled = false
local aiming = true
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


RegisterCommand("crosspoint", function(source)
	

            local carcam = GetFollowVehicleCamViewMode()
            local cam = GetFollowPedCamViewMode()
            if crosshair then
                            crosshair = false
                            toggled = false
                        else
                            crosshair = true
                            toggled = false
            end


end)



