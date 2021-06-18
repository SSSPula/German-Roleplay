ESX = nil

Citizen.CreateThread(function ()
	while ESX == nil do
		TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


local uebergabe = nil

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
	Citizen.Wait(30000)
	ESX.TriggerServerCallback('grrasdda:skdjfinemotelauf', function (result)
		if result then
			if result[1].laufstil ~= nil then
			local uebergabe = result[1].laufstil
			RequestWalking(result[1].laufstil)
			SetPedMovementClipset(PlayerPedId(), result[1].laufstil, 0.2)
			RemoveAnimSet(result[1].laufstil)	
			end
		end
	end)
end)
local hateinen = true
RegisterCommand("debug", function(source)
	
	ESX.TriggerServerCallback('grrasdda:skdjfinemotelauf', function (result)
		if result and hateinen then
		--print(result[1].laufstil == '')
			if result[1].laufstil ~= nil then
			uebergabe = result[1].laufstil
			RequestWalking(result[1].laufstil)
			SetPedMovementClipset(PlayerPedId(), result[1].laufstil, 0.2)
			RemoveAnimSet(result[1].laufstil)
			else
				hateinen = false
			end
		else
		
		end
	end)
end)


function WalkMenuStart(name)
  RequestWalking(name)
  SetPedMovementClipset(PlayerPedId(), name, 0.2)
  local uebergabe = name
  RemoveAnimSet(name)
  TriggerServerEvent('grp_561j4213hdd:oemeoteteuebergabte', name)
end

function RequestWalking(set)
  RequestAnimSet(set)
  while not HasAnimSetLoaded(set) do
    Citizen.Wait(1)
  end 
end

function WalksOnCommand(source, args, raw)
  local WalksCommand = ""
  for a in pairsByKeys(DP.Walks) do
    WalksCommand = WalksCommand .. ""..string.lower(a)..", "
  end
  EmoteChatMessage(WalksCommand)
end

function WalkCommandStart(source, args, raw)
  local name = firstToUpper(args[1])

  if name == "Reset" then
      ResetPedMovementClipset(PlayerPedId()) return
  end

  local name2 = table.unpack(DP.Walks[name])
  if name2 ~= nil then
    WalkMenuStart(name2)
  else
    EmoteChatMessage("'"..name.."' is not a valid walk")
  end
end







--crouch script

local tonumber            = tonumber
local unpack              = table.unpack
local crouched = false
local CreateThread        = Citizen.CreateThread
local Wait                = Citizen.Wait
local TriggerEvent        = TriggerEvent
local RegisterCommand     = RegisterCommand
local PlayerPedId         = PlayerPedId
local IsPedInAnyVehicle   = IsPedInAnyVehicle
local GetPedInVehicleSeat = GetPedInVehicleSeat
local GetVehiclePedIsIn   = GetVehiclePedIsIn
local GetIsTaskActive     = GetIsTaskActive
local SetPedIntoVehicle   = SetPedIntoVehicle
local disabled            = false




Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(0)

		local ped = GetPlayerPed(PlayerId())

		if DoesEntityExist(ped) and not IsEntityDead(ped) and not IsPedInAnyVehicle(ped) then 
			DisableControlAction(0, 36, true) -- INPUT_DUCK  

			if not IsPauseMenuActive() then 
				if IsDisabledControlJustPressed(0, 36) then 
					

					if crouched == true then
					if uebergabe == '' or uebergabe == nil then
						ResetPedMovementClipset(ped, 0)
						crouched = false 
						--print("aus ")
					else
						RequestWalking(uebergabe)
						SetPedMovementClipset(PlayerPedId(), uebergabe, 0.2)
						RemoveAnimSet(uebergabe)	
						crouched = false 
						--print("an ")
					end	
					elseif crouched == false then
						RequestAnimSet("move_ped_crouched")

						while not HasAnimSetLoaded("move_ped_crouched") do 
							Citizen.Wait(100)
						end 
						SetPedMovementClipset(ped, "move_ped_crouched", 0.25)
						crouched = true 
					end 
				end
			end 
		end 
	end
end)

