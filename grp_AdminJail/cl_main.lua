-- Config

local maxActions

-- Coords
local jailCoords = {x = 1080.28, y = 62.35, z = 79.89}
local stuckCoords = {x = 1088.28, y = 58.35, z = 79.89}
local jailRadius = 25.0
local outfitCoords = {x = -74.38, y = -820.35, z = 243.99}
local neuanfangCoords = {x = -1985.07, y = 3204.58, z = 32.81}
local wuerfelCoords = {x = 226.07, y = -789.58, z = 29.70}
local lshubCoords = {x = -1609.07, y = -1031.58, z = 12.13} --
local lshub2Coords = {x = 1123.07, y = 77.58, z = 79.89} --
local sandyhubCoords = {x = 2314.07, y = 3147.58, z = 47.08} --
local paletohubCoords = {x = 407.07, y = 6496.58, z = 26.86} --



-- Translation
local hitmankyll = "Ein ~bl~Hitman~w~ hat Dich ausgeschaltet. Es handelt sich demnach ~r~nicht um RDM."
local hitmankyll5 = "Du spürst ~b~kälte~w~. Du fühlst Dich verfolgt."
local hitmankyll4 = "Ein ~bl~Hitman~w~ hat einen Auftrag angenommen Dich zu ~r~TÖTEN."
local hitmankyll2 = "Diese Info darfst Du im RP ~r~nicht~w~ verwenden. Solltest Du dies nutzen, ist es ~r~METAgaming"
local hitmankyll3 = "und wird mit ~r~einem Ban~w~ bestraft."
local endMessage = "Du bist fertig! Willkommen zurück in der normalen Welt. Benimm Dich ab jetzt!"
local doingPrefix = "Du hast Dich daneben benommen!\n"
local doingSuffix = " Aufgaben noch. Vorher kommst Du nicht raus!"

