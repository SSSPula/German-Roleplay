local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil

PlayerData = {}

local jailTime = 0
local bereits = false
local imknast = false
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData() == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()

	
end)


--faq

function openMenu(trigger, isServer, params, time, text)
    SendNUIMessage({
        action = "open",
        text = text,
        time = time
    })
    local time2 = time - 1
    Citizen.SetTimeout(time, function()
        time2 = time + 1
    end)
    while time > time2 do
        if IsControlJustPressed(1, 246) then
            if isServer == true then
                TriggerServerEvent(trigger, params)
                SendNUIMessage({close = true})
                break
            else 
                TriggerEvent(trigger, params)
                SendNUIMessage({close = true})
                break
            end
        elseif IsControlJustPressed(1, 74) then  --H
            SendNUIMessage({close = true})
			ExecuteCommand("oocconsdstr hat die Anfrage abgelehnt")
            break
        end
        Wait(1)
    end
end

local aufgabenanzahl = 0

function aufgabedazu()
	PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
	if aufgabenanzahl < 9 then
		aufgabenanzahl = aufgabenanzahl + 1
		elseif aufgabenanzahl == 9 then
		TriggerServerEvent('grp_Knast:einewenigerplssss')
		aufgabenanzahl = 0
	end
end


local aufgabe1 = true
local aufgabe2 = false
local aufgabe3 = false
local aufgabe4 = false
local aufgabe5 = false
local aufgabe6 = false
local aufgabe7 = false
local aufgabe8 = false
local aufgabe9 = false
local aufgabe10 = false
					
