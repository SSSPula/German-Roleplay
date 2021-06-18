CreateThread(function()
    while not Cache.loaded do
        Wait(0)
    end

    while true do
        Wait(500)
        
        for k, v in pairs(Config.Motels) do
            if #(Cache.coords - v.Location.xyz) <= 50.0 then
                while (not Cache.owned or Cache.owned.motel == k) and #(Cache.coords - v.Location.xyz) <= 1.0 do
                    Wait(0)
                    local rent = 0
                    if Cache.owned and Cache.owned.motel == k then
                        if v.Rent then
                            rent = Config.Prices[Cache.owned.interior.Id]
                        end
                        DrawTxt3D(v.Location.xyz, (Strings["manage_rent"]):format(rent), true)
                    else
                        DrawTxt3D(v.Location.xyz, Strings["purchase_room"], true)
                    end

                    if IsControlJustReleased(0, Config.Options.Control) then
                        if Cache.owned and Cache.owned.motel == k then
                            ESX.UI.Menu.CloseAll()

                            local elements = {
                                {label = Strings["stop_rent"], value = "sell"}
                            }
                            if rent > 0 then
                                table.insert(elements, {label = Strings["deposit_money"], value = "deposit"})
                                table.insert(elements, {label = (Strings["rent_due"]):format(math.floor(Cache.owned.rent_due/(24*60*60)))})
                                table.insert(elements, {label = (Strings["balance"]):format(Cache.owned.money)})
                            end
                            
                            ESX.UI.Menu.Open("default", GetCurrentResourceName(), "manage_rent", {
                                title = v.Name,
                                align = Config.Options.Align,
                                elements = elements
                            }, function(data, menu)
                                if data.current.value == "sell" then
                                    TriggerServerEvent("loaf_motel:sell", Cache.owned)
                                    menu.close()
                                elseif data.current.value == "deposit" then
                                    ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "to_deposit", {
                                        title = Strings["amount"]
                                    }, function(data2, menu2)
                                        local amount = tonumber(data2.value)
                                        if amount and amount > 0 then
                                            TriggerServerEvent("loaf_motel:deposit_rent", amount)
                                            menu2.close()
                                            menu.close()
                                        else
                                            ESX.ShowNotification(Strings["invalid_amount"])
                                        end
                                    end, function(data2, menu2)
                                        menu2.close()
                                    end)
                                end
                            end, function(data, menu)
                                menu.close()
                            end)
                        else
                            ESX.UI.Menu.CloseAll()

                            local elements = {}
                            if not v.Rent then
                                table.insert(elements, {
                                    label = Strings["claim_room"],
                                    value = "rent"
                                })
                            else
                                local rent = Config.Prices[v.Interiors[1]]
                                table.insert(elements, {
                                    label = (Strings["rent_room"]:format(rent)),
                                    value = "rent"
                                })
                            end
                            
                            ESX.UI.Menu.Open("default", GetCurrentResourceName(), "motel_menu", {
                                title = v.Name,
                                align = Config.Options.Align,
                                elements = elements
                            }, function(data, menu)
                                if data.current.value == "rent" then
                                    ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "room_to_get", {
                                        title = (Strings["what_room"]):format(1, #v.Rooms)
                                    }, function(data2, menu2)
                                        local room = tonumber(data2.value)
                                        if room and room >= 1 and room <= #v.Rooms then
                                            TriggerServerEvent("loaf_motel:purchase", k, room)

                                            menu2.close()
                                            menu.close()
                                        else
                                            ESX.ShowNotification(Strings["invalid_room"])
                                        end
                                    end, function(data2, menu2)
                                        menu2.close()
                                    end)
                                end
                            end, function(data, menu)
                                menu.close()
                            end)

                            while ESX.UI.Menu.IsOpen("default", GetCurrentResourceName(), "motel_menu") do
                                Wait(250)
                                if #(Cache.coords - v.Location.xyz) > 1.0 then
                                    ESX.UI.Menu.CloseAll()
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)