-- Actions
local jailActionCoords =
{
	{ label = "Gewichte heben",			duration = 10000, scenario = "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS", x = 1102.6425341796,	y = 47.0556640625,	z = 79.89489944458,		h = 47.86309}, --
	{ label = "Gewichte heben",			duration = 10000, scenario = "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS", x = 1076.622680664,		y = 62.8493652344,	z = 44.564876556396,	h = 240.930492}, --
	{ label = "Pushups",			duration = 10000, scenario = "WORLD_HUMAN_PUSH_UPS",			x = 1091.439819336,		y = 52.7370605468,	z = 79.89489944458,		h = 239.6525192}, --
	{ label = "Pushups",			duration = 10000, scenario = "WORLD_HUMAN_PUSH_UPS",			x = 1089.8117675782,	y = 61.6665039062,	z = 79.89489944458,		h = 248.541206}, --
	{ label = "Pushups",			duration = 10000, scenario = "WORLD_HUMAN_PUSH_UPS",			x = 1095.2742919922,	y = 49.4873046875,	z = 79.89489944458,		h = 318.171966}, --
	{ label = "Bauchtraining",		duration = 10000, scenario = "WORLD_HUMAN_SIT_UPS",				x = 1101.6425341796,	y = 54.0556640625,	z = 79.89489944458,		h = 125.86309}, --
	{ label = "Bauchtraining",		duration = 10000, scenario = "WORLD_HUMAN_SIT_UPS",				x = 1087.4490966796,	y = 63.3046875,		z = 79.89489944458,		h = 234.47094726}, --
	{ label = "Bauchtraining",		duration = 10000, scenario = "WORLD_HUMAN_SIT_UPS",				x = 1087.8138427734,	y = 54.8374023438,	z = 79.89489944458,		h = 237.37298}, --
	{ label = "Bauchtraining",		duration = 10000, scenario = "WORLD_HUMAN_SIT_UPS",				x = 1095.5084228516,	y = 57.1552734375,	z = 79.89489944458,		h = 300.60180}, --
	{ label = "Bauchtraining",		duration = 10000, scenario = "WORLD_HUMAN_SIT_UPS",				x = 1083.407836914,		y = 51.583984375,		z = 79.89489944458,		h = 137.7697906}, --
	{ label = "Yoga",				duration = 10000, scenario = "WORLD_HUMAN_YOGA",				x = 1092.8255615234,	y = 55.7043457032,	z = 79.894865112304,	h = 236.25950622}, --
	{ label = "Yoga",				duration = 10000, scenario = "WORLD_HUMAN_YOGA",				x = 1079.7510986328,	y = 62.3874511718,	z = 79.894865112304,	h = 65.14630126}, --
	{ label = "Yoga",				duration = 10000, scenario = "WORLD_HUMAN_YOGA",				x = 1091.7794189454,	y = 66.0014648438,	z = 79.894865112304,	h = 351.44407653}, --
	{ label = "Joggen",			duration = 10000, scenario = "WORLD_HUMAN_JOG_STANDING",		x = 1097.0295410156,	y = 65.6865234375,	z = 79.564865112304,	h = 349.7815246582}, --
	{ label = "Joggen",			duration = 10000, scenario = "WORLD_HUMAN_JOG_STANDING",		x = 1079.1231689454,	y = 58.3095703125,	z = 79.894865112304,	h = 127.14538574218}, --
	{ label = "Joggen",			duration = 10000, scenario = "WORLD_HUMAN_JOG_STANDING",		x = 1097.1625976562,	y = 56.9912109375,	z = 79.894865112304,	h = 55.96112060546}, --
	{ label = "Joggen",			duration = 10000, scenario = "WORLD_HUMAN_JOG_STANDING",		x = 1099.8634033204,	y = 46.0524902344,	z = 79.894865112304,	h = 212.926918029786}, --
	{ label = "Joggen",			duration = 10000, scenario = "WORLD_HUMAN_JOG_STANDING",		x = 1084.2060546875,	y = 60.70703125,		z = 79.894865112304,	h = 31.375495910644}, --
	{ label = "Fege den Boden",	duration = 10000, scenario = "WORLD_HUMAN_JANITOR",				x = 1089.8232421875,	y = 67.7856445312,	z = 79.894865112304,	h = 286.40534973144}, --
	{ label = "Fege den Boden",	duration = 10000, scenario = "WORLD_HUMAN_JANITOR",				x = 1098.9923095704,	y = 52.69140625,		z = 79.894865112304,	h = 220.42027282714}, --
	{ label = "Fege den Boden",	duration = 10000, scenario = "WORLD_HUMAN_JANITOR",				x = 1080.2058105468,	y = 56.2036132812,	z = 79.894865112304,	h = 74.950496673584}, --
}


-- Variables 
local imknast = false
local currentAction = 0
local isDoingAction = false
local nActionLeft = nActionNeeded
local initialCoords = nil


