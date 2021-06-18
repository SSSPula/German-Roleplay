ESX = nil


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)


--[[
RegisterNetEvent('setgroup')
AddEventHandler('setgroup', function()
    group = true
end)    


Citizen.CreateThread(function()
    while true do
        Citizen.Wait( 2000 )

        if NetworkIsSessionStarted() then
            TriggerServerEvent( "checkadmin")
        end
    end
end )
]]


local maxHealth = GetEntityMaxHealth(playerPed)
local health = GetEntityHealth(playerPed)
local newHealth = math.min(maxHealth , math.floor(health + maxHealth/1))

--==--==--==--
-- Noclip
--==--==--==--


function DrawPlayerInfo(target)
	drawTarget = target
	drawInfo = true
end

function StopDrawPlayerInfo()
	drawInfo = false
	drawTarget = 0
end
Citizen.CreateThread( function()
	while true do
		Citizen.Wait(0)
		if drawInfo then
			local text = {}
			-- cheat checks
			local targetPed = GetPlayerPed(drawTarget)
			
			table.insert(text,"[E] Zuschauen beenden")
			
			for i,theText in pairs(text) do
				SetTextFont(0)
				SetTextProportional(1)
				SetTextScale(0.0, 0.30)
				SetTextDropshadow(0, 0, 0, 0, 255)
				SetTextEdge(1, 0, 0, 0, 255)
				SetTextDropShadow()
				SetTextOutline()
				SetTextEntry("STRING")
				AddTextComponentString(theText)
				EndTextCommandDisplayText(0.3, 0.7+(i/30))
			end
			
			if IsControlJustPressed(0,103) then
				local targetPed = PlayerPedId()
				local targetx,targety,targetz = table.unpack(GetEntityCoords(targetPed, false))
	
				RequestCollisionAtCoord(targetx,targety,targetz)
				NetworkSetInSpectatorMode(false, targetPed)
	
				StopDrawPlayerInfo()
				
			end
			
		end
	end
end)




RegisterNetEvent("grp_Adminmenu:tpm")
AddEventHandler("grp_Adminmenu:tpm", function()
    ESX.TriggerServerCallback('grd_Pets:Gruppegetten', function(plyGroup)
	if plyGroup == 'superadmin' or plyGroup == 'admin' then
	local WaypointHandle = GetFirstBlipInfoId(8)
    if DoesBlipExist(WaypointHandle) then
        local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

        for height = 1, 1000 do
            SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

            local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

            if foundGround then
                SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                break
            end

            Citizen.Wait(5)
        end
		exports['mythic_notify']:SendAlert('inform',' Erfolgreich teleportiert.', 2500, { ['background-color'] = '#00FFFF', ['color'] = '#000000' })
    else
		exports['mythic_notify']:SendAlert('inform',' Wähle zuerst ein Ziel auf der Karte.', 2500, { ['background-color'] = '#00FFFF', ['color'] = '#000000' })
    end
	else
	end
	end)
end)





function SpectatePlayer(targetPed,target,name)
    local playerPed = PlayerPedId() -- yourself
	enable = true
	if targetPed == playerPed then enable = false end

    if(enable)then

        local targetx,targety,targetz = table.unpack(GetEntityCoords(targetPed, false))

        RequestCollisionAtCoord(targetx,targety,targetz)
        NetworkSetInSpectatorMode(true, targetPed)
		DrawPlayerInfo(target)
       -- ESX.ShowNotification('~g~Spectator mode in progress')
    else

        local targetx,targety,targetz = table.unpack(GetEntityCoords(targetPed, false))

        RequestCollisionAtCoord(targetx,targety,targetz)
        NetworkSetInSpectatorMode(false, targetPed)
		StopDrawPlayerInfo()
        --ESX.ShowNotification('~b~Spectator mode stopped')
    end
end

function ButtonMessage(text)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end

function Button(ControlButton)
    N_0xe83a3e3557a56640(ControlButton)
end

