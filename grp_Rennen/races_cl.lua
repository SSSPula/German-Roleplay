local PlayerData


ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

-- DEFINITIONS AND CONSTANTS
local RACE_STATE_NONE = 0
local RACE_STATE_JOINED = 1
local RACE_STATE_RACING = 2
local RACE_STATE_RECORDING = 3
local RACE_CHECKPOINT_TYPE = 45
local RACE_CHECKPOINT_FINISH_TYPE = 9

-- Races and race status
local races = {}
local raceStatus = {
    state = RACE_STATE_NONE,
    index = 0,
    checkpoint = 0
}

-- Recorded checkpoints
local recordedCheckpoints = {}



RegisterCommand("rennen", function(source)
	
	if not isDead and PlayerData.job and PlayerData.job.name == 'carculture' then	
	
	
	MenuOeffnen()


	else
	exports['mythic_notify']:DoHudText('error', 'Du kannst kein Rennen starten!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })


	end

end)


function MenuOeffnen()
	ESX.UI.Menu.CloseAll()
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gg', {
		title    = 'GRP Rennenmenü',
		align    = 'top-left',
		elements = {
			{label = ('Strecke aufzeichnen'), value = 'eins'},
			{label = ('Rennen starten'), value = 'zwei'},
			{label = ('Rennen beenden/löschen'), value = 'drei'},
			{label = ('menü schliessen'), value = 'dasdsadsa'},
			
	}}, function(data, menu)
			local coordsrunter = { x = -1652.73,  y = -919.64, z = 0.46}
			local playerPed = GetPlayerPed(-1)
		    if data.current.value == 'eins' then
			SetWaypointOff()
			cleanupRecording()
			raceStatus.state = RACE_STATE_RECORDING
			exports['mythic_notify']:DoHudText('inform', 'Du kannst nun eine Strecke auf der Karte aufzeichnen.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })

			
		    elseif data.current.value == 'zwei' then
			
			local keyboard = exports["nh-keyboard"]:KeyboardInput({
			header = "Zeit zum beitreten", 
			rows = {
				{
					id = 0, 
					txt = "Zeit zum beitreten (sekunden)"
				}
			}
			})
			
			
			
            -- Get optional start delay argument and starting coordinates
            
			local startDelay = tonumber(keyboard) * 1000
            local startCoords = GetEntityCoords(GetPlayerPed(-1))
            -- Create a race using checkpoints or waypoint if none set
            if #recordedCheckpoints > 0 then
                -- Create race using custom checkpoints
                TriggerServerEvent('grp_Rennen:rennenerstellen_sv', startDelay, startCoords, recordedCheckpoints)
            elseif IsWaypointActive() then
                -- Create race using waypoint as the only checkpoint
                local waypointCoords = GetBlipInfoIdCoord(GetFirstBlipInfoId(8))
                local retval, nodeCoords = GetClosestVehicleNode(waypointCoords.x, waypointCoords.y, waypointCoords.z, 1)
                table.insert(recordedCheckpoints, {blip = nil, coords = nodeCoords})
                TriggerServerEvent('grp_Rennen:rennenerstellen_sv', startDelay, startCoords, recordedCheckpoints)
            end

            -- Set state to none to cleanup recording blips while waiting to join
            raceStatus.state = RACE_STATE_NONE
			
			
		    elseif data.current.value == 'drei' then
			 if raceStatus.state == RACE_STATE_JOINED or raceStatus.state == RACE_STATE_RACING then
            cleanupRace()
            TriggerServerEvent('grp_Rennen:rennenverlassen_sv', raceStatus.index)
			end

			-- Reset state
			raceStatus.index = 0
			raceStatus.checkpoint = 0
			raceStatus.state = RACE_STATE_NONE
			TriggerServerEvent('grp_Rennen:rennenabbrechen_sv')
			exports['mythic_notify']:DoHudText('inform', 'Rennen abgebrochen', { ['background-color'] = '#ffffff', ['color'] = '#000000' })

		    elseif data.current.value == 'vier' then
			
			end
			menu.close()
		
		end, function(data, menu)
		menu.close()
	end)
end


