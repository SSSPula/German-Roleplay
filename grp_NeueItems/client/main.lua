

ESX = nil
local IsDead = false
local IsAnimated = false


local PlayerData = {}

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

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job

	Citizen.Wait(5000)
	--TriggerServerEvent('grp_PolizeiJob:forceBlip')
end)
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer

	if Config.UseVehicleGPS then
		DisplayRadar(false)
	end
end)

Citizen.CreateThread(function()
    local peds = {
        `a_c_chimp`,
    }
    exports['bt-target']:AddTargetModel(peds, {
        options = {
            {
                event = "dwnmaggrd:iatrsadtiersadsjaspeioeln",
                icon = "fas fa-dumpster",
                label = "Als Tier spielen",
            },
            {
                event = "dwnmaggrd:waffsafenksin",
                icon = "fas fa-dumpster",
                label = "Waffenskin",
            },
        },
        job = {"all"},
        distance = 2.5
    })
end)

RegisterNetEvent('dwnmaggrd:waffsafenksin')
AddEventHandler('dwnmaggrd:waffsafenksin', function()

ExecuteCommand("waffenskin")
end)

RegisterNetEvent('dwnmaggrd:iatrsadtiersadsjaspeioeln')
AddEventHandler('dwnmaggrd:iatrsadtiersadsjaspeioeln', function()
ExecuteCommand("tier")

end)

--Dewens Lappen(wow ebenfalls sehr kreativ und so) gerd ist ein penner <3
RegisterNetEvent('dwnmaggrd:denrudia4schrubbne')
AddEventHandler('dwnmaggrd:denrudia4schrubbne', function(source)


	local playerPed = PlayerPedId()
	local vehicle   = ESX.Game.GetVehicleInDirection()
	local coords    = GetEntityCoords(playerPed)

		if IsPedSittingInAnyVehicle(playerPed) then
			ESX.ShowNotification(_U('inside_vehicle'))
			return
		end

		if DoesEntityExist(vehicle) then
			isBusy = true
			TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_MAID_CLEAN', 0, true)
			TriggerServerEvent('dwnmaggrd:putzdiekarrealler')
			Citizen.CreateThread(function()
				ESX.ShowNotification('Du fängst an ein Fahrzeug mit einem Mikrofasertuch zu säubern...')
				exports['progressBars']:startUI(10000, "Putze Fahrzeug blitzblank...") --10.000 Sekunden
				Citizen.Wait(10000)

				SetVehicleDirtLevel(vehicle, 0)
				ClearPedTasksImmediately(playerPed)
				ESX.ShowNotification('Fahrzeug gesäubert!\nSieht wieder fresh aus')
				isBusy = false
			end)
		else
			ESX.ShowNotification("Kein Fahrzeug in der Nähe was du säubern könntest")
		end
end)



-- Start of Binoculars
local fov_max = 70.0
local fov_min = 5.0
local zoomspeed = 10.0
local speed_lr = 8.0
local speed_ud = 8.0
local binoculars = false
local fov = (fov_max+fov_min)*0.5

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local playerPed = GetPlayerPed(-1)
		local vehicle = GetVehiclePedIsIn(playerPed)

		if binoculars then
			binoculars = true
			if not (IsPedSittingInAnyVehicle(playerPed)) then
				Citizen.CreateThread(function()
					TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_BINOCULARS", 0, 1)
					PlayAmbientSpeech1(GetPlayerPed(-1), "GENERIC_CURSE_MED", "SPEECH_PARAMS_FORCE")
				end)
			end

			Wait(2000)

			SetTimecycleModifier("default")
			SetTimecycleModifierStrength(0.3)

			local scaleform = RequestScaleformMovie("BINOCULARS")

			while not HasScaleformMovieLoaded(scaleform) do
				Citizen.Wait(10)
			end

			local playerPed = GetPlayerPed(-1)
			local vehicle = GetVehiclePedIsIn(playerPed)
			local cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA", true)

			AttachCamToEntity(cam, playerPed, 0.0,0.0,1.0, true)
			SetCamRot(cam, 0.0,0.0,GetEntityHeading(playerPed))
			SetCamFov(cam, fov)
			RenderScriptCams(true, false, 0, 1, 0)
			PushScaleformMovieFunction(scaleform, "SET_CAM_LOGO")
			PushScaleformMovieFunctionParameterInt(0) -- 0 for nothing, 1 for LSPD logo
			PopScaleformMovieFunctionVoid()

			while binoculars and not IsEntityDead(playerPed) and (GetVehiclePedIsIn(playerPed) == vehicle) and true do
				if IsControlJustPressed(0, Config.BinocularsPutAway) then -- Toggle binoculars
					PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
					ClearPedTasks(GetPlayerPed(-1))
					binoculars = false
				end

				local zoomvalue = (1.0/(fov_max-fov_min))*(fov-fov_min)
				CheckInputRotation(cam, zoomvalue)

				HandleZoom(cam)
				HideHUDThisFrame()

				DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
				Citizen.Wait(5)
			end

			binoculars = false
			ClearTimecycleModifier()
			fov = (fov_max+fov_min)*0.5
			RenderScriptCams(false, false, 0, 1, 0)
			SetScaleformMovieAsNoLongerNeeded(scaleform)
			DestroyCam(cam, false)
			SetNightvision(false)
			SetSeethrough(false)
		end
	end