function setupScaleform(scaleform)

    local scaleform = RequestScaleformMovie(scaleform)

    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(1)
    end

    PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()

	--[[
    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(5)
    Button(GetControlInstructionalButton(2, config.controls.openKey, true))
    ButtonMessage("Disable Noclip")
    PopScaleformMovieFunctionVoid()
	]]
	
	PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(5)
    Button(GetControlInstructionalButton(2, 74, true))
    ButtonMessage("Maus/Tastatur")
    PopScaleformMovieFunctionVoid()
	
	PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(4)
    Button(GetControlInstructionalButton(2, config.controls.goUp, true))
    ButtonMessage("↑")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(3)
    Button(GetControlInstructionalButton(2, config.controls.goDown, true))
    ButtonMessage("↓")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(2)
    Button(GetControlInstructionalButton(1, config.controls.turnRight, true))
    Button(GetControlInstructionalButton(1, config.controls.turnLeft, true))
    ButtonMessage("←-- l --→")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(1)
    Button(GetControlInstructionalButton(1, config.controls.goBackward, true))
    Button(GetControlInstructionalButton(1, config.controls.goForward, true))
    ButtonMessage("+ l -")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(0)
    Button(GetControlInstructionalButton(2, config.controls.changeSpeed, true))
    ButtonMessage(""..config.speeds[index].label.."")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
    PushScaleformMovieFunctionParameterInt(config.bgR)
    PushScaleformMovieFunctionParameterInt(config.bgG)
    PushScaleformMovieFunctionParameterInt(config.bgB)
    PushScaleformMovieFunctionParameterInt(config.bgA)
    PopScaleformMovieFunctionVoid()

    return scaleform
end

