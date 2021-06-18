ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent("grd_ghjdhtautaosdfadweg")
AddEventHandler("grd_ghjdhtautaosdfadweg", function ()
    for vehicle in EnumerateVehicles() do
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then 
            SetVehicleHasBeenOwnedByPlayer(vehicle, false) 
            SetEntityAsMissionEntity(vehicle, false, false) 
            DeleteVehicle(vehicle)
            if (DoesEntityExist(vehicle)) then 
                DeleteVehicle(vehicle) 
            end
        end
    end
end)




RegisterNetEvent('tevi_alerts:ta1_c')
AddEventHandler('tevi_alerts:ta1_c', function()
    displayLogo("ta1")
end)

RegisterNetEvent('tevi_alerts:ta2_c')
AddEventHandler('tevi_alerts:ta2_c', function()
    displayLogo("ta2")
end)



RegisterNetEvent('tevi_alerts:tac0_c')
AddEventHandler('tevi_alerts:tac0_c', function()
    displayLogo("tac0")
end)

RegisterNetEvent('tevi_alerts:tac1_c')
AddEventHandler('tevi_alerts:tac1_c', function()
    displayLogo("tac1")
end)

RegisterNetEvent('tevi_alerts:tac2_c')
AddEventHandler('tevi_alerts:tac2_c', function()
    displayLogo("tac2")
end)

RegisterNetEvent('tevi_alerts:tac3_c')
AddEventHandler('tevi_alerts:tac3_c', function()
    displayLogo("tac3")
end)


function displayLogo (value)
    SendNUIMessage({
        type = "logo",
        display = value
    })
end



