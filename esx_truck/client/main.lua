local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,["-"] = 84,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}


ESX                           = nil
local GUI      = {}
local PlayerData                = {}
local lastVehicle = nil
local lastOpen = false
GUI.Time                      = 0
local vehiclePlate = {}
local arrayWeight = Config.localWeight
local CloseToVehicle = false
local entityWorld = nil
local globalplate = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  	PlayerData = xPlayer
end)


function getItemyWeight(item)
  local weight = 0
  local itemWeight = 0
  if item ~= nil then
	   itemWeight = Config.DefaultWeight
	   if arrayWeight[item] ~= nil then
	        itemWeight = arrayWeight[item]
	   end
	end
  return itemWeight
end

function VehicleInFront()
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local entityWorld = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 4.0, 0.0)
    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetPlayerPed(-1), 0)
    local a, b, c, d, result = GetRaycastResult(rayHandle)
    return result
end

function openmenuvehicle()
	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)
	local vehicle   =VehicleInFront()
	globalplate  = GetVehicleNumberPlateText(vehicle)

  if globalplate ~= nil or globalplate ~= "" or globalplate ~= " " then
		CloseToVehicle = true
		local vehFront = VehicleInFront()
		local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
		local closecar = GetClosestVehicle(x, y, z, 5.0, 0, 71)

    if vehFront > 0 and closecar ~= nil and GetPedInVehicleSeat(closecar, -1) ~= GetPlayerPed(-1) then
    	lastVehicle = vehFront
			local model = GetDisplayNameFromVehicleModel(GetEntityModel(closecar))
			local locked = GetVehicleDoorLockStatus(closecar)
			local class = GetVehicleClass(vehFront)
			ESX.UI.Menu.CloseAll()

			if ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'inventory') then
			  SetVehicleDoorShut(vehFront, 5, false)
			else

			  if locked ~= 2  then
				  SetVehicleDoorOpen(vehFront, 5, false, false)
				  ESX.UI.Menu.CloseAll()

          if globalplate ~= nil or globalplate ~= "" or globalplate ~= " " then
            CloseToVehicle = true
            OpenCoffreInventoryMenu(GetVehicleNumberPlateText(vehFront),Config.VehicleLimit[class])
				  end

				else
				   ESX.ShowNotification('Dieses Fahrzeug ist abgeschlossen')
			  end
			end
		else
			ESX.ShowNotification('Es befindet sich kein Fahrzeug in deiner Nähe!')
		end
		lastOpen = true
		GUI.Time  = GetGameTimer()
	end

end
local count = 0
-- Key controls
--Citizen.CreateThread(function()
--  while true do
--    Wait(0)
--    if IsControlPressed(0, Keys[","]) and (GetGameTimer() - GUI.Time) > 1000  then
--      openmenuvehicle()
--    elseif lastOpen and IsControlPressed(0, Keys["BACKSPACE"]) and (GetGameTimer() - GUI.Time) > 150 then
--	    CloseToVehicle = false
--      lastOpen = false
--      if lastVehicle > 0 then
--        SetVehicleDoorShut(lastVehicle, 5, false)
--        lastVehicle = 0
--      end
--      GUI.Time  = GetGameTimer()
--    end
--  end
--end)

Citizen.CreateThread(function()
  while true do
  Wait(0)
	local pos = GetEntityCoords(GetPlayerPed(-1))
	if CloseToVehicle then
		local vehicle = GetClosestVehicle(pos['x'], pos['y'], pos['z'], 2.0, 0, 70)
		if DoesEntityExist(vehicle) then
			CloseToVehicle = true
		else
			CloseToVehicle = false
			lastOpen = false
			ESX.UI.Menu.CloseAll()
			SetVehicleDoorShut(lastVehicle, 5, false)
		end
	end
  end
end)