-- Functions
local function DrawText3D(x,y,z, text, r,g,b) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
	scale = scale * 1.0
   
    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(r, g, b, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

local function newNotif(message, duration)
	Citizen.CreateThread(function()
		SetNotificationTextEntry("STRING")
		AddTextComponentSubstringPlayerName(message)
		if duration then 
		local Notification = DrawNotification(true, true)
		Citizen.Wait(duration)
		RemoveNotification(Notification)
		else DrawNotification(false, false) end
	end)
end

local function ExitJail()
	currentAction = 0
	isInJail = false
	imknast = false
	Citizen.Wait(1000)
	isDoingAction = false
	nActionLeft = nActionNeeded
	SetEntityCoords(GetPlayerPed(-1), initialCoords.x, initialCoords.y, initialCoords.z, 0, 0, 0, 0)
	newNotif(endMessage, 6000)
	--SetEntityInvincible(GetPlayerPed(-1), false)
end

local function Hitmankill()
newNotif(hitmankyll, 12000)
PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
Citizen.Wait(6000)
newNotif(hitmankyll2, 12000)
Citizen.Wait(100)
newNotif(hitmankyll3, 12000)
PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")


end

local function Hitmankill2()
newNotif(hitmankyll5, 12000)
PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
Citizen.Wait(6000)
newNotif(hitmankyll4, 12000)
PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
Citizen.Wait(6000)
newNotif(hitmankyll2, 12000)
Citizen.Wait(100)
newNotif(hitmankyll3, 12000)
PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")


end


local function SetPedInJail()
	--SetEntityInvincible(GetPlayerPed(-1), true)
	local newCoords = {x = jailCoords.x + (math.random(1, 5) * 1.0), y = jailCoords.y + (math.random(1, 5) * 1.0), z = jailCoords.z}
	SetEntityCoords(GetPlayerPed(-1), newCoords.x, newCoords.y, newCoords.z, 0, 0, 0, 0)
	FreezeEntityPosition(GetPlayerPed(-1), false)
	imknast = true
end



local function IsPedOutOfJail(currentPos)
	local distanceFromJail = GetDistanceBetweenCoords(jailCoords.x, jailCoords.y, jailCoords.z, currentPos.x, currentPos.y, currentPos.z, true)
	--[[
	if distanceFromJail > jailRadius and isInJail then
		return true
	else
	--]]
		return false
	--end
end



local function IsPedNearAction(currentPos)
	local distanceFromCurrentAction = GetDistanceBetweenCoords(jailActionCoords[currentAction].x, jailActionCoords[currentAction].y, jailActionCoords[currentAction].z, currentPos.x, currentPos.y, currentPos.z, true)
	if distanceFromCurrentAction < 2.0 then
		return true
	else
		return false
	end
end

local function SetNewAction()
	local randomNewAction = math.random(1, #jailActionCoords)
	if currentAction ~= 0 then
		local distBetweenOldAndNewActions = GetDistanceBetweenCoords(jailActionCoords[currentAction].x, jailActionCoords[currentAction].y, jailActionCoords[currentAction].z, jailActionCoords[randomNewAction].x, jailActionCoords[randomNewAction].y, jailActionCoords[randomNewAction].z, true)
		while distBetweenOldAndNewActions < 5.0 do
			randomNewAction = math.random(1, #jailActionCoords)
			distBetweenOldAndNewActions = GetDistanceBetweenCoords(jailActionCoords[currentAction].x, jailActionCoords[currentAction].y, jailActionCoords[currentAction].z, jailActionCoords[randomNewAction].x, jailActionCoords[randomNewAction].y, jailActionCoords[randomNewAction].z, true)
		end
	end

	newNotif(doingPrefix .. nActionLeft .. "/" .. nActionNeeded .. doingSuffix, 5000)
	currentAction = randomNewAction
end

local function OnActionEnd()
	ClearPedTasks(GetPlayerPed(-1))
	nActionLeft = nActionLeft - 1
	if nActionLeft <= 0 then
		ExitJail()
	else
		SetNewAction()
	end
end


-- Loops
-- System
Citizen.CreateThread(function()
	Citizen.Wait(3000)

    while true do
        Citizen.Wait(0)
		
        if isInJail then
			local currentPos = GetEntityCoords(GetPlayerPed(-1))
		--anti abhaumodus
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1089.8448486328,57.649471282959,80.892555236816, true) > 25 then
		local ped = PlayerPedId()
		SetEntityCoords(ped, 1089.8448486328,57.649471282959,80.892555236816, false, false, false, true)
		end
			if IsPedNearAction(currentPos) then
				isDoingAction = true
				TaskStartScenarioInPlace(GetPlayerPed(-1), jailActionCoords[currentAction].scenario, 0, true)
				Citizen.Wait(jailActionCoords[currentAction].duration)
				OnActionEnd()
				isDoingAction = false
			end
			
			Citizen.Wait(0)
        --[[
		else
			local currentPos = GetEntityCoords(GetPlayerPed(-1))
			if not IsPedOutOfJail(currentPos) then
				TriggerEvent("cookpris:setInJail", maxActions)
			end

            Citizen.Wait(1000)
		]]--	
        end
    end
end)


--zurücktp
Citizen.CreateThread(function()
while true do
        Citizen.Wait(0)


		--draw + tp initialcoords
		DrawMarker(25, -77.185241699219,-826.52777099609,242.38575744629, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 0.5, 0, 155, 255, 155, 0, 0, 2, 2, 0, 0, 0)
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -77.185241699219,-826.52777099609,243.38575744629, true) < 3 then
            --was passiert wenn man im marker ist
			--DisplayHelpText("~w~Drücke [E] um zurück zu kehren !")
            if (IsControlJustPressed(1, 38)) then
			SetEntityCoords(GetPlayerPed(-1), initialCoords2.x, initialCoords2.y, initialCoords2.z, 0, 0, 0, 0)
			end
		end
    end
end)




-- Display
Citizen.CreateThread(function ()
	while true do
		if currentAction > 0 and not isDoingAction then
			DrawText3D(jailActionCoords[currentAction].x, jailActionCoords[currentAction].y, jailActionCoords[currentAction].z + 1.0, "[~g~GRP~w~] ~g~" .. jailActionCoords[currentAction].label .. "~w~", 255, 255, 255)
			Citizen.Wait(0)
		else
			Citizen.Wait(500)
		end
	end
end)


-- Events
RegisterNetEvent("cookpris:setInJail")
AddEventHandler("cookpris:setInJail", function(lNewNeeded)
	nActionNeeded = lNewNeeded
	nActionLeft = nActionNeeded

	initialCoords = GetEntityCoords(GetPlayerPed(-1))

	TriggerEvent('cS.banner', "~y~Adminjail", "Du bist nun im ~r~Adminjail~w~ mach deine Aufgaben!", 10, true)
	isInJail = true
	SetPedInJail()
	SetNewAction()
end)

RegisterNetEvent("cookpris:outfitP")
AddEventHandler("cookpris:outfitP", function()
	local playerPed = GetPlayerPed(-1)
	
	initialCoords2 = GetEntityCoords(GetPlayerPed(-1))
	local newCoords2 = {x = outfitCoords.x + (math.random(1, 5) * 1.0), y = outfitCoords.y + (math.random(1, 5) * 1.0), z = outfitCoords.z}
	SetEntityCoords(GetPlayerPed(-1), newCoords2.x, newCoords2.y, newCoords2.z, 0, 0, 0, 0)
	
	TriggerEvent('skinchanger:getSkin', function(skin)
                if skin.sex == 0 then 
                        --männer
						local clothesSkin = { 
                        ['torso_1'] 	= 262, 	['torso_2'] 	= 0,
						['tshirt_1'] 	= 15, 	['tshirt_2'] 	= 0,
						['pants_1'] 	= 6, 	['pants_2'] 	= 1,
						['shoes_1'] 	= 8, 	['shoes_2'] 	= 0,
						['arms'] 	= 1,			['bproof_1']	= 0, 
						
                        } 
                        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                        TriggerServerEvent('esx_skin:save', skin)
                        end)
                else
						--frauen
                        local clothesSkin = { 
                        ['torso_1'] 	= 271, 	['torso_2'] 	= 0,
						['tshirt_1'] 	= 14, 	['tshirt_2'] 	= 0,
						['pants_1'] 	= 11, 	['pants_2'] 	= 1,
						['shoes_1'] 	= 1, 	['shoes_2'] 	= 0,
						['arms'] 	= 3,			['bproof_1']	= 0,  
						
                        } 
                        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                        TriggerServerEvent('esx_skin:save', skin)
                        end)               
                end 
			end)
	
	FreezeEntityPosition(playerPed, true)
	Citizen.Wait(2300)
	FreezeEntityPosition(playerPed, false)
