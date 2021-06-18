ESX                  = nil
local FirstSpawn     = true
local LastSkin       = nil
local PlayerLoaded   = false
local cam            = nil
local isCameraActive = false
local zoomOffset     = 0.0
local camOffset      = 0.0
local camOffset2      = 0.0
local heading        = 90.0
local right = false
local left = false
local rightcamera = false
local leftcamera = false

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
  SetNuiFocus(false, false)
end)
RegisterNUICallback('NUIFocusOffnosave', function()
	SetNuiFocus(false, false)
  SendNUIMessage({
    type = "container",
    articul = nil,
    edit = false,
    display = false
  })
  TriggerEvent('esx_skin:getLastSkin', function(skin)
    TriggerEvent('skinchanger:loadSkin', skin)
  end)
  DeleteSkinCam()
end)


RegisterNUICallback('NUIFocusOffsave', function()
	SetNuiFocus(false, false)
  SendNUIMessage({
    type = "container",
    articul = nil,
    edit = false,
    display = false
  })
  DeleteSkinCam()
end)



RegisterNUICallback('value', function(data,cb)
  --print(data.value)
  TriggerEvent('skinchanger:change',data.type, data.value)
end)



RegisterNUICallback('saveinhouse', function(data,cb)

  TriggerEvent('skinchanger:getSkin', function(skin)
    local skin = skin
    TriggerServerEvent('esx_clotheshop:saveOutfit', data.name, skin)
  end)
  
end)




RegisterNUICallback('maxcolor', function(data,cb)
  TriggerEvent('skinchanger:getData', function(components, maxVals)  
    SendNUIMessage({
      type = "container",
      display = true,
      compoent = data.type,
      maxval = maxVals[data.type],
    })
  
  end)

end)


RegisterNUICallback('saveskin', function(data,cb)
  DeleteSkinCam()
  ESX.TriggerServerCallback('esx_clotheshop:buyClothes', function(hasEnoughMoney)
    if hasEnoughMoney then
      TriggerEvent('skinchanger:getSkin', function(skin)
        TriggerServerEvent('esx_skin:save', skin)
        TriggerServerEvent('esx_clotheshop:save', skin)
      end)
      TriggerServerEvent('esx_clotheshop:buyClothes')
      --TriggerEvent("pNotify:SendNotification", {text ='Zakupiono ciuchy' , type = "info", timeout = 2000})
    else
      --TriggerEvent("pNotify:SendNotification", {text ='Niestety nie masz pieniędzy' , type = "info", timeout = 2000})
    end
    
  end)
end)




RegisterNUICallback('camera', function(data,cb)
  local playerPed = GetPlayerPed(-1)
  
  SetEntityHeading(playerPed, ToFloat(data.angle))
  
end)

RegisterNUICallback('camerazoom', function(data,cb)
  
  zoomOffset = data.zoom
  camOffset = data.cam
  camOffset2 = data.cam2
  
end)



