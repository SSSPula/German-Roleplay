Loaded = false
ESX = nil

CreateThread(function()
    while not NetworkIsSessionStarted() do 
        Wait(250)
    end

    if Strings then
        while ESX == nil do
            TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj)
                ESX = obj
            end)
            Wait(250)
        end

        while ESX.GetPlayerData().job == nil do -- Wait for character (job) to load (support for kashacters, etc)
            Wait(250)
        end

        Loaded = true
    end
end)

HelpText = function(text, sound)
    AddTextEntry(GetCurrentResourceName(), text)
    BeginTextCommandDisplayHelp(GetCurrentResourceName())
    EndTextCommandDisplayHelp(0, 0, (sound == true), -1)
end

AddBlip = function(coords, sprite, colour, label)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, colour)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(label)
    EndTextCommandSetBlipName(blip)

    return blip
end