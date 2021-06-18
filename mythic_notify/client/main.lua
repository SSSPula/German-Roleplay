RegisterNetEvent('mythic_notify:client:SendAlert')
AddEventHandler('mythic_notify:client:SendAlert', function(data)
	DoCustomHudText(data.type, data.text, data.length, data.style)
end)

RegisterNetEvent('mythic_notify:client:PersistentHudText')
AddEventHandler('mythic_notify:client:PersistentHudText', function(data)
	PersistentHudText(data.action, data.id, data.type, data.text, data.style)
end)

function DoShortHudText(type, text, style)
	SendNUIMessage({
		type = type,
		text = text,
		length = 3500,
		style = style
	})
end

function SendAlert(type, text, style)
	SendNUIMessage({
		type = type,
		text = text,
		length = 4500,
		style = style
	})
end

function DoHudText(type, text, style)
	SendNUIMessage({
		type = type,
		text = text,
		length = 5000,
		style = style
	})
end

function DoLongHudText(type, text, style)
	SendNUIMessage({
		type = type,
		text = text,
		length = 5000,
		style = style
	})
end

function DoCustomHudText(type, text, length, style)
	SendNUIMessage({
		type = type,
		text = text,
		length = length,
		style = style
	})
end

RegisterCommand('testnotify', function()
	DoHudText('inform', 'Test Notifty! Test Notifty! Test Notifty! Test Notifty! Test Notifty! Test Notifty! Test Notifty! Test Notifty!')
	DoHudText('error', 'Test Notifty! Test Notifty! Test Notifty! Test Notifty! Test Notifty! Test Notifty! Test Notifty! Test Notifty!')
	DoHudText('success', 'Test Notifty! Test Notifty! Test Notifty! Test Notifty! Test Notifty! Test Notifty! Test Notifty! Test Notifty!')
end)


function PersistentHudText(action, id, type, text, style)
	if action:upper() == 'START' then
		SendNUIMessage({
			persist = action,
			id = id,
			type = type,
			text = text,
			style = style
		})
	elseif action:upper() == 'END' then
		SendNUIMessage({
			persist = action,
			id = id
		})
	end
end