--aufgaben im knast
Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
		if imknast then
			local ped = PlayerPedId()
			DrawMarker(1, 1752.7545166016,2550.3833007812,44.564975738525, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 0, 155, 255, 155, 0, 0, 2, 0, 0, 0, 0) 
			DrawMarker(1, 1748.6840820312,2536.1904296875,44.564990997314, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 0, 155, 255, 155, 0, 0, 2, 0, 0, 0, 0) 
			DrawMarker(1, 1744.3739013672,2544.7333984375,44.566707611084, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 0, 155, 255, 155, 0, 0, 2, 0, 0, 0, 0) 
			DrawMarker(1, 1756.6007080078,2543.7033691406,44.56498336792, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 0, 155, 255, 155, 0, 0, 2, 0, 0, 0, 0) 
			DrawMarker(1, 1750.6029052734,2541.3757324219,44.56498336792, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 0, 155, 255, 155, 0, 0, 2, 0, 0, 0, 0) 
			--besen schwingen matrose
			DrawMarker(1, 1744.3309326172,2558.6237792969,44.564998626709, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 0, 255, 155, 155, 0, 0, 2, 0, 0, 0, 0) 
			DrawMarker(1, 1722.2303466797,2560.1284179688,44.564903259277, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 0, 255, 155, 155, 0, 0, 2, 0, 0, 0, 0) 
			DrawMarker(1, 1734.5552978516,2538.5539550781,44.564903259277, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 0, 255, 155, 155, 0, 0, 2, 0, 0, 0, 0) 
			DrawMarker(1, 1721.7442392578,2514.8142089844,44.564903259277, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 0, 255, 155, 155, 0, 0, 2, 0, 0, 0, 0) 
			DrawMarker(1, 1758.9716796875,2533.1120605469,44.564945220947, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 0, 255, 155, 155, 0, 0, 2, 0, 0, 0, 0) 
			--1
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1758.9716796875,2533.1120605469,45.564945220947, true) < 1 then
				if (IsControlJustPressed(1, 38)) then
					if not aufgabe1 then
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_JANITOR", 0, true)
					FreezeEntityPosition(ped, true)
					Citizen.Wait(6000)
					aufgabedazu()
					ClearPedTasks(ped)
					FreezeEntityPosition(ped, false)
					aufgabe1 = true
					aufgabe2 = false
					aufgabe3 = false
					aufgabe4 = false
					aufgabe5 = false
					aufgabe6 = false
					aufgabe7 = false
					aufgabe8 = false
					aufgabe9 = false
					aufgabe10 = false
					else
					exports['mythic_notify']:DoHudText('error', 'Los! Weiter! Mach andere Aufgaben!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					end
				end
			end
			--2
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1721.7452392578,2514.8142089844,45.564903259277, true) < 1 then
				if (IsControlJustPressed(1, 38)) then
					if not aufgabe2 then
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_JANITOR", 0, true)
					FreezeEntityPosition(ped, true)
					Citizen.Wait(6000)
					aufgabedazu()
					ClearPedTasks(ped)
					FreezeEntityPosition(ped, false)
					print(aufgabe2)
					aufgabe1 = false
					aufgabe2 = true
					aufgabe3 = false
					aufgabe4 = false
					aufgabe5 = false
					aufgabe6 = false
					aufgabe7 = false
					aufgabe8 = false
					aufgabe9 = false
					aufgabe10 = false
					else
					exports['mythic_notify']:DoHudText('error', 'Los! Weiter! Mach andere Aufgaben!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					end
				end
			end
			--3
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1734.5552978516,2538.5539550781,45.564903259277, true) < 1 then
				if (IsControlJustPressed(1, 38)) then
					if not aufgabe3 then
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_JANITOR", 0, true)
					FreezeEntityPosition(ped, true)
					Citizen.Wait(6000)
					aufgabedazu()
					ClearPedTasks(ped)
					FreezeEntityPosition(ped, false)
					aufgabe1 = false
					aufgabe2 = false
					aufgabe3 = true
					aufgabe4 = false
					aufgabe5 = false
					aufgabe6 = false
					aufgabe7 = false
					aufgabe8 = false
					aufgabe9 = false
					aufgabe10 = false
					else
					exports['mythic_notify']:DoHudText('error', 'Los! Weiter! Mach andere Aufgaben!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					end
				end
			end
			--4
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1722.2303466797,2560.1284179688,45.564903259277, true) < 1 then
				if (IsControlJustPressed(1, 38)) then
					if not aufgabe4 then
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_JANITOR", 0, true)
					FreezeEntityPosition(ped, true)
					Citizen.Wait(6000)
					aufgabedazu()
					ClearPedTasks(ped)
					FreezeEntityPosition(ped, false)
					aufgabe1 = false
					aufgabe2 = false
					aufgabe3 = false
					aufgabe4 = true
					aufgabe5 = false
					aufgabe6 = false
					aufgabe7 = false
					aufgabe8 = false
					aufgabe9 = false
					aufgabe10 = false
					else
					exports['mythic_notify']:DoHudText('error', 'Los! Weiter! Mach andere Aufgaben!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					end
				end
			end
			--5
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1744.3309326172,2558.6237792969,45.564998626709, true) < 1 then
				if (IsControlJustPressed(1, 38)) then
					if not aufgabe5 then
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_JANITOR", 0, true)
					FreezeEntityPosition(ped, true)
					Citizen.Wait(6000)
					aufgabedazu()
					ClearPedTasks(ped)
					FreezeEntityPosition(ped, false)
					aufgabe1 = false
					aufgabe2 = false
					aufgabe3 = false
					aufgabe4 = false
					aufgabe5 = true
					aufgabe6 = false
					aufgabe7 = false
					aufgabe8 = false
					aufgabe9 = false
					aufgabe10 = false
					else
					exports['mythic_notify']:DoHudText('error', 'Los! Weiter! Mach andere Aufgaben!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					end
				end
			end
			--6
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1752.8444824219,2550.2885742188,45.56498336792, true) < 1 then
				if (IsControlJustPressed(1, 38)) then
					if not aufgabe6 then
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS", 0, true)
					FreezeEntityPosition(ped, true)
					Citizen.Wait(6000)
					aufgabedazu()
					ClearPedTasks(ped)
					FreezeEntityPosition(ped, false)
					aufgabe1 = false
					aufgabe2 = false
					aufgabe3 = false
					aufgabe4 = false
					aufgabe5 = false
					aufgabe6 = true
					aufgabe7 = false
					aufgabe8 = false
					aufgabe9 = false
					aufgabe10 = false
					else
					exports['mythic_notify']:DoHudText('error', 'Los! Weiter! Mach andere Aufgaben!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					end
				end
			end
			--7
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1744.1026611328,2544.50390625,45.564998626709, true) < 1 then
				if (IsControlJustPressed(1, 38)) then
					if not aufgabe7 then
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_JOG_STANDING", 0, true)
					FreezeEntityPosition(ped, true)
					Citizen.Wait(6000)
					aufgabedazu()
					ClearPedTasks(ped)
					FreezeEntityPosition(ped, false)
					aufgabe1 = false
					aufgabe2 = false
					aufgabe3 = false
					aufgabe4 = false
					aufgabe5 = false
					aufgabe6 = false
					aufgabe7 = true
					aufgabe8 = false
					aufgabe9 = false
					aufgabe10 = false
					else
					exports['mythic_notify']:DoHudText('error', 'Los! Weiter! Mach andere Aufgaben!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					end
				end
			end
			--8
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1756.4500732422,2543.7116699219,45.564998626709, true) < 1 then
				if (IsControlJustPressed(1, 38)) then
					if not aufgabe8 then
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_YOGA", 0, true)
					FreezeEntityPosition(ped, true)
					Citizen.Wait(6000)
					aufgabedazu()
					ClearPedTasks(ped)
					FreezeEntityPosition(ped, false)
					aufgabe1 = false
					aufgabe2 = false
					aufgabe3 = false
					aufgabe4 = false
					aufgabe5 = false
					aufgabe6 = false
					aufgabe7 = false
					aufgabe8 = true
					aufgabe9 = false
					aufgabe10 = false
					else
					exports['mythic_notify']:DoHudText('error', 'Los! Weiter! Mach andere Aufgaben!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					end
				end
			end
			--9
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1750.5992431641,2541.4516601562,45.564998626709, true) < 1 then
				if (IsControlJustPressed(1, 38)) then
					if not aufgabe9 then
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS", 0, true)
					FreezeEntityPosition(ped, true)
					Citizen.Wait(6000)
					aufgabedazu()
					ClearPedTasks(ped)
					FreezeEntityPosition(ped, false)
					aufgabe1 = false
					aufgabe2 = false
					aufgabe3 = false
					aufgabe4 = false
					aufgabe5 = false
					aufgabe6 = false
					aufgabe7 = false
					aufgabe8 = false
					aufgabe9 = true
					aufgabe10 = false
					else
					exports['mythic_notify']:DoHudText('error', 'Los! Weiter! Mach andere Aufgaben!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					end
				end
			end	
			--10
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1748.7370605469,2536.2424316406,45.564998626709, true) < 1 then
				if (IsControlJustPressed(1, 38)) then
					if not aufgabe10 then
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_PUSH_UPS", 0, true)
					FreezeEntityPosition(ped, true)
					Citizen.Wait(6000)
					aufgabedazu()
					ClearPedTasks(ped)
					FreezeEntityPosition(ped, false)
					aufgabe1 = false
					aufgabe2 = false
					aufgabe3 = false
					aufgabe4 = false
					aufgabe5 = false
					aufgabe6 = false
					aufgabe7 = false
					aufgabe8 = false
					aufgabe9 = false
					aufgabe10 = true
					else
					exports['mythic_notify']:DoHudText('error', 'Los! Weiter! Mach andere Aufgaben!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					end
				end
			end	
			DrawAdvancedText(0.891, 0.953, 0.005, 0.0028, 0.4, aufgabenanzahl .. "/10 Aufgaben erledigt", 0, 191, 255, 255, 6, 0)
			DrawAdvancedText(0.891, 0.933, 0.005, 0.0028, 0.4, "Noch: " .. jailTime .. " Minuten übrig", 0, 191, 255, 255, 6, 0)
		end
	end
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


--alle 10 aufgaben 1 minute weniger

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
		if imknast and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1771.4653320312,2553.1508789062,45.565021514893, true) > 100 then
			local JailPosition = Config.JailPositions["Cell"]
			SetEntityCoords(PlayerPedId(), JailPosition["x"], JailPosition["y"], JailPosition["z"] - 1)
			exports['mythic_notify']:DoHudText('error', 'Du bist ausgebrochen und wurdest zurück teleporiert!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
		end
		--rein
		DrawMarker(1, 1792.7211914062,2552.0114746094,44.564990997314, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 0, 155, 255, 155, 0, 0, 2, 0, 0, 0, 0) 
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1792.7211914062,2552.0114746094,45.564990997314, true) < 1 then
			if (IsControlJustPressed(1, 38)) then
				if PlayerData.job and (PlayerData.job.name == 'police' or PlayerData.job.name == 'doj' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'sheriff' or PlayerData.job.name == 'fib') then	
				SetEntityCoords(PlayerPedId(), 1773.7620849609,2552.0163574219,45.564990997314)
				PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
				
				else
				exports['mythic_notify']:DoHudText('error', 'Du hast keinen Schlüssel für diese Tür!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

				end
			end
		end
		DrawMarker(1, 1773.7620849609,2552.0163574219,44.564990997314, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 0, 155, 255, 155, 0, 0, 2, 0, 0, 0, 0) 
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1773.7620849609,2552.0163574219,45.564990997314, true) < 1 then
			if (IsControlJustPressed(1, 38)) then
				if PlayerData.job and (PlayerData.job.name == 'police' or PlayerData.job.name == 'doj' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'sheriff' or PlayerData.job.name == 'fib') then	
					SetEntityCoords(PlayerPedId(), 1792.7211914062,2552.0114746094,45.564990997314)
					PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

				else
				exports['mythic_notify']:DoHudText('error', 'Du hast keinen Schlüssel für diese Tür!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

				end
			end
		end
	end
end)


RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(newData)
	PlayerData = newData

	Citizen.Wait(25000)

	ESX.TriggerServerCallback("grp_Knast:WieLangeNoch", function(inJail, newJailTime)
		if inJail then

			jailTime = newJailTime

			JailLogin()
		end
	end)
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job

	Citizen.Wait(5000)
	TriggerServerEvent('grp_PolizeiJob:forceBlip')
end)



RegisterNetEvent("grp_Knast:ZeigeKnast")
AddEventHandler("grp_Knast:ZeigeKnast", function()
	if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1792.3135986328,2552.0700683594,45.564990997314, true) < 20 then
	OpenJailMenu()
	
	else
	exports['mythic_notify']:SendAlert('error', 'Du musst Dich beim Stateprison befinden.', 4000, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	end
end)

RegisterNetEvent("grp_Knast:IchSperreDichEin")
AddEventHandler("grp_Knast:IchSperreDichEin", function(newJailTime)
	--neuer test
	if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 1793.1112060547,2552.373046875,45.56502532959, true) < 50 then
	jailTime = newJailTime
	imknast = true
	Cutscene()
	end
end)




RegisterNetEvent("grp_Knast:IchLasseDichFrei")
AddEventHandler("grp_Knast:IchLasseDichFrei", function()
	jailTime = 0
	imknast = false
	UnJail()
end)