function OpenMenu(submitCb, cancelCb, restrict)
  local playerPed = GetPlayerPed(-1)

  TriggerEvent('skinchanger:getSkin', function(skin)
    LastSkin = skin
  end)

  TriggerEvent('skinchanger:getData', function(components, maxVals)

    local elements    = {}
    local _components = {}

    -- Restrict menu
    if restrict == nil then
      for i=1, #components, 1 do
        _components[i] = components[i]
      end
    else
      for i=1, #components, 1 do

        local found = false

        for j=1, #restrict, 1 do
          if components[i].name == restrict[j] then
            found = true
          end
        end

        if found then
          table.insert(_components, components[i])
        end

      end
    end

    -- Insert elements
    for i=1, #_components, 1 do

      local value       = _components[i].value
      local componentId = _components[i].componentId

      if componentId == 0 then
        value = GetPedPropIndex(playerPed,  _components[i].componentId)
      end

      local data = {
        label     = _components[i].label,
        name      = _components[i].name,
        value     = value,
        min       = _components[i].min,
        textureof = _components[i].textureof,
        zoomOffset= _components[i].zoomOffset,
        camOffset = _components[i].camOffset,
        camOffset2 = _components[i].camOffset,
        type      = 'slider'
      }

      for k,v in pairs(maxVals) do
        if k == _components[i].name then
          data.max = v
        end
      end

      table.insert(elements, data)

    end

    CreateSkinCam()
    zoomOffset = _components[1].zoomOffset
    camOffset = _components[1].camOffset
    camOffset2 = _components[1].camOffset

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'skin',
      {
        title = _U('skin_menu'),
        align = 'left',
        elements = elements
      },
      function(data, menu)

        TriggerEvent('skinchanger:getSkin', function(skin)
          LastSkin = skin
          
        end)

        submitCb(data, menu)
        DeleteSkinCam()
      end,
      function(data, menu)

        menu.close()

        DeleteSkinCam()

        TriggerEvent('skinchanger:loadSkin', LastSkin)

        if cancelCb ~= nil then
          cancelCb(data, menu)
        end

      end,
      function(data, menu)
        --wartości przy zmianie
        TriggerEvent('skinchanger:getSkin', function(skin)

          zoomOffset = data.current.zoomOffset
          camOffset = data.current.camOffset
          camOffset2 = data.current.camOffset

          if skin[data.current.name] ~= data.current.value then

            -- Change skin element
            TriggerEvent('skinchanger:change', data.current.name, data.current.value)
            --print(data)
            --print(data.current.name..':'..data.current.value)
            -- Update max values
            TriggerEvent('skinchanger:getData', function(components, maxVals)

              for i=1, #elements, 1 do

                local newData = {}

                newData.max = maxVals[elements[i].name]

                if elements[i].textureof ~= nil and data.current.name == elements[i].textureof then
                  newData.value = 0
                end

                menu.update({name = elements[i].name}, newData)

              end

              menu.refresh()

            end)

          end

        end)

      end,
      function()
        DeleteSkinCam()
      end
    )

  end)

end

function CreateSkinCam()
  if not DoesCamExist(cam) then
    cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
  end
  local playerPed = GetPlayerPed(-1)

  SetCamActive(cam, true)
  RenderScriptCams(true, true, 500, true, true)
  isCameraActive = true
  --local heading = GetEntityHeading(playerPed)
  --print(heading)
  SetCamRot(cam, 0.0, 0.0, heading, true)
  --SetEntityHeading(playerPed, 90.0)
end

function DeleteSkinCam()
  isCameraActive = false
  SetCamActive(cam, false)
  RenderScriptCams(false, true, 500, true, true)
  cam = nil
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if isCameraActive then
      DisableControlAction(2, 30, true)
      DisableControlAction(2, 31, true)
      DisableControlAction(2, 32, true)
      DisableControlAction(2, 33, true)
      DisableControlAction(2, 34, true)
      DisableControlAction(2, 35, true)

      DisableControlAction(0, 25,   true) -- Input Aim
        DisableControlAction(0, 24,   true) -- Input Attack

      local playerPed = GetPlayerPed(-1)
      local coords    = GetEntityCoords(playerPed)

      local angle = heading * math.pi / 180.0
      local theta = {
        x = math.cos(angle),
        y = math.sin(angle)
      }
      local pos = {
        x = coords.x + (zoomOffset * theta.x),
        y = coords.y + (zoomOffset * theta.y),
      }

      local angleToLook = heading - 140.0
      if angleToLook > 360 then
        angleToLook = angleToLook - 360
      elseif angleToLook < 0 then
        angleToLook = angleToLook + 360
      end
      angleToLook = angleToLook * math.pi / 180.0
      local thetaToLook = {
        x = math.cos(angleToLook),
        y = math.sin(angleToLook)
      }
      local posToLook = {
        x = coords.x + (zoomOffset * thetaToLook.x),
        y = coords.y + (zoomOffset * thetaToLook.y),
      }

      SetCamCoord(cam, pos.x, pos.y, coords.z + camOffset)
      PointCamAtCoord(cam, posToLook.x, posToLook.y, coords.z + camOffset2)

      SetTextComponentFormat("STRING")
      AddTextComponentString(_U('use_rotate_view'))
      DisplayHelpTextFromStringLabel(0, 0, 0, -1)
    end
  end