config = {
    controls = {
        -- [[Controls, list can be found here : https://docs.fivem.net/game-references/controls/]]
        openKey = 288, -- [[F2]]
        goUp = 85, -- [[Q]]
        goDown = 48, -- [[Z]]
        turnLeft = 34, -- [[A]]
        turnRight = 35, -- [[D]]
        goForward = 32,  -- [[W]]
        goBackward = 33, -- [[S]]
        changeSpeed = 21, -- [[L-Shift]]
    },

    speeds = {
        -- [[If you wish to change the speeds or labels there are associated with then here is the place.]]
        { label = "Sehr langsam", speed = 0},
        { label = "langsam", speed = 0.5},
        { label = "Normal", speed = 2},
        { label = "schnell", speed = 4},
        { label = "sehr schnell", speed = 6},
        { label = "Extrem schnell", speed = 10},
        { label = "Extrem schnell v2.0", speed = 20},
        { label = "Max Geschw.", speed = 25}
    },

    offsets = {
        y = 0.5, -- [[How much distance you move forward and backward while the respective button is pressed]]
        z = 0.2, -- [[How much distance you move upward and downward while the respective button is pressed]]
        h = 3, -- [[How much you rotate. ]]
    },

    -- [[Background colour of the buttons. (It may be the standard black on first opening, just re-opening.)]]
    bgR = 0, -- [[Red]]
    bgG = 0, -- [[Green]]
    bgB = 0, -- [[Blue]]
    bgA = 80, -- [[Alpha]]
}


noclipActive = false -- [[Wouldn't touch this.]]

index = 1 -- [[Used to determine the index of the speeds table.]]

Citizen.CreateThread(function()

    buttons = setupScaleform("instructional_buttons")

    currentSpeed = config.speeds[index].speed

    while true do
        Citizen.Wait(1)

        if noclipActive then
            DrawScaleformMovieFullscreen(buttons)

            local yoff = 0.0
            local zoff = 0.0

            if IsControlJustPressed(1, config.controls.changeSpeed) then
                if index ~= 8 then
                    index = index+1
                    currentSpeed = config.speeds[index].speed
                else
                    currentSpeed = config.speeds[1].speed
                    index = 1
                end
                setupScaleform("instructional_buttons")
            end

			if IsControlPressed(0, config.controls.goForward) then
                yoff = config.offsets.y
			end
			
            if IsControlPressed(0, config.controls.goBackward) then
                yoff = -config.offsets.y
			end
			
            if IsControlPressed(0, config.controls.turnLeft) then
                SetEntityHeading(noclipEntity, GetEntityHeading(noclipEntity)+config.offsets.h)
			end
			
            if IsControlPressed(0, config.controls.turnRight) then
                SetEntityHeading(noclipEntity, GetEntityHeading(noclipEntity)-config.offsets.h)
			end
			
            if IsControlPressed(0, config.controls.goUp) then
                zoff = config.offsets.z
			end
			
            if IsControlPressed(0, config.controls.goDown) then
                zoff = -config.offsets.z
			end
			
            local newPos = GetOffsetFromEntityInWorldCoords(noclipEntity, 0.0, yoff * (currentSpeed + 0.3), zoff * (currentSpeed + 0.3))
            local heading = GetEntityHeading(noclipEntity)
            SetEntityVelocity(noclipEntity, 0.0, 0.0, 0.0)
            SetEntityRotation(noclipEntity, 0.0, 0.0, 0.0, 0, false)
            SetEntityHeading(noclipEntity, heading)
            SetEntityCoordsNoOffset(noclipEntity, newPos.x, newPos.y, newPos.z, noclipActive, noclipActive, noclipActive)
        end
    end
end)

--==--==--==--
-- Noclip fin
--==--==--==--


local function TeleportToWaypoint()-- https://gist.github.com/samyh89/32a780abcd1eea05ab32a61985857486
    local entity = PlayerPedId()
    if IsPedInAnyVehicle(entity, false) then
        entity = GetVehiclePedIsUsing(entity)
    end
    local success = false
    local blipFound = false
    local blipIterator = GetBlipInfoIdIterator()
    local blip = GetFirstBlipInfoId(8)
    
    while DoesBlipExist(blip) do
        if GetBlipInfoIdType(blip) == 4 then
            cx, cy, cz = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ReturnResultAnyway(), Citizen.ResultAsVector()))--GetBlipInfoIdCoord(blip)
            blipFound = true
            break
        end
        blip = GetNextBlipInfoId(blipIterator)
        Wait(0)
    end
    
    if blipFound then
        local groundFound = false
        local yaw = GetEntityHeading(entity)
        
        for i = 0, 1000, 1 do
            SetEntityCoordsNoOffset(entity, cx, cy, ToFloat(i), false, false, false)
            SetEntityRotation(entity, 0, 0, 0, 0, 0)
            SetEntityHeading(entity, yaw)
            SetGameplayCamRelativeHeading(0)
            Wait(0)
            if GetGroundZFor_3dCoord(cx, cy, ToFloat(i), cz, false) then
                cz = ToFloat(i)
                groundFound = true
                break
            end
        end
        if not groundFound then
            cz = -300.0
        end
        success = true
   
    end
    
    if success then
        SetEntityCoordsNoOffset(entity, cx, cy, cz, false, false, true)
        SetGameplayCamRelativeHeading(0)
        if IsPedSittingInAnyVehicle(PlayerPedId()) then
            if GetPedInVehicleSeat(GetVehiclePedIsUsing(PlayerPedId()), -1) == PlayerPedId() then
                SetVehicleOnGroundProperly(GetVehiclePedIsUsing(PlayerPedId()))
            end
        end
    end

end

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)

	-- TextEntry		-->	The Text above the typing field in the black square
	-- ExampleText		-->	An Example Text, what it should say in the typing field
	-- MaxStringLenght	-->	Maximum String Lenght

	AddTextEntry('FMMC_KEY_TIP1', TextEntry) --Sets the Text above the typing field in the black square
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) --Actually calls the Keyboard Input
	blockinput = true --Blocks new input while typing if **blockinput** is used

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do --While typing is not aborted and not finished, this loop waits
		Citizen.Wait(0)
	end
		
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult() --Gets the result of the typing
		Citizen.Wait(500) --Little Time Delay, so the Keyboard won't open again if you press enter to finish the typing
		blockinput = false --This unblocks new Input when typing is done
		return result --Returns the result
	else
		Citizen.Wait(500) --Little Time Delay, so the Keyboard won't open again if you press enter to finish the typing
		blockinput = false --This unblocks new Input when typing is done
		return nil --Returns nil if the typing got aborted
	end
end

function gestionjoueurs()
	for k,v in ipairs(ServersIdSession) do
                if GetPlayerName(GetPlayerFromServerId(v)) == "**Invalid**" then table.remove(ServersIdSession, k) 
                end

                RageUI.Button("["..v.."] - "..GetPlayerName(GetPlayerFromServerId(v)), nil, {RightLabel = "→→→"}, true, function(Hovered, Active, Selected)
			end)
			end
			end			