--[[
-- Main command for races
RegisterCommand("rennen33", function(source, args)
    if args[1] == "clear" or args[1] == "leave" then
        -- If player is part of a race, clean up map and send leave event to server
        if raceStatus.state == RACE_STATE_JOINED or raceStatus.state == RACE_STATE_RACING then
            cleanupRace()
            TriggerServerEvent('grp_Rennen:rennenverlassen_sv', raceStatus.index)
        end

        -- Reset state
        raceStatus.index = 0
        raceStatus.checkpoint = 0
        raceStatus.state = RACE_STATE_NONE
    elseif args[1] == "strecke" then
        -- Clear waypoint, cleanup recording and set flag to start recording
        SetWaypointOff()
        cleanupRecording()
        raceStatus.state = RACE_STATE_RECORDING
    elseif args[1] == "sichern" then
        -- Check name was provided and checkpoints are recorded
        local name = args[2]
        if name ~= nil and #recordedCheckpoints > 0 then
            -- Send event to server to save checkpoints
            TriggerServerEvent('grp_Rennen:rennenspeichern_sv', name, recordedCheckpoints)
        end
    elseif args[1] == "löschen" then
        -- Check name was provided and send event to server to delete saved race
        local name = args[2]
        if name ~= nil then
            TriggerServerEvent('grp_Rennen:rennenloschen_sv', name)
        end
    elseif args[1] == "liste" then
        -- Send event to server to list saved races
        TriggerServerEvent('grp_Rennen:rennenliste_sv')
    elseif args[1] == "laden" then
        -- Check name was provided and send event to server to load saved race
        local name = args[2]
        if name ~= nil then
            TriggerServerEvent('grp_Rennen:rennenladen_sv', name)
        end
    elseif args[1] == "start" then
        -- Parse arguments and create race
        
    elseif args[1] == "cancel" then
        -- Send cancel event to server
        TriggerServerEvent('grp_Rennen:rennenabbrechen_sv')
    else
        return
    end
end)
]]

-- Client event for when a race is created
RegisterNetEvent("grp_Rennen:rennenerstellen_cl")
AddEventHandler("grp_Rennen:rennenerstellen_cl", function(index, startDelay, startCoords, checkpoints)
    -- Create race struct and add to array
    local race = {
        started = false,
        startTime = GetGameTimer() + startDelay,
        startCoords = startCoords,
        checkpoints = checkpoints
    }
    races[index] = race
end)

-- Client event for loading a race
RegisterNetEvent("grp_Rennen:loadRace_cl")
AddEventHandler("grp_Rennen:loadRace_cl", function(checkpoints)
    -- Cleanup recording, save checkpoints and set state to recording
    cleanupRecording()
    recordedCheckpoints = checkpoints
    raceStatus.state = RACE_STATE_RECORDING

    -- Add map blips
    for index, checkpoint in pairs(recordedCheckpoints) do
        checkpoint.blip = AddBlipForCoord(checkpoint.coords.x, checkpoint.coords.y, checkpoint.coords.z)
        SetBlipColour(checkpoint.blip, config_cl.checkpointBlipColor)
        SetBlipAsShortRange(checkpoint.blip, true)
        ShowNumberOnBlip(checkpoint.blip, index)
    end

    -- Clear waypoint and add route for first checkpoint blip
    SetWaypointOff()
    SetBlipRoute(checkpoints[1].blip, true)
    SetBlipRouteColour(checkpoints[1].blip, config_cl.checkpointBlipColor)
end)

-- Client event for when a race is joined
RegisterNetEvent("grp_Rennen:joinedRace_cl")
AddEventHandler("grp_Rennen:joinedRace_cl", function(index)
    -- Set index and state to joined
    raceStatus.index = index
    raceStatus.state = RACE_STATE_JOINED

    -- Add map blips
    local race = races[index]
    local checkpoints = race.checkpoints
    for index, checkpoint in pairs(checkpoints) do
        checkpoint.blip = AddBlipForCoord(checkpoint.coords.x, checkpoint.coords.y, checkpoint.coords.z)
        SetBlipColour(checkpoint.blip, config_cl.checkpointBlipColor)
        SetBlipAsShortRange(checkpoint.blip, true)
        ShowNumberOnBlip(checkpoint.blip, index)
    end

    -- Clear waypoint and add route for first checkpoint blip
    SetWaypointOff()
    SetBlipRoute(checkpoints[1].blip, true)
    SetBlipRouteColour(checkpoints[1].blip, config_cl.checkpointBlipColor)
end)