end)

Citizen.CreateThread(function()
  local playerPed = GetPlayerPed(-1)
  local angle = 90
  while true do
    Citizen.Wait(0)
    if isCameraActive then
      if right == true then
        angle = angle - 1
        SetEntityHeading(playerPed, ToFloat(angle))
      elseif left == true then
        angle = angle + 1
        SetEntityHeading(playerPed, ToFloat(angle))
      end

      if rightcamera == true then
        angle = angle - 1
        heading = angle + 0.0
      elseif leftcamera == true then
        angle = angle + 1
        heading = angle + 0.0
      end


      if angle > 360 then
        angle = angle - 360
      elseif angle < 0 then
        angle = angle + 360
      end

      --heading = angle + 0.0
    end
  end
end)

function OpenSaveableMenu(submitCb, cancelCb, restrict)

  TriggerEvent('skinchanger:getSkin', function(skin)
    LastSkin = skin
  end)

  OpenMenu(function(data, menu)

    menu.close()

    DeleteSkinCam()

    TriggerEvent('skinchanger:getSkin', function(skin)

      TriggerServerEvent('esx_skin:save', skin)

      if submitCb ~= nil then
        submitCb(data, menu)
      end

    end)

  end, cancelCb, restrict)

end

AddEventHandler('playerSpawned', function()

  Citizen.CreateThread(function()

    while not PlayerLoaded do
      Citizen.Wait(0)
    end

    if FirstSpawn then
		
      ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

        if skin == nil then
          TriggerEvent('skinchanger:loadSkin', {sex = 0})
        else
          TriggerEvent('skinchanger:loadSkin', skin)
        end

      end)

      FirstSpawn = false

    end

  end)

end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerLoaded = true
end)

AddEventHandler('esx_skin:getLastSkin', function(cb)
  cb(LastSkin)
end)

AddEventHandler('esx_skin:setLastSkin', function(skin)
  LastSkin = skin
end)

RegisterNetEvent('esx_skin:openMenu')
AddEventHandler('esx_skin:openMenu', function(submitCb, cancelCb)
  OpenMenu(submitCb, cancelCb, nil)
end)

