local show = false
function openGui()
  if show == false then
    show = true
    SetNuiFocus(true, true)

    SendNUIMessage(
      {
        show = true
      }
    )
  end
end

function closeGui()
  show = false
  SetNuiFocus(false)
  SendNUIMessage({show = false})
end

RegisterCommand('bugreport', function(source)
	openGui()
end)

RegisterCommand('bug', function(source)
	openGui()
end)

RegisterCommand('fehler', function(source)
	openGui()
end)

RegisterCommand('developer', function(source)
	openGui()
end)

RegisterCommand('entwickler', function(source)
	openGui()
end)

RegisterNetEvent("BugreportUI:openGui")
AddEventHandler("BugreportUI:openGui", function(user_id)
	user_id = user_id
    openGui()
end)

RegisterNUICallback("sendReport", function(data)
  discord = data['data'][1]
  description = data['data'][2]
  if (discord == "" or description == "") then

  else
    TriggerServerEvent("BugreportUI:sendReport", data)
  end

end)

RegisterNetEvent("BugreportUI:reportSent")
AddEventHandler("BugreportUI:reportSent", function(user_id)
	user_id = user_id
    closeGui()
end)

RegisterNUICallback("close", function()
	closeGui()
end)
