  hatsOn = false
  currentHats = nil
  myHats = nil
  sgTexture = nil
  hatsSet = false
  noHats = false

RegisterNetEvent('hats')
AddEventHandler('hats', function()
--[[
  Sets variables for if sunglasses are on and which sunglasses they are
]]--
  local player = GetPlayerPed(-1)
  local currentHats = GetPedPropIndex(player, 0)
  if currentHats == -1 and hatsSet == false then
    noHats = true
    hatsSet = false
  elseif currentHats ~= -1 and hatsSet == false then
    myHats = GetPedPropIndex(player, 0)
    sgTexture = GetPedPropTextureIndex(player, 0)
    noHats = false
    hatsSet = true
    hatsOn = true
  elseif currentHats == -1 and hatsSet == true then
    hatsOn = false
  elseif hatsSet == true and currentHats ~= -1 and myHats ~= currentHats then
    myHats = GetPedPropIndex(player, 0)
    sgTexture = GetPedPropTextureIndex(player, 0)
    hatsSet = true
    noHats = false
    hatsOn = true
  end 

--Takes Glasses off / Puts them On
if not noHats then
  hatsOn = not hatsOn
  if hatsOn then
    SetPedPropIndex(player, 0, myHats, sgTexture, 2)
    ShowNotification('Hut aufgesetzt')
  else
    ClearPedProp(player, 0)
    ShowNotification('Hut abgesetzt')
  end
else
  ShowNotification('Zu deinem Outfit zählt kein Hut')
end

end, false)

RegisterCommand('gibmirmeinkrassenhutwiederallersonstdrehichfreietzala', function()
  TriggerEvent('hats')
end)

--Function to show the notification

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
  end