end)

RegisterNetEvent("cookpris:neuanfangP")
AddEventHandler("cookpris:neuanfangP", function()
	local playerPed = GetPlayerPed(-1)
	
	
	local newCoords3 = {x = neuanfangCoords.x + (math.random(1, 5) * 1.0), y = neuanfangCoords.y + (math.random(1, 5) * 1.0), z = neuanfangCoords.z}
	SetEntityCoords(GetPlayerPed(-1), newCoords3.x, newCoords3.y, newCoords3.z, 0, 0, 0, 0)
	FreezeEntityPosition(playerPed, true)
	Citizen.Wait(2300)
	FreezeEntityPosition(playerPed, false)
end)

RegisterNetEvent("cookpris:wuerfelpark")
AddEventHandler("cookpris:wuerfelpark", function()
	local playerPed = GetPlayerPed(-1)
	
	
	local newCoords2 = {x = wuerfelCoords.x + (math.random(1, 5) * 1.0), y = wuerfelCoords.y + (math.random(1, 5) * 1.0), z = wuerfelCoords.z}
	SetEntityCoords(GetPlayerPed(-1), newCoords2.x, newCoords2.y, newCoords2.z, 0, 0, 0, 0)
	FreezeEntityPosition(playerPed, true)
	Citizen.Wait(2300)
	FreezeEntityPosition(playerPed, false)
end)

