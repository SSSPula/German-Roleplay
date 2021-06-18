ESX = nil
local pos_before_assist,assisting,assist_target,last_assist,IsFirstSpawn = nil, false, nil, nil, true

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	SetNuiFocus(false, false)
end)

function GetIndexedPlayerList()
	local toReturn
	ESX.TriggerServerCallback("loaf_is_king", function(players)
		toReturn = players
	end)
	while not toReturn do
		Wait(50)
	end
	return toReturn
end


RegisterNUICallback("hidecursor", function(data,cb)
	SetNuiFocus(false, false)
end)

AddEventHandler("playerSpawned", function(spawn)
    if IsFirstSpawn and Config.backup_kick_method then
        TriggerServerEvent("grp_bmh:backupcheck")
        IsFirstSpawn = false
    end
end)


RegisterNetEvent("grp_bmh:requestedAssist")
AddEventHandler("grp_bmh:requestedAssist",function(t,name)
	SendNUIMessage({show=true,window="assistreq",data=Config.popassistformat:format(name,t)})
	--print(t)
	last_assist=t
end)
local unsichtbarkeyt2

RegisterNetEvent("grp_bmh:acceptedAssist")
AddEventHandler("grp_bmh:acceptedAssist",function(t)
	if assisting then return end
	local target = GetPlayerFromServerId(t)
	local target2 = (t)
	if target then
		PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

		local ped = GetPlayerPed(-1)
		pos_before_assist = GetEntityCoords(ped)
		assisting = true
		assist_target = t
		ExecuteCommand("goto " .. t)
		print(t)
		--unsichtbar sein
		unsichtbarkeyt2 = true
		--
		--exports['mythic_notify']:DoHudText('inform', 'Mit /beenden kannst Du den Fall schliessen.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
		
	end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
	local ped = GetPlayerPed(-1)


    if unsichtbarkeyt2 then
	--hier	
	SetEntityVisible(ped, false, false)
	SetEntityLocallyVisible(entity)
	DrawAdvancedText(1, 0.053, 0.005, 0.0028, 0.4, "Du bist unsichtbar", 255, 0, 0, 255, 6, 0)
	DrawAdvancedText(1, 0.053, 0.008, 0.0261, 0.4, "Andere Spieler können Dich nicht sehen.", 255, 0, 0, 255, 6, 0)
	DrawAdvancedText(1, 0.053, 0.008, 0.0461, 0.4, "Du darfst nun mit dem Spieler reden.", 255, 255, 255, 255, 6, 0)
	DrawAdvancedText(1, 0.053, 0.008, 0.0661, 0.4, "Mit [BILD RUNTER] kannst Du den Fall beenden.", 0, 100, 255, 255, 6, 0)
	else
	SetEntityVisible(entity, true, false)
	end	
end
end)

	
RegisterNetEvent("grp_bmh:assistDone")
AddEventHandler("grp_bmh:assistDone",function()
	if assisting then
		assisting = false
		if pos_before_assist~=nil then ESX.Game.Teleport(GetPlayerPed(-1),pos_before_assist+vector3(0,0.5,0)); pos_before_assist = nil end
		assist_target = nil
		PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
		unsichtbarkeyt2 = false
		SetEntityVisible(entity, true, false)
	end
end)

RegisterNetEvent("grp_bmh:hideAssistPopup")
AddEventHandler("grp_bmh:hideAssistPopup",function(t)
	SendNUIMessage({hide=true})
	last_assist=nil
end)

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

RegisterCommand("ablehnen",function(a,b,c)
	TriggerEvent("grp_bmh:hideAssistPopup")
	PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

end, false)

if Config.assist_keys.enable then
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			if IsControlJustPressed(0, 10) then
				--print(ja)
				
					TriggerServerEvent("grp_bmh:acceptAssistKey",last_assist)
				end
			end
			if IsControlJustPressed(0, Config.assist_keys.decline) then
				TriggerEvent("grp_bmh:assistDone")
				TriggerEvent("grp_bmh:hideAssistPopup")
			end
		end
	end)
end


