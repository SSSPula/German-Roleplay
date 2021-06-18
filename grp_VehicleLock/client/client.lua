----------------------
-- Author : Deediezi
-- Version 3.0
--
-- Contributors : No contributors at the moment.
--
-- Github link : https://github.com/Deediezi/FiveM_LockSystem
-- You can contribute to the project. All the information is on Github.

--  Main algorithm with all functions and events - Client side

----
-- @var vehicles[plate_number] = newVehicle Object
--local vehicles = {}

---- Retrieve the keys of a player when he reconnects.
-- The keys are synchronized with the server. If you restart the server, all keys disappear.
--AddEventHandler("playerSpawned", function()
  --  TriggerServerEvent("ls:retrieveVehiclesOnconnect")
--end)



------------------------    EVENTS      ------------------------
------------------------     :)         ------------------------

---- Update a vehicle plate (for developers)
-- @param string oldPlate
-- @param string newPlate
--RegisterNetEvent("ls:updateVehiclePlate")
--AddEventHandler("ls:updateVehiclePlate", function(oldPlate, newPlate)
  --  local oldPlate = string.lower(oldPlate)
 --   local newPlate = string.lower(newPlate)

--    if(vehicles[oldPlate])then
  --      vehicles[newPlate] = vehicles[oldPlate]
 --       vehicles[oldPlate] = nil

   --     TriggerServerEvent("ls:updateServerVehiclePlate", oldPlate, newPlate)
   -- end
--end)

---- Event called from the server
-- Get the keys and create the vehicle Object if the vehicle has no owner
-- @param boolean hasOwner
-- @param int localVehId
-- @param string localVehPlate
-- @param int localVehLockStatus
--RegisterNetEvent("ls:getHasOwner")
--AddEventHandler("ls:getHasOwner", function(hasOwner, localVehId, localVehPlate, localVehLockStatus)
  --  if(not hasOwner)then
    --    TriggerEvent("ls:newVehicle", localVehId, localVehPlate, localVehLockStatus)
      --  TriggerServerEvent("ls:addOwner", localVehPlate)

     --   TriggerEvent("ls:notify", getRandomMsg())
   -- else
     --   TriggerEvent("ls:notify", "This vehicle is not yours")
   -- end
--end)

---- Create a new vehicle object
-- @param int id [opt]
-- @param string plate
-- @param string lockStatus [opt]
--RegisterNetEvent("ls:newVehicle")
--AddEventHandler("ls:newVehicle", function(id, plate, lockStatus)
  --  if(plate)then
  --      local plate = string.lower(plate)
    --    if(not id)then id = nil end
      --  if(not lockStatus)then lockStatus = nil end
      --  vehicles[plate] = newVehicle()
      --  vehicles[plate].__construct(id, plate, lockStatus)
   -- else
     --   print("Can't create the vehicle instance. Missing argument PLATE")
    --end
--end)

---- Event called from server when a player execute the /givekey command
-- Create a new vehicle object with its plate
-- @param string plate
--RegisterNetEvent("ls:giveKeys")
--AddEventHandler("ls:giveKeys", function(plate)
  --  local plate = string.lower(plate)
  --  TriggerEvent("ls:newVehicle", nil, plate, nil)
--end)


RegisterNetEvent('LIFE_CL:Sound:PlayOnOne')
AddEventHandler('LIFE_CL:Sound:PlayOnOne', function(soundFile, soundVolume)
    SendNUIMessage({
        transactionType     = 'playSound',
        transactionFile     = soundFile,
        transactionVolume   = soundVolume
    })
end)

---- Piece of code from Scott's InteractSound script : https://forum.fivem.net/t/release-play-custom-sounds-for-interactions/8282
-- I've decided to use only one part of its script so that administrators don't have to download more scripts. I hope you won't forget to thank him!
RegisterNetEvent('InteractSound_CL:PlayWithinDistance')
AddEventHandler('InteractSound_CL:PlayWithinDistance', function(playerNetId, maxDistance, soundFile, soundVolume)
    local lCoords = GetEntityCoords(GetPlayerPed(-1))
    local eCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerNetId)))
    local distIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)
    if(distIs <= maxDistance) then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = soundVolume
        })
    end
end)

--interact play on one
RegisterNetEvent('InteractSound_CL:PlayOnOne')
AddEventHandler('InteractSound_CL:PlayOnOne', function(soundFile, soundVolume)
    SendNUIMessage({
        transactionType     = 'playSound',
        transactionFile     = soundFile,
        transactionVolume   = soundVolume
    })
end)


--all pls
RegisterNetEvent('grpsoundabspielen_CL:fueralle')
AddEventHandler('grpsoundabspielen_CL:fueralle', function(soundFile, soundVolume)
    SendNUIMessage({
        transactionType     = 'playSound',
        transactionFile     = soundFile,
        transactionVolume   = soundVolume
    })
end)




--RegisterNetEvent('ls:notify')
--AddEventHandler('ls:notify', function(text, duration)
--	Notify(text, duration)
--end)

------------------------    FUNCTIONS      ------------------------
------------------------        :O         ------------------------

---- A simple algorithm that checks if the player finds the keys or not.
-- @return boolean
--function canSteal()
  --  nb = math.random(1, 100)
    --percentage = globalConf["CLIENT"].percentage
   -- if(nb < percentage)then
    --    return true
   -- else
     --   return false
    --end
--end

---- Return a random message
-- @return string
--function getRandomMsg()
  --  msgNb = math.random(1, #randomMsg)
    --return randomMsg[msgNb]
--end

---- Get a vehicle in direction
-- @param array coordFrom
-- @param array coordTo
-- @return int
--function GetVehicleInDirection(coordFrom, coordTo)
--	local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)
--	local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
--	return vehicle
--end

---- Get the vehicle in front of the player
-- @param array pCoords
-- @param int ply
-- @return int
--function GetTargetedVehicle(pCoords, ply)
  --  for i = 1, 200 do
    --    coordB = GetOffsetFromEntityInWorldCoords(ply, 0.0, (6.281)/i, 0.0)
      --  targetedVehicle = GetVehicleInDirection(pCoords, coordB)
        --if(targetedVehicle ~= nil and targetedVehicle ~= 0)then
          --  return targetedVehicle
       -- end
    --end
    --return
--end

---- Notify the player
-- Can be configured in "config/shared.lua"
-- @param string text
-- @param float duration [opt]
--function Notify(text, duration)
--	if(globalConf['CLIENT'].notification)then
--		if(globalConf['CLIENT'].notification == 1)then
--			if(not duration)then
--				duration = 0.080
--			end
--			SetNotificationTextEntry("STRING")
--			AddTextComponentString(text)
--			Citizen.InvokeNative(0x1E6611149DB3DB6B, "CHAR_LIFEINVADER", "CHAR_LIFEINVADER", true, 1, "Fahrzeug" , "Information", duration)
--			DrawNotification_4(false, true)
--		elseif(globalConf['CLIENT'].notification == 2)then
--			TriggerEvent('chatMessage', '^1LockSystem V' .. _VERSION, {255, 255, 255}, text)
--		else
--			return
--		end
--	else
--		return
--	end
--end
