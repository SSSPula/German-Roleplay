ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


local ImNewbie = nil
local FirstSpawn = true
local Newbies = {}
--[[ AddEventHandler('playerSpawned', function()
    if FirstSpawn then
        FirstSpawn = false
        TriggerServerEvent('Cyber:NewbieSystemSpawn')
    end
end) 
]]

RegisterNetEvent("Cyber:LoadNewbies")
AddEventHandler('Cyber:LoadNewbies', function(new)
    if new then
        Newbies = new
        if Newbies[GetPlayerServerId(PlayerId())] then ImNewbie = true end
    end
end)

RegisterNetEvent('Cyber:NewNewbie')
AddEventHandler('Cyber:NewNewbie', function(serverid)
    if not Newbies[serverid] then Newbies[serverid] = true end
    if Newbies[GetPlayerServerId(PlayerId())] and not ImNewbie then
        ImNewbie = true
    end
end)

RegisterNetEvent('Cyber:NoLongerNewbie')
AddEventHandler('Cyber:NoLongerNewbie', function(serverid)
    if Newbies[serverid] then Newbies[serverid] = nil end
    if ImNewbie and not Newbies[GetPlayerServerId(PlayerId())] then
        ImNewbie = false
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"[Noobschutz]", '~g~ Dein Noobschutz ist abgelaufen. Viel spaß auf GRP'}
        })
        PlaySoundFrontend(-1, "DELETE", "HUD_DEATHMATCH_SOUNDSET", 1)
        SetNotificationTextEntry('STRING')
        AddTextComponentString('~g~ Du wirst nun nicht mehr als Neuling angezeigt.')
        DrawNotification(0, 1)
    end
end)


RegisterNetEvent('Cyber:IsNotAnAdmin')
AddEventHandler('Cyber:IsNotAnAdmin', function()
    TriggerEvent('chat:addMessage', {
        color = {255, 0, 0},
        multiline = false,
        args = {"[Noobschutz]",
            'Du bist kein Admin'
			}
    })
end)

RegisterNetEvent('Cyber:InvalidServerID')
AddEventHandler('Cyber:InvalidServerID', function()
    TriggerEvent('chat:addMessage', {
        color = {255, 0, 0},
        multiline = true,
        args = {
            "[Noobschutz]",
            'ID Fehlerhaft'
        }
    })
end)

RegisterNetEvent('Cyber:TimePlayMessage')
AddEventHandler('Cyber:TimePlayMessage', function(timeplay)
    

    exports['mythic_notify']:DoHudText('inform', 'Du hast bereits: ' .. tostring(timeplay) .. " Minuten auf GRP gespielt.", { ['background-color'] = '#ffffff', ['color'] = '#000000' })

end)


RegisterNetEvent('Cyber:TrustSuccessful')
AddEventHandler('Cyber:TrustSuccessful', function()
    TriggerEvent('chat:addMessage', {
        color = {255, 0, 0},
        multiline = true,
        args = {
            "[Noobschutz]",
            '~g~Der Spieler hat nun keinen Noobschutz mehr.'
        }
    })
end)



Citizen.CreateThread(function()
    local astrsrrr = {
        `s_m_m_movspace_01`,
    }
    exports['bt-target']:AddTargetModel(astrsrrr, {
        options = {
            {
                event = "strsr:ofefnnen2",
                icon = "fas fa-dumpster",
                label = "Menü öffnen",
            },
        },
        job = {"all"},
        distance = 2.5
    })
end)


RegisterNetEvent('strsr:ofefnnen2')
AddEventHandler('strsr:ofefnnen2', function()
obermenu()

end)


function obermenu()
	ESX.UI.Menu.CloseAll()
	menuauf = true
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'obermenu', {
		title    = 'Menüauswahl',
		align    = 'top-left',
		elements = {
			{label = ('Spielzeit'), value = 'spielzeit1'},
			{label = ('Freunde werben Freunde'), value = 'freunde1'},
			
			
	}}, function(data, menu)
		
	
		    if data.current.value == 'spielzeit1' then
			MunuPceeeee2()
			
		    elseif data.current.value == 'freunde1' then
			MunuPceeee()
		   
			end
		menu.close()
		menuauf = false
	end)
end


function MunuPceeee()
	ESX.UI.Menu.CloseAll()
	menuauf = true
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'grp_partnercode', {
		title    = 'GRP Freunde werben',
		align    = 'top-left',
		elements = {
			{label = ('Code benutzen'), value = 'spielermenu3'},
			{label = ('Code erstellen'), value = 'spielermenu'},
			{label = ('Code übersicht'), value = 'spielermenu2'},
			
	}}, function(data, menu)
		
	
		    if data.current.value == 'spielermenu' then
			local keyboard = exports["nh-keyboard"]:KeyboardInput({
			header = "Code erstellen", 
			rows = {
			{
            id = 0, 
            txt = "Code"
			}
			}
			})
			if keyboard ~= nil then
			ExecuteCommand("grpref " .. keyboard)
			--TriggerEvent('additem', keyboard)
			end
		    elseif data.current.value == 'spielermenu2' then
			ExecuteCommand("mycode")
		    elseif data.current.value == 'spielermenu3' then
			local keyboard = exports["nh-keyboard"]:KeyboardInput({
			header = "Code verwenden", 
			rows = {
			{
            id = 0, 
            txt = "Code eingeben"
			}
			}
			})
			if keyboard ~= nil then
			ExecuteCommand("usecode " .. keyboard)
			end
		end
		menu.close()
		menuauf = false
	end)