function JailLogin()
	local JailPosition = Config.JailPositions["Cell"]
	SetEntityCoords(PlayerPedId(), JailPosition["x"], JailPosition["y"], JailPosition["z"] - 1)

	exports['mythic_notify']:SendAlert('error', 'Du bist im Gefängnis!', 4000, { ['background-color'] = '#ffffff', ['color'] = '#000000' })

	InJail()
end

function UnJail()
	InJail()
	imknast = false
	
	SetEntityCoords(PlayerPedId(), 1849.7214355469,2585.7722167969,45.672313690186)
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
	end)

	exports['mythic_notify']:SendAlert('success', 'Du bist aus dem Gefängnis entlassen wurden!', 4000, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
end

function InJail()

	--Jail Timer--
	Citizen.CreateThread(function()
		
		while jailTime > 0 do

			jailTime = jailTime - 1
			
			--local JailPosition = Config.JailPositions["Cell"]
			--SetEntityCoords(PlayerPedId(), JailPosition["x"], JailPosition["y"], JailPosition["z"] - 1)

			ESX.ShowNotification("Du sitzt noch " .. jailTime .. " Minuten im Gefängnis!")

			TriggerServerEvent("grp_Knast:ZeitAktualisieren", jailTime)

			if jailTime == 0 then
				UnJail()
				imknast = false
				TriggerServerEvent("grp_Knast:ZeitAktualisieren", 0)
			end
			Citizen.Wait(60000)
		end
	end)
end

--[[
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if jemandenfreigelassen then
		Citizen.Wait(1800000)
		local jemandenfreigelassen = false
		else
		Citizen.Wait(10000)
		end
	end
end)
]]