Admin = {
	showcoords = false,
	showcrosshair = false,
	ghostmode = false,
    godmode = false,
    showName = false,
    gamerTags = {}
}
MainColor = {
	r = 225, 
	g = 55, 
	b = 55,
	a = 255
}

function DrawTxt(text,r,z)
    SetTextColour(MainColor.r, MainColor.g, MainColor.b, 255)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0,0.4)
    SetTextDropshadow(1,0,0,0,255)
    SetTextEdge(1,0,0,0,255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(r,z)
 end


 --------------------------------------------


 Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(0)
        TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj)
            ESX = obj
        end)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

local ServersIdSession = {}

Citizen.CreateThread(function()
    while true do
        Wait(500)
        for k,v in pairs(GetActivePlayers()) do
            local found = false
            for _,j in pairs(ServersIdSession) do
                if GetPlayerServerId(v) == j then
                    found = true
                end
            end
            if not found then
                table.insert(ServersIdSession, GetPlayerServerId(v))
            end
        end
    end
end)

local joueurPed = GetPlayerPed(IdSelected)
 --------------------------------------------





RMenu.Add('admin', 'main', RageUI.CreateMenu("Spielerliste", "German Roleplay GRP"))
RMenu.Add('admin', 'listej', RageUI.CreateSubMenu(RMenu:Get('admin', 'main'), "Spielerliste", "Online Spieler"))
RMenu.Add('admin', 'gestj', RageUI.CreateSubMenu(RMenu:Get('admin', 'listej'), "Spieler verwaltung", "Aktion wählen:"))


Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('admin', 'main'), true, true, true, function()

            RageUI.Button("Spielerliste", "Online Spieler", {RightLabel = "→→→"},true, function()
            end, RMenu:Get('admin', 'listej'))
            
        end, function()
        end)
    	RageUI.IsVisible(RMenu:Get('admin', 'listej'), true, true, true, function()
              for k,v in ipairs(ServersIdSession) do
                if GetPlayerName(GetPlayerFromServerId(v)) == "**OFFLINE**" then table.remove(ServersIdSession, k) end
                RageUI.Button("[ID : "..v.."~s~] - ~r~"..GetPlayerName(GetPlayerFromServerId(v)), nil, {}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        IdSelected = v
                    end
                end, RMenu:Get('admin', 'gestj'))
            end
    	
       end, function()
        end)

		 

        RageUI.IsVisible(RMenu:Get('admin', 'gestj'), true, true, true, function()
        
		RageUI.Button("~r~Spieler~s~: ".. GetPlayerName(GetPlayerFromServerId(IdSelected)) .." [ID : "..IdSelected.."]", nil, {}, true, function(Hovered, Active, Selected)
        end)

		RageUI.Button("~r~zu Spieler teleportieren".. " ", nil, {}, true, function(Hovered, Active, Selected)
            if (Selected) then
                ExecuteCommand("goto " .. IdSelected)
                
            end
        end)
		
		RageUI.Button("~r~zurück teleportieren".. " ", nil, {}, true, function(Hovered, Active, Selected)
            if (Selected) then
                ExecuteCommand("goback")
                
            end
        end)
		
		RageUI.Button("~r~Spieler holen  ".. " ", nil, {}, true, function(Hovered, Active, Selected)
            if (Selected) then
                ExecuteCommand("bring " .. IdSelected)
                --ESX.ShowNotification('~b~You just TP to '.. GetPlayerName(GetPlayerFromServerId(IdSelected)) ..'')
            end
        end)
		RageUI.Button("~r~Spieler zurückbringen ".. " ", nil, {}, true, function(Hovered, Active, Selected)
            if (Selected) then
                ExecuteCommand("bringback " .. IdSelected)
                --ESX.ShowNotification('~b~You just TP to '.. GetPlayerName(GetPlayerFromServerId(IdSelected)) ..'')
            end
        end)
		
		RageUI.Button("~r~Spieler töten  ".. " ", nil, {}, true, function(Hovered, Active, Selected)
            if (Selected) then
                ExecuteCommand("kill " .. IdSelected)
                --ESX.ShowNotification('~b~You just TP to '.. GetPlayerName(GetPlayerFromServerId(IdSelected)) ..'')
            end
        end)
		
		RageUI.Button("~r~Spieler wiederbeleben  ".. " ", nil, {}, true, function(Hovered, Active, Selected)
            if (Selected) then
                ExecuteCommand("revive " .. IdSelected)
                --ESX.ShowNotification('~b~You just TP to '.. GetPlayerName(GetPlayerFromServerId(IdSelected)) ..'')
            end
        end)
		
		RageUI.Button("~r~Adminjail  ".. " ", nil, {}, true, function(Hovered, Active, Selected)
            if (Selected) then
                --ExecuteCommand("outfit " .. IdSelected)
                local keyboard = exports["nh-keyboard"]:KeyboardInput({
				header = "Adminjail", 
				rows = {
				{
				id = 0, 
				txt = "Wieviele Aufgaben?"
				}
				}
				})
				if keyboard ~= nil then
				ExecuteCommand("adminjail " .. IdSelected .. " " .. keyboard)
				end
            end
        end)
		
		RageUI.Button("~r~Outfit ändern  ".. " ", nil, {}, true, function(Hovered, Active, Selected)
            if (Selected) then
                ExecuteCommand("outfit " .. IdSelected)
                --ESX.ShowNotification('~b~You just TP to '.. GetPlayerName(GetPlayerFromServerId(IdSelected)) ..'')
            end
        end)
		
		RageUI.Button("~r~Einfrieren  ".. " ", nil, {}, true, function(Hovered, Active, Selected)
            if (Selected) then
				ExecuteCommand("freeze " .. IdSelected)
                --ESX.ShowNotification('~b~You just TP to '.. GetPlayerName(GetPlayerFromServerId(IdSelected)) ..'')
            end
        end)
		RageUI.Button("~r~Auftauen  ".. " ", nil, {}, true, function(Hovered, Active, Selected)
            if (Selected) then
				ExecuteCommand("unfreeze " .. IdSelected)
                --ESX.ShowNotification('~b~You just TP to '.. GetPlayerName(GetPlayerFromServerId(IdSelected)) ..'')
            end
        end)
		RageUI.Button("~r~Screenshot anfordern  ".. " ", nil, {}, true, function(Hovered, Active, Selected)
            if (Selected) then
				TriggerServerEvent('grp_Adminmenu:screnshoetbitte', IdSelected)
                --ESX.ShowNotification('~b~You just TP to '.. GetPlayerName(GetPlayerFromServerId(IdSelected)) ..'')
            end
        end)
        RageUI.Button("~r~Zuschauen  ".. " ", nil, {}, true, function(Hovered, Active, Selected)
                if (Selected) then
				local playerId = GetPlayerFromServerId(IdSelected)
                    SpectatePlayer(GetPlayerPed(playerId),playerId,GetPlayerName(playerId))
                end
            end)   			
       end, function()
        end)
            Citizen.Wait(0)
        end
    end)

	
