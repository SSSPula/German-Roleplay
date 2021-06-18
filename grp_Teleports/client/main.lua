ESX                           = nil

local PlayerData              = {}

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
        Citizen.Wait(1)
    end

    while ESX.GetPlayerData() == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()

    LoadMarkers2()
end) 

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)



function LoadMarkers2()
    Citizen.CreateThread(function()
    
        while true do
            Citizen.Wait(5)

            local plyCoords = GetEntityCoords(PlayerPedId())

            for location, val in pairs(Config.Teleport2ers) do

                local Enter = val['Enter']
                local Exit = val['Exit']
                local JobNeeded = val['Job']

                local dstCheckEnter, dstCheckExit = GetDistanceBetweenCoords(plyCoords, Enter['x'], Enter['y'], Enter['z'], true), GetDistanceBetweenCoords(plyCoords, Exit['x'], Exit['y'], Exit['z'], true)

                if dstCheckEnter <= 7.5 then
                    if JobNeeded ~= 'none' then
                       

                            DrawM(Enter['Information'], 27, Enter['x'], Enter['y'], Enter['z'])

                            if dstCheckEnter <= 1.2 then
                                if IsControlJustPressed(0, 38) then
                                    Teleport2(val, 'enter')
                                end
                            end

                        
                        DrawM(Enter['Information'], 27, Enter['x'], Enter['y'], Enter['z'])

                        if dstCheckEnter <= 1.2 then

                            if IsControlJustPressed(0, 38) then
                                Teleport2(val, 'enter')
                            end

                        end

                    end
                end

                if dstCheckExit <= 7.5 then
                    if JobNeeded ~= 'none' then
                       
                            DrawM(Exit['Information'], 27, Exit['x'], Exit['y'], Exit['z'])

                            if dstCheckExit <= 1.2 then
                                if IsControlJustPressed(0, 38) then
                                    Teleport2(val, 'exit')
                                end
                            end

                        
                    else

                        DrawM(Exit['Information'], 27, Exit['x'], Exit['y'], Exit['z'])

                        if dstCheckExit <= 1.2 then

                            if IsControlJustPressed(0, 38) then
                                Teleport2(val, 'exit')
                            end

                        end
                    end
                end

            end

        end

    end)
end

local playerPed = PlayerPedId(-1)

function Teleport2(table, location)
	local playerPed = PlayerPedId(-1)
    if location == 'enter' then
        DoScreenFadeOut(100)

        Citizen.Wait(750)

        ESX.Game.Teleport(PlayerPedId(), table['Exit'])
		FreezeEntityPosition(playerPed, true)
        DoScreenFadeIn(100)
		Citizen.Wait(2000)
		FreezeEntityPosition(playerPed, false)
    else
        DoScreenFadeOut(100)

        Citizen.Wait(750)

        ESX.Game.Teleport(PlayerPedId(), table['Enter'])
		FreezeEntityPosition(playerPed, true)
		DoScreenFadeIn(100)
		Citizen.Wait(1500)
		FreezeEntityPosition(playerPed, false)
    end
end


function DrawM(hint, type, x, y, z)
--	ESX.Game.Utils.DrawText3D({x = x, y = y, z = z + 1.0}, hint, 0.4)
	DrawMarker(type, x, y, z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 255, 255, 255, 100, false, true, 2, false, false, false, false)
end
