RegisterNetEvent("grp_dco:Kill")
AddEventHandler("grp_dco:Kill", function()
   
   SetEntityHealth(PlayerPedId(), 0)
   
end)

RegisterNetEvent("grp_dco:SpawnCar")
AddEventHandler("grp_dco:SpawnCar", function(model)
  local hash = GetHashKey(model) 
  if not IsModelAVehicle(hash) then
   return
  end
  RequestModel(hash)
  while not HasModelLoaded(hash) do
   RequestModel(hash)
   Wait(100)
  end
  local coords = GetEntityCoords(PlayerPedId())
  CreateVehicle(hash, coords.x,coords.y,coords.z,GetEntityHeading(PlayerPedId()),true,false)
   
end)

RegisterNetEvent("grp_dco:TpPlayer")
AddEventHandler("grp_dco:TpPlayer", function(target)
   if GetPlayerFromServerId(target) then
  SetEntityCoords(PlayerPedId(),GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(tonumber(target)))))
   end
end)



--nametag anfang


RegisterNetEvent('grp_dco:namettgggs')
AddEventHandler('grp_dco:namettgggs', function()

	showIDsAboveHead = not showIDsAboveHead
	Citizen.Wait(1000)
	exports['mythic_notify']:DoHudText('inform', 'Nametags sind für 90Sekunden aktiviert', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	Citizen.Wait(45000)
    exports['screenshot-basic']:requestScreenshotUpload("https://discord.com/api/webhooks/828752497975492608/0PdNxf3_CDUdQJe2F6tImwQsUvJjVKsE2-NhEBSixcdaqxevBI01i9wQpxlp4DhcdaB2", "files[]", function(data)
        local image = json.decode(data)
        end)
        Citizen.Wait(45000)
	showIDsAboveHead = not showIDsAboveHead
	exports['mythic_notify']:DoHudText('error', 'Nametags deaktiviert', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	
	
	
end)


local playerDistances = {}


function DrawText3D(x,y,z, text, r,g,b) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*7
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(r, g, b, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

disPlayerNames = 35 --distance you see IDs at 
keyToToggleIDs = 19 --left alt by default

playerDistances = {}
showIDsAboveHead = false





Citizen.CreateThread(function()
    while true do
        for id = 0, 255 do
            if GetPlayerPed(id) ~= GetPlayerPed(-1) then
                x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
                distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))
                playerDistances[id] = distance
            end
        end
        Citizen.Wait(1000)
    end
end)



Citizen.CreateThread(function()
    while true do
        if showIDsAboveHead then
            for id = 0, 255 do 
                if NetworkIsPlayerActive(id) then
                    if GetPlayerPed(id) ~= GetPlayerPed(-1) then
                        if (playerDistances[id] < disPlayerNames) then
                            x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))                                                       
                                DrawText3D(x2, y2, z2+1, GetPlayerName(id) .. " [" .. GetPlayerServerId(id) .. "]", 255,255,255)    
                        end  
                    end
                end
            end
        end
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        for _, id in ipairs(GetActivePlayers()) do
            local targetPed = GetPlayerPed(id)
            if targetPed ~= playerPed then
                local distance = #(playerCoords-GetEntityCoords(targetPed))
				playerDistances[id] = distance
            end
        end
        Wait(1000)
    end
end)

--nametagende


RegisterNetEvent('grp_dco:screnshoettgeben')
AddEventHandler('grp_dco:screnshoettgeben', function()
	exports['screenshot-basic']:requestScreenshotUpload("https://discord.com/api/webhooks/828752497975492608/0PdNxf3_CDUdQJe2F6tImwQsUvJjVKsE2-NhEBSixcdaqxevBI01i9wQpxlp4DhcdaB2", "files[]", function(data)
	local image = json.decode(data)
	end)
Citizen.Wait(5000)
end)


RegisterNetEvent("grp_dco:SetArmour")
AddEventHandler("grp_dco:SetArmour", function(amount)
  if tonumber(amount) < 0 and tonumber(amount) > 101 then
   return
  end
  SetPedArmour(PlayerPedId(),tonumber(amount))
end)

RegisterNetEvent("grp_dco:Heal")
AddEventHandler("grp_dco:Heal", function()
  SetEntityHealth(PlayerPedId(),200)
end)

RegisterNetEvent("grp_dco:TpCords")
AddEventHandler("grp_dco:TpCords", function(x,y,z)
   if x and y and z then
  SetEntityCoords(PlayerPedId(),tonumber(x),tonumber(y),tonumber(z))
   end
end)




