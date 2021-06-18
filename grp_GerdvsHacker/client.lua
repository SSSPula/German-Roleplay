RegisterNetEvent("jumpscare:toggleNUI")
AddEventHandler("jumpscare:toggleNUI", function(display)
    SendNUIMessage({
    type = "ui",
    display = display
  })
end)

RegisterNetEvent("gerdown:toggleNUI")
AddEventHandler("gerdown:toggleNUI", function(display)
    SendNUIMessage({
    type = "gerd",
    display = display
  })
end)



RegisterCommand("hs", function(source, args, rawCommand)	 
      local target = args[1]
      ExecuteCommand("klopfenon " .. target)
	  exports['mythic_notify']:DoHudText('inform', 'Es Klopft bei dem User an der Tür....', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	  Citizen.Wait(3000)
      ExecuteCommand("jumpscareon " .. target)
	  exports['mythic_notify']:DoHudText('inform', 'Es wird warscheinlich sehr einfach gewesen sein.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
end)

RegisterCommand("hsaus", function(source, args, rawCommand)
      local target = args[1]
      ExecuteCommand("klopfenoff " .. target)
	  ExecuteCommand("jumpscareoff " .. target)
	  exports['mythic_notify']:DoHudText('inform', 'Jumpscare aus', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
end)