RegisterNetEvent('esx_skin:openRestrictedMenu')
AddEventHandler('esx_skin:openRestrictedMenu', function(submitCb, cancelCb, restrict)
  --OpenMenu(submitCb, cancelCb, restrict)
  SetNuiFocus(true, true)

  TriggerEvent('skinchanger:getData', function(components, maxVals)
  local _components = {}

  for i=1, #components, 1 do
    _components[i] = components[i]
  end


  SendNUIMessage({
    type = "container",
    display = true,
    clothe = true,
    editclothe = true,
    tshirt_1 = {value = _components[35].value, maxval = maxVals[_components[35].name]},
    tshirt_2 = {value = _components[36].value,maxval = maxVals[_components[36].name]},
    torso_1 = {value = _components[37].value,maxval = maxVals[_components[37].name]},
    torso_2 = {value = _components[38].value,maxval = maxVals[_components[38].name]},
    decals_1 = {value = _components[39].value,maxval = maxVals[_components[39].name]},
    decals_2 = {value = _components[40].value,maxval = maxVals[_components[40].name]},
    arms = {value = _components[41].value,maxval = maxVals[_components[41].name]},
    arms_2 = {value = _components[42].value,maxval = maxVals[_components[42].name]},
    pants_1 = {value = _components[43].value,maxval = maxVals[_components[43].name]},
    pants_2 = {value = _components[44].value,maxval = maxVals[_components[44].name]},
    shoes_1 = {value = _components[45].value,maxval = maxVals[_components[45].name]},
    shoes_2 = {value = _components[46].value,maxval = maxVals[_components[46].name]},

    mask_1 = {value = _components[47].value,maxval = maxVals[_components[47].name]},
    mask_2 = {value = _components[48].value,maxval = maxVals[_components[48].name]},

    bproof_1 = {value = _components[49].value,maxval = maxVals[_components[49].name]},
    bproof_2 = {value = _components[50].value,maxval = maxVals[_components[50].name]},
    chain_1 = {value = _components[51].value,maxval = maxVals[_components[51].name]},
    chain_2 = {value = _components[52].value,maxval = maxVals[_components[52].name]},
    helmet_1 = {value = _components[53].value,maxval = maxVals[_components[53].name]},
    helmet_2 = {value = _components[54].value,maxval = maxVals[_components[54].name]},
    glasses_1 = {value = _components[55].value,maxval = maxVals[_components[55].name]},
    glasses_2 = {value = _components[56].value,maxval = maxVals[_components[56].name]},
    watches_1 = {value = _components[57].value,maxval = maxVals[_components[57].name]},
    watches_2 = {value = _components[58].value,maxval = maxVals[_components[58].name]},
    bracelets_1 = {value = _components[59].value,maxval = maxVals[_components[59].name]},
    bracelets_2 = {value = _components[60].value,maxval = maxVals[_components[60].name]},
    bags_1 = {value = _components[61].value,maxval = maxVals[_components[61].name]},
    bags_2 = {value = _components[62].value,maxval = maxVals[_components[62].name]},
    ears_1 = {value = _components[63].value,maxval = maxVals[_components[63].name]},
    ears_2 = {value = _components[64].value,maxval = maxVals[_components[64].name]},
    
  })

end)










  TriggerEvent('skinchanger:getSkin', function(skin)
    LastSkin = skin
  end)
  CreateSkinCam()
  zoomOffset = 1.75
  camOffset = 0.25
  camOffset2 = 0
end)





RegisterNetEvent('esx_skin:openRestrictedMenu2')
AddEventHandler('esx_skin:openRestrictedMenu2', function(submitCb, cancelCb, restrict)
  --OpenMenu(submitCb, cancelCb, restrict)
  SetNuiFocus(true, true)

  TriggerEvent('skinchanger:getData', function(components, maxVals)
  local _components = {}

  for i=0, #components, 1 do
    _components[i] = components[i]
  end


  SendNUIMessage({
    type = "container",
    display = true,
    barber = true,
    editbarber = true,
    sex = {value = _components[1].value, maxval = maxVals[_components[1].name]},
    skin = {value = _components[2].value, maxval = maxVals[_components[2].name]},
    eyecolor = {value = _components[4].value, maxval = maxVals[_components[4].name]},
    wrinkles = {value = _components[5].value, maxval = maxVals[_components[5].name]},
    wrinkle_thickness = {value = _components[6].value, maxval = maxVals[_components[6].name]},
    freckles = {value = _components[7].value, maxval = maxVals[_components[7].name]},
    freckles_1 = {value = _components[8].value, maxval = maxVals[_components[8].name]},

    chest_hair = {value = _components[32].value, maxval = maxVals[_components[32].name]},
    chest_color = {value = _components[34].value, maxval = maxVals[_components[34].name]},


    hair_1 = {value = _components[9].value, maxval = maxVals[_components[9].name]},
    hair_color_1 = {value = _components[11].value, maxval = maxVals[_components[11].name]},
    hair_2 = {value = _components[10].value, maxval = maxVals[_components[10].name]},
    hair_color_2 = {value = _components[12].value, maxval = maxVals[_components[12].name]},
    beard_1 = {value = _components[13].value, maxval = maxVals[_components[13].name]},
    beard_2 = {value = _components[14].value, maxval = maxVals[_components[14].name]},
    beard_3 = {value = _components[15].value, maxval = maxVals[_components[15].name]},

    eyebrows_1 = {value = _components[17].value, maxval = maxVals[_components[17].name]},
    eyebrows_2 = {value = _components[18].value, maxval = maxVals[_components[18].name]},
    eyebrows_3 = {value = _components[19].value, maxval = maxVals[_components[19].name]},
    eyebrows_4 = {value = _components[20].value, maxval = maxVals[_components[20].name]},

    makeup_1 = {value = _components[21].value, maxval = maxVals[_components[21].name]},
    makeup_2 = {value = _components[22].value, maxval = maxVals[_components[22].name]},
    makeup_3 = {value = _components[23].value, maxval = maxVals[_components[23].name]},

    blush_1 = {value = _components[25].value, maxval = maxVals[_components[25].name]},
    blush_2 = {value = _components[26].value, maxval = maxVals[_components[26].name]},
    blush_3 = {value = _components[27].value, maxval = maxVals[_components[27].name]},


    lipstick_1 = {value = _components[28].value, maxval = maxVals[_components[28].name]},
    lipstick_2 = {value = _components[29].value, maxval = maxVals[_components[29].name]},
    lipstick_3 = {value = _components[30].value, maxval = maxVals[_components[30].name]},



    
  })

end)










  TriggerEvent('skinchanger:getSkin', function(skin)
    LastSkin = skin
  end)
  CreateSkinCam()
  zoomOffset = 0.6
  camOffset = 0.65
  camOffset2 = 0.65
end)

