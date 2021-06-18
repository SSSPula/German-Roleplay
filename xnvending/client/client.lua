ESX = nil
local ct = Citizen.CreateThread
ct(function()
	while ESX == nil do
		TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)
local animPlaying = false
local usingMachine = false
local VendingObject = nil
local itemItem = nil
local itemCost = nil
local itemName = nil
local itemProp = nil

ct(function()
	local Drinkables = {}

	for k,v in pairs(Config.Softdrinks) do
		local model = GetHashKey(v)
		table.insert(Drinkables, model)
	end
	Wait(100)
	exports['bt-target']:AddTargetModel(Drinkables, {
        options = {
            {
                event = "bili.BuyBust",
                icon = "",
                label = "Automat benutzen",
            },
        },
        job = {"all"},
        distance = 1.75
    })

	local Waterrrrr = {}

	for k,v in pairs(Config.Waters) do
		local model = GetHashKey(v)
		table.insert(Waterrrrr, model)
	end
	Wait(100)
	exports['bt-target']:AddTargetModel(Waterrrrr, {
        options = {
            {
                event = "bili.InomTubig",
                icon = "",
                label = "Wasserspender nutzen",
            },
        },
        job = {"all"},
        distance = 1.75
    })
	local coffeeeeee = {}

	for k,v in pairs(Config.Coffee) do
		local model = GetHashKey(v)
		table.insert(coffeeeeee, model)
	end
	Wait(100)
	exports['bt-target']:AddTargetModel(coffeeeeee, {
        options = {
            {
                event = "bili.Kape",
                icon = "",
                label = "Kaffeeautomat benutzen",
            },
        },
        job = {"all"},
        distance = 1.75
    })
	local foodssssss = {}

	for k,v in pairs(Config.Eatables) do
		local model = GetHashKey(v)
		table.insert(foodssssss, model)
	end
	Wait(100)
	exports['bt-target']:AddTargetModel(foodssssss, {
        options = {
            {
                event = "bili.Foods",
                icon = "",
                label = "Automat benutzen",
            },
        },
        job = {"all"},
        distance = 1.75
    })
end)
RegisterNetEvent("bili.BuyBust")
AddEventHandler("bili.BuyBust", function()
	if nearVendingMachine() and not usingMachine and not IsPedInAnyVehicle(PlayerPedId(), 1) then
	sleep = 5
		ESX.TriggerServerCallback('vending:checkMoneyandInvent', function(response)
			if response == "cash" then
				exports['mythic_notify']:SendAlert('error', 'Du hast nicht genug Geld dabei.', 2500)

			elseif response == "inventory" then
				exports['mythic_notify']:SendAlert('inform', 'Deine Taschen sind bereits voll. ' .. itemName, 2500)

			else
				usingMachine = true
				local ped = PlayerPedId()
				local position = GetOffsetFromEntityInWorldCoords(VendingObject, 0.0, -0.97, 0.05)
				TaskTurnPedToFaceEntity(ped, VendingObject, -1)
				ReqAnimDict(Config.DispenseDict[1])
				RequestAmbientAudioBank("VENDING_MACHINE")
				HintAmbientAudioBank("VENDING_MACHINE", 0, -1)
				SetPedCurrentWeaponVisible(ped, false, true, 1, 0)
				ReqTheModel(itemProp)
				SetPedResetFlag(ped, 322, true)
				if not IsEntityAtCoord(ped, position, 0.1, 0.1, 0.1, false, true, 0) then
					TaskGoStraightToCoord(ped, position, 1.0, 20000, GetEntityHeading(VendingObject), 0.1)
					while not IsEntityAtCoord(ped, position, 0.1, 0.1, 0.1, false, true, 0) do
						Citizen.Wait(2000)
					end
				end
				TaskTurnPedToFaceEntity(ped, VendingObject, -1)
				Citizen.Wait(1000)
				TaskPlayAnim(ped, Config.DispenseDict[1], Config.DispenseDict[2], 8.0, 5.0, -1, true, 1, 0, 0, 0)
				Citizen.Wait(2500)
				local canModel = CreateObjectNoOffset(itemProp, position, true, false, false)
				SetEntityAsMissionEntity(canModel, true, true)
				SetEntityProofs(canModel, false, true, false, false, false, false, 0, false)
				AttachEntityToEntity(canModel, ped, GetPedBoneIndex(ped, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
				Citizen.Wait(1700)
				ReqAnimDict(Config.PocketAnims[1])
				TaskPlayAnim(ped, Config.PocketAnims[1], Config.PocketAnims[2], 8.0, 5.0, -1, true, 1, 0, 0, 0)
				Citizen.Wait(1000)
				ClearPedTasks(ped)
				ReleaseAmbientAudioBank()
				RemoveAnimDict(Config.DispenseDict[1])
				RemoveAnimDict(Config.PocketAnims[1])
				if DoesEntityExist(canModel) then
					DetachEntity(canModel, true, true)
					DeleteEntity(canModel)
				end
				SetModelAsNoLongerNeeded(itemProp)
				usingMachine = false
			end
		end, itemItem)
	end
end)
RegisterNetEvent("bili.InomTubig")
AddEventHandler("bili.InomTubig", function()
	if nearWaterCoolers() and not usingMachine and not IsPedInAnyVehicle(PlayerPedId(), 1) then
	sleep = 5
		usingMachine = true
		local ped = PlayerPedId()
		TaskPlayAnim(ped, "mini@sprunk", "plyr_buy_drink_pt1", 8.0, 5.0, -1, true, 1, 0, 0, 0)
		Citizen.Wait(2500)
		usingMachine = false
		ClearPedTasks(ped)
		Citizen.Wait(1000)
		exports['mythic_progbar']:Progress({
			name = "onDrinkCoffee",
			duration = 8000,
			label = "",
			useWhileDead = false,
			canCancel = false,
			controlDisables = {
				disableMovement = false,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			},
			animation = {
				animDict = "mp_player_intdrink",
				anim = "loop_bottle",
			
			flags = 49,},
			prop = {
				model = "prop_cs_paper_cup",
			}
		}, function(status)
			if not status then
				TriggerServerEvent('vending:refillThirst')
				
			end
		end)
	end
end)
RegisterNetEvent("bili.Kape")
AddEventHandler("bili.Kape", function()
	if nearCoffeeMakers() and not usingMachine and not IsPedInAnyVehicle(PlayerPedId(), 1) then
	sleep = 5
	usingMachine = true
	local ped = PlayerPedId()
	TaskPlayAnim(ped, "mini@sprunk", "plyr_buy_drink_pt1", 8.0, 5.0, -1, true, 1, 0, 0, 0)
	Citizen.Wait(2500)
	usingMachine = false
	ClearPedTasks(ped)
	Citizen.Wait(1000)
		exports['mythic_progbar']:Progress({
			name = "onDrinkCoffee",
			duration = 8000,
			label = "",
			useWhileDead = false,
			canCancel = false,
			controlDisables = {
				disableMovement = false,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			},
			animation = {
				animDict = "mp_player_intdrink",
				anim = "loop_bottle",
			
			flags = 49,},
			prop = {
				model = "prop_fib_coffee",
			}
		}, function(status)
			if not status then
				TriggerServerEvent('vending:refillThirst')
			end
		end)
	end
end)
RegisterNetEvent("bili.Foods")
AddEventHandler("bili.Foods", function()
	if nearFoodVendo() and not usingMachine and not IsPedInAnyVehicle(PlayerPedId(), 1) then
	sleep = 5
	sleep = 5
		ESX.TriggerServerCallback('vending:checkMoneyandInvent', function(response)
			if response == "cash" then
				exports['mythic_notify']:SendAlert('error', 'Du hast nicht genug Geld dabei.', 2500)

			elseif response == "inventory" then
				exports['mythic_notify']:SendAlert('inform', 'Deine Taschen sind bereits voll. ' .. itemName, 2500)

			else
				usingMachine = true
				local ped = PlayerPedId()
				local position = GetOffsetFromEntityInWorldCoords(VendingObject, 0.0, -0.97, 0.05)
				TaskTurnPedToFaceEntity(ped, VendingObject, -1)
				ReqAnimDict(Config.DispenseDict[1])
				RequestAmbientAudioBank("VENDING_MACHINE")
				HintAmbientAudioBank("VENDING_MACHINE", 0, -1)
				SetPedCurrentWeaponVisible(ped, false, true, 1, 0)
				ReqTheModel(itemProp)
				SetPedResetFlag(ped, 322, true)
				if not IsEntityAtCoord(ped, position, 0.1, 0.1, 0.1, false, true, 0) then
					TaskGoStraightToCoord(ped, position, 1.0, 20000, GetEntityHeading(VendingObject), 0.1)
					while not IsEntityAtCoord(ped, position, 0.1, 0.1, 0.1, false, true, 0) do
						Citizen.Wait(2000)
					end
				end
				TaskTurnPedToFaceEntity(ped, VendingObject, -1)
				Citizen.Wait(1000)
				TaskPlayAnim(ped, Config.DispenseDict[1], Config.DispenseDict[2], 8.0, 5.0, -1, true, 1, 0, 0, 0)
				Citizen.Wait(2500)
				local canModel = CreateObjectNoOffset(itemProp, position, true, false, false)
				SetEntityAsMissionEntity(canModel, true, true)
				SetEntityProofs(canModel, false, true, false, false, false, false, 0, false)
				AttachEntityToEntity(canModel, ped, GetPedBoneIndex(ped, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
				Citizen.Wait(1700)
				ReqAnimDict(Config.PocketAnims[1])
				TaskPlayAnim(ped, Config.PocketAnims[1], Config.PocketAnims[2], 8.0, 5.0, -1, true, 1, 0, 0, 0)
				Citizen.Wait(1000)
				ClearPedTasks(ped)
				ReleaseAmbientAudioBank()
				RemoveAnimDict(Config.DispenseDict[1])
				RemoveAnimDict(Config.PocketAnims[1])
				if DoesEntityExist(canModel) then
					DetachEntity(canModel, true, true)
					DeleteEntity(canModel)
				end
				SetModelAsNoLongerNeeded(itemProp)
				usingMachine = false
			end
		end, itemItem)
	end
end)
function nearVendingMachine()
	local player = PlayerPedId()
	local playerLoc = GetEntityCoords(player, 0)

	for _, machine in ipairs(Config.Machines) do
		VendingObject = GetClosestObjectOfType(playerLoc, 0.6, machine.model, false)
		if DoesEntityExist(VendingObject) then
			itemItem = machine.item
			itemCost = machine.price
			itemProp = machine.prop
			return true
		end
	end
	return false
end
function nearWaterCoolers()
	local player = PlayerPedId()
	local playerLoc = GetEntityCoords(player, 0)

	for _, machine in ipairs(Config.WaterCoolers) do
		VendingObject = GetClosestObjectOfType(playerLoc, 0.6, machine.model, false)
		if DoesEntityExist(VendingObject) then
			itemItem = machine.item
			itemProp = machine.prop
			return true
		end
	end
	return false
end
function nearCoffeeMakers()
	local player = PlayerPedId()
	local playerLoc = GetEntityCoords(player, 0)

	for _, machine in ipairs(Config.CoffeeMaker) do
		VendingObject = GetClosestObjectOfType(playerLoc, 0.6, machine.model, false)
		if DoesEntityExist(VendingObject) then
			itemItem = machine.item
			itemProp = machine.prop
			return true
		end
	end
	return false
end
function nearFoodVendo()
	local player = PlayerPedId()
	local playerLoc = GetEntityCoords(player, 0)

	for _, machine in ipairs(Config.FoodVendo) do
		VendingObject = GetClosestObjectOfType(playerLoc, 0.6, machine.model, false)
		if DoesEntityExist(VendingObject) then
			itemItem = machine.item
			itemProp = machine.prop
			itemCost = machine.price
			return true
		end
	end
	return false
end
function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function ReqTheModel(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(0)
	end
end

function ReqAnimDict(animDict)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(0)
	end
end