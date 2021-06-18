Loaded = false

CreateThread(function()
    while not NetworkIsSessionStarted() do Wait(50) end

    Wait(1000)

    for k, v in pairs(Config.MiningPositions) do 
        AddBlip(v.xyz, 85, 5, Strings['mining'], 0.75)
    end

    --AddBlip(Config.Sell, 207, 2, Strings['sell_mine'], 0.75)

    Loaded = true
end)

Notify = function(msg)
    TriggerEvent('esx:showNotification', msg)
end

PressRandomKey = function()
    collectgarbage() -- ram leak fix
    local keys = Config.keys
    local randomKey = math.random(1, #keys)

    local time = math.random(100, 125) * 10
    local timer = GetGameTimer() + time
    while timer >= GetGameTimer() or (timer - GetGameTimer() > 0) do
        -- DrawTxt(Strings['press']:format(GetControlInstructionalButton(0, keys[randomKey][2], 1):gsub('t_', '')), 0.5, 0.5, 0, 0.3)

        AddTextEntry('helptextXDD', Strings['press']:format(keys[randomKey][1]))
        BeginTextCommandDisplayHelp('helptextXDD')
        EndTextCommandDisplayHelp(1, 0, 0, 0)
        SetFloatingHelpTextScreenPosition(0, 0.425, 0.5)

        DrawPercent(((timer - GetGameTimer()) / time) * 100, 0.5, 0.6)

        for k, v in pairs(keys) do
            DisableControlAction(0, v[2], true)
        end

        if IsDisabledControlJustReleased(0, keys[randomKey][2]) then
            return true
        end

        Wait(0)
    end

    return false
end

DrawPercent = function(percent, x, y)
    if percent > 0 and percent <= 100 then
        DrawRect(x, y, 0.203, 0.02, 0, 0, 0, 255)
        DrawRect(x, y, 0.2, 0.015, 255, 35, 40, 255)
        DrawRect(x, y, (percent*2)/1000, 0.015, 35, 255, 40, 255) -- https://gyazo.com/b5585d3baa709374c7f4752040461599
        -- DrawRect(x - (100 - percent) / 1000, y, (percent*2)/1000, 0.015, 35, 255, 40, 255) -- https://gyazo.com/fe695dfc06f23ca362cc7c0b244a8184
        -- DrawRect(x + (100 - percent) / 1000, y, (percent*2)/1000, 0.015, 35, 255, 40, 255) -- https://gyazo.com/0d8d884b8f98893550daedff4873202c
    end
end

AddBlip = function(coords, sprite, colour, text, scale)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, colour)
    SetBlipScale(blip, scale)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
end

DrawTxt = function(text, x, y, font, scale)
    SetTextColour(255, 255, 255, 255)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextEdge(1, 0, 0, 0, 205)
    SetTextDropShadow()
    SetTextCentre(true)
    SetTextEntry('STRING')
    AddTextComponentString(text)
    DrawText(x, y)
end