-- Client event for when a race is removed
RegisterNetEvent("grp_Rennen:removeRace_cl")
AddEventHandler("grp_Rennen:removeRace_cl", function(index)
    -- Check if index matches active race
    if index == raceStatus.index then
        -- Cleanup map blips and checkpoints
        cleanupRace()

        -- Reset racing state
        raceStatus.index = 0
        raceStatus.checkpoint = 0
        raceStatus.state = RACE_STATE_NONE
    elseif index < raceStatus.index then
        -- Decrement raceStatus.index to match new index after removing race
        raceStatus.index = raceStatus.index - 1
    end
    
    -- Remove race from table
    table.remove(races, index)
end)
local bana = false
-- Main thread
Citizen.CreateThread(function()
    -- Loop forever and update every frame
    while true do
        Citizen.Wait(0)

        -- Get player and check if they're in a vehicle
        local player = GetPlayerPed(-1)
        if IsPedInAnyVehicle(player, false) then
            -- Get player position and vehicle
            local position = GetEntityCoords(player)
            local vehicle = GetVehiclePedIsIn(player, false)

            -- Player is racing
            if raceStatus.state == RACE_STATE_RACING then
                -- Initialize first checkpoint if not set
                local race = races[raceStatus.index]
                if raceStatus.checkpoint == 0 then
                    -- Increment to first checkpoint
                    raceStatus.checkpoint = 1
                    local checkpoint = race.checkpoints[raceStatus.checkpoint]

                    -- Create checkpoint when enabled
                    if config_cl.checkpointRadius > 0 then
                        local checkpointType = raceStatus.checkpoint < #race.checkpoints and RACE_CHECKPOINT_TYPE or RACE_CHECKPOINT_FINISH_TYPE
                        checkpoint.checkpoint = CreateCheckpoint(checkpointType, checkpoint.coords.x,  checkpoint.coords.y, checkpoint.coords.z, 0, 0, 0, config_cl.checkpointRadius, 255, 255, 0, 127, 0)
                        SetCheckpointCylinderHeight(checkpoint.checkpoint, config_cl.checkpointHeight, config_cl.checkpointHeight, config_cl.checkpointRadius)
                    end

                    -- Set blip route for navigation
                    SetBlipRoute(checkpoint.blip, true)
                    SetBlipRouteColour(checkpoint.blip, config_cl.checkpointBlipColor)
                else
                    -- Check player distance from current checkpoint
                    local checkpoint = race.checkpoints[raceStatus.checkpoint]
                    if GetDistanceBetweenCoords(position.x, position.y, position.z, checkpoint.coords.x, checkpoint.coords.y, 0, false) < config_cl.checkpointProximity then
                        -- Passed the checkpoint, delete map blip and checkpoint
                        RemoveBlip(checkpoint.blip)
                        if config_cl.checkpointRadius > 0 then
                            DeleteCheckpoint(checkpoint.checkpoint)
                        end
                        
                        -- Check if at finish line
                        if raceStatus.checkpoint == #(race.checkpoints) then
                            -- Play finish line sound
                            PlaySoundFrontend(-1, "ScreenFlash", "WastedSounds")

                            -- Send finish event to server
                            local currentTime = (GetGameTimer() - race.startTime)
                            TriggerServerEvent('grp_Rennen:finishedRace_sv', raceStatus.index, currentTime)
                            
                            -- Reset state
                            raceStatus.index = 0
                            raceStatus.state = RACE_STATE_NONE
                        else
                            -- Play checkpoint sound
                            PlaySoundFrontend(-1, "RACE_PLACED", "HUD_AWARDS")

                            -- Increment checkpoint counter and get next checkpoint
                            raceStatus.checkpoint = raceStatus.checkpoint + 1
                            local nextCheckpoint = race.checkpoints[raceStatus.checkpoint]

                            -- Create checkpoint when enabled
                            if config_cl.checkpointRadius > 0 then
                                local checkpointType = raceStatus.checkpoint < #race.checkpoints and RACE_CHECKPOINT_TYPE or RACE_CHECKPOINT_FINISH_TYPE
                                nextCheckpoint.checkpoint = CreateCheckpoint(checkpointType, nextCheckpoint.coords.x,  nextCheckpoint.coords.y, nextCheckpoint.coords.z, 0, 0, 0, config_cl.checkpointRadius, 255, 255, 0, 127, 0)
                                SetCheckpointCylinderHeight(nextCheckpoint.checkpoint, config_cl.checkpointHeight, config_cl.checkpointHeight, config_cl.checkpointRadius)
                            end

                            -- Set blip route for navigation
                            SetBlipRoute(nextCheckpoint.blip, true)
                            SetBlipRouteColour(nextCheckpoint.blip, config_cl.checkpointBlipColor)
                        end
                    end
                end

                -- Draw HUD when it's enabled
                if config_cl.hudEnabled then
                    -- Draw time and checkpoint HUD above minimap
                    local timeSeconds = (GetGameTimer() - race.startTime)/1000.0
                    local timeMinutes = math.floor(timeSeconds/60.0)
                    timeSeconds = timeSeconds - 60.0*timeMinutes
                    Draw2DText(config_cl.hudPosition.x, config_cl.hudPosition.y, ("~y~%02d:%06.3f"):format(timeMinutes, timeSeconds), 0.7)
                    local checkpoint = race.checkpoints[raceStatus.checkpoint]
                    local checkpointDist = math.floor(GetDistanceBetweenCoords(position.x, position.y, position.z, checkpoint.coords.x, checkpoint.coords.y, 0, false))
                    Draw2DText(config_cl.hudPosition.x, config_cl.hudPosition.y + 0.04, ("~y~CHECKPOINT %d/%d (%dm)"):format(raceStatus.checkpoint, #race.checkpoints, checkpointDist), 0.5)
                end
            -- Player has joined a race
            elseif raceStatus.state == RACE_STATE_JOINED then
                -- Check countdown to race start
                local race = races[raceStatus.index]
                local currentTime = GetGameTimer()
                local count = race.startTime - currentTime
                if count <= 0 then
                    -- Race started, set racing state and unfreeze vehicle position
                    raceStatus.state = RACE_STATE_RACING
                    raceStatus.checkpoint = 0
                    FreezeEntityPosition(vehicle, false)
					bana = false
                elseif count <= config_cl.freezeDuration then
                    -- Display countdown text and freeze vehicle position
                    Draw2DText(0.5, 0.4, ("~y~%d"):format(math.ceil(count/1000.0)), 3.0)
					
					if not bana then
					bana = true
					TriggerEvent("InteractSound_CL:PlayOnOne", "countdown", 0.4) 
					end
                    FreezeEntityPosition(vehicle, true)
                else
                    -- Draw 3D start time and join text
                    local temp, zCoord = GetGroundZFor_3dCoord(race.startCoords.x, race.startCoords.y, 9999.9, 1)
                    Draw3DText(race.startCoords.x, race.startCoords.y, zCoord+1.0, ("Rennen um ~w~ startet in ~y~%d~w~s"):format(math.ceil(count/1000.0)))
                    Draw3DText(race.startCoords.x, race.startCoords.y, zCoord+0.80, "Du nimmst teil! GRP wünscht viel Glück!")
                end
            -- Player is not in a race
            else
                -- Loop through all races
                for index, race in pairs(races) do
                    -- Get current time and player proximity to start
                    local currentTime = GetGameTimer()
                    local proximity = GetDistanceBetweenCoords(position.x, position.y, position.z, race.startCoords.x, race.startCoords.y, race.startCoords.z, true)

                    -- When in proximity and race hasn't started draw 3D text and prompt to join
                    if proximity < config_cl.joinProximity and currentTime < race.startTime then
                        -- Draw 3D text
                        local count = math.ceil((race.startTime - currentTime)/1000.0)
                        local temp, zCoord = GetGroundZFor_3dCoord(race.startCoords.x, race.startCoords.y, 9999.9, 0)
                        Draw3DText(race.startCoords.x, race.startCoords.y, zCoord+1.0, ("Das Rennen ~w~ startet in ~y~%d~w~s"):format(math.ceil(count)))
                        Draw3DText(race.startCoords.x, race.startCoords.y, zCoord+0.80, "Drücke [~g~E~w~] um das Rennen anzunehmen")

                        -- Check if player enters the race and send join event to server
                        if IsControlJustReleased(1, config_cl.joinKeybind) then
                            TriggerServerEvent('grp_Rennen:joinRace_sv', index)
                            break
                        end
                    end
                end
            end  
        end
    end
end)

-- Checkpoint recording thread
Citizen.CreateThread(function()
    -- Loop forever and record checkpoints every 100ms
    while true do
        Citizen.Wait(100)
        
        -- When recording flag is set, save checkpoints
        if raceStatus.state == RACE_STATE_RECORDING then
            -- Create new checkpoint when waypoint is set
            if IsWaypointActive() then
                -- Get closest vehicle node to waypoint coordinates and remove waypoint
                local waypointCoords = GetBlipInfoIdCoord(GetFirstBlipInfoId(8))
                local retval, coords = GetClosestVehicleNode(waypointCoords.x, waypointCoords.y, waypointCoords.z, 1)
                SetWaypointOff()

                -- Check if coordinates match any existing checkpoints
                for index, checkpoint in pairs(recordedCheckpoints) do
                    if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, checkpoint.coords.x, checkpoint.coords.y, checkpoint.coords.z, false) < 1.0 then
                        -- Matches existing checkpoint, remove blip and checkpoint from table
                        RemoveBlip(checkpoint.blip)
                        table.remove(recordedCheckpoints, index)
                        coords = nil

                        -- Update existing checkpoint blips
                        for i = index, #recordedCheckpoints do
                            ShowNumberOnBlip(recordedCheckpoints[i].blip, i)
                        end
                        break
                    end
                end

                -- Add new checkpoint
                if (coords ~= nil) then
                    -- Add numbered checkpoint blip
                    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
                    SetBlipColour(blip, config_cl.checkpointBlipColor)
                    SetBlipAsShortRange(blip, true)
                    ShowNumberOnBlip(blip, #recordedCheckpoints+1)

                    -- Add checkpoint to array
                    table.insert(recordedCheckpoints, {blip = blip, coords = coords})
                end
            end
        else
            -- Not recording, do cleanup
            cleanupRecording()
        end
    end
end)

-- Helper function to clean up race blips, checkpoints and status
function cleanupRace()
    -- Cleanup active race
    if raceStatus.index ~= 0 then
        -- Cleanup map blips and checkpoints
        local race = races[raceStatus.index]
        local checkpoints = race.checkpoints
        for _, checkpoint in pairs(checkpoints) do
            if checkpoint.blip then
                RemoveBlip(checkpoint.blip)
            end
            if checkpoint.checkpoint then
                DeleteCheckpoint(checkpoint.checkpoint)
            end
        end

        -- Set new waypoint to finish if racing
        if raceStatus.state == RACE_STATE_RACING then
            local lastCheckpoint = checkpoints[#checkpoints]
            SetNewWaypoint(lastCheckpoint.coords.x, lastCheckpoint.coords.y)
        end

        -- Unfreeze vehicle
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        FreezeEntityPosition(vehicle, false)
		bana = false
    end
end

-- Helper function to clean up recording blips
function cleanupRecording()
    -- Remove map blips and clear recorded checkpoints
    for _, checkpoint in pairs(recordedCheckpoints) do
        RemoveBlip(checkpoint.blip)
        checkpoint.blip = nil
    end
    recordedCheckpoints = {}
end

-- Draw 3D text at coordinates
function Draw3DText(x, y, z, text)
    -- Check if coords are visible and get 2D screen coords
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if onScreen then
        -- Calculate text scale to use
        local dist = GetDistanceBetweenCoords(GetGameplayCamCoords(), x, y, z, 1)
        local scale = 1.8*(1/dist)*(1/GetGameplayCamFov())*100

        -- Draw text on screen
        SetTextScale(scale, scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropShadow(0, 0, 0, 0,255)
        SetTextDropShadow()
        SetTextEdge(4, 0, 0, 0, 255)
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

-- Draw 2D text on screen
function Draw2DText(x, y, text, scale)
    -- Draw text on screen
    SetTextFont(4)
    SetTextProportional(7)
    SetTextScale(scale, scale)
    SetTextColour(255, 255, 255, 255)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end