RegisterNetEvent('esx_skin:openSaveableMenu')
AddEventHandler('esx_skin:openSaveableMenu', function(submitCb, cancelCb)
  --OpenSaveableMenu(submitCb, cancelCb, nil)
  SetNuiFocus(true, true)

  TriggerEvent('skinchanger:getData', function(components, maxVals)
  local _components = {}

  for i=0, #components, 1 do
    _components[i] = components[i]
  end


  SendNUIMessage({
    type = "container",
    display = true,
    face = true,
    clothe = false,
    barber = true,
    sex = {value = _components[1].value, maxval = maxVals[_components[1].name]},
    skin = {value = _components[2].value, maxval = maxVals[_components[2].name]},
    eyecolor = {value = _components[4].value, maxval = maxVals[_components[4].name]},
    wrinkles = {value = _components[5].value, maxval = maxVals[_components[5].name]},
    wrinkle_thickness = {value = _components[6].value, maxval = maxVals[_components[6].name]},
    freckles = {value = _components[7].value, maxval = maxVals[_components[7].name]},
    freckles_1 = {value = _components[8].value, maxval = maxVals[_components[8].name]},

    chest_hair = {value = _components[32].value, maxval = maxVals[_components[32].name]},
    chest_color = {value = _components[33].value, maxval = maxVals[_components[33].name]},


    hair_1 = {value = _components[9].value, maxval = maxVals[_components[9].name]},
    hair_color_1 = {value = _components[11].value, maxval = maxVals[_components[11].name]},
    hair_2 = {value = _components[10].value, maxval = maxVals[_components[10].name]},
    hair_color_2 = {value = _components[12].value, maxval = maxVals[_components[12].name]},
    beard_1 = {value = _components[13].value, maxval = maxVals[_components[13].name]},
    beard_2 = {value = _components[14].value, maxval = maxVals[_components[14].name]},
    beard_3 = {value = _components[15].value, maxval = maxVals[_components[15].name]},

    eyebrows_1 = {value = _components[17].value, maxval = maxVals[_components[17].name]},
    eyebrows_2 = {value = _components[18].value, maxval = maxVals[_components[18].name]},
    eyebrows_3 = {value = _components[19].value, maxval = maxVals[_components[19].name]},
    eyebrows_4 = {value = _components[20].value, maxval = maxVals[_components[20].name]},

    makeup_1 = {value = _components[21].value, maxval = maxVals[_components[21].name]},
    makeup_2 = {value = _components[22].value, maxval = maxVals[_components[22].name]},
    makeup_3 = {value = _components[23].value, maxval = maxVals[_components[23].name]},

    blush_1 = {value = _components[25].value, maxval = maxVals[_components[25].name]},
    blush_2 = {value = _components[26].value, maxval = maxVals[_components[26].name]},
    blush_3 = {value = _components[27].value, maxval = maxVals[_components[27].name]},


    lipstick_1 = {value = _components[28].value, maxval = maxVals[_components[28].name]},
    lipstick_2 = {value = _components[29].value, maxval = maxVals[_components[29].name]},
    lipstick_3 = {value = _components[30].value, maxval = maxVals[_components[30].name]},

    tshirt_1 = {value = _components[35].value, maxval = maxVals[_components[35].name]},
    tshirt_2 = {value = _components[36].value,maxval = maxVals[_components[36].name]},
    torso_1 = {value = _components[37].value,maxval = maxVals[_components[37].name]},
    torso_2 = {value = _components[38].value,maxval = maxVals[_components[38].name]},
    decals_1 = {value = _components[39].value,maxval = maxVals[_components[39].name]},
    decals_2 = {value = _components[40].value,maxval = maxVals[_components[40].name]},
    arms = {value = _components[41].value,maxval = maxVals[_components[41].name]},
    arms_2 = {value = _components[42].value,maxval = maxVals[_components[42].name]},
    pants_1 = {value = _components[43].value,maxval = maxVals[_components[43].name]},
    pants_2 = {value = _components[44].value,maxval = maxVals[_components[44].name]},
    shoes_1 = {value = _components[45].value,maxval = maxVals[_components[45].name]},
    shoes_2 = {value = _components[46].value,maxval = maxVals[_components[46].name]},
    mask_1 = {value = _components[47].value,maxval = maxVals[_components[47].name]},
    mask_2 = {value = _components[48].value,maxval = maxVals[_components[48].name]},
    bproof_1 = {value = _components[49].value,maxval = maxVals[_components[49].name]},
    bproof_2 = {value = _components[50].value,maxval = maxVals[_components[50].name]},
    chain_1 = {value = _components[51].value,maxval = maxVals[_components[51].name]},
    chain_2 = {value = _components[52].value,maxval = maxVals[_components[52].name]},
    helmet_1 = {value = _components[53].value,maxval = maxVals[_components[53].name]},
    helmet_2 = {value = _components[54].value,maxval = maxVals[_components[54].name]},
    glasses_1 = {value = _components[55].value,maxval = maxVals[_components[55].name]},
    glasses_2 = {value = _components[56].value,maxval = maxVals[_components[56].name]},
    watches_1 = {value = _components[57].value,maxval = maxVals[_components[57].name]},
    watches_2 = {value = _components[58].value,maxval = maxVals[_components[58].name]},
    bracelets_1 = {value = _components[59].value,maxval = maxVals[_components[59].name]},
    bracelets_2 = {value = _components[60].value,maxval = maxVals[_components[60].name]},
    bags_1 = {value = _components[61].value,maxval = maxVals[_components[61].name]},
    bags_2 = {value = _components[62].value,maxval = maxVals[_components[62].name]},
    ears_1 = {value = _components[63].value,maxval = maxVals[_components[63].name]},
    ears_2 = {value = _components[64].value,maxval = maxVals[_components[64].name]},

    
  })

end)










  TriggerEvent('skinchanger:getSkin', function(skin)
    LastSkin = skin
  end)
  CreateSkinCam()
  zoomOffset = 0.6
  camOffset = 0.65
  camOffset2 = 0.65

end)

RegisterNetEvent('esx_skin:openSaveableRestrictedMenu')
AddEventHandler('esx_skin:openSaveableRestrictedMenu', function(submitCb, cancelCb, restrict)
  OpenSaveableMenu(submitCb, cancelCb, restrict)
end)

RegisterNetEvent('esx_skin:requestSaveSkin')
AddEventHandler('esx_skin:requestSaveSkin', function()
  TriggerEvent('skinchanger:getSkin', function(skin)
    TriggerServerEvent('esx_skin:responseSadewenspantossindnice1337veSkin', skin)
  end)
end)

Citizen.CreateThread(function()
  while true do

    Citizen.Wait(0)

    local playerPed = GetPlayerPed(-1)

    if IsEntityDead(playerPed) then
      HasLoadedModel = false
    end

  end
end)