end)

RegisterNetEvent('esx_extraitems:binoculars')
AddEventHandler('esx_extraitems:binoculars', function()
	binoculars = not binoculars
end)


RegisterCommand("fernglas", function(source)
	
	binoculars = not binoculars

end)


function HideHUDThisFrame()
	HideHelpTextThisFrame()
	HideHudAndRadarThisFrame()
	HideHudComponentThisFrame(1) -- Wanted Stars
	HideHudComponentThisFrame(2) -- Weapon icon
	HideHudComponentThisFrame(3) -- Cash
	HideHudComponentThisFrame(4) -- MP CASH
	HideHudComponentThisFrame(6)
	HideHudComponentThisFrame(7)
	HideHudComponentThisFrame(8)
	HideHudComponentThisFrame(9)
	HideHudComponentThisFrame(13) -- Cash Change
	HideHudComponentThisFrame(11) -- Floating Help Text
	HideHudComponentThisFrame(12) -- more floating help text
	HideHudComponentThisFrame(15) -- Subtitle Text
	HideHudComponentThisFrame(18) -- Game Stream
	HideHudComponentThisFrame(19) -- weapon wheel
end

function CheckInputRotation(cam, zoomvalue)
	local rightAxisX = GetDisabledControlNormal(0, 220)
	local rightAxisY = GetDisabledControlNormal(0, 221)
	local rotation = GetCamRot(cam, 2)

	if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
		new_z = rotation.z + rightAxisX*-1.0*(speed_ud)*(zoomvalue+0.1)
		new_x = math.max(math.min(20.0, rotation.x + rightAxisY*-1.0*(speed_lr)*(zoomvalue+0.1)), -89.5)
		SetCamRot(cam, new_x, 0.0, new_z, 2)
	end
end

function HandleZoom(cam)
	local playerPed = GetPlayerPed(-1)

	if not (IsPedSittingInAnyVehicle(playerPed)) then
		if IsControlJustPressed(0,241) then -- Scrollup
			fov = math.max(fov - zoomspeed, fov_min)
		end

		if IsControlJustPressed(0,242) then
			fov = math.min(fov + zoomspeed, fov_max) -- ScrollDown
		end

		local current_fov = GetCamFov(cam)
		if math.abs(fov-current_fov) < 0.1 then
			fov = current_fov
		end

		SetCamFov(cam, current_fov + (fov - current_fov)*0.05)
	else
		if IsControlJustPressed(0,17) then -- Scrollup
			fov = math.max(fov - zoomspeed, fov_min)
		end

		if IsControlJustPressed(0,16) then
			fov = math.min(fov + zoomspeed, fov_max) -- ScrollDown
		end

		local current_fov = GetCamFov(cam)

		if math.abs(fov-current_fov) < 0.1 then -- the difference is too small, just set the value directly to avoid unneeded updates to FOV of order 10^-5
			fov = current_fov
		end

		SetCamFov(cam, current_fov + (fov - current_fov)*0.05) -- Smoothing of camera zoom
	end
end
-- End of Binoculars

-- Start of Bullet Proof Vest
RegisterNetEvent('esx_extraitems:bulletproof')
AddEventHandler('esx_extraitems:bulletproof', function()
	local playerPed = GetPlayerPed(-1)
	local inpaintball = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -2214.4331054688,3030.0393066406,32.914123535156, true) < 750
