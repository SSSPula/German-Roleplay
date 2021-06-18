local dvKFnbCVkf31234e454GcKDjfeeeegiBB = false
local dvKFnbCVkYMADD4e454GcKDjfeeeegiBB = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.CircleZones.LicenseShop.coords, true) < 5 then
			if not dvKFnbCVkf31234e454GcKDjfeeeegiBB then
				checkjob()
			end
		--[[else
			if dvKFnbCVkYMADD4e454GcKDjfeeeegiBB then
				dvKFnbCVkYMADD4e454GcKDjfeeeegiBB = false
				ESX.UI.Menu.CloseAll()
			end

			Citizen.Wait(500)--]]
		end
	end
end)


function dvKFnbCVkYsdfe454GcKDjfeeeegiBB()
	ESX.UI.Menu.CloseAll()
	local dfffKFnbCVkYsdfe454GcKDjfeeeegiBB = {}
	dvKFnbCVkf31234e454GcKDjfeeeegiBB = true

	for k, v in pairs(ESX.GetPlayerData().inventory) do
		local price = Config.Licenses[v.name]

		if price and v.count >= 0 then
			table.insert(dfffKFnbCVkYsdfe454GcKDjfeeeegiBB, {
				label = ('%s - <span style="color:green;">%s</span>'):format("Buy " .. v.label, _U('dealer_item', ESX.Math.GroupDigits(price))),
				name = v.name,
				price = price,

			})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'license_shop', {
		title    = _U('licenseshop_title'),
		align    = 'top-left',
		dfffKFnbCVkYsdfe454GcKDjfeeeegiBB = dfffKFnbCVkYsdfe454GcKDjfeeeegiBB
	}, function(data, menu)
		TriggerServerEvent('esx_illegal:buyLisense2', data.current.name)
	end, function(data, menu)
		menu.close()
		dvKFnbCVkf31234e454GcKDjfeeeegiBB = false
	end)
end

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		if dvKFnbCVkf31234e454GcKDjfeeeegiBB then
			ESX.UI.Menu.CloseAll()
		end
	end
end)