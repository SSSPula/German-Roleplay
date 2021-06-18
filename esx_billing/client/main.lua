ESX = nil
local isDead = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function ShowBillsMenu()
	ESX.TriggerServerCallback('esx_billing:getBills', function(bills)
		if #bills > 0 then
			ESX.UI.Menu.CloseAll()
			local elements = {}

			for k,v in ipairs(bills) do
				table.insert(elements, {
					label  = ('%s - <span style="color:red;">%s</span>'):format(v.label, _U('invoices_item', ESX.Math.GroupDigits(v.amount))),
					billId = v.id
				})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'billing', {
				title    = _U('invoices'),
				align    = 'top-left',
				elements = elements
			}, function(data, menu)
				menu.close()

				ESX.TriggerServerCallback('esx_billing:payBill', function()
					ShowBillsMenu()
				end, data.current.billId)
			end, function(data, menu)
				menu.close()
			end)
		else
			exports['mythic_notify']:SendAlert('success', 'Aktuell liegen dir keine Rechnungen vor!', 2500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
			--ESX.ShowNotification(_U('no_invoices'))
		end
	end)
end

RegisterCommand('showbills', function()
	if not isDead and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'billing') then
		ShowBillsMenu()
	end
end, false)


AddEventHandler('esx:onPlayerDeath', function() isDead = true end)
AddEventHandler('esx:onPlayerSpawn', function(spawn) isDead = false end)

--custom code for rgz_menu, disabled F7
RegisterNetEvent("esx_billing:openBillings")
    AddEventHandler("esx_billing:openBillings", function()
            ShowBillsMenu()
    end)