if not inpaintball then
	TaskPlayAnim(playerPed, 'clothingtie', 'try_tie_negative_a', 8.0, -8, -1, 49, 0, 0, 0, 0)
	exports['progressBars']:startUI(5000, "Ziehe Schutzweste an...") --10.000 Sekunden
	Citizen.Wait(5100)
	ClearPedTasksImmediately(playerPed)
	exports['mythic_notify']:DoHudText('success', 'Schutzweste angezogen.')
	AddArmourToPed(playerPed, 100)
	SetPedArmour(playerPed, 100)
	SetPedComponentVariation(playerPed, 9, 20, 9, 20)
	end
end)
-- End of Bullet Proof Vest


-- Polizeiweste




---- Start of Defib
--RegisterNetEvent('esx_extraitems:defib')
--AddEventHandler('esx_extraitems:defib', function(source)
--	local playerPed = GetPlayerPed(-1)
--
--	if IsPedSittingInAnyVehicle(playerPed) then
--		ESX.ShowNotification(_U('error_veh'))
--	else
--		if IsPedOnFoot(playerPed) then
--			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
--			if closestPlayer == -1 or closestDistance > 3.0 then
--				ESX.ShowNotification(_U('error_no_ped'))
--			else
--				local closestPlayerPed = GetPlayerPed(closestPlayer)
--				local chance = math.random(100)
--
--				if IsPedDeadOrDying(closestPlayerPed, 1) then
--					local playerPed = PlayerPedId()
--					local lib, anim = 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest'
--					ESX.ShowNotification(_U('revive_inprogress'))
--
--					for i=1, 15 do
--						Citizen.Wait(900)
--
--						ESX.Streaming.RequestAnimDict(lib, function()
--							TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
--						end)
--					end
--
--					if chance <= 66 then
--						TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(closestPlayer))
--						ESX.ShowNotification(_U('defib_worked'))
--					else
--						ESX.ShowNotification(_U('defib_failed'))
--					end
--				else
--					ESX.ShowNotification(_U('player_not_unconscious'))
--				end
--			end
--		else
--			ESX.ShowNotification(_U('error_no_foot'))
--		end
--	end
--end)
-- End of Defib


--gerds munisystem(wow so kreativ und kompliziert)

--hier
RegisterNetEvent('grd_munitionspakete:100pistol_ammo')
AddEventHandler('grd_munitionspakete:100pistol_ammo', function(source)

end)



RegisterNetEvent('esx_extraitems:kabelbinder')
AddEventHandler('esx_extraitems:kabelbinder', function(source)
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
	
	local playerPed = PlayerPedId()
		ESX.ShowNotification(("Du hast einen Kabelbinder benutzt. Nutze Ihn noch ein mal um die Person zu entfesseln."))	
		TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
		exports['progressBars']:startUI(2500, "Benutze Kabelbinder...") --10.000 Sekunden
		Citizen.Wait(2500)
		ClearPedTasksImmediately(playerPed)
		TriggerServerEvent('grp_kabelbinder:binder', GetPlayerServerId(closestPlayer))
	
	else
	ESX.ShowNotification(("Kein Spieler in der Nähe"))
	end
end)

RegisterNetEvent('esx_extraitems:panzertape')
AddEventHandler('esx_extraitems:panzertape', function(source)
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
	
	local playerPed = PlayerPedId()
		ESX.ShowNotification(("Du hast Panzertape benutzt. Nutze es noch einmal um es zu entfernen."))	
		TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
		exports['progressBars']:startUI(2500, "Benutze Panzertape...")
		Citizen.Wait(2500)
		ClearPedTasksImmediately(playerPed)
		TriggerServerEvent('grp_kabelbinder:tapee', GetPlayerServerId(closestPlayer))
	
	else
	ESX.ShowNotification(("Kein Spieler in der Nähe"))
	end
end)




RegisterNetEvent('grp_kabelbinder:Tapeed')
AddEventHandler('grp_kabelbinder:Tapeed', function()
	isPanzertaped = not isPanzertaped
	local playerPed = PlayerPedId()
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if isPanzertaped then
		
		DrawAdvancedText(0.891, 0.953, 0.005, 0.0028, 0.4, "Dir wurde Panzertape über den Mund getaped, \ndu kannst bis zum Ablauf der Zeit nicht sprechen, nur Geräusche von dir geben", 0, 191, 255, 255, 6, 0)
		
		end
		
		
		
	end
	end)
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


