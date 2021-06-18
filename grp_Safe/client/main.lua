
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


--easy neue safes hinzufügen by Ph4rus (spaß. ist made by grd)

local safes = {
	{ ['x'] = 1150.76, ['y'] = 103.01, ['z'] = 80.02},  --lshub2
	{ ['x'] = -1619.76, ['y'] = -1043.01, ['z'] = 12.15},  --lshub
	{ ['x'] = 2358.16, ['y'] = 3129.51, ['z'] = 47.21}, --sandy 
	{ ['x'] = 440.76, ['y'] = 6458.01, ['z'] = 27.75},  --paleto
}

local safean = true


function DrawSub(text, time)
	ClearPrints()
	BeginTextCommandPrint('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandPrint(time, 1)
end





RegisterNetEvent('grp_Safe:kleiderldasdaauf')
AddEventHandler('grp_Safe:kleiderldasdaauf', function()
KleiderSchrank()

end)



Citizen.CreateThread(function()
    local peds = {
        `a_f_y_hiker_01`,
    }
    exports['bt-target']:AddTargetModel(peds, {
        options = {
            {
                event = "grp_Safe:kleiderldasdaauf",
                icon = "fas fa-tshirt",
                label = "Umziehen",
            },
        },
        job = {"all"},
        distance = 2.5
    })
end)


RegisterCommand("umziehen", function(source)
	ESX.TriggerServerCallback('grd_Pets:Gruppegetten', function(plyGroup)
		if plyGroup == 'superadmin' or plyGroup == 'admin' then
		
			KleiderSchrank()
		
		else
		exports['mythic_notify']:SendAlert('error', 'Du musst Admin sein.!', 2500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
		end
		end)
end)


--kleiderMenu
function KleiderSchrank()
	local playerPed = PlayerPedId()
	

	local elements = {
		{ label = ("Kleidung anziehen"), value = 'player_dressing' },
		{ label = ("Kleidung wegwerfen"), value = 'remove_cloth' }
	}


	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = ("Kleiderschrank"),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		

		if data.current.value == 'player_dressing' then
			ESX.TriggerServerCallback('grp_Safe:getPlayerDressing', function(dressing)
				local elements = {}

				for i=1, #dressing, 1 do
					table.insert(elements, {
						label = dressing[i],
						value = i
					})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing', {
					title    = ("Kleidung"),
					align    = 'top-left',
					elements = elements
				}, function(data2, menu2)
					TriggerEvent('skinchanger:getSkin', function(skin)
						ESX.TriggerServerCallback('grp_Safe:getPlayerOutfit', function(clothes)
							TriggerEvent('skinchanger:loadClothes', skin, clothes)
							TriggerEvent('esx_skin:setLastSkin', skin)

							TriggerEvent('skinchanger:getSkin', function(skin)
								TriggerServerEvent('esx_skin:save', skin)
							end)
						end, data2.current.value)
					end)
				end, function(data2, menu2)
					menu2.close()
				end)
			end)

		elseif data.current.value == 'remove_cloth' then

			ESX.TriggerServerCallback('grp_Safe:getPlayerDressing', function(dressing)
				local elements = {}

				for i=1, #dressing, 1 do
					table.insert(elements, {
						label = dressing[i],
						value = i
					})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'remove_cloth', {
					title    = ("Kleidung wegwerfen"),
					align    = 'top-left',
					elements = elements
				}, function(data2, menu2)
					menu2.close()
					TriggerServerEvent('grp_Safe:removeOutfit', data2.current.value)
					ESX.ShowNotification(_U('removed_cloth'))
				end, function(data2, menu2)
					menu2.close()
				end)
			end)

		
		end

	end, function(data, menu)
		menu.close()
	end)
end

--ende





function OpenRoomMenu()
	local entering = nil
	local elements = {{label = ('Gegenstände aus dem Safe nehmen'),  value = 'room_inventory'}}

	

	

	table.insert(elements, {label = ('Gegenstände in den Safe einlagern'), value = 'player_inventory'})

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'room', {
		title    = "Safe",
		align    = 'top-left',
		elements = elements
	}, function(data, menu)

		if data.current.value == 'room_inventory' then
			OpenRoomInventoryMenu()
			PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
		elseif data.current.value == 'player_inventory' then
			OpenPlayerInventoryMenu()
			PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
		end

	end, function(data, menu)
		menu.close()
		SetTimecycleModifier('default')
	end)
end