RegisterNetEvent('grp_Adminmenu:screnshoettgeben')
AddEventHandler('grp_Adminmenu:screnshoettgeben', function()
	exports['screenshot-basic']:requestScreenshotUpload("https://discord.com/api/webhooks/822344379225341954/TqNJbIXOyNragectGhXD-Nu363SuvfJ6-EBLhAPbj62o_wuEbnnWG3Hn_z75Feb0ICU1", "files[]", function(data)
	local image = json.decode(data)
	end)
Citizen.Wait(5000)
end)

 --------------------------------------------




--[[
RegisterNetEvent('grp_admin:openlistjoueur')
AddEventHandler('grp_admin:openlistjoueur', function()
	ESX.TriggerServerCallback('grd_Pets:Gruppegetten', function(plyGroup)
	if plyGroup == 'superadmin' or plyGroup == 'admin' then	
	RageUI.Visible(RMenu:Get('admin', 'main'), not RageUI.Visible(RMenu:Get('admin', 'main')))
	
	else
	
	end
	end)
end)

]]

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
                --if group == true then 
                    if IsControlJustPressed(1,244) then
					 TriggerEvent('grp_admin:menuv')
                    end
					if IsControlJustReleased(0, 82) then 
					
					 TriggerEvent('adminmenueee:namettgggs')
                    end
					if IsControlJustReleased(0, 168) then
					TriggerEvent('grp_Adminmenu:tpm')
					
					end
                --end
       		 end
    end)


	