function OpenJailMenu()
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'jail_prison_menu',
		{
			title    = "Gefängnis Befugnisse",
			align    = 'top-left',
			elements = {
				{ label = "🔐Person in Gefängnis sperren (Insasse sitzt 1 Min. weniger!)", value = "jail_closest_player" },			
				{ label = "🔑Person aus Gefängnis freilassen", value = "unjail_player" }
			}
		}, 
	function(data, menu)

		local action = data.current.value

		
		if action == "jail_closest_player" then
			menu.close()
		
			local keyboard = exports["nh-keyboard"]:KeyboardInput({
			header = "Haftzeit", 
			rows = {
				{
					id = 0, 
					txt = "Haftzeit"
				}
			}
			})
			local jailTime = tonumber(keyboard) + 1
			
			if jailTime == nil then
					exports['mythic_notify']:SendAlert('error', 'Die Zeit muss in Minuten angegeben werden!', 4000, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
            	else
				if jailTime > 40 and (PlayerData.job and PlayerData.job.name  ~= 'doj') then
				exports['mythic_notify']:DoHudText('inform', 'Haftzeiten über 40 Monate dürfen nur vom DOJ vergeben werden.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				else
				if jailTime < 200 then
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

              		if closestPlayer == -1 or closestDistance > 3.0 then
                		exports['mythic_notify']:SendAlert('error', 'Niemand in der Nähe zum Inhaftieren', 4000, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					else
					
					
					TriggerServerEvent("grp_Knast:IchSperreDichEinAnfrage", GetPlayerServerId(closestPlayer), jailTime)
					exports['mythic_notify']:DoHudText('inform', 'Du hast eine Anfrage gesendet.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })

					--TriggerServerEvent("grp_Knast:IchSperreDichEin", GetPlayerServerId(closestPlayer), jailTime, reason)
				end
				else
				exports['mythic_notify']:DoHudText('inform', 'Die maximale Haftzeit beträgt 200Monate.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				
				end
			end
			end
		elseif action == "unjail_player" then

			local elements = {}

			ESX.TriggerServerCallback("grp_Knast:KommZurueck", function(playerArray)

				if #playerArray == 0 then
					exports['mythic_notify']:SendAlert('inform', 'Das Gefängnis hat aktuell 0 Insassen!', 4000, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					return
				end

				for i = 1, #playerArray, 1 do
					table.insert(elements, {label = "Häftling: " .. playerArray[i].name .. " | Haftzeit: " .. playerArray[i].jailTime .. " minutes", value = playerArray[i].identifier })
				end

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'jail_unjail_menu',
					{
						title = "Spieler entlassen (wird Administrativ geloggt)",
						align = "top-left",
						elements = elements
					},
				function(data2, menu2)
					
					local action = data2.current.value
					print(bereits)
					if bereits then
					exports['mythic_notify']:DoHudText('error', 'Du kannst nur alle 30 Minuten jemanden freilassen.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
					else
					local bereits = true
					TriggerServerEvent("grp_Knast:IchLasseDichFrei", action)
					end
					
					
					menu2.close()

				end, function(data2, menu2)
					menu2.close()
				end)
			end)
		end
	end, function(data, menu)
		menu.close()
	end)	
end


RegisterNetEvent("grp_Knast:IchSperreDichEinAnfrageAnnehmen")
AddEventHandler("grp_Knast:IchSperreDichEinAnfrageAnnehmen", function(jailTime, wer)
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	
	local closestPlayer2 = GetPlayerServerId(closestPlayer)
	
	if closestPlayer2 == wer then
	openMenu('grp_Knast:bringmichrein', true, (jailTime), 20000, ('ID: ' .. wer .. ' Drücke [Z] um deine Haftstrafe anzunehmen. Strafe: ' .. jailTime))
	end
end)