RegisterNetEvent('grp_kabelbinder:Binder')
AddEventHandler('grp_kabelbinder:Binder', function()
	isHandcuffed = not isHandcuffed
	local playerPed = PlayerPedId()

	Citizen.CreateThread(function()
		if isHandcuffed then

			RequestAnimDict('mp_arresting')
			while not HasAnimDictLoaded('mp_arresting') do
				Citizen.Wait(100)
			end

			TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)

			SetEnableHandcuffs(playerPed, true)
			DisablePlayerFiring(playerPed, true)
			SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
			SetPedCanPlayGestureAnims(playerPed, false)
			--FreezeEntityPosition(playerPed, true)
			DisplayRadar(false)


		else


			ClearPedSecondaryTask(playerPed)
			SetEnableHandcuffs(playerPed, false)
			DisablePlayerFiring(playerPed, false)
			SetPedCanPlayGestureAnims(playerPed, true)
			--FreezeEntityPosition(playerPed, false)
			DisplayRadar(true)
		end
	end)
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()

		if isHandcuffed then
			--DisableControlAction(0, 1, true) -- Disable pan
			--DisableControlAction(0, 2, true) -- Disable tilt
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
			--DisableControlAction(0, 32, true) -- W
			--DisableControlAction(0, 34, true) -- A
			--DisableControlAction(0, 31, true) -- S
			--DisableControlAction(0, 30, true) -- D

			DisableControlAction(0, 45, true) -- Reload
			DisableControlAction(0, 22, true) -- Jump
			DisableControlAction(0, 44, true) -- Cover
			DisableControlAction(0, 37, true) -- Select Weapon
			--DisableControlAction(0, 23, true) -- Also 'enter'?

			DisableControlAction(0, 288,  true) -- Disable phone
			DisableControlAction(0, 289, true) -- Inventory
			DisableControlAction(0, 170, true) -- Animations
			DisableControlAction(0, 167, true) -- Job

			--DisableControlAction(0, 0, true) -- Disable changing view
			--DisableControlAction(0, 26, true) -- Disable looking behind
			DisableControlAction(0, 73, true) -- Disable clearing animation
			--DisableControlAction(2, 199, true) -- Disable pause screen

			DisableControlAction(0, 59, true) -- Disable steering in vehicle
			DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			DisableControlAction(0, 72, true) -- Disable reversing in vehicle

			DisableControlAction(2, 36, true) -- Disable going stealth

			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			--DisableControlAction(0, 75, true)  -- Disable exit vehicle
			--DisableControlAction(27, 75, true) -- Disable exit vehicle

			if IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) ~= 1 then
				ESX.Streaming.RequestAnimDict('mp_arresting', function()
					TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
				end)
			end
		else
			Citizen.Wait(500)
		end
	end
end)










--[[
RegisterCommand("waffenskin", function(source)
	local playerPed = GetPlayerPed(-1)
	local waffe = GetSelectedPedWeapon(playerPed)
	ESX.TriggerServerCallback('grd_Pets:Gruppegetten', function(plyGroup)
	if plyGroup == 'skindonator' or plyGroup == 'superadmin' or plyGroup == 'donator3' or plyGroup == 'donator5' or plyGroup == 'skintierdonator' or plyGroup == 'admin' or plyGroup == 'skinmarktdonator' or plyGroup == 'skintiermarktdonator' then
	MenuOeffnen()
	--menü
	else
	exports['mythic_notify']:SendAlert('error', 'Du musst Unterstützer sein. Infos sind im Discord.!', 2500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	end
end)
end)


function MenuOeffnen()
    menuOpen = true
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'test', {
        title   = '[Donator]Waffenskin auswählen',
        align   = 'top-left',
        elements = {
            {label = ('⚫Ohne Skin'), value = 'default'},
            {label = ('🟡Gold Elite'), value = 'gold'},
            {label = ('⚪Platin Ace'), value = 'platin'},
            {label = ('🟣Pink Flash'), value = 'pink'},
            {label = ('🟠Orange Hype'), value = 'orange'},
            {label = ('🔵Blue Moon'), value = 'blau'},
            {label = ('🟢Grove Grün'), value = 'gruen'}
        }
    }, function(data, menu)
        local playerPed = GetPlayerPed(-1)
		local waffe = GetSelectedPedWeapon(playerPed)
		if data.current.value == 'default' then
		PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
		SetPedWeaponTintIndex(playerPed , waffe, 0)
        elseif data.current.value == 'gold' then
		PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
        SetPedWeaponTintIndex(playerPed , waffe, 2)
		elseif data.current.value == 'platin' then
		PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
		SetPedWeaponTintIndex(playerPed , waffe, 7)
		elseif data.current.value == 'pink' then
		PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
		SetPedWeaponTintIndex(playerPed , waffe, 3)
		elseif data.current.value == 'orange' then
		PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
		SetPedWeaponTintIndex(playerPed , waffe, 6)
		elseif data.current.value == 'blau' then
		PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
		SetPedWeaponTintIndex(playerPed , waffe, 5)
		elseif data.current.value == 'gruen' then
		PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
		SetPedWeaponTintIndex(playerPed , waffe, 1)
        end
    end, function(data, menu)
        menuOpen = false
        menu.close()
    end)
end

]]--

