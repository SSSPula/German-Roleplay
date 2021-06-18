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

local tabEnabled, tabLoaded, isDead, lastOpend = false, false, false, 0

function REQUEST_NUI_FOCUS(bool)
    SetNuiFocus(bool, bool)
    if bool == true then
        SendNUIMessage({showtab = true})
		if Config.Animation == true and not IsPedInAnyVehicle(PlayerPedId(), false) then
			SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'), true) 
			
			if not HasAnimDictLoaded('anim_heist@arcade_combined@') then
				RequestAnimDict('anim_heist@arcade_combined@')

				while not HasAnimDictLoaded('anim_heist@arcade_combined@') do
					Citizen.Wait(1)
				end
			end
		end
    else
        SendNUIMessage({hidetab = true})
        SetNuiFocus(false, false)
		if Config.Animation == true then
			ClearPedTasks(PlayerPedId())
		end
    end
end

RegisterNUICallback("tablet-bus", function(data)
	if data.load then
		tabLoaded = true
	elseif data.hide then
		tabEnabled = false
		REQUEST_NUI_FOCUS(false)
	elseif data.click then
        lastOpend = GetGameTimer()
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local player = PlayerId()

		if NetworkIsPlayerActive(player) then
			local playerPed = PlayerPedId()

			if IsPedFatallyInjured(playerPed) and not isDead then
				isDead = true
				if tabEnabled then
					tabEnabled = false
					REQUEST_NUI_FOCUS(false)
				end
			elseif not IsPedFatallyInjured(playerPed) then
				isDead = false
			end
		end
	end
end)

function canOpenTablet()
	local canOpen = not Config.OnlyInVehicle
	
	if Config.OnlyInVehicle == true and IsPedInAnyVehicle(PlayerPedId(), false) then
		if Config.OnlyInEmergencyVehicle == true then
			if GetVehicleClass(GetVehiclePedIsIn(PlayerPedId(), false)) == 18 then
				canOpen = true
			else
				canOpen = false
			end
		else
			canOpen = true
		end
	end
	
	return canOpen
end

RegisterNetEvent('copnet_tablet:openTablet')
AddEventHandler('copnet_tablet:openTablet', function() 
	if not isDead then
		if canOpenTablet() == true then
			if (GetGameTimer() - lastOpend) > 250 then
				lastOpend = GetGameTimer()
				tabEnabled = true
				REQUEST_NUI_FOCUS(true)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if NetworkIsPlayerActive(PlayerId()) then
			local PlayerPed = PlayerPedId()

			if IsPedFatallyInjured(PlayerPed) and not isDead then
				isDead = true
				if tabEnabled then
					tabEnabled = false
					REQUEST_NUI_FOCUS(false)
				end
			elseif not IsPedFatallyInjured(PlayerPed) then
				isDead = false
			end
		end

		if Config.Hotkey ~= nil and Config.Hotkey ~= "nil" and IsControlJustReleased(0, Keys[Config.Hotkey]) and not isDead then
			TriggerEvent('copnet_tablet:openTablet', Config.HotkeyOpenType)
		end
	end
end)

Citizen.CreateThread(function()
	local timeout, l = false, 0
	
	while not tabLoaded do
		Citizen.Wait(0)
		l = l + 1
		if l > 500 then
			tabLoaded = true --
			timeout = true
		end
    end
	
    if timeout == true then        
        return
    end
	
    REQUEST_NUI_FOCUS(false)
end)

if Config.Commands == true then
	RegisterCommand('copnet',function(source, args)
		TriggerEvent('copnet_tablet:openTablet')
	end, false)
end