RegisterNetEvent("cookpris:lshub")
AddEventHandler("cookpris:lshub", function()
	local playerPed = GetPlayerPed(-1)
	
	
	local newCoords2 = {x = lshubCoords.x + (math.random(1, 5) * 1.0), y = lshubCoords.y + (math.random(1, 5) * 1.0), z = lshubCoords.z}
	SetEntityCoords(GetPlayerPed(-1), newCoords2.x, newCoords2.y, newCoords2.z, 0, 0, 0, 0)
	FreezeEntityPosition(playerPed, true)
	Citizen.Wait(2300)
	FreezeEntityPosition(playerPed, false)
end)

RegisterNetEvent("cookpris:lshub2")
AddEventHandler("cookpris:lshub2", function()
	local playerPed = GetPlayerPed(-1)
	
	
	local newCoords2 = {x = lshub2Coords.x + (math.random(1, 5) * 1.0), y = lshub2Coords.y + (math.random(1, 5) * 1.0), z = lshub2Coords.z}
	SetEntityCoords(GetPlayerPed(-1), newCoords2.x, newCoords2.y, newCoords2.z, 0, 0, 0, 0)
	FreezeEntityPosition(playerPed, true)
	Citizen.Wait(2300)
	FreezeEntityPosition(playerPed, false)
end)

RegisterNetEvent("cookpris:sandyhub")
AddEventHandler("cookpris:sandyhub", function()
	local playerPed = GetPlayerPed(-1)
	
	
	local newCoords2 = {x = sandyhubCoords.x + (math.random(1, 5) * 1.0), y = sandyhubCoords.y + (math.random(1, 5) * 1.0), z = sandyhubCoords.z}
	SetEntityCoords(GetPlayerPed(-1), newCoords2.x, newCoords2.y, newCoords2.z, 0, 0, 0, 0)
	FreezeEntityPosition(playerPed, true)
	Citizen.Wait(2300)
	FreezeEntityPosition(playerPed, false)
end)

RegisterNetEvent("cookpris:paletohub")
AddEventHandler("cookpris:paletohub", function()
	local playerPed = GetPlayerPed(-1)
	
	
	local newCoords2 = {x = paletohubCoords.x + (math.random(1, 5) * 1.0), y = paletohubCoords.y + (math.random(1, 5) * 1.0), z = paletohubCoords.z}
	SetEntityCoords(GetPlayerPed(-1), newCoords2.x, newCoords2.y, newCoords2.z, 0, 0, 0, 0)
	FreezeEntityPosition(playerPed, true)
	Citizen.Wait(2300)
	FreezeEntityPosition(playerPed, false)
end)


RegisterNetEvent("cookpris:hytmankyll")
AddEventHandler("cookpris:hytmankyll", function()
	Hitmankill()
end)

RegisterNetEvent("cookpris:hytmankyll2")
AddEventHandler("cookpris:hytmankyll2", function()
	Hitmankill2()
end)

RegisterNetEvent("cookpris:notify")
AddEventHandler("cookpris:notify", function(message, duration)
	newNotif(message, duration)
end)