-- Start of Firework
local box = nil
local animlib = 'anim@mp_fireworks'
local feuerwerkgez = false

RegisterNetEvent('esx_extraitems:firework')
AddEventHandler('esx_extraitems:firework', function()
	if not feuerwerkgez then
	TriggerServerEvent('grp_NeueItems:lahinimmweg')
	exports['mythic_notify']:DoHudText('inform', 'Du hast 1x Feuerwerk benutzt.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })

	feuerwerkgez = true
	RequestAnimDict(animlib)

	while not HasAnimDictLoaded(animlib) do
		Citizen.Wait(10)
	end

	if not HasNamedPtfxAssetLoaded("scr_indep_fireworks") then
		RequestNamedPtfxAsset("scr_indep_fireworks")

		while not HasNamedPtfxAssetLoaded("scr_indep_fireworks") do
			Wait(10)
		end
	end

	local pedcoords = GetEntityCoords(GetPlayerPed(-1))
	local ped = GetPlayerPed(-1)
	local times = 20

	TaskPlayAnim(ped, animlib, 'place_firework_3_box', -1, -8.0, 3000, 0, 0, false, false, false)
	Citizen.Wait(4000)
	ClearPedTasks(ped)

	box = CreateObject(GetHashKey('ind_prop_firework_03'), pedcoords, true, false, false)
	PlaceObjectOnGroundProperly(box)
	FreezeEntityPosition(box, true)
	local firecoords = GetEntityCoords(box)

	Citizen.Wait(10000)
	feuerwerkgez = false
	repeat
	UseParticleFxAssetNextCall("scr_indep_fireworks")
	local part1 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", firecoords, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
	times = times - 1
	Citizen.Wait(2000)
	until(times == 0)
	DeleteEntity(box)
	box = nil
	else
	exports['mythic_notify']:DoHudText('inform', 'Bitte warte bevor Du Feuerwerk zündest.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	end
end)


--DEwens ichhabhungerupdate


RegisterNetEvent('grp_IchHabHunger:IchHelfeDir')
AddEventHandler('grp_IchHabHunger:IchHelfeDir', function()
	-- restore hunger & thirst
	TriggerEvent('grp_IchFuehle:set', 'hunger', 1000000)
	TriggerEvent('grp_IchFuehle:set', 'thirst', 1000000)

	-- restore hp
	local playerPed = PlayerPedId()
	SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
end)


AddEventHandler('grp_IchHabHunger:isEating', function(cb)
	cb(IsAnimated)
end)

RegisterNetEvent('grp_IchHabHunger:onEat')
AddEventHandler('grp_IchHabHunger:onEat', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_cs_burger_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('grp_IchHabHunger:onDrink')
AddEventHandler('grp_IchHabHunger:onDrink', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_ld_flow_bottle'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_intdrink', function()
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)


RegisterNetEvent('grd_machbummpow')
AddEventHandler('grd_machbummpow', function()
	local ped = PlayerPedId()
	local wo = GetEntityCoords(ped)
	
	TriggerEvent('esx_extraitems:firework2')
	TriggerEvent("InteractSound_CL:PlayOnOne", "bummpow", 0.1) 
	ExecuteCommand('e superhero')
	

end)

RegisterNetEvent('esx_extraitems:firework2')
AddEventHandler('esx_extraitems:firework2', function()
	RequestAnimDict(animlib)

	while not HasAnimDictLoaded(animlib) do
		Citizen.Wait(10)
	end

	if not HasNamedPtfxAssetLoaded("scr_indep_fireworks") then
		RequestNamedPtfxAsset("scr_indep_fireworks")

		while not HasNamedPtfxAssetLoaded("scr_indep_fireworks") do
			Wait(10)
		end
	end

	local pedcoords = GetEntityCoords(GetPlayerPed(-1))
	local ped = GetPlayerPed(-1)


	local firecoords = GetEntityCoords(ped)

	UseParticleFxAssetNextCall("scr_indep_fireworks")
	StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", firecoords, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
	Citizen.Wait(2000)
	UseParticleFxAssetNextCall("scr_indep_fireworks")
	StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", firecoords, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
	Citizen.Wait(2000)
	UseParticleFxAssetNextCall("scr_indep_fireworks")
	StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", firecoords, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
	Citizen.Wait(2000)


end)

RegisterNetEvent('grp_IchHabHunger:smoke')
AddEventHandler('grp_IchHabHunger:smoke', function()
	
	if not IsAnimated then
		prop_name = 'ng_proc_cigarette01a'
		IsAnimated = true
		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
			ESX.Streaming.RequestAnimDict('amb@world_human_aa_smoke@male@idle_a', function()
				TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_SMOKING', 0, false)
				Citizen.Wait(8000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				ClearPedTasksImmediately(playerPed)
				DeleteObject(prop)
			end)
			--TriggerServerEvent('stress:remove', 100000)
		end)

	end
end)

RegisterNetEvent('grp_IchHabHunger:onEatSandwich')
AddEventHandler('grp_IchHabHunger:onEatSandwich', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_sandwich_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.03, -240.0, -180.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('grp_IchHabHunger:onDrinkCocaCola')
AddEventHandler('grp_IchHabHunger:onDrinkCocaCola', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_ecola_can' --ng_proc_sodacan_01a
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.008, 0.03, 240.0, -60.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_intdrink', function()
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('grp_IchHabHunger:onDrinkIceTea')
AddEventHandler('grp_IchHabHunger:onDrinkIceTea', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_ld_can_01' --ng_proc_sodacan_01b
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.008, 0.03, 240.0, -60.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_intdrink', function()
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('grp_IchHabHunger:onDrinkCoffe')
AddEventHandler('grp_IchHabHunger:onDrinkCoffe', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_fib_coffee'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.008, -0.01, -0.03, 90.0, 270.0, 90.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_intdrink', function()
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('grp_IchHabHunger:onDrinkBeer')
AddEventHandler('grp_IchHabHunger:onDrinkBeer', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_amb_beer_bottle'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 28422)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.008, 0.03, 240.0, -60.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('amb@code_human_wander_drinking@beer@male@base', function()
				TaskPlayAnim(playerPed, 'amb@code_human_wander_drinking@beer@male@base', 'static', 1.0, -1.0, 2000, 0, 1, true, true, true)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('grp_grdashrthet:diestmarke')
AddEventHandler('grp_grdashrthet:diestmarke', function(fraktion)
	local fraktion = fraktion
	ExecuteCommand("oocconsdstr zeigt dir seine " .. fraktion .. " Dienstmarke")
end)

RegisterNetEvent('grp_grdashrthet:gsfddf')
AddEventHandler('grp_grdashrthet:gsfddf', function(paketname)
ExecuteCommand("oocconsdstr ist nun im Besitz des " .. paketname .. " -Pakets")

end)


RegisterNetEvent('grp_IchHabHunger:onDrinkWine')
AddEventHandler('grp_IchHabHunger:onDrinkWine', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_wine_bot_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 28422)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.008, -0.02, -0.3, 90.0, 270.0, 90.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('amb@code_human_wander_drinking@beer@male@base', function()
				TaskPlayAnim(playerPed, 'amb@code_human_wander_drinking@beer@male@base', 'static', 1.0, -1.0, 2000, 0, 1, true, true, true)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('grp_IchHabHunger:onDrinkVodka')
AddEventHandler('grp_IchHabHunger:onDrinkVodka', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_vodka_bottle'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 28422)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.008, -0.02, -0.3, 90.0, 270.0, 90.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('amb@code_human_wander_drinking@beer@male@base', function()
				TaskPlayAnim(playerPed, 'amb@code_human_wander_drinking@beer@male@base', 'static', 1.0, -1.0, 2000, 0, 1, true, true, true)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('grp_IchHabHunger:onDrinkWhisky')
AddEventHandler('grp_IchHabHunger:onDrinkWhisky', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_cs_whiskey_bottle'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 28422)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.008, -0.02, -0.2, 90.0, 270.0, 90.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('amb@code_human_wander_drinking@beer@male@base', function()
				TaskPlayAnim(playerPed, 'amb@code_human_wander_drinking@beer@male@base', 'static', 1.0, -1.0, 2000, 0, 1, true, true, true)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('grp_IchHabHunger:onDrinkTequila')
AddEventHandler('grp_IchHabHunger:onDrinkTequila', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_tequila_bottle'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 28422)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.008, -0.02, -0.3, 90.0, 270.0, 90.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('amb@code_human_wander_drinking@beer@male@base', function()
				TaskPlayAnim(playerPed, 'amb@code_human_wander_drinking@beer@male@base', 'static', 1.0, -1.0, 2000, 0, 1, true, true, true)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)


--umnennen hitman
RegisterNetEvent('grp_fhthdDFtz4r:1111122')
AddEventHandler('grp_fhthdDFtz4r:1111122', function()
if PlayerData.job and (PlayerData.job.name == 'hitman' or PlayerData.job.name == 'fib')then
local keyboard2 = exports["nh-keyboard"]:KeyboardInput({
    header = "Namen ändern", 
    rows = {
        {
            id = 0, 
            txt = "Vorname"
        },
        {
            id = 1, 
            txt = "Nachname"
        }
    }
})

if keyboard2 ~= nil then
    if keyboard2[1].input == nil or keyboard2[2].input == nil or keyboard2[1].input =="" or keyboard2[2].input == "" then return end
	local firstName = keyboard2[1].input
	local lastName = keyboard2[2].input
	
	TriggerServerEvent('grp_fhthdDFtz4r:23332122',firstName, lastName)
	
end
end


end)



--umnennen
RegisterNetEvent('grp_fhthdDFtz4r:111112')
AddEventHandler('grp_fhthdDFtz4r:111112', function()


local keyboard = exports["nh-keyboard"]:KeyboardInput({
    header = "Neuanfang", 
    rows = {
        {
            id = 0, 
            txt = "Vorname"
        },
        {
            id = 1, 
            txt = "Nachname"
        },
        {
            id = 2, 
            txt = "Geburtsdatum"
        },
        {
            id = 3, 
            txt = "Größe"
        }
    }
})

if keyboard ~= nil then
    if keyboard[1].input == nil or keyboard[2].input == nil or keyboard[3].input == nil or keyboard[4].input == nil then return end
	local firstName = keyboard[1].input
	local lastName = keyboard[2].input
	local dateofbirth = keyboard[3].input
	local height = keyboard[4].input
	
local lol = string.len(firstName)
local lol2 = string.len(lastName)
local lol3 = string.len(dateofbirth)
local groesse = tonumber(height)
	if lol > 2 and lol2 > 3 then
		if lol3 == 10 then
			if groesse > 150 and groesse < 200 then
			TriggerServerEvent('grp_fhthdDFtz4r:2333212',firstName, lastName, dateofbirth, height)
			exports['mythic_notify']:DoHudText('inform', 'Erfolgreich! Name: ' .. firstName .. " " .. lastName .. " Geb: " .. dateofbirth .. " Größe: " .. height, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
			else
			exports['mythic_notify']:DoHudText('error', 'Du bist zu klein oder zu groß!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
			end
		else
		exports['mythic_notify']:DoHudText('error', 'Dein Geburtsdatum muss folgender maßen angegeben werden: 01.01.1001!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })

		end
	else
	exports['mythic_notify']:DoHudText('error', 'Dein Name muss länger sein!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	end
end


end)


function hasPhone (cb)
  if (ESX == nil) then return cb(0) end
  ESX.TriggerServerCallback('gcphone:getItemAmount', function(qtty)
    cb(qtty > 0)
  end, 'neuanfang')
end

function hasPhone (cb)
  cb(true)
end

--[[
--umnennen backup
RegisterNetEvent('grp_fhthdDFtz4r:111112')
AddEventHandler('grp_fhthdDFtz4r:111112', function()
local keyboard = exports["nh-keyboard"]:KeyboardInput({
    header = "Namen ändern", 
    rows = {
        {
            id = 0, 
            txt = "Vorname"
        },
        {
            id = 1, 
            txt = "Nachname"
        }
    }
})

if keyboard ~= nil then
    if keyboard[1].input == nil or keyboard[2].input == nil then return end
	local firstName = keyboard[1].input
	local lastName = keyboard[2].input
	
	TriggerServerEvent('grp_fhthdDFtz4r:2333212',firstName, lastName)
end
end)

]]


--Neue handynummer
RegisterNetEvent('grp_fhthdDFtz4r:23saxs2321')
AddEventHandler('grp_fhthdDFtz4r:23saxs2321', function()
local handynummer = exports["nh-keyboard"]:KeyboardInput({
    header = "Neue Handynummer", 
    rows = {
        {
            id = 0, 
            txt = "Neue Handynummer"
        }
    }
})

local lol = string.len(handynummer)
	if handynummer ~= nil then
		if lol == 7 then
			TriggerServerEvent('grp_fhthdDFtz4r:22112',handynummer)
		else
			exports['mythic_notify']:DoHudText('error', 'Deine Handynummer muss 7 Zahlen lang sein!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
		end
	end
end)



RegisterNetEvent('grp_fhthdDFtz4r:22223812')
AddEventHandler('grp_fhthdDFtz4r:22223812', function()
local cardnumber = exports["nh-keyboard"]:KeyboardInput({
    header = "Neue Bankverbindung", 
    rows = {
        {
            id = 0, 
            txt = "Neue Bankverbindung"
        }
    }
})
local lol = string.len(cardnumber)
	if cardnumber ~= nil then
		if lol < 16 then
			TriggerServerEvent('grp_fhthdDFtz4r:2222112',cardnumber)
		else
			exports['mythic_notify']:DoHudText('error', 'Deine Kontonummer ist zu lang!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
		end	
	end
end)



RegisterNetEvent('grp_IchHabHunger:onDrinkMilk')
AddEventHandler('grp_IchHabHunger:onDrinkMilk', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_cs_milk_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, -0.009, -0.03, -0.1, -90.0, 270.0, -90.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_intdrink', function()
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

-- Disco
RegisterNetEvent('grp_IchHabHunger:onDrinkGin')
AddEventHandler('grp_IchHabHunger:onDrinkGin', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_rum_bottle'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 28422)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.008, -0.02, -0.3, 90.0, 270.0, 90.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('amb@code_human_wander_drinking@beer@male@base', function()
				TaskPlayAnim(playerPed, 'amb@code_human_wander_drinking@beer@male@base', 'static', 1.0, -1.0, 2000, 0, 1, true, true, true)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('grp_IchHabHunger:onDrinkAbsinthe')
AddEventHandler('grp_IchHabHunger:onDrinkAbsinthe', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_bottle_cognac'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 28422)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.008, -0.02, -0.3, 90.0, 270.0, 90.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('amb@code_human_wander_drinking@beer@male@base', function()
				TaskPlayAnim(playerPed, 'mamb@code_human_wander_drinking@beer@male@base', 'static', 1.0, -1.0, 2000, 0, 1, true, true, true)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('grp_IchHabHunger:onDrinkChampagne')
AddEventHandler('grp_IchHabHunger:onDrinkChampagne', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_wine_white'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 28422)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.008, -0.02, -0.3, 90.0, 270.0, 90.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('amb@code_human_wander_drinking@beer@male@base', function()
				TaskPlayAnim(playerPed, 'amb@code_human_wander_drinking@beer@male@base', 'static', 1.0, -1.0, 2000, 0, 1, true, true, true)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)

RegisterNetEvent('grp_IchHabHunger:onEatMoewen')
AddEventHandler('grp_IchHabHunger:onEatMoewen', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_sandwich_01'
		IsAnimated = true

		Citizen.CreateThread(function()
			local playerPed = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
			local boneIndex = GetPedBoneIndex(playerPed, 18905)
			AttachEntityToEntity(prop, playerPed, boneIndex, 0.12, 0.028, 0.03, -240.0, -180.0, 0.0, true, true, false, true, 1, true)

			ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
				TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)

				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
			end)
		end)

	end
end)