function OpenCoffreInventoryMenu(plate,max)

  ESX.TriggerServerCallback('esx_truck:getInventoryV', function(inventory)
    local plate = plate
    local owner= GetPlayerPed(-1)
    local elements = {}
    table.insert(elements, {label = 'Deponieren', type = 'deposer', value = 'deposer'})
    table.insert(elements, {label = 'Schwarzgeld: ' .. inventory.blackMoney, type = 'item_account', value = 'black_money'})

    for i=1, #inventory.items, 1 do
      local item = inventory.items[i]
      if item.count > 0 then
        table.insert(elements, {label = item.label .. ' x' .. item.count..' - ('.. ((getItemyWeight(item.name)*item.count)/1000) ..' Kg)', type = 'item_standard', value = item.name})
      end

    end

    for i=1, #inventory.weapons, 1 do
      local weapon = inventory.weapons[i]
      table.insert(elements, {label = ESX.GetWeaponLabel(weapon.name) .. ' [' .. weapon.ammo .. '] - ('..(getItemyWeight(weapon.name)/1000)..' Kg)', type = 'item_weapon', value = weapon.name, ammo = weapon.ammo})
    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'car_inventory',
      {
        title    = 'Kofferraum ' .. ' - ' .. (inventory.weight/1000) .. " / "..(max/1000).." Kg",
        align    = 'top-right',
        elements = elements,
      },
      function(data, menu)

        if data.current.type == 'item_weapon' then

          menu.close()

          --TriggerServerEvent('esx_truck:getItem', plate, data.current.type, data.current.value, data.current.ammo)
          TriggerServerEvent('esx_truck:getItem', plate, data.current.type, data.current.value, 0)

          ESX.SetTimeout(500, function()
            ESX.UI.Menu.CloseAll()
            OpenCoffreInventoryMenu(plate,max)
          end)

        elseif data.current.type == "deposer" then
          ESX.UI.Menu.CloseAll()
          OpenPlayerInventoryMenu(owner,plate,max,inventory.weight)
        else

          ESX.UI.Menu.Open(
            'dialog', GetCurrentResourceName(), 'get_item_count',
            {
              title = 'Menge',
            },
            function(data2, menu)

              local quantity = tonumber(data2.value)

              if quantity == nil or quantity < 1 then
                ESX.ShowNotification('Ungueltige Anzahl!')
              else

                menu.close()
				
				local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 3.0, 0, 70)
				if DoesEntityExist(vehicle) then
                TriggerServerEvent('esx_truck:getItem', plate, data.current.type, data.current.value, quantity)
				else
				exports['mythic_notify']:DoHudText('error', 'Kein Kofferraum in der Nähe', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				end
                ESX.SetTimeout(500, function()
                  ESX.UI.Menu.CloseAll()
                  OpenCoffreInventoryMenu(plate,max)
                end)

              end

            end,
            function(data2,menu)
              menu.close()
            end
          )

        end

      end,
      function(data, menu)
        menu.close()
      end
    )

  end, plate)
end


function OpenPlayerInventoryMenu(owner,plate,max,weight)

  ESX.TriggerServerCallback('esx_truck:getPlayerInventory', function(inventory)

    local elements = {}
    table.insert(elements, {label = 'Nehmen', type = 'retour', value = 'retour'})
    table.insert(elements, {label = 'Schwarzgeld: ' .. inventory.blackMoney, type = 'item_account', value = 'black_money'})

    for i=1, #inventory.items, 1 do

      local item = inventory.items[i]

      if item.count > 0 then
        table.insert(elements, {label = item.label .. ' x' .. item.count..' - ('.. ((getItemyWeight(item.name)*item.count)/1000) ..' Kg)', type = 'item_standard', value = item.name})
      end

    end

    local playerPed  = GetPlayerPed(-1)
    local weaponList = ESX.GetWeaponList()

    for i=1, #weaponList, 1 do

      local weaponHash = GetHashKey(weaponList[i].name)

      if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
        local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
        table.insert(elements, {label = weaponList[i].label .. ' [' .. ammo .. '] - ('..(getItemyWeight(weaponList[i].name)/1000)..' Kg)', type = 'item_weapon', value = weaponList[i].name, ammo = ammo})
      end

    end

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'player_inventory',
      {
        title    = 'Kofferraum' .. ' - ' .. (weight/1000) .. " / "..(max/1000).." Kg",
        align    = 'top-right',
        elements = elements,
      },
      function(data, menu)

        if data.current.type == 'item_weapon' then

          menu.close()
			local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 4.0, 0, 70)
			if DoesEntityExist(vehicle) then
			TriggerServerEvent('esx_truck:putItem', plate, data.current.type, data.current.value, 0,max)
			else
			exports['mythic_notify']:DoHudText('error', 'Kein Kofferraum in der Nähe', { ['background-color'] = '#ffffff', ['color'] = '#000000' })

			end
          ESX.SetTimeout(300, function()
            weight = weight + (getItemyWeight(data.current.value))
            ESX.UI.Menu.CloseAll()
            OpenPlayerInventoryMenu(playerPed,plate,max,weight)
          end)
        elseif data.current.type == 'retour' then
          ESX.UI.Menu.CloseAll()
          OpenCoffreInventoryMenu(plate,max)
        else

          ESX.UI.Menu.Open(
            'dialog', GetCurrentResourceName(), 'put_item_count',
            {
              title = 'Anzahl',
            },
            function(data2, menu)
              local quantity = tonumber(data2.value)

              if quantity == nil or quantity < 1 then
                ESX.ShowNotification('Ungueltige Angabe')
              else
                menu.close()
				local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 3.0, 0, 70)
				if DoesEntityExist(vehicle) then
                TriggerServerEvent('esx_truck:putItem', plate, data.current.type, data.current.value, tonumber(data2.value),max)
				else
				exports['mythic_notify']:DoHudText('error', 'Kein Kofferraum in der Nähe', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				end
                ESX.SetTimeout(300, function()
                  ESX.UI.Menu.CloseAll()
                  weight = weight + (getItemyWeight(data.current.value) * tonumber(data2.value))
                  OpenPlayerInventoryMenu(playerPed,plate,max,weight)

                end)
              end
            end,
            function(data2,menu)
              menu.close()
            end
          )

        end

      end,
      function(data, menu)
        menu.close()
      end
    )

  end)

end





function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

RegisterNetEvent("esx_truck:OpenByServer") -- For opening the documents menu from another resource.
AddEventHandler("esx_truck:OpenByServer", function()
  openmenuvehicle()
end)