function OpenRoomInventoryMenu()
	ESX.TriggerServerCallback('grp_Safe:getPropertyInventory', function(inventory)
		local elements = {}

		if inventory.blackMoney > 0 then
			table.insert(elements, {
				label = _U('dirty_money', ESX.Math.GroupDigits(inventory.blackMoney)),
				type = 'item_account',
				value = 'black_money'
			})
		end

		local item 
		for i=1, #inventory.items, 1 do
		if inventory.items[i] then 
			item = inventory.items[i]
			
			if item.count and item.label and item.name then
				if item.count > 0 then
					table.insert(elements, {
						label = item.label .. ' x' .. item.count,
						type = 'item_standard',
						value = item.name
					})
				end
			end
		end
		end


		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'room_inventory', {
			title    = ('Safe'),
			align    = 'top-left',
			elements = elements
		}, function(data, menu)

			if data.current.type == 'item_weapon' then
				menu.close()

				TriggerServerEvent('grp_Safe:getItem',  data.current.type, data.current.value, data.current.index)
				ESX.SetTimeout(300, function()
					OpenRoomInventoryMenu()
				end)
			else
				
				local keyboard = exports["nh-keyboard"]:KeyboardInput({
				header = "Gegenstand auslagern", 
				rows = {
					{
						id = 0, 
						txt = "Anzahl"
					}
				}
				})
				
				
				local quantity = tonumber(keyboard)
					if quantity == nil then
						ESX.ShowNotification(_U('amount_invalid'))
					else
						menu.close()

						TriggerServerEvent('grp_Safe:getItem',  data.current.type, data.current.value, quantity)
						PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
						ESX.SetTimeout(300, function()
							OpenRoomInventoryMenu()
						end)
					end
				
			end
		end, function(data, menu)
			menu.close()
			
		end)
	end)
end



function OpenPlayerInventoryMenu()
	ESX.TriggerServerCallback('grp_Safe:getPlayerInventory', function(inventory)
		local elements = {}

		if inventory.blackMoney > 0 then
			table.insert(elements, {
				label = _U('dirty_money', ESX.Math.GroupDigits(inventory.blackMoney)),
				type  = 'item_account',
				value = 'black_money'
			})
		end

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type  = 'item_standard',
					value = item.name
				})
			end
		end


		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_inventory', {
			title    = ('Safe'),
			align    = 'top-left',
			elements = elements
		}, function(data, menu)

			if data.current.type == 'item_weapon' then
				menu.close()
				TriggerServerEvent('grp_Safe:putItem',  data.current.type, data.current.value, data.current.ammo)

				ESX.SetTimeout(300, function()
					OpenPlayerInventoryMenu()
				end)
			else
			--SetTimecycleModifier('hud_def_blur')
			--SetTimecycleModifier('default')
				local keyboard2 = exports["nh-keyboard"]:KeyboardInput({
				header = "Gegenstand einlagern", 
				rows = {
					{
						id = 0, 
						txt = "Anzahl"
					}
				}
				})
					local quantity = tonumber(keyboard2)

					if quantity == nil then
						ESX.ShowNotification(('Anzahl ungültig'))
					else
						menu.close()
						
						TriggerServerEvent('grp_Safe:putItem',  data.current.type, data.current.value, quantity)
						PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
						ESX.SetTimeout(300, function()
							OpenPlayerInventoryMenu()
						end)
					end
			end
		end, function(data, menu)
			menu.close()
			
		end)
	end)
end




local closestZone = 1

Citizen.CreateThread(function()
	while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
	
	while true do
		local playerPed = GetPlayerPed(-1)
		local x, y, z = table.unpack(GetEntityCoords(playerPed, true))
		local minDistance = 100000
		for i = 1, #safes, 1 do
			dist = Vdist(safes[i].x, safes[i].y, safes[i].z, x, y, z)
			if dist < minDistance then
				minDistance = dist
				closestZone = i
			end
		end
		Citizen.Wait(15000)
	end
end)


RegisterNetEvent('grp_Safe:safean')
AddEventHandler('grp_Safe:safean', function()

safean = true

end)

RegisterNetEvent('grp_Safe:safeaus')
AddEventHandler('grp_Safe:safeaus', function()

safean = false

end)



-- Enter / Exit marker events & Draw markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local player = GetPlayerPed(-1)
		local x,y,z = table.unpack(GetEntityCoords(player, true))
		local dist = Vdist(safes[closestZone].x, safes[closestZone].y, safes[closestZone].z, x, y, z)
		
		
		
		--neuer safepunkt
		
		if dist < 30 then
				DrawMarker(1, safes[closestZone].x, safes[closestZone].y, safes[closestZone].z, 0, 0, 0, 0, 0, 0, 10.0, 10.0, 0.5, 50, 255, 255, 70, 0, 0, 2, 0, 0, 0, 0) 
				letSleep = false
		end
	
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), safes[closestZone].x, safes[closestZone].y, safes[closestZone].z, true) < 5 then
			showHelpNotification("Drücke [E] um den Safe zu öffnen")
			if (IsControlJustPressed(1, 38)) then
				if safean then
				OpenRoomMenu()
				SetTimecycleModifier('hud_def_blur')
				PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
				else
				exports['mythic_notify']:DoHudText('error', 'Eine Sonnenwende steht bevor, dein Safe ist verschlossen.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
				end	
			end
		end
	end
end)

function showHelpNotification(msg)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, 0, 1, -1)
end