end

function MunuPceeeee2()
	ESX.UI.Menu.CloseAll()
	menuauf = true
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tts', {
		title    = 'Spielzeitmenü',
		align    = 'top-left',
		elements = {
			{label = ('Spielzeit einsehen'), value = 'spielzeit'},
			--{label = ('Discordrolle abholen'), value = 'discordrolle'},
			--{label = ('Discordrolle abgeben'), value = 'discordrolleeg'},
			
			
	}}, function(data, menu)
		menu.close()
		
	
		    if data.current.value == 'spielzeit' then
			ExecuteCommand("spielzeit")
			
		    elseif data.current.value == 'discordrolle' then
				if hfUdFhzt3D > Config.Spieltagefurrolle then
				TriggerServerEvent('grp_dcogrp:giroll')
				exports['mythic_notify']:DoHudText('inform', "Du hast dir erfolgreich die Rolle abgeholt.", { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				Citizen.Wait(10000)
				else
				exports['mythic_notify']:DoHudText('error', 'Du hast weniger als ' .. Config.Spieltagefurrolle .. " Spieltage.", { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				end
		    elseif data.current.value == 'discordrolleeg' then
				if hfUdFhzt3D > Config.Spieltagefurrolle then
				TriggerServerEvent('grp_dcogrp:niroll')
				else
				exports['mythic_notify']:DoHudText('error', 'Du hast weniger als ' .. Config.Spieltagefurrolle .. " Spieltage.", { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				end
			end
	end)
end

--ende neues menü

if #Config.KeysToDisableForNewbie > 0 then
    Citizen.CreateThread(function()
        while true do
            if ImNewbie then
                for _, v in pairs(Config.KeysToDisableForNewbie) do
                    DisableControlAction(0, v, true)
                end
                Wait(0)
            else
                Wait(5000)
            end
        end
    end)
end


function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end



if Config.DisablePlayerFiringForNewbies then
    Citizen.CreateThread(function()
        while true do
            if ImNewbie then
                DisablePlayerFiring(PlayerId(), true)
                Wait(0)
            else
                Wait(5000)
            end
        end
    end)
end


Citizen.CreateThread(function()
	while true do
		--if not ImNewbie then
		if ImNewbie then
			DrawAdvancedText(0.891, 0.953, 0.005, 0.0028, 0.4, Config.Text1, 0, 191, 255, 255, 6, 0)
			DrawAdvancedText(0.891, 0.983, 0.005, 0.0028, 0.4, Config.Text2, 0, 191, 255, 255, 6, 0)
			Wait(0)
		else
			Wait(5000)
		end
	end
end)


--[[


if Config.NewbieTag.Enabled then
    ShowNewbies = {}
    Citizen.CreateThread(function()

        while true do
            Wait(1000)
            ShowNewbies = {}
            local myserverid = GetPlayerServerId(PlayerId())
            local mycoords = GetEntityCoords(PlayerPedId())
            for i, v in pairs(Newbies) do
                local targetplayerid = GetPlayerFromServerId(i)
                if targetplayerid ~= -1 then
                    local ped = GetPlayerPed(targetplayerid)
                    local coords = GetEntityCoords(ped)
                    local dist = #(coords - mycoords)
                    if dist < Config.NewbieTag.DistanceToShow then
                        ShowNewbies[ped] = true
                    end
                end
            end
        end
    end)
    Citizen.CreateThread(function()
        while true do
            if IsTableMoreThanOne(ShowNewbies) then
                Wait(0)
                for i, v in pairs(ShowNewbies) do
                    local coords = GetEntityCoords(i)
                    local show = true

                    if Config.NewbieTag.ShowInVehicle and IsPedInAnyVehicle(i) then
                        show = false
                    end
                    if not Config.NewbieTag.ShowForHimSelf and i ==
                        PlayerPedId() then show = false end
                    if Config.NewbieTag.ShowWithOnlyClearLos and
                        not HasEntityClearLosToEntityInFront(i, PlayerPedId()) then
                        show = false
                    end

                    if show then
                        local x, y, z = table.unpack(coords)
                        DrawText3D(x, y, z + Config.NewbieTag.Height,
                                   Config.NewbieTag.NewbieTag,
                                   Config.NewbieTag.Color.r,
                                   Config.NewbieTag.Color.g,
                                   Config.NewbieTag.Color.b,
                                   Config.NewbieTag.Color.a,
                                   Config.NewbieTag.Size)
                    end
                end
            else
                Wait(1000)
            end
        end
    end)

end

]]--

-- [[ End of Newbie Tags]]

-- [[Functions]]

function DrawGenericTextThisFrame(size)
    SetTextFont(4)
    SetTextScale(0.0, size)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(true)
end

function DrawText3D(x, y, z, text, r, g, b, a, size)
    local showing, _x, _y = World3dToScreen2d(x, y, z)

    if showing then
        local px, py, pz = table.unpack(GetGameplayCamCoords())
        local dist = #(vector3(px, py, pz) - vector3(x, y, z))

        local andaze = (1 / dist) * 2
        local fov = (1 / GetGameplayCamFov()) * 100
        local andaze = andaze * fov
        SetTextScale(0.0, size * andaze)
        SetTextFont(7)
        SetTextProportional(1)
        SetTextColour(r, g, b, a)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

IsTableMoreThanOne = function(tbl)
    for _, v in pairs(tbl) do if v then return true end end
    return false
end
