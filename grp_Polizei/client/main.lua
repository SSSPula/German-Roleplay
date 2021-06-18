local PlayerData, CurrentActionData, handcuffTimer, dragStatus, blipsCops, currentTask, spawnedVehicles = {}, {}, {}, {}, {}, {}, {}
local HasAlreadyEnteredMarker, isDead, isHandcuffed, hasAlreadyJoined, playerInService, isInShopMenu = false, false, false, false, false, false
local LastStation, LastPart, LastPartNum, LastEntity, CurrentAction, CurrentActionMsg
local durchsucht = false
dragStatus.isDragged = false
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

function cleanPlayer(playerPed)
	SetPedArmour(playerPed, 0)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	
end
local leitstellean



function setUniform(job, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if Config.Uniforms[job].male then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].male)
				TriggerEvent('skinchanger:getSkin', function(skin)
                        TriggerServerEvent('esx_skin:save', skin)
                end)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end

			if job == 'bullet_wear' then
				SetPedArmour(playerPed, 100)
			end
		else
			if Config.Uniforms[job].female then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].female)
				TriggerEvent('skinchanger:getSkin', function(skin)
                        TriggerServerEvent('esx_skin:save', skin)
                end)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end

			if job == 'bullet_wear' then
				SetPedArmour(playerPed, 100)
			end
		end
	end)
end








--[[
function leitstellenmenu()
	local playerPed = PlayerPedId()
	

	local elements = {
		{ label = ("Leitstelle übernehmen"), value = 'uebernehmen' },
		{ label = ("Leitstelle abgeben"), value = 'abgeben' }
	}


	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Kennzeichen', {
		title    = ("Kennzeichen abfragen"),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		

		if data.current.value == 'uebernehmen' then		
		
		leitstellean = true
		exports['mythic_notify']:DoHudText('inform', 'Du hast die Leitstelle übernommen', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
		
		end		
		if data.current.value == 'abgeben' then			
		
		leitstellean = false
		exports['mythic_notify']:DoHudText('inform', 'Du hast die Leitstelle abgegeben', { ['background-color'] = '#ffffff', ['color'] = '#000000' })

		
		end

	end, function(data, menu)
		menu.close()
	end)

end
]]

function autokennzeichen()
	local playerPed = PlayerPedId()
	

	local elements = {
		{ label = ("Kennzeichen abfragen"), value = 'Kennzeichen' }
	}


	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Kennzeichen', {
		title    = ("Kennzeichen abfragen"),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		

		if data.current.value == 'Kennzeichen' then			
		LookupVehicle()
		end

	end, function(data, menu)
		menu.close()
	end)
end

--holster

local holstered = true

local skins = {

}

local weapons = {
	"WEAPON_PISTOL",
	"WEAPON_COMBATPISTOL",
	"WEAPON_STUNGUN",	
	"WEAPON_NIGHTSTICK",
	"WEAPON_FLASHLIGHT",
	"WEAPON_FIREEXTINGUISHER",
	"WEAPON_FLARE",
	"WEAPON_SNSPISTOl",
	"WEAPON_HEAVYPISTOL",
	"WEAPON_SMG",
	"WEAPON_ASSAULTSMG",
	"WEAPON_PISTOL_MK2",
	"WEAPON_MACHINEPISTOL",
	"WEAPON_PUMPSHOTGUN",
	"WEAPON_KNIFE",
	"WEAPON_KNUCKLE",
	"WEAPON_NIGHTSTICK",
	"WEAPON_HAMMER",
	"WEAPON_BAT",
	"WEAPON_SNSPISTOL_MK2",
	"WEAPON_GOLFCLUB",
	"WEAPON_CROWBAR",
	"WEAPON_BOTTLE",
	"WEAPON_DAGGER",
	"WEAPON_HATCHET",
	"WEAPON_MACHETE",
	"WEAPON_SWITCHBLADE",
	"WEAPON_PROXMINE",
	"WEAPON_BZGAS",
	"WEAPON_SMOKEGRENADE",
	"WEAPON_MOLOTOV",
	"WEAPON_MACHINEPISTOL",	
			
}

local nichtschiessen

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		if DoesEntityExist( ped ) and not IsEntityDead( ped ) and not IsPedInAnyVehicle(PlayerPedId(), true) then
			loadAnimDict( "reaction@intimidation@1h" )
			loadAnimDict( "weapons@pistol_1h@gang" )
			if CheckWeapon(ped) then
				if holstered then
					TaskPlayAnim(ped, "reaction@intimidation@1h", "intro", 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
					nichtschiessen = true
					--DisablePlayerFiring(ped, true)
					Citizen.Wait(2500)
					nichtschiessen = false
					--DisablePlayerFiring(ped, false)
					ClearPedTasks(ped)

					Citizen.Wait(100)					
					holstered = false
				end
			elseif not CheckWeapon(ped) then
				if not holstered then
					TaskPlayAnim(ped, "reaction@intimidation@1h", "outro", 8.0, 2.0, -1, 48, 2, 0, 0, 0 )
					--DisablePlayerFiring(ped, true)
					nichtschiessen = true
					Citizen.Wait(1500)
					nichtschiessen = false
					--DisablePlayerFiring(ped, false)			
					ClearPedTasks(ped)

					holstered = true
				end
			end
		end
	end
end)


--debug fix


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(900000)
		
		ExecuteCommand("debug")
		
	end
end)

--leitstelle




Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		if nichtschiessen then
		DisablePlayerFiring(ped, true)
		--exports['mythic_notify']:DoHudText('inform', 'angekommen', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
		end
		
	end
end)

function CheckWeapon(ped)
	for i = 1, #weapons do
		if GetHashKey(weapons[i]) == GetSelectedPedWeapon(ped) then
			return true
		end
	end
	return false
end

function DisableActions(ped)
	DisableControlAction(1, 140, true)
	DisableControlAction(1, 141, true)
	DisableControlAction(1, 142, true)
	DisableControlAction(1, 37, true) -- Disables INPUT_SELECT_WEAPON (TAB)
	DisablePlayerFiring(ped, true) -- Disable weapon firing
end

function loadAnimDict( dict )
	while ( not HasAnimDictLoaded( dict ) ) do
		RequestAnimDict( dict )
		Citizen.Wait( 0 )
	end
end


--holster ende

Citizen.CreateThread(function()
    local speilerpedds = {
        `mp_m_freemode_01`,
        `mp_f_freemode_01`,
    }
    exports['bt-target']:AddTargetModel(speilerpedds, {
        options = {
            {
                event = "aaauusweisyysnehmen",
                icon = "fas fa-id-card",
                label = "Ausweis nehmen",
            },
            {
                event = "assuuusweiszeigen",
                icon = "fas fa-id-card",
                label = "Ausweis zeigen",
            },
            {
                event = "duuuurchsuchen",
                icon = "fas fa-search",
                label = "Spieler durchsuchen",
            },
            {
                event = "kotnatkteilen",
                icon = "fas fa-mobile-alt",
                label = "Kontakt teilen",
            },
            {
                event = "ausweisannehmenss",
                icon = "fas fa-mobile-alt",
                label = "Kontakt annehmen",
            },
            {
                event = "",
                icon = "fas fa-times",
                label = "Menü schliessen",
            },
        },
        job = {"all"},
        distance = 2.5
    })
end)

RegisterNetEvent('ausweisannehmenss')
AddEventHandler('ausweisannehmenss', function()

ExecuteCommand("sca")

end)

RegisterNetEvent('kotnatkteilen')
AddEventHandler('kotnatkteilen', function()

TriggerEvent('grp_Phone:client:kontaktteilen')

end)

RegisterNetEvent('assuuusweiszeigen')
AddEventHandler('assuuusweiszeigen', function()

ExecuteCommand("ausweiszeigen")

end)

RegisterNetEvent('fssszeiggened')
AddEventHandler('fssszeiggened', function()

ExecuteCommand("fszeigen")

end)

RegisterNetEvent('duuuurchsuchen')
AddEventHandler('duuuurchsuchen', function()

ExecuteCommand("durchsuchen3")

end)

RegisterNetEvent('aaauusweisyysnehmen')
AddEventHandler('aaauusweisyysnehmen', function()

ExecuteCommand("ausweisnehmen3")

end)

RegisterCommand("ausweisnehmen3", function(source)
	
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		
		local playerPed = PlayerPedId()
		TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
		exports['progressBars']:startUI(2500, "Nehme Ausweis...") 
		TriggerServerEvent('grp_PolizeiJob:message', GetPlayerServerId(closestPlayer), _U('being_searched2'))				
		Citizen.Wait(2500)
		ClearPedTasksImmediately(playerPed)
		OpenIdentityCardMenu(closestPlayer)
		
		
	end

end)

RegisterCommand("durchsuchen3", function(source)
	
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		
		local playerPed = PlayerPedId()
		TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
		exports['progressBars']:startUI(2500, "Durchsuche Person...") 
		TriggerServerEvent('grp_PolizeiJob:message', GetPlayerServerId(closestPlayer), _U('being_searched'))				
		TriggerServerEvent('grp_PolizeiJob:message', GetPlayerServerId(closestPlayer), ("Dir dürfen maximal insgesamt 500 legale Gegenstände abgenommen werden."))				
		TriggerServerEvent('grp_PolizeiJob:message', GetPlayerServerId(closestPlayer), ("Illegale Gegenstände unterliegen keiner Obergrenze."))				
		Citizen.Wait(2500)
		ClearPedTasksImmediately(playerPed)
		OpenunemployedSearchMenu(closestPlayer)
	end

end)


function OpenunemployedSearchMenu(player)
--[[
if IsPlayerDead(player) then
  ESX.ShowNotification("Du kannst keine Leiche durchsuchen")
  return
end
]]

	ESX.TriggerServerCallback('grp_PolizeiJob:getOtherPlayerData', function(data)
		
		local elements = {}

		for i=1, #data.accounts, 1 do
			if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then
				table.insert(elements, {
					label    = _U('confiscate_dirty', ESX.Math.Round(data.accounts[i].money)),
					value    = 'black_money',
					itemType = 'item_account',
					amount   = data.accounts[i].money
				})

				break
			end
		end

		table.insert(elements, {label = _U('guns_label')})

		for i=1, #data.weapons, 1 do
			table.insert(elements, {
				label    = _U('confiscate_weapon', ESX.GetWeaponLabel(data.weapons[i].name), data.weapons[i].ammo),
				value    = data.weapons[i].name,
				itemType = 'item_weapon',
				amount   = data.weapons[i].ammo
			})
		end

		table.insert(elements, {label = _U('inventory_label')})

		for i=1, #data.inventory, 1 do
			if data.inventory[i].count > 0 then
				table.insert(elements, {
					label    = _U('confiscate_inv', data.inventory[i].count, data.inventory[i].label),
					value    = data.inventory[i].name,
					itemType = 'item_standard',
					amount   = data.inventory[i].count
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search', {
			title    = _U('search'),
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			if data.current.value then
				ESX.ShowNotification("Du kannst nichts abnehmen. Lass Dir die Gegenstände geben!")
				--TriggerServerEvent('esx_unemployedjob:confiscatePlayerItem', GetPlayerServerId(player), data.current.itemType, data.current.value, data.current.amount)
				OpenBodySearchMenu(player)
			end
		end, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end



function OpenCloakroomMenu()
	local playerPed = PlayerPedId()
	local grade = PlayerData.job.grade_name

	local elements = {
		{ label = _U('citizen_wear'), value = 'citizen_wear' },
		{ label = ("Swat Uniform"), value = 'swat_wear' },
		{ label = ("Anzug für Anlässe"), value = 'anzug_wear' },
		{ label = ("Arbeitskleidung mit Jacke"), value = 'mitjacke_wear' },
		{ label = ("Arbeitskleidung ohne Jacke"), value = 'ohnejacke_wear' },
		{ label = ("Pilotenoutfit"), value = 'pilot_wear' },
		{ label = ("Fahrradkleidung"), value = 'fahrrad_wear' },
		{ label = ("Motorradkleidung"), value = 'bike_wear' },
		{ label = _U('gilet_wear'), value = 'gilet_wear' }
	}


	if Config.EnableNonFreemodePeds then
		table.insert(elements, {label = 'Sheriff wear', value = 'freemode_ped', maleModel = 's_m_y_sheriff_01', femaleModel = 's_f_y_sheriff_01'})
		table.insert(elements, {label = 'police wear', value = 'freemode_ped', maleModel = 's_m_y_cop_01', femaleModel = 's_f_y_cop_01'})
		table.insert(elements, {label = 'Swat wear', value = 'freemode_ped', maleModel = 's_m_y_swat_01', femaleModel = 's_m_y_swat_01'})
	end


	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = _U('cloakroom'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		cleanPlayer(playerPed)

		if data.current.value == 'citizen_wear' then
			
			KleiderSchrank()
			

		end

		

		if
			data.current.value == 'bike_wear' or
			data.current.value == 'swat_wear' or
			data.current.value == 'anzug_wear' or
			data.current.value == 'mitjacke_wear' or
			data.current.value == 'ohnejacke_wear' or
			data.current.value == 'pilot_wear' or
			data.current.value == 'fahrrad_wear' or
			data.current.value == 'gilet_wear'
		then
			setUniform(data.current.value, playerPed)
		end

		if data.current.value == 'freemode_ped' then
			local modelHash = ''

			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					modelHash = GetHashKey(data.current.maleModel)
				else
					modelHash = GetHashKey(data.current.femaleModel)
				end

				ESX.Streaming.RequestModel(modelHash, function()
					SetPlayerModel(PlayerId(), modelHash)
					SetModelAsNoLongerNeeded(modelHash)

					TriggerEvent('esx:restoreLoadout')
				end)
			end)
		end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	end)
end

function KleiderSchrank()
	local playerPed = PlayerPedId()
	

	local elements = {
		{ label = ("Kleidung anziehen"), value = 'player_dressing' },
		{ label = ("Kleidung wegwerfen"), value = 'remove_cloth' }
	}


	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = ("Kleiderschrank"),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		

		if data.current.value == 'player_dressing' then
			ESX.TriggerServerCallback('grp_Safe:getPlayerDressing', function(dressing)
				local elements = {}

				for i=1, #dressing, 1 do
					table.insert(elements, {
						label = dressing[i],
						value = i
					})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing', {
					title    = ("Kleidung"),
					align    = 'top-left',
					elements = elements
				}, function(data2, menu2)
					TriggerEvent('skinchanger:getSkin', function(skin)
						ESX.TriggerServerCallback('grp_Safe:getPlayerOutfit', function(clothes)
							TriggerEvent('skinchanger:loadClothes', skin, clothes)
							TriggerEvent('esx_skin:setLastSkin', skin)

							TriggerEvent('skinchanger:getSkin', function(skin)
								TriggerServerEvent('esx_skin:save', skin)
							end)
						end, data2.current.value)
					end)
				end, function(data2, menu2)
					menu2.close()
				end)
			end)

		elseif data.current.value == 'remove_cloth' then

			ESX.TriggerServerCallback('grp_Safe:getPlayerDressing', function(dressing)
				local elements = {}

				for i=1, #dressing, 1 do
					table.insert(elements, {
						label = dressing[i],
						value = i
					})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'remove_cloth', {
					title    = ("Kleidung wegwerfen"),
					align    = 'top-left',
					elements = elements
				}, function(data2, menu2)
					menu2.close()
					TriggerServerEvent('grp_Safe:removeOutfit', data2.current.value)
					ESX.ShowNotification(("Kleidung weggeworfen"))
				end, function(data2, menu2)
					menu2.close()
				end)
			end)

		
		end

	end, function(data, menu)
		menu.close()
	end)
end



function OpenArmoryMenu(station)
	local elements = {
		--{label = _U('buy_weapons'), value = 'buy_weapons'}
		--{label = _U('put_weapon'),     value = 'put_weapon'}
	}

	if Config.EnableArmoryManagement then
		--table.insert(elements, {label = _U('get_weapon'),     value = 'get_weapon'})
		--table.insert(elements, {label = _U('put_weapon'),     value = 'put_weapon'})
		--table.insert(elements, {label = ('Items kaufen'),  value = 'item_kaufen'})
		table.insert(elements, {label = _U('deposit_object'), value = 'put_stock'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory', {
		title    = _U('armory'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)

		if data.current.value == 'buy_weapons' then
			OpenBuyWeaponsMenu()
		elseif data.current.value == 'item_kaufen' then
			OpenItemKaufenMenu()
		elseif data.current.value == 'put_weapon' then
			OpenPutWeaponMenu()
		elseif data.current.value == 'put_stock' then
			OpenPutStocksMenu()
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menu_armory'
		CurrentActionMsg  = _U('open_armory')
		CurrentActionData = {station = station}
	end)
end



RegisterNetEvent('grp_Polizei:Minigsamessa')
AddEventHandler('grp_Polizei:Minigsamessa', function()

mginigdames()

end)

function mginigdames()
	ESX.UI.Menu.CloseAll()
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gg', {
		title    = 'Verfügbare Minigames',
		align    = 'top-left',
		elements = {
			{label = ('Paintball'), value = 'paitnballl'},
			{label = ('Wüstenrallye'), value = 'wuesten'},
			{label = ('Armdrücken'), value = 'armdrücken'},
			
	}}, function(data, menu)
			local coordsrunter = { x = -1652.73,  y = -919.64, z = 0.46}
			local playerPed = GetPlayerPed(-1)
		    if data.current.value == 'paitnballl' then
			exports['mythic_notify']:DoHudText('inform', 'Paintball wurde auf Deinem Navi markiert.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
			SetNewWaypoint(-1683.6938476562,-1138.3818359375,13.066224098206);
			PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

		    elseif data.current.value == 'wuesten' then
			exports['mythic_notify']:DoHudText('inform', 'Die Wüstenrallye wurde auf Deinem Navi markiert.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
			SetNewWaypoint(2361.4030761719,3163.6782226562,48.027751922607);
			PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
				
		    elseif data.current.value == 'armdrücken' then
			PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
			exports['mythic_notify']:DoHudText('inform', 'Das Armdrücken wurde auf Deinem Navi markiert.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
			SetNewWaypoint(1116.5793457031,111.95475769043,80.77075958252);
			PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
			end
		menu.close()
		
		end, function(data, menu)
		menu.close()
	end)
end


 

RegisterNetEvent('grp_Polizei:Farmuigna231')
AddEventHandler('grp_Polizei:Farmuigna231', function()

Farmuigna231()

end)


function Farmuigna231()
	ESX.UI.Menu.CloseAll()
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gg', {
		title    = 'Farming Möglichkeiten',
		align    = 'top-left',
		elements = {
			{label = ('Eisen schürfen'), value = 'EINS'},
			{label = ('Fische angeln'), value = 'ZWEI'},
			{label = ('Asche sammeln'), value = 'DREI'},
			{label = ('Tabak pflücken'), value = 'VIER'},
			{label = ('Sand schaufeln'), value = 'FÜNF'},
			
	}}, function(data, menu)
			local coordsrunter = { x = -1652.73,  y = -919.64, z = 0.46}
			local playerPed = GetPlayerPed(-1)
		    if data.current.value == 'EINS' then
			exports['mythic_notify']:DoHudText('inform', 'Die Eisenmine wurde auf Deinem Navi markiert.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
			SetNewWaypoint(2945.3491210938,2783.4833984375,39.728633880615);
			PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
			
			
			
		    elseif data.current.value == 'ZWEI' then
			exports['mythic_notify']:DoHudText('inform', 'Der Angelspot wurde auf Deinem Navi markiert.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
			SetNewWaypoint(951.10852050781,-2659.896484375,3.0743687152863);
			PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

		    elseif data.current.value == 'DREI' then
			exports['mythic_notify']:DoHudText('inform', 'Das Ziel wurde auf Deinem Navi markiert.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
			SetNewWaypoint(-1145.9599609375,4969.3100585938,220.65405273438);
			PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
				
		    elseif data.current.value == 'VIER' then
			PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
			exports['mythic_notify']:DoHudText('inform', 'Das Tabakfeld wurde auf Deinem Navi markiert.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
			SetNewWaypoint(324.95962524414,6653.3100585938,32.498958587646);
			PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
			
			
		    elseif data.current.value == 'FÜNF' then
			PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
			exports['mythic_notify']:DoHudText('inform', 'Der Sandberg wurde auf Deinem Navi markiert.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
			SetNewWaypoint(2722.9599609375,2894.3100585938,47.814529418945);
			PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
			
			end
		menu.close()
		
		end, function(data, menu)
		menu.close()
	end)
end


RegisterNetEvent('grp_Polizei:Hubss231s')
AddEventHandler('grp_Polizei:Hubss231s', function()

Hubss231s()

end)

function Hubss231s()
	ESX.UI.Menu.CloseAll()
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gg', {
		title    = 'Creative Hubs',
		align    = 'top-left',
		elements = {
			{label = ('Los Santos #1'), value = 'lseinsse'},
			{label = ('Los Santos #2'), value = 'lszweis'},
			{label = ('Sandy Shores'), value = 'sandyshh'},
			{label = ('Paleto Bay'), value = 'paletksd'},
			
	}}, function(data, menu)
			local coordsrunter = { x = -1652.73,  y = -919.64, z = 0.46}
			local playerPed = GetPlayerPed(-1)
		    if data.current.value == 'lseinsse' then
			exports['mythic_notify']:DoHudText('inform', 'Das LS Hub #1 wurde auf Deinem Navi markiert.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
			SetNewWaypoint(-1622.0113525391,-1065.9792480469,13.06428527832);
			PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

			
			
		    elseif data.current.value == 'lszweis' then
			exports['mythic_notify']:DoHudText('inform', 'Das LS Hub #2 wurde auf Deinem Navi markiert.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
			SetNewWaypoint(1129.1246337891,113.75206756592,80.853927612305);
			PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

		    elseif data.current.value == 'sandyshh' then
			exports['mythic_notify']:DoHudText('inform', 'Das Sandy Hub wurde auf Deinem Navi markiert.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
			SetNewWaypoint(2346.6682128906,3131.6520996094,48.208724975586);
			PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
				
		    elseif data.current.value == 'paletksd' then
			PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
			exports['mythic_notify']:DoHudText('inform', 'Das Paleto Hub wurde auf Deinem Navi markiert.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
			SetNewWaypoint(412.20825195312,6481.494140625,28.738935470581);
			PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
			
			end
		menu.close()
		
		end, function(data, menu)
		menu.close()
	end)
end


Citizen.CreateThread(function()
    local polizeigarag = {
        `s_f_y_cop_01`,
    }
	local helikk = {
        `s_m_m_pilot_02`,
    }
	local kleidungrrrd = {
        1746762665,
        1201332031,
    }
	local teltzzlll = {
        1281992692,
    }
	local bosmmm = {
        1910331218,
    }
	local biaritisch = {
        -314623274,
        322248450,
    }
	local Waffenkkkkrmer = {
        `s_m_y_cop_01`,
    }
	local jobcennntt = {
        `a_m_y_business_02`,
    }
	exports['bt-target']:AddTargetModel(biaritisch, {
        options = {
            {
                event = "rcore_pool:takeCue",
                icon = "fas fa-ball-pile",
                label = "Billardkö nehmen",
            },
			{
                event = "rcore_pool:removeCue",
                icon = "fas fa-ball-pile",
                label = "Billardkö ablegen",
            },
        },
        job = {"all"},
        distance = 2.5
    })
	
	exports['bt-target']:AddTargetModel(jobcennntt, {
         options = {
            {
                event = "",
                icon = "",
                label = "Wo möchtest Du hin?:",
            },
			{
                event = "grp_Polizei:Minigsamessa",
                icon = "fas fa-car",
                label = "Minigames",
            },
			{
                event = "grp_Polizei:Hubss231s",
                icon = "fas fa-car",
                label = "Creative Hubs",
            },
			{
                event = "grp_Polizei:Farmuigna231",
                icon = "fas fa-car",
                label = "Farming",
            },
        },
        job = {"all"},
        distance = 2.5 
	})
	
    exports['bt-target']:AddTargetModel(polizeigarag, {
         options = {
            {
                event = "grp_Polizei:garageoeffnenn",
                icon = "fas fa-car",
                label = "Garage Öffnen",
            },
        },
        job = {"police"},
        distance = 2.5 
	})
	exports['bt-target']:AddTargetModel(helikk, {
         options = {
            {
                event = "grp_Polizei:helikoeffnennd",
                icon = "fas fa-helicopter",
                label = "Heligarage Öffnen",
            },
        },
        job = {"police"},
        distance = 2.5 
	})
	exports['bt-target']:AddTargetModel(Waffenkkkkrmer, {
         options = {
			{
                event = "grp_Polizei:waffenkaaammeer",
                icon = "far fa-id-card",
                label = "Waffenkammer öffnen",
            },
			{
                event = "grp_Polizei:schutzwueeeste",
                icon = "fas fa-shield-alt",
                label = "Schutzweste anziehen",
            },
        },
        job = {"police"},
        distance = 2.5 
	})
    exports['bt-target']:AddTargetModel(kleidungrrrd, {
        options = {
            {
                event = "grp_Polizei:kleidunggrr",
                icon = "fas fa-coffee",
                label = "Umziehen",
            },
        },
        job = {"police"},
        distance = 2.5
    })
	exports['bt-target']:AddTargetModel(bosmmm, {
        options = {
            {
                event = "grp_Polizei:bosmmme",
                icon = "fas fa-desktop",
                label = "Bossmenu",
            },
        },
        job = {"police"},
        distance = 2.5
    })
	exports['bt-target']:AddTargetModel(teltzzlll, {
        options = {
			{
                event = "grp_Polizei:anrufannehmen",
                icon = "fas fa-phone",
                label = "Edgar's anruf annehmen",
            },
        },
        job = {"all"},
        distance = 2.5
    })
	
end)




RegisterNetEvent('grp_Polizei:taxirufffen')
AddEventHandler('grp_Polizei:taxirufffen', function()
TriggerEvent("Taxi:CallTaxi")
end)

RegisterNetEvent('grp_Polizei:taxi22rufffen')
AddEventHandler('grp_Polizei:taxi22rufffen', function()
TriggerEvent("Taxi:CancelTaxi")
end)

RegisterNetEvent('grp_Polizei:anrufannehmen')
AddEventHandler('grp_Polizei:anrufannehmen', function()

local playerPed = GetPlayerPed(-1)

TaskPlayAnim(playerPed,"cellphone@","cellphone_call_listen_base", 1.0, -1.0, 10000, 0, 1, true, true, true) 
TriggerEvent("InteractSound_CL:PlayOnOne", "edgartelefon", 0.5)

end)



RegisterNetEvent('grp_Polizei:bosmmme')
AddEventHandler('grp_Polizei:bosmmme', function()
TriggerEvent('esx_society:openBosdewenspantossindnice1337sMenu', 'police', function(data, menu)
end)
end)

RegisterNetEvent('grp_Polizei:kleidunggrr')
AddEventHandler('grp_Polizei:kleidunggrr', function()
OpenCloakroomMenu()
end)


RegisterNetEvent('grp_Polizei:schutzwueeeste')
AddEventHandler('grp_Polizei:schutzwueeeste', function()
	local inpaintball = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -2214.4331054688,3030.0393066406,32.914123535156, true) < 750
local playerPed = GetPlayerPed(-1)
	if PlayerData.job and PlayerData.job.name == 'police' and not inpaintball then		
	TaskPlayAnim(playerPed, 'clothingtie', 'try_tie_negative_a', 8.0, -8, -1, 49, 0, 0, 0, 0)
	exports['progressBars']:startUI(5000, "Ziehe Schutzweste an...") --10.000 Sekunden
	Citizen.Wait(5100)
	ClearPedTasksImmediately(playerPed)
	exports['mythic_notify']:DoHudText('success', 'Schutzweste angezogen.')
	AddArmourToPed(playerPed, 100)
	SetPedArmour(playerPed, 100)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
				SetPedComponentVariation(playerPed, 9, 12, 3, 1)
			else
				SetPedComponentVariation(playerPed, 9, 11, 3, 1)
		end
	end)
	else
	exports['mythic_notify']:DoHudText('error', 'Du musst Polizist sein.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	end
end)

RegisterNetEvent('grp_DoJ:schutzwueeeste')
AddEventHandler('grp_DoJ:schutzwueeeste', function()
	local inpaintball = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -2214.4331054688,3030.0393066406,32.914123535156, true) < 750
	local playerPed = GetPlayerPed(-1)
	if PlayerData.job and PlayerData.job.name == 'doj' and not inpaintball then		
	TaskPlayAnim(playerPed, 'clothingtie', 'try_tie_negative_a', 8.0, -8, -1, 49, 0, 0, 0, 0)
	exports['progressBars']:startUI(5000, "Ziehe Schutzweste an...") --10.000 Sekunden
	Citizen.Wait(5100)
	ClearPedTasksImmediately(playerPed)
	exports['mythic_notify']:DoHudText('success', 'Schutzweste angezogen.')
	AddArmourToPed(playerPed, 100)
	SetPedArmour(playerPed, 100)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
				SetPedComponentVariation(playerPed, 9, 11, 2, 1)
			else
				SetPedComponentVariation(playerPed, 9, 11, 2, 1)
		end
	end)
	else
	exports['mythic_notify']:DoHudText('error', 'Du musst bei der Justiz sein.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	end
end)

RegisterNetEvent('grp_Fib:schutzwueeeste')
AddEventHandler('grp_Fib:schutzwueeeste', function()
	local inpaintball = GetDistanceBetweenCoords(coords, -2214.4331054688,3030.0393066406,32.914123535156, true) < 750
	local playerPed = GetPlayerPed(-1)
	if PlayerData.job and PlayerData.job.name == 'fib' and not inpaintball then		
	TaskPlayAnim(playerPed, 'clothingtie', 'try_tie_negative_a', 8.0, -8, -1, 49, 0, 0, 0, 0)
	exports['progressBars']:startUI(5000, "Ziehe Schutzweste an...") --10.000 Sekunden
	Citizen.Wait(5100)
	ClearPedTasksImmediately(playerPed)
	exports['mythic_notify']:DoHudText('success', 'Schutzweste angezogen.')
	AddArmourToPed(playerPed, 100)
	SetPedArmour(playerPed, 100)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
				SetPedComponentVariation(playerPed, 9, 8, 2, 1)
			else
				SetPedComponentVariation(playerPed, 9, 7, 2, 1)
		end
	end)
	else
	exports['mythic_notify']:DoHudText('error', 'Du musst FIB Agent sein.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	end
end)

RegisterNetEvent('grp_Sheriff:schutzwueeeste')
AddEventHandler('grp_Sheriff:schutzwueeeste', function()
	local inpaintball = GetDistanceBetweenCoords(coords, -2214.4331054688,3030.0393066406,32.914123535156, true) < 750
	local playerPed = GetPlayerPed(-1)
	if PlayerData.job and PlayerData.job.name == 'sheriff' and not inpaintball then		
	TaskPlayAnim(playerPed, 'clothingtie', 'try_tie_negative_a', 8.0, -8, -1, 49, 0, 0, 0, 0)
	exports['progressBars']:startUI(5000, "Ziehe Schutzweste an...") --10.000 Sekunden
	Citizen.Wait(5100)
	ClearPedTasksImmediately(playerPed)
	exports['mythic_notify']:DoHudText('success', 'Schutzweste angezogen.')
	AddArmourToPed(playerPed, 100)
	SetPedArmour(playerPed, 100)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
				SetPedComponentVariation(playerPed, 9, 12, 2, 1)
			else
				SetPedComponentVariation(playerPed, 9, 11, 2, 1)
		end
	end)
	else
	exports['mythic_notify']:DoHudText('error', 'Du musst Sheriff sein.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	end
end)




RegisterNetEvent('grp_Polizei:waffenkaaammeer')
AddEventHandler('grp_Polizei:waffenkaaammeer', function()
OpenArmoryMenu(CurrentActionData.station)
end)

RegisterNetEvent('grp_Polizei:garageoeffnenn')
AddEventHandler('grp_Polizei:garageoeffnenn', function()
OpenVehicleSpawnerMenu('car', CurrentActionData.station, CurrentActionData.part, CurrentActionData.partNum)

--[[
print("CurrentActionData.station: " .. CurrentActionData.station)
print("CurrentActionData.part: " .. CurrentActionData.part)
print("CurrentActionData.partNum: " .. CurrentActionData.partNum)
]]--

end)

RegisterNetEvent('grp_Polizei:helikoeffnennd')
AddEventHandler('grp_Polizei:helikoeffnennd', function()
OpenVehicleSpawnerMenu('helicopter', CurrentActionData.station, CurrentActionData.part, CurrentActionData.partNum)


end)

RegisterNetEvent('grp_Polizei:Fahrzeugshoppp')
AddEventHandler('grp_Polizei:Fahrzeugshoppp', function()


end)


function OpenVehicleSpawnerMenu(type, station, part, partNum)
	local playerCoords = GetEntityCoords(PlayerPedId())
	PlayerData = ESX.GetPlayerData()
	local elements = {
		{label = _U('garage_storeditem'), action = 'garage'},
		{label = _U('garage_storeitem'), action = 'store_garage'},
		{label = _U('garage_buyitem'), action = 'buy_vehicle'}
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle', {
		title    = _U('garage_title'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.action == 'buy_vehicle' then
			local shopElements, shopCoords = {}

			if type == 'car' then
				shopCoords = Config.PoliceStations[station].Vehicles[partNum].InsideShop
				local authorizedVehicles = Config.AuthorizedVehicles[PlayerData.job.grade_name]

				if #Config.AuthorizedVehicles.Shared > 0 then
					for k,vehicle in ipairs(Config.AuthorizedVehicles.Shared) do
						table.insert(shopElements, {
							label = ('%s - <span style="color:green;">%s</span>'):format(vehicle.label, _U('shop_item', ESX.Math.GroupDigits(vehicle.price))),
							name  = vehicle.label,
							model = vehicle.model,
							price = vehicle.price,
							livery = vehicle.livery or nil,
							type  = 'car'
						})
					end
				end

				if #authorizedVehicles > 0 then
					for k,vehicle in ipairs(authorizedVehicles) do
						table.insert(shopElements, {
							label = ('%s - <span style="color:green;">%s</span>'):format(vehicle.label, _U('shop_item', ESX.Math.GroupDigits(vehicle.price))),
							name  = vehicle.label,
							model = vehicle.model,
							price = vehicle.price,
							livery = vehicle.livery or nil,
							type  = 'car'
						})
					end
				else
					if #Config.AuthorizedVehicles.Shared == 0 then
						return
					end
				end
			elseif type == 'helicopter' then
				shopCoords = Config.PoliceStations[station].Helicopters[partNum].InsideShop
				local authorizedHelicopters = Config.AuthorizedHelicopters[PlayerData.job.grade_name]

				if #authorizedHelicopters > 0 then
					for k,vehicle in ipairs(authorizedHelicopters) do
						table.insert(shopElements, {
							label = ('%s - <span style="color:green;">%s</span>'):format(vehicle.label, _U('shop_item', ESX.Math.GroupDigits(vehicle.price))),
							name  = vehicle.label,
							model = vehicle.model,
							price = vehicle.price,
							livery = vehicle.livery or nil,
							type  = 'helicopter'
						})
					end
				else
					ESX.ShowNotification(_U('helicopter_notauthorized'))
					return
				end
			end

			OpenShopMenu(shopElements, playerCoords, shopCoords)
		elseif data.current.action == 'garage' then
			local garage = {}

			ESX.TriggerServerCallback('grp_AutoHaus2:retrieveJobVehicles', function(jobVehicles)
				if #jobVehicles > 0 then
					for k,v in ipairs(jobVehicles) do
						local props = json.decode(v.vehicle)
						local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(props.model))
						local label = ('%s - <span style="color:darkgoldenrod;">%s</span>: '):format(vehicleName, props.plate)

						if v.stored then
							label = label .. ('<span style="color:green;">%s</span>'):format(_U('garage_stored'))
						else
							label = label .. ('<span style="color:darkred;">%s</span>'):format(_U('garage_notstored'))
						end

						table.insert(garage, {
							label = label,
							stored = v.stored,
							model = props.model,
							vehicleProps = props
						})
					end

					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_garage', {
						title    = _U('garage_title'),
						align    = 'top-left',
						elements = garage
					}, function(data2, menu2)
						if data2.current.stored then
							local foundSpawn, spawnPoint = GetAvailableVehicleSpawnPoint(station, part, partNum)

							if foundSpawn then
								menu2.close()

								ESX.Game.SpawnVehicle(data2.current.model, spawnPoint.coords, spawnPoint.heading, function(vehicle)
									ESX.Game.SetVehicleProperties(vehicle, data2.current.vehicleProps)

									TriggerServerEvent('grp_AutoHaus2:setJobVehicleState', data2.current.vehicleProps.plate, false)
									ESX.ShowNotification(_U('garage_released'))
								end)
							end
						else
							ESX.ShowNotification(_U('garage_notavailable'))
						end
					end, function(data2, menu2)
						menu2.close()
					end)
				else
					ESX.ShowNotification(_U('garage_empty'))
				end
			end, type)
		elseif data.current.action == 'store_garage' then
			StoreNearbyVehicle(playerCoords)
		end
	end, function(data, menu)
		menu.close()
	end)
end

function StoreNearbyVehicle(playerCoords)
	local vehicles, vehiclePlates = ESX.Game.GetVehiclesInArea(playerCoords, 30.0), {}

	if #vehicles > 0 then
		for k,v in ipairs(vehicles) do

			-- Make sure the vehicle we're saving is empty, or else it wont be deleted
			if GetVehicleNumberOfPassengers(v) == 0 and IsVehicleSeatFree(v, -1) then
				table.insert(vehiclePlates, {
					vehicle = v,
					plate = ESX.Math.Trim(GetVehicleNumberPlateText(v))
				})
			end
		end
	else
		ESX.ShowNotification(_U('garage_store_nearby'))
		return
	end

	ESX.TriggerServerCallback('grp_PolizeiJob:storeNearbyVehicle', function(storeSuccess, foundNum)
		if storeSuccess then
			local vehicleId = vehiclePlates[foundNum]
			local attempts = 0
			ESX.Game.DeleteVehicle(vehicleId.vehicle)
			IsBusy = true

			Citizen.CreateThread(function()
				BeginTextCommandBusyString('STRING')
				AddTextComponentSubstringPlayerName(_U('garage_storing'))
				EndTextCommandBusyString(4)

				while IsBusy do
					Citizen.Wait(100)
				end

				RemoveLoadingPrompt()
			end)

			-- Workaround for vehicle not deleting when other players are near it.
			while DoesEntityExist(vehicleId.vehicle) do
				Citizen.Wait(500)
				attempts = attempts + 1

				-- Give up
				if attempts > 30 then
					break
				end

				vehicles = ESX.Game.GetVehiclesInArea(playerCoords, 30.0)
				if #vehicles > 0 then
					for k,v in ipairs(vehicles) do
						if ESX.Math.Trim(GetVehicleNumberPlateText(v)) == vehicleId.plate then
							ESX.Game.DeleteVehicle(v)
							break
						end
					end
				end
			end

			IsBusy = false
			ESX.ShowNotification(_U('garage_has_stored'))
		else
			ESX.ShowNotification(_U('garage_has_notstored'))
		end
	end, vehiclePlates)
end

function GetAvailableVehicleSpawnPoint(station, part, partNum)
	local spawnPoints = Config.PoliceStations[station][part][partNum].SpawnPoints
	local found, foundSpawnPoint = false, nil

	for i=1, #spawnPoints, 1 do
		if ESX.Game.IsSpawnPointClear(spawnPoints[i].coords, spawnPoints[i].radius) then
			found, foundSpawnPoint = true, spawnPoints[i]
			break
		end
	end

	if found then
		return true, foundSpawnPoint
	else
		ESX.ShowNotification(_U('vehicle_blocked'))
		return false
	end
end

function OpenShopMenu(elements, restoreCoords, shopCoords)
	local playerPed = PlayerPedId()
	isInShopMenu = true

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_shop', {
		title    = _U('vehicleshop_title'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_shop_confirm', {
			title    = _U('vehicleshop_confirm', data.current.name, data.current.price),
			align    = 'top-left',
			elements = {
				{label = _U('confirm_no'), value = 'no'},
				{label = _U('confirm_yes'), value = 'yes'}
		}}, function(data2, menu2)
			if data2.current.value == 'yes' then
				local newPlate = exports['esx_AutoHaus2']:GeneratePlate()
				local vehicle  = GetVehiclePedIsIn(playerPed, false)
				local props    = ESX.Game.GetVehicleProperties(vehicle)
				props.plate    = newPlate

				ESX.TriggerServerCallback('grp_PolizeiJob:buyJobVehicle', function (bought)
					if bought then
						ESX.ShowNotification(_U('vehicleshop_bought', data.current.name, ESX.Math.GroupDigits(data.current.price)))

						isInShopMenu = false
						ESX.UI.Menu.CloseAll()
						DeleteSpawnedVehicles()
						FreezeEntityPosition(playerPed, false)
						SetEntityVisible(playerPed, true)

						ESX.Game.Teleport(playerPed, restoreCoords)
					else
						ESX.ShowNotification(_U('vehicleshop_money'))
						menu2.close()
					end
				end, props, data.current.type)
			else
				menu2.close()
			end
		end, function(data2, menu2)
			menu2.close()
		end)
	end, function(data, menu)
		isInShopMenu = false
		ESX.UI.Menu.CloseAll()

		DeleteSpawnedVehicles()
		FreezeEntityPosition(playerPed, false)
		SetEntityVisible(playerPed, true)

		ESX.Game.Teleport(playerPed, restoreCoords)
	end, function(data, menu)
		DeleteSpawnedVehicles()
		WaitForVehicleToLoad(data.current.model)

		ESX.Game.SpawnLocalVehicle(data.current.model, shopCoords, 0.0, function(vehicle)
			table.insert(spawnedVehicles, vehicle)
			TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
			FreezeEntityPosition(vehicle, true)
			SetModelAsNoLongerNeeded(data.current.model)

			if data.current.livery then
				SetVehicleModKit(vehicle, 0)
				SetVehicleLivery(vehicle, data.current.livery)
			end
		end)
	end)

	WaitForVehicleToLoad(elements[1].model)
	ESX.Game.SpawnLocalVehicle(elements[1].model, shopCoords, 0.0, function(vehicle)
		table.insert(spawnedVehicles, vehicle)
		TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
		FreezeEntityPosition(vehicle, true)
		SetModelAsNoLongerNeeded(elements[1].model)

		if elements[1].livery then
			SetVehicleModKit(vehicle, 0)
			SetVehicleLivery(vehicle, elements[1].livery)
		end
	end)
end


--reg command textaus = textaus true


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if isInShopMenu then
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle
		else
			Citizen.Wait(500)
		end
	end
end)

--[[
local textan = true

RegisterCommand("textaus", function()
	textan = false
end)

RegisterCommand("textan", function()
	textan = true
end)

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
	if textan then
		DrawAdvancedText(0.591, 0.853, 0.005, 0.0028, 0.4, "NEU: Verwende [ALT] zum Interagieren mit Spielern/NPCS/Objekten.", 0, 255, 0, 255, 6, 0)
		DrawAdvancedText(0.591, 0.883, 0.005, 0.0028, 0.4, "Du kannst diese Nachricht mit /textaus ausblenden.", 0, 255, 0, 255, 6, 0)
		else
		
		end
	end
end)

]]--

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





function DeleteSpawnedVehicles()
	while #spawnedVehicles > 0 do
		local vehicle = spawnedVehicles[1]
		ESX.Game.DeleteVehicle(vehicle)
		table.remove(spawnedVehicles, 1)
	end
end

function WaitForVehicleToLoad(modelHash)
	modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))

	if not HasModelLoaded(modelHash) then
		RequestModel(modelHash)

		BeginTextCommandBusyString('STRING')
		AddTextComponentSubstringPlayerName(_U('vehicleshop_awaiting_model'))
		EndTextCommandBusyString(4)

		while not HasModelLoaded(modelHash) do
			Citizen.Wait(0)
			DisableAllControlActions(0)
		end

		RemoveLoadingPrompt()
	end
end




RegisterCommand("polizeimenu", function(source)
if not isDead and PlayerData.job and PlayerData.job.name == 'police' then		
OpenpoliceActionsMenu()
end
end)


function JailPlayer(player)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'jail_menu', {
		title = ("Person einsperren"),
	}, function (data2, menu)
		local jailTime = tonumber(data2.value)
		if jailTime == nil then
			ESX.ShowNotification('Ungültiger Wert!')
		else
			TriggerServerEvent("grp_Knast:IchSperreDichEin", player, jailTime)
			menu.close()
		end
	end, function (data2, menu)
		menu.close()
	end)
end

function OpenpoliceActionsMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'police_actions', {
		title    = 'LSPD',
		align    = 'top-left',
		elements = {
			{label = _U('citizen_interaction'), value = 'citizen_interaction'},
			{label = ("🔊Unterstützung anfordern"), value = 'dienstausweis_aktion'},
			{label = ("🛡️Schild und 👮‍♂️Style"), value = 'schild_interaction'},
			{label = ("🚓Fahrzeug Aktionen"), value = 'vehicle_interaction'},
			{label = _U('object_spawner'), value = 'object_spawner'},
			{label = "⛓️Gefängnis",               value = 'jail_menu'}
	}}, function(data, menu)
	
			if data.current.value == 'jail_menu' then
            TriggerEvent('grp_Knast:ZeigeKnast')
			end
		
	    if data.current.value == 'citizen_interaction' then
			local elements = {
				--{label = _U('id_card'), value = 'identity_card'},
				--{label = _U('search'), value = 'body_search'},
				--{label = _U('handcuff'), value = 'handcuff'},
				--{label = _U('softcuff'), value = 'softcuff'},				
				--{label = _U('uncuff'), value = 'uncuff'},
				--{label = _U('drag'), value = 'drag'},
				{label = _U('kleidung_jail'), value = 'kleidungjail'},
				{label = _U('put_in_vehicle'), value = 'put_in_vehicle'},
				{label = _U('out_the_vehicle'), value = 'out_the_vehicle'},
				--{label = ('🚗 Fahrzeug Extras'),         value = 'ichwechselmeineextraseinfachsobruder'},
				--{label = _U('fine'), value = 'fine'},
				{label = _U('customrechnung'), value = 'customdannwirdbesser'},
				{label = _U('unpaid_bills'), value = 'unpaid_bills'}
			}

			--if Config.EnableLicenses then
				--table.insert(elements, { label = _U('license_check'), value = 'license' })
			--end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
				title    = _U('citizen_interaction'),
				align    = 'top-left',
				elements = elements
			}, function(data2, menu2)
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if closestPlayer ~= -1 and closestDistance <= 3.0 then
					local action = data2.current.value
					local playerPed = PlayerPedId()
					if action == 'identity_card' then
						TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
						TriggerServerEvent('grp_PolizeiJob:message', GetPlayerServerId(closestPlayer), _U('dein_ausweis_genommen'))
						exports['progressBars']:startUI(2500, "Ziehe Ausweis...") --10.000 Sekunden
						Citizen.Wait(2500)
						ClearPedTasksImmediately(playerPed)
						OpenIdentityCardMenu(closestPlayer)
					
					elseif action == 'body_search' then
						TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
						TriggerServerEvent('grp_PolizeiJob:message', GetPlayerServerId(closestPlayer), _U('being_searched'))
						exports['progressBars']:startUI(2500, "Durchsuche Person...") --10.000 Sekunden
						Citizen.Wait(2500)
						ClearPedTasksImmediately(playerPed)
						OpenBodySearchMenu(closestPlayer)
					elseif action == 'softcuff' then
						TriggerServerEvent('grp_PolizeiJobjob:message', GetPlayerServerId(closestPlayer), _U('dir_wurden_handschellenvorne_angelegt'))
						TriggerEvent('bens_cuff_item:checkCuff', GetPlayerServerId(closestPlayer))	
					elseif action == 'uncuff' then
						TriggerServerEvent('grp_PolizeiJob:entfesseln', GetPlayerServerId(closestPlayer))
						TriggerEvent('bens_cuff_item:uncufffürbeamte', GetPlayerServerId(closestPlayer))	
					elseif action == 'drag' then
						TriggerServerEvent('grp_PolizeiJob:message', GetPlayerServerId(closestPlayer), _U('du_wirst_getragen'))
						TriggerServerEvent('grp_PolizeiJob:drag', GetPlayerServerId(closestPlayer))
					elseif action == 'kleidungjail' then
						PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

						TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
						exports['progressBars']:startUI(2500, "Ziehe Kleidung an...") --10.000 Sekunden
						Citizen.Wait(2500)
						ClearPedTasksImmediately(playerPed)
						TriggerServerEvent('grp_PolizeiJob:message', GetPlayerServerId(closestPlayer), _U('dir_wurde_jailkleidung_angekleidet'))
						TriggerServerEvent('grp_PolizeiJob:kleidungjail', GetPlayerServerId(closestPlayer))	
					elseif action == 'put_in_vehicle' then
					PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

						TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
						exports['progressBars']:startUI(2500, "Setze ins Auto...")
						Citizen.Wait(2500)
						ClearPedTasksImmediately(playerPed)
						TriggerServerEvent('grp_PolizeiJob:message', GetPlayerServerId(closestPlayer), _U('du_wurdest_ins_auto_gesetzt'))
						TriggerServerEvent('grp_PolizeiJob:putInVehicle', GetPlayerServerId(closestPlayer))
					elseif action == 'out_the_vehicle' then
					PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

						TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
						exports['progressBars']:startUI(2500, "Ziehe aus Fahrzeug...") --10.000 Sekunden
						Citizen.Wait(2500)
						ClearPedTasksImmediately(playerPed)
						TriggerServerEvent('grp_PolizeiJob:message', GetPlayerServerId(closestPlayer), _U('du_wurdest_aus_auto_genommen'))
						TriggerServerEvent('grp_PolizeiJob:OutVehicle', GetPlayerServerId(closestPlayer))
					elseif action == 'fine' then
					PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

						OpenFineMenu(closestPlayer)
					elseif action == 'customdannwirdbesser' then
					PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

						OpenCustomRechnungMenu(closestPlayer)	
					elseif action == 'license' then
					PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

						TriggerServerEvent('grp_PolizeiJob:message', GetPlayerServerId(closestPlayer), _U('deine_lizenzen_werden_angeschaut'))
						ShowPlayerLicense(closestPlayer)
					elseif action == 'unpaid_bills' then
					PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

						OpenUnpaidBillsMenu(closestPlayer)
					end
				else
					ESX.ShowNotification(_U('no_players_nearby'))
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		
		elseif data.current.value == 'dienstausweis_aktion' then
			local elements = {
				{label = ("👮Code4 (1 weitere Einheit)"), value = '1'},
				{label = ("👮Code4 (2 weitere Einheiten)"), value = '1.1'},
				{label = ("🚕Abholung anfordern"), value = '2'},
				{label = ("🚓Gefangenentransport"), value = '3'},
				{label = ("🚑Mediziner Kontaktieren"), value = '4'},
				{label = ("🚒Feuerwehr Kontaktieren"), value = '4.1'},
				{label = ("📍10-20 teilen"), value = '5'},
				{label = ("🏎️10-80"), value = '6'},
				{label = ("🔎10-68 (+1 Einheit)"), value = '7'}
				
			}

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dienstausweis_aktion', {
				title    = ('Unterstützung anfordern'),
				align    = 'top-left',
				elements = elements
			}, function(data2, menu2)
				
				local action = data2.current.value
				local cord = GetEntityCoords(GetPlayerPed(-1))
				
				if action == '1' then
				--1
				PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

				exports['grp_Dispatch']:addCall("C-4", "Unterstützung benötigt", {
				{icon="fas fa-info-circle", info="Eine weitere Einheit benötigt"}
				}, {cord[1], cord[2], cord[3]}, "police", 3000, 11, 5 )
				--2
				exports['grp_Dispatch']:addCall("C-4", "Unterstützung benötigt", {
				{icon="fas fa-info-circle", info="Eine weitere Einheit benötigt"}
				}, {cord[1], cord[2], cord[3]}, "sheriff", 3000, 11, 5 )
				ESX.UI.Menu.CloseAll()
				Citizen.Wait(5000)
				
				elseif action == '1.1' then
				--1
				PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

				exports['grp_Dispatch']:addCall("C-4", "Unterstützung benötigt", {
				{icon="fas fa-info-circle", info="Zwei weitere Einheiten benötigt"}
				}, {cord[1], cord[2], cord[3]}, "police", 3000, 11, 5 )
				--2
				exports['grp_Dispatch']:addCall("C-4", "Unterstützung benötigt", {
				{icon="fas fa-info-circle", info="Zwei weitere Einheiten benötigt"}
				}, {cord[1], cord[2], cord[3]}, "sheriff", 3000, 11, 5 )
				ESX.UI.Menu.CloseAll()
				Citizen.Wait(5000)
				elseif action == '2' then
				--1
				PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

				exports['grp_Dispatch']:addCall("C-4", "Abholung benötigt", {
				{icon="fas fa-info-circle", info="Ein Kollege benötigt eine Abholung"}
				}, {cord[1], cord[2], cord[3]}, "police", 3000, 11, 5 )
				--2
				exports['grp_Dispatch']:addCall("C-4", "Abholung benötigt", {
				{icon="fas fa-info-circle", info="Ein Kollege benötigt eine Abholung"}
				}, {cord[1], cord[2], cord[3]}, "sheriff", 3000, 11, 5 )
				ESX.UI.Menu.CloseAll()
				Citizen.Wait(5000)
				elseif action == '3' then
				--1
				PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

				exports['grp_Dispatch']:addCall("C-4", "Gefangenentransport", {
				{icon="fas fa-info-circle", info="Unterstützung für abtransport benötigt."}
				}, {cord[1], cord[2], cord[3]}, "police", 3000, 11, 5 )
				--2
				exports['grp_Dispatch']:addCall("C-4", "Gefangenentransport", {
				{icon="fas fa-info-circle", info="Unterstützung für abtransport benötigt."}
				}, {cord[1], cord[2], cord[3]}, "sheriff", 3000, 11, 5 )
				ESX.UI.Menu.CloseAll()
				Citizen.Wait(5000)
				elseif action == '4' then
				PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

				exports['grp_Dispatch']:addCall("C-4", "Unterstützung angefordert", {
				{icon="fas fa-info-circle", info="Das LSPD benötigt Unterstützung."}
				}, {cord[1], cord[2], cord[3]}, "ambulance", 3000, 11, 5 )
				exports['mythic_notify']:DoHudText('inform', 'Du hast das LSMD kontaktiert', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				ESX.UI.Menu.CloseAll()
				Citizen.Wait(5000)
				elseif action == '4.1' then
				PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

				exports['grp_Dispatch']:addCall("C-4", "Feuerwehr angefordert", {
				{icon="fas fa-info-circle", info="Das LSPD benötigt die Feuerwehr."}
				}, {cord[1], cord[2], cord[3]}, "ambulance", 3000, 11, 5 )
				exports['mythic_notify']:DoHudText('inform', 'Du hast die Feuerwehr kontaktiert', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				ESX.UI.Menu.CloseAll()
				Citizen.Wait(5000)
				elseif action == '5' then
				PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

				--1
				exports['grp_Dispatch']:addCall("10-20", "Standort", {
				{icon="fas fa-info-circle", info="Ein Kollege hat seinen Standort geteilt."}
				}, {cord[1], cord[2], cord[3]}, "police", 3000, 11, 5 )
				--2
				exports['grp_Dispatch']:addCall("10-20", "Standort", {
				{icon="fas fa-info-circle", info="Ein Kollege hat seinen Standort geteilt."}
				}, {cord[1], cord[2], cord[3]}, "sheriff", 3000, 11, 5 )
				ESX.UI.Menu.CloseAll()
				Citizen.Wait(5000)
				elseif action == '6' then
				PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

				--1
				exports['grp_Dispatch']:addCall("10-80", "Verfolgungsjagd", {
				{icon="fas fa-info-circle", info="Es ist eine Verfolgungsjagd in gange."}
				}, {cord[1], cord[2], cord[3]}, "police", 3000, 11, 5 )
				--2
				exports['grp_Dispatch']:addCall("10-80", "Verfolgungsjagd", {
				{icon="fas fa-info-circle", info="Es ist eine Verfolgungsjagd in gange."}
				}, {cord[1], cord[2], cord[3]}, "sheriff", 3000, 11, 5 )
				ESX.UI.Menu.CloseAll()
				Citizen.Wait(5000)
				elseif action == '7' then
				PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

				--1
				exports['grp_Dispatch']:addCall("10-68", "Verkehrskontrolle", {
				{icon="fas fa-info-circle", info="Ein Kollege benötigt Unterstützung bei einer 10-68"}
				}, {cord[1], cord[2], cord[3]}, "police", 3000, 11, 5 )
				--2
				exports['grp_Dispatch']:addCall("10-68", "Verkehrskontrolle", {
				{icon="fas fa-info-circle", info="Ein Kollege benötigt Unterstützung bei einer 10-68"}
				}, {cord[1], cord[2], cord[3]}, "sheriff", 3000, 11, 5 )
				ESX.UI.Menu.CloseAll()
				Citizen.Wait(5000)
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == 'schild_interaction' then
			local elements  = {}
			local playerPed = PlayerPedId()
			local vehicle = ESX.Game.GetVehicleInDirection()

			--if DoesEntityExist(vehicle) then
				--table.insert(elements, {label = _U('vehicle_info'), value = 'vehicle_infos'})
			--	table.insert(elements, {label = _U('pick_lock'), value = 'hijack_vehicle'})
				--table.insert(elements, {label = _U('impound'), value = 'impound'})
			--end

			--table.insert(elements, {label = _U('search_database'), value = 'search_database'})
			table.insert(elements, {label = ("Schild 1"), value = 'schild1'})
			table.insert(elements, {label = ("Schild 2"), value = 'schild2'})
			table.insert(elements, {label = ("Schild 3"), value = 'schild3'})
			table.insert(elements, {label = ("Schild 4"), value = 'schild4'})
			table.insert(elements, {label = ("Schild weg"), value = 'schild5'})
			table.insert(elements, {label = ("Hut&Sonnenbrille an/aus"), value = 'hutandsunglassesyoyeah'})

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_interaction', {
				title    = _U('vehicle_interaction'),
				align    = 'top-left',
				elements = elements
			}, function(data2, menu2)
				local coords  = GetEntityCoords(playerPed)
				vehicle = ESX.Game.GetVehicleInDirection()
				action  = data2.current.value

				if action == 'schild1' then
				PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

				ExecuteCommand("sc223xxhild 1")
				ESX.UI.Menu.CloseAll()
				elseif action == 'schild2' then
				PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

				ExecuteCommand("sc223xxhild 2")
				elseif action == 'schild4' then
				PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

				ExecuteCommand("sc223xxhild 3")
				ESX.UI.Menu.CloseAll()
				elseif action == 'schild4' then
				PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

				ExecuteCommand("sc223xxhild 4")
				ESX.UI.Menu.CloseAll()
				elseif action == 'schild5' then
				PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

				ExecuteCommand("sc223xxhild")
				ESX.UI.Menu.CloseAll()
				elseif action == 'hutandsunglassesyoyeah' then
				ExecuteCommand("gibmirmeinkrassenhutwiederallersonstdrehichfreietzala")
				--[[
				if action == 'search_database' then
					if IsPedSittingInAnyVehicle(playerPed) then
					LookupVehicle()
					else
					ESX.ShowNotification(("Du musst Dich in deinem Dienstwagen befinden."))
					end
				if DoesEntityExist(vehicle) then
					if action == 'vehicle_infos' then
						local vehicleData = ESX.Game.GetVehicleProperties(vehicle)
						OpenVehicleInfosMenu(vehicleData)
					elseif action == 'hijack_vehicle' then
						if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.0) then
							TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
							Citizen.Wait(20000)
							ClearPedTasksImmediately(playerPed)

							SetVehicleDoorsLocked(vehicle, 1)
							SetVehicleDoorsLockedForAllPlayers(vehicle, false)
							ESX.ShowNotification(_U('vehicle_unlocked'))
						end
					elseif action == 'impound' then
						-- is the script busy?
						if currentTask.busy then
							return
						end

						ESX.ShowHelpNotification(_U('impound_prompt'))
						TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)

						currentTask.busy = true
						currentTask.task = ESX.SetTimeout(10000, function()
							ClearPedTasks(playerPed)
							ImpoundVehicle(vehicle)
							Citizen.Wait(100) -- sleep the entire script to let stuff sink back to reality
						end)

						-- keep track of that vehicle!
						Citizen.CreateThread(function()
							while currentTask.busy do
								Citizen.Wait(1000)

								vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.0, 0, 71)
								if not DoesEntityExist(vehicle) and currentTask.busy then
									ESX.ShowNotification(_U('impound_canceled_moved'))
									ESX.ClearTimeout(currentTask.task)
									ClearPedTasks(playerPed)
									currentTask.busy = false
									break
								end
							end
						end)
					end
				else
					ESX.ShowNotification(_U('no_vehicles_nearby'))
				end
				]]--
				end
			end, function(data2, menu2)
				menu2.close()
			end)
			
		elseif data.current.value == 'vehicle_interaction' then
			local elements  = {}
			local playerPed = PlayerPedId()
			local vehicle = ESX.Game.GetVehicleInDirection()

			if DoesEntityExist(vehicle) then
				--table.insert(elements, {label = _U('vehicle_info'), value = 'vehicle_infos'})
				table.insert(elements, {label = _U('pick_lock'), value = 'hijack_vehicle'})
				table.insert(elements, {label = _U('impound'), value = 'impound'})
			end

			--table.insert(elements, {label = _U('search_database'), value = 'search_database'})
			table.insert(elements, {label = ('Kennzeichen abfragen'), value = 'kennzeichend'})
			table.insert(elements, {label = ('Fahrzeug Extras'), value = 'kennzei2chend'})
			table.insert(elements, {label = ('Ein Fahrzeug muss in der nähe sein.'), value = 'search_database22'})

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_interaction', {
				title    = _U('vehicle_interaction'),
				align    = 'top-left',
				elements = elements
			}, function(data2, menu2)
				local coords  = GetEntityCoords(playerPed)
				vehicle = ESX.Game.GetVehicleInDirection()
				action  = data2.current.value

				if action == 'search_database' then
				PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

					LookupVehicle()
				elseif action == 'kennzei2chend' then
				OpenVehicleExtrasMenu()
				elseif action == 'kennzeichend' then
					PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

					autokennzeichen()	
				elseif DoesEntityExist(vehicle) then
					if action == 'vehicle_infos' then
					PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

						local vehicleData = ESX.Game.GetVehicleProperties(vehicle)
						OpenVehicleInfosMenu(vehicleData)
					elseif action == 'hijack_vehicle' then
					PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

						if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.0) then
							TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
							Citizen.Wait(20000)
							ClearPedTasksImmediately(playerPed)

							SetVehicleDoorsLocked(vehicle, 1)
							SetVehicleDoorsLockedForAllPlayers(vehicle, false)
							ESX.ShowNotification(_U('vehicle_unlocked'))
						end
					
					
					elseif action == 'impound' then
					PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")

						-- is the script busy?
						if currentTask.busy then
							return
						end

						ESX.ShowHelpNotification(_U('impound_prompt'))
						TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)

						currentTask.busy = true
						currentTask.task = ESX.SetTimeout(10000, function()
							ClearPedTasks(playerPed)
							ImpoundVehicle(vehicle)
							Citizen.Wait(100) -- sleep the entire script to let stuff sink back to reality
						end)

						-- keep track of that vehicle!
						Citizen.CreateThread(function()
							while currentTask.busy do
								Citizen.Wait(1000)

								vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.0, 0, 71)
								if not DoesEntityExist(vehicle) and currentTask.busy then
									ESX.ShowNotification(_U('impound_canceled_moved'))
									ESX.ClearTimeout(currentTask.task)
									ClearPedTasks(playerPed)
									currentTask.busy = false
									break
								end
							end
						end)
					end
				else
					ESX.ShowNotification(_U('no_vehicles_nearby'))
				end

			end, function(data2, menu2)
				menu2.close()
			end)	
			
			--unten
		elseif data.current.value == 'object_spawner' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
				title    = _U('traffic_interaction'),
				align    = 'top-left',
				elements = {
				{label = _U('cone'), model = 'prop_mp_cone_04'},
				{label = _U('barrier'), model = 'prop_mp_barrier_02b'},
				{label = _U('Baustrahler3'), model = 'prop_worklight_03b'},
				{label = _U('Baustrahler2'), model = 'prop_worklight_01a'},
				{label = _U('Baustrahler1'), model = 'prop_worklight_04d'},
				{label = _U('Beton'), model = 'prop_barier_conc_01a'},
				{label = _U('Laptop'), model = 'prop_laptop_lester2'},
				{label = _U('Umleitung1'), model = 'prop_sign_road_06r'},
				{label = _U('Umleitung2'), model = 'prop_sign_road_06q'}
			}}, function(data2, menu2)
				local playerPed = PlayerPedId()
				local coords    = GetEntityCoords(playerPed)
				local forward   = GetEntityForwardVector(playerPed)
				local x, y, z   = table.unpack(coords + forward * 1.0)

				if data2.current.model == 'prop_roadcone02a' then
					z = z - 2.0
				end

				ESX.Game.SpawnObject(data2.current.model, {x = x, y = y, z = z}, function(obj)
					SetEntityHeading(obj, GetEntityHeading(playerPed))
					PlaceObjectOnGroundProperly(obj)
				end)
			end, function(data2, menu2)
				menu2.close()
			end)
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenIdentityCardMenu(player)
	ESX.TriggerServerCallback('grp_PolizeiJob:getOtherPlayerData', function(data)
		local elements = {}
		local nameLabel = _U('name', data.name)
		local sexLabel, dobLabel, heightLabel, idLabel


		if Config.EnableESXIdentity then
			nameLabel = _U('name', data.firstname .. ' ' .. data.lastname)

			if data.sex then
				if string.lower(data.sex) == 'm' then
					sexLabel = _U('sex', _U('male'))
				else
					sexLabel = _U('sex', _U('female'))
				end
			else
				sexLabel = _U('sex', _U('unknown'))
			end

			if data.dob then
				dobLabel = _U('dob', data.dob)
			else
				dobLabel = _U('dob', _U('unknown'))
			end

			if data.height then
				heightLabel = _U('height', data.height)
			else
				heightLabel = _U('height', _U('unknown'))
			end

			if data.name then
				idLabel = _U('id', data.name)
			else
				idLabel = _U('id', _U('unknown'))
			end
		end

		local elements = {
			{label = nameLabel}
		}

		if Config.EnableESXIdentity then
			table.insert(elements, {label = sexLabel})
			table.insert(elements, {label = dobLabel})
			table.insert(elements, {label = heightLabel})
			table.insert(elements, {label = idLabel})
		end




		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
			title    = ("Person durchsuchen"),
			align    = 'top-left',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end


function OpenBodySearchMenu(player)
if IsPlayerDead(player) then
  ESX.ShowNotification("Du kannst keine Leiche durchsuchen")
  return
end
	ESX.TriggerServerCallback('grp_PolizeiJob:getOtherPlayerData', function(data)
		local elements = {}

		for i=1, #data.accounts, 1 do
			if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then
				table.insert(elements, {
					label    = _U('confiscate_dirty', ESX.Math.Round(data.accounts[i].money)),
					value    = 'black_money',
					itemType = 'item_account',
					amount   = data.accounts[i].money
				})

				break
			end
		end  

		table.insert(elements, {label = _U('guns_label')})

		for i=1, #data.weapons, 1 do
			table.insert(elements, {
				label    = _U('confiscate_weapon', ESX.GetWeaponLabel(data.weapons[i].name), data.weapons[i].ammo),
				value    = data.weapons[i].name,
				itemType = 'item_weapon',
				amount   = data.weapons[i].ammo
			})
		end

		table.insert(elements, {label = _U('inventory_label')})

		for i=1, #data.inventory, 1 do
			if data.inventory[i].count > 0 then
				table.insert(elements, {
					label    = _U('confiscate_inv', data.inventory[i].count, data.inventory[i].label),
					value    = data.inventory[i].name,
					itemType = 'item_standard',
					amount   = data.inventory[i].count
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search', {
			title    = _U('search'),
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			if data.current.value then
				TriggerServerEvent('grp_PolizeiJob:confiscatePlayerItem', GetPlayerServerId(player), data.current.itemType, data.current.value, data.current.amount)
				OpenBodySearchMenu(player)
			end
		end, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end

function OpenFineMenu(player)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fine', {
		title    = _U('fine'),
		align    = 'top-left',
		elements = {
			{label = _U('traffic_offense'), value = 0},
			{label = _U('minor_offense'),   value = 1},
			{label = _U('average_offense'), value = 2},
			{label = _U('major_offense'),   value = 3}
	}}, function(data, menu)
		OpenFineCategoryMenu(player, data.current.value)
	end, function(data, menu)
		menu.close()
	end)
end

--Custom Rechnung ausstellen 
function OpenCustomRechnungMenu(player)

	ESX.UI.Menu.Open(
		'dialog', GetCurrentResourceName(), 'customrechnung',
		{
		  title = "Grund"
		},
	function(data, menu)

	  local reason = tostring(data.value)

	  if reason == nil then
			ESX.ShowNotification("Du musst einen Grund eingeben")
	  else
		menu.close()

		ESX.UI.Menu.Open(
				'dialog', GetCurrentResourceName(), 'customrechnung2',
				{
				title = "Betrag"
				},
			function(data2, menu2)

				local price = tonumber(data2.value)

				if price == nil then
					ESX.ShowNotification("Du musst einen Betrag eingeben")
				else
					menu2.close()

					TriggerServerEvent('esx_bidewenspantossindnice1337lling:sendBill', GetPlayerServerId(player), 'society_police', reason, price)
				end

			end, function(data2, menu2)
				menu2.close()
			end)
	  end

	end, function(data2, menu2)
	  menu2.close()
  end)

end



function OpenFineCategoryMenu(player, category)
	ESX.TriggerServerCallback('grp_PolizeiJob:getFineList', function(fines)
		local elements = {}

		for k,fine in ipairs(fines) do
			table.insert(elements, {
				label     = ('%s <span style="color:green;">%s</span>'):format(fine.label, _U('armory_item', ESX.Math.GroupDigits(fine.amount))),
				value     = fine.id,
				amount    = fine.amount,
				fineLabel = fine.label
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fine_category', {
			title    = _U('fine'),
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			menu.close()

			if Config.EnablePlayerManagement then
				TriggerServerEvent('esx_bidewenspantossindnice1337lling:sendBill', GetPlayerServerId(player), 'society_police', _U('fine_total', data.current.fineLabel), data.current.amount)
			else
				TriggerServerEvent('esx_bidewenspantossindnice1337lling:sendBill', GetPlayerServerId(player), '', _U('fine_total', data.current.fineLabel), data.current.amount)
			end

			ESX.SetTimeout(300, function()
				OpenFineCategoryMenu(player, category)
			end)
		end, function(data, menu)
			menu.close()
		end)
	end, category)
end

function LookupVehicle()
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'lookup_vehicle',
	{
		title = _U('search_database_title'),
	}, function(data, menu)
		local length = string.len(data.value)
		if data.value == nil or length < 2 or length > 13 then
			ESX.ShowNotification(_U('search_database_error_invalid'))
		else
			exports['mythic_notify']:DoHudText('inform', 'Der Halter des Kennzeichens wird dir in 30 Sekunden übermittelt.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
			menu.close()
			Citizen.Wait(30000)
			ESX.TriggerServerCallback('grp_PolizeiJob:getVehicleFromPlate', function(owner, found)
				if found then
					ESX.ShowNotification(_U('search_database_found', owner))
				else
					ESX.ShowNotification(_U('search_database_error_not_found'))
				end
			end, data.value)
			menu.close()
		end
	end, function(data, menu)
		menu.close()
	end)
end

function ShowPlayerLicense(player)
	local elements, targetName = {}

	ESX.TriggerServerCallback('grp_PolizeiJob:getOtherPlayerData', function(data)
		if data.licenses then
			for i=1, #data.licenses, 1 do
				if data.licenses[i].label and data.licenses[i].type then
					table.insert(elements, {
						label = data.licenses[i].label,
						type = data.licenses[i].type
					})
				end
			end
		end

		if Config.EnableESXIdentity then
			targetName = data.firstname .. ' ' .. data.lastname
		else
			targetName = data.name
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_license', {
			title    = _U('license_revoke'),
			align    = 'top-left',
			elements = elements,
		}, function(data, menu)
			ESX.ShowNotification(_U('licence_you_revoked', data.current.label, targetName))
			TriggerServerEvent('grp_PolizeiJob:message', GetPlayerServerId(player), _U('license_revoked', data.current.label))

			TriggerServerEvent('esx_license:removeLicense', GetPlayerServerId(player), data.current.type)

			ESX.SetTimeout(300, function()
				ShowPlayerLicense(player)
			end)
		end, function(data, menu)
			menu.close()
		end)

	end, GetPlayerServerId(player))
end

function OpenUnpaidBillsMenu(player)
	local elements = {}

	ESX.TriggerServerCallback('esx_billing:getTargetBills', function(bills)
		for k,bill in ipairs(bills) do
			table.insert(elements, {
				label = ('%s - <span style="color:red;">%s</span>'):format(bill.label, _U('armory_item', ESX.Math.GroupDigits(bill.amount))),
				billId = bill.id
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'billing', {
			title    = _U('unpaid_bills'),
			align    = 'top-left',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end

function OpenVehicleInfosMenu(vehicleData)
	ESX.TriggerServerCallback('grp_PolizeiJob:getVehicleInfos', function(retrivedInfo)
		local elements = {{label = _U('plate', retrivedInfo.plate)}}

		if retrivedInfo.owner == nil then
			table.insert(elements, {label = _U('owner_unknown')})
		else
			table.insert(elements, {label = _U('owner', retrivedInfo.owner)})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_infos', {
			title    = _U('vehicle_info'),
			align    = 'top-left',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)
	end, vehicleData.plate)
end

function OpenGetWeaponMenu()
	ESX.TriggerServerCallback('grp_PolizeiJob:getArmoryWeapons', function(weapons)
		local elements = {}

		for i=1, #weapons, 1 do
			if weapons[i].count > 0 then
				table.insert(elements, {
					label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name),
					value = weapons[i].name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_get_weapon', {
			title    = _U('get_weapon_menu'),
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			menu.close()

			ESX.TriggerServerCallback('grp_PolizeiJob:removeArmoryWeapon', function()
				OpenGetWeaponMenu()
			end, data.current.value)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenPutWeaponMenu()
	local elements   = {}
	local playerPed  = PlayerPedId()
	local weaponList = ESX.GetWeaponList()

	for i=1, #weaponList, 1 do
		local weaponHash = GetHashKey(weaponList[i].name)

		if HasPedGotWeapon(playerPed, weaponHash, false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
			table.insert(elements, {
				label = weaponList[i].label,
				value = weaponList[i].name
			})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_put_weapon', {
		title    = _U('put_weapon_menu'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		menu.close()

		ESX.TriggerServerCallback('grp_PolizeiJob:addArmoryWeapon', function()
			OpenPutWeaponMenu()
		end, data.current.value, true)
	end, function(data, menu)
		menu.close()
	end)
end

function OpenBuyWeaponsMenu()
	local elements = {}
	local playerPed = PlayerPedId()
	PlayerData = ESX.GetPlayerData()

	for k,v in ipairs(Config.AuthorizedWeapons[PlayerData.job.grade_name]) do
		local weaponNum, weapon = ESX.GetWeapon(v.weapon)
		local components, label = {}
		local hasWeapon = HasPedGotWeapon(playerPed, GetHashKey(v.weapon), false)

		if v.components then
			for i=1, #v.components do
				if v.components[i] then
					local component = weapon.components[i]
					local hasComponent = HasPedGotWeaponComponent(playerPed, GetHashKey(v.weapon), component.hash)

					if hasComponent then
						label = ('%s: <span style="color:green;">%s</span>'):format(component.label, _U('armory_owned'))
					else
						if v.components[i] > 0 then
							label = ('%s: <span style="color:green;">%s</span>'):format(component.label, _U('armory_item', ESX.Math.GroupDigits(v.components[i])))
						else
							label = ('%s: <span style="color:green;">%s</span>'):format(component.label, _U('armory_free'))
						end
					end

					table.insert(components, {
						label = label,
						componentLabel = component.label,
						hash = component.hash,
						name = component.name,
						price = v.components[i],
						hasComponent = hasComponent,
						componentNum = i
					})
				end
			end
		end

		
			if v.price > 0 then
				label = ('%s: <span style="color:green;">%s</span>'):format(weapon.label, _U('armory_item', ESX.Math.GroupDigits(v.price)))
			else
				label = ('%s: <span style="color:green;">%s</span>'):format(weapon.label, _U('armory_free'))
			end
		

		table.insert(elements, {
			label = label,
			weaponLabel = weapon.label,
			name = weapon.name,
			components = components,
			price = v.price,
			hasWeapon = hasWeapon
		})
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_buy_weapons', {
		title    = _U('armory_weapontitle'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.hasWeapon then
			if #data.current.components > 0 then
				OpenWeaponComponentShop(data.current.components, data.current.name, menu)
			end
		else
			ESX.TriggerServerCallback('grp_PolizeiJob:buyWeapon', function(bought)
				if bought then
					if data.current.price > 0 then
						ESX.ShowNotification(_U('armory_bought', data.current.weaponLabel, ESX.Math.GroupDigits(data.current.price)))
					end

					menu.close()
					OpenBuyWeaponsMenu()
				else
					ESX.ShowNotification(_U('armory_money'))
				end
			end, data.current.name, 1)
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenWeaponComponentShop(components, weaponName, parentShop)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_buy_weapons_components', {
		title    = _U('armory_componenttitle'),
		align    = 'top-left',
		elements = components
	}, function(data, menu)
		if data.current.hasComponent then
			ESX.ShowNotification(_U('armory_hascomponent'))
		else
			ESX.TriggerServerCallback('grp_PolizeiJob:buyWeapon', function(bought)
				if bought then
					if data.current.price > 0 then
						ESX.ShowNotification(_U('armory_bought', data.current.componentLabel, ESX.Math.GroupDigits(data.current.price)))
					end

					menu.close()
					parentShop.close()
					OpenBuyWeaponsMenu()
				else
					ESX.ShowNotification(_U('armory_money'))
				end
			end, weaponName, 2, data.current.componentNum)
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenPutStocksMenu()
	ESX.TriggerServerCallback('grp_PolizeiJob:getPlayerInventory', function(inventory)
		local elements = {}

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type = 'item_standard',
					value = item.name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = _U('inventory'),
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification(_U('quantity_invalid'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('grp_PolizeiJob:putStockItems', itemName, count)

					Citizen.Wait(300)
					OpenPutStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenGetStocksMenu()
	ESX.TriggerServerCallback('grp_PolizeiJob:getStockItems', function(items)
		local elements = {}

		for i=1, #items, 1 do
			table.insert(elements, {
				label = 'x' .. items[i].count .. ' ' .. items[i].label,
				value = items[i].name
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = _U('police_stock'),
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification(_U('quantity_invalid'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('grp_PolizeiJob:getStockItem', itemName, count)

					Citizen.Wait(300)
					OpenGetStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end


--function OpenItemKaufenMenu()
--	ESX.UI.Menu.CloseAll()
--
--	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pharmacy', {
--		title    = _U('shop'),
--		align    = 'top-left',
--		elements = {
--			{label = _U('item_shop', _U('fixkit')), value = 'fixkit'},
--			{label = _U('item_shop', _U('bandage')), value = 'bandage'},
--			{label = _U('item_shop', _U('medikit')), value = 'medikit'},
--			{label = _U('item_shop', _U('clip')), value = 'clip'},
--			{label = _U('item_shop', _U('lspdstandard')), value = 'lspdstandard'},
--			{label = _U('item_shop', _U('lspdweste1')), value = 'lspdweste1'},
--			{label = _U('item_shop', _U('lspdweste2')), value = 'lspdweste2'},
--			{label = _U('item_shop', _U('lspdweste3')), value = 'lspdweste3'}
--		}
--	}, function(data, menu)
--		TriggerServerEvent('grp_PolizeiJob:giveItem', data.current.value)
--	end, function(data, menu)
--		menu.close()
--	end)
--end



RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job

	Citizen.Wait(5000)
	--TriggerServerEvent('grp_PolizeiJob:forceBlip')
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = _U('phone_police'),
		number     = 'police',
		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDFGQTJDRkI0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDFGQTJDRkM0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0MUZBMkNGOTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0MUZBMkNGQTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoW66EYAAAjGSURBVHjapJcLcFTVGcd/u3cfSXaTLEk2j80TCI8ECI9ABCyoiBqhBVQqVG2ppVKBQqUVgUl5OU7HKqNOHUHU0oHamZZWoGkVS6cWAR2JPJuAQBPy2ISEvLN57+v2u2E33e4k6Ngz85+9d++95/zP9/h/39GpqsqiRYsIGz8QZAq28/8PRfC+4HT4fMXFxeiH+GC54NeCbYLLATLpYe/ECx4VnBTsF0wWhM6lXY8VbBE0Ch4IzLcpfDFD2P1TgrdC7nMCZLRxQ9AkiAkQCn77DcH3BC2COoFRkCSIG2JzLwqiQi0RSmCD4JXbmNKh0+kc/X19tLtc9Ll9sk9ZS1yoU71YIk3xsbEx8QaDEc2ttxmaJSKC1ggSKBK8MKwTFQVXRzs3WzpJGjmZgvxcMpMtWIwqsjztvSrlzjYul56jp+46qSmJmMwR+P3+4aZ8TtCprRkk0DvUW7JjmV6lsqoKW/pU1q9YQOE4Nxkx4ladE7zd8ivuVmJQfXZKW5dx5EwPRw4fxNx2g5SUVLw+33AkzoRaQDP9SkFu6OKqz0uF8yaz7vsOL6ycQVLkcSg/BlWNsjuFoKE1knqDSl5aNnmPLmThrE0UvXqQqvJPyMrMGorEHwQfEha57/3P7mXS684GFjy8kreLppPUuBXfyd/ibeoS2kb0mWPANhJdYjb61AxUvx5PdT3+4y+Tb3mTd19ZSebE+VTXVGNQlHAC7w4VhH8TbA36vKq6ilnzlvPSunHw6Trc7XpZ14AyfgYeyz18crGN1Alz6e3qwNNQSv4dZox1h/BW9+O7eIaEsVv41Y4XeHJDG83Nl4mLTwzGhJYtx0PzNTjOB9KMTlc7Nkcem39YAGU7cbeBKVLMPGMVf296nMd2VbBq1wmizHoqqm/wrS1/Zf0+N19YN2PIu1fcIda4Vk66Zx/rVi+jo9eIX9wZGGcFXUMR6BHUa76/2ezioYcXMtpyAl91DSaTfDxlJbtLprHm2ecpObqPuTPzSNV9yKz4a4zJSuLo71/j8Q17ON69EmXiPIlNMe6FoyzOqWPW/MU03Lw5EFcyKghTrNDh7+/vw545mcJcWbTiGKpRdGPMXbx90sGmDaux6sXk+kimjU+BjnMkx3kYP34cXrFuZ+3nrHi6iDMt92JITcPjk3R3naRwZhpuNSqoD93DKaFVU7j2dhcF8+YzNlpErbIBTVh8toVccbaysPB+4pMcuPw25kwSsau7BIlmHpy3guaOPtISYyi/UkaJM5Lpc5agq5Xkcl6gIHkmqaMn0dtylcjIyPThCNyhaXyfR2W0I1our0v6qBii07ih5rDtGSOxNVdk1y4R2SR8jR/g7hQD9l1jUeY/WLJB5m39AlZN4GZyIQ1fFJNsEgt0duBIc5GRkcZF53mNwIzhXPDgQPoZIkiMkbTxtstDMVnmFA4cOsbz2/aKjSQjev4Mp9ZAg+hIpFhB3EH5Yal16+X+Kq3dGfxkzRY+KauBjBzREvGN0kNCTARu94AejBLMHorAQ7cEQMGs2cXvkWshYLDi6e9l728O8P1XW6hKeB2yv42q18tjj+iFTGoSi+X9jJM9RTxS9E+OHT0krhNiZqlbqraoT7RAU5bBGrEknEBhgJks7KXbLS8qERI0ErVqF/Y4K6NHZfLZB+/wzJvncacvFd91oXO3o/O40MfZKJOKu/rne+mRQByXM4lYreb1tUnkizVVA/0SpfpbWaCNBeEE5gb/UH19NLqEgDF+oNDQWcn41Cj0EXFEWqzkOIyYekslFkThsvMxpIyE2hIc6lXGZ6cPyK7Nnk5OipixRdxgUESAYmhq68VsGgy5CYKCUAJTg0+izApXne3CJFmUTwg4L3FProFxU+6krqmXu3MskkhSD2av41jLdzlnfFrSdCZxyqfMnppN6ZUa7pwt0h3fiK9DCt4IO9e7YqisvI7VYgmNv7mhBKKD/9psNi5dOMv5ZjukjsLdr0ffWsyTi6eSlfcA+dmiVyOXs+/sHNZu3M6PdxzgVO9GmDSHsSNqmTz/R6y6Xxqma4fwaS5Mn85n1ZE0Vl3CHBER3lUNEhiURpPJRFdTOcVnpUJnPIhR7cZXfoH5UYc5+E4RzRH3sfSnl9m2dSMjE+Tz9msse+o5dr7UwcQ5T3HwlWUkNuzG3dKFSTbsNs7m/Y8vExOlC29UWkMJlAxKoRQMR3IC7x85zOn6fHS50+U/2Untx2R1voinu5no+DQmz7yPXmMKZnsu0wrm0Oe3YhOVHdm8A09dBQYhTv4T7C+xUPrZh8Qn2MMr4qcDSRfoirWgKAvtgOpv1JI8Zi77X15G7L+fxeOUOiUFxZiULD5fSlNzNM62W+k1yq5gjajGX/ZHvOIyxd+Fkj+P092rWP/si0Qr7VisMaEWuCiYonXFwbAUTWWPYLV245NITnGkUXnpI9butLJn2y6iba+hlp7C09qBcvoN7FYL9mhxo1/y/LoEXK8Pv6qIC8WbBY/xr9YlPLf9dZT+OqKTUwfmDBm/GOw7ws4FWpuUP2gJEZvKqmocuXPZuWYJMzKuSsH+SNwh3bo0p6hao6HeEqwYEZ2M6aKWd3PwTCy7du/D0F1DsmzE6/WGLr5LsDF4LggnYBacCOboQLHQ3FFfR58SR+HCR1iQH8ukhA5s5o5AYZMwUqOp74nl8xvRHDlRTsnxYpJsUjtsceHt2C8Fm0MPJrphTkZvBc4It9RKLOFx91Pf0Igu0k7W2MmkOewS2QYJUJVWVz9VNbXUVVwkyuAmKTFJayrDo/4Jwe/CT0aGYTrWVYEeUfsgXssMRcpyenraQJa0VX9O3ZU+Ma1fax4xGxUsUVFkOUbcama1hf+7+LmA9juHWshwmwOE1iMmCFYEzg1jtIm1BaxW6wCGGoFdewPfvyE4ertTiv4rHC73B855dwp2a23bbd4tC1hvhOCbX7b4VyUQKhxrtSOaYKngasizvwi0RmOS4O1QZf2yYfiaR+73AvhTQEVf+rpn9/8IMAChKDrDzfsdIQAAAABJRU5ErkJggg=='
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

-- don't show dispatches if the player isn't in service
AddEventHandler('esx_phone:cancelMessage', function(dispatchNumber)
	if PlayerData.job and PlayerData.job.name == 'police' and PlayerData.job.name == dispatchNumber then
		-- if esx_service is enabled
		if Config.MaxInService ~= -1 and not playerInService then
			CancelEvent()
		end
	end
end)

AddEventHandler('grp_PolizeiJob:hasEnteredMarker', function(station, part, partNum)
	if part == 'Cloakroom' then
		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	elseif part == 'Armory' then
		CurrentAction     = 'menu_armory'
		CurrentActionMsg  = _U('open_armory')
		CurrentActionData = {station = station}
	elseif part == 'Vehicles' then
		CurrentAction     = 'menu_vehicle_spawner'
		CurrentActionMsg  = _U('garage_prompt')
		CurrentActionData = {station = station, part = part, partNum = partNum}
	elseif part == 'Helicopters' then
		CurrentAction     = 'Helicopters'
		CurrentActionMsg  = _U('helicopter_prompt')
		CurrentActionData = {station = station, part = part, partNum = partNum}
	elseif part == 'BossActions' then
		CurrentAction     = 'menu_boss_actions'
		CurrentActionMsg  = _U('open_bossmenu')
		CurrentActionData = {}
	end
end)

AddEventHandler('grp_PolizeiJob:hasExitedMarker', function(station, part, partNum)
	if not isInShopMenu then
		ESX.UI.Menu.CloseAll()
	end

	CurrentAction = nil
end)

AddEventHandler('grp_PolizeiJob:hasEnteredEntityZone', function(entity)
	local playerPed = PlayerPedId()

	if PlayerData.job and PlayerData.job.name == 'police' and IsPedOnFoot(playerPed) then
		CurrentAction     = 'remove_entity'
		CurrentActionMsg  = _U('remove_prop')
		CurrentActionData = {entity = entity}
	end
end)

AddEventHandler('grp_PolizeiJob:hasExitedEntityZone', function(entity)
	if CurrentAction == 'remove_entity' then
		CurrentAction = nil
	end
end)


--Entfesseln
RegisterNetEvent('grp_PolizeiJob:entfesseln')
AddEventHandler('grp_PolizeiJob:entfesseln',function()
	if isHandcuffed then
	local playerPed = GetPlayerPed(-1)
    IsHandcuffed = false
    ClearPedSecondaryTask(playerPed)
    SetEnableHandcuffs(playerPed, false)
    DisablePlayerFiring(playerPed, false)
    SetPedCanPlayGestureAnims(playerPed, true)
    FreezeEntityPosition(playerPed, false)
	DisplayRadar(true)
	end
end)

RegisterNetEvent('grp_PolizeiJob:unrestrain')
AddEventHandler('grp_PolizeiJob:unrestrain', function()
	if isHandcuffed then
		local playerPed = PlayerPedId()
		isHandcuffed = false

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)

		-- end timer
		if Config.EnableHandcuffTimer and handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end
	end
end)

--Durchsuchen Animation
RegisterNetEvent('grp_PolizeiJob:durchsuchenanimation')
AddEventHandler('grp_PolizeiJob:durchsuchenanimation', function()
	durchsucht = not durchsucht
    local playerPed = GetPlayerPed(-1)
    exports['grv_progress']:startUI(6000)
	TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_PARKING_METER', 0, true)
	Citizen.Wait(6000)
	ClearPedTasksImmediately(playerPed)
	durchsucht = false
end)


RegisterNetEvent('grp_PolizeiJob:drag')
AddEventHandler('grp_PolizeiJob:drag', function(copId)
	if not isHandcuffed then
		return
	end

	dragStatus.isDragged = not dragStatus.isDragged
	dragStatus.CopId = copId
end)

--Kleidung Jail
RegisterNetEvent('grp_PolizeiJob:kleidungjail')
AddEventHandler('grp_PolizeiJob:kleidungjail', function(source)
	local playerPed = GetPlayerPed(-1)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then 
		local clothesSkin = {
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1'] = 5, ['torso_2'] = 0,
			['arms'] = 5,
			['pants_1'] = 5, ['pants_2'] = 7,
			['shoes_1'] = 8, ['shoes_2'] = 0,
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		end
		if skin.sex == 1 then 
		local clothesSkin = {
			['tshirt_1'] = 14, ['tshirt_2'] = 0,
			['torso_1'] = 74, ['torso_2'] = 0,
			['arms'] = 15,
			['pants_1'] = 107, ['pants_2'] = 2,
			['shoes_1'] = 16, ['shoes_2'] = 0,
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		end
	end)
end)

--Citizen.CreateThread(function()
--	local playerPed
--	local targetPed
--
--	while true do
--		Citizen.Wait(1)
--
--		if isHandcuffed then
--			playerPed = PlayerPedId()
--
--			if dragStatus.isDragged then
--				targetPed = GetPlayerPed(GetPlayerFromServerId(dragStatus.CopId))
--
--				-- undrag if target is in an vehicle
--				if not IsPedSittingInAnyVehicle(targetPed) then
--					AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
--				else
--					dragStatus.isDragged = false
--					DetachEntity(playerPed, true, false)
--				end
--
--				if IsPedDeadOrDying(targetPed, true) then
--					dragStatus.isDragged = false
--					DetachEntity(playerPed, true, false)
--				end
--
--			else
--				DetachEntity(playerPed, true, false)
--			end
--		else
--			Citizen.Wait(500)
--		end
--	end
--end)


RegisterNetEvent('grp_PolizeiJob:putInVehicle')
AddEventHandler('grp_PolizeiJob:putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords, 5.0) then
		local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)

		if DoesEntityExist(vehicle) then
			local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

			for i=maxSeats - 1, 0, -1 do
				if IsVehicleSeatFree(vehicle, i) then
					freeSeat = i
					break
				end
			end

			if freeSeat then
				TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
				dragStatus.isDragged = false
			end
		end
	end
end)

RegisterNetEvent('grp_PolizeiJob:OutVehicle')
AddEventHandler('grp_PolizeiJob:OutVehicle', function()
	local playerPed = PlayerPedId()

	if not IsPedSittingInAnyVehicle(playerPed) then
		return
	end

	local vehicle = GetVehiclePedIsIn(playerPed, false)
	TaskLeaveVehicle(playerPed, vehicle, 16)
end)

-- Handcuff
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()

		if isHandcuffed then
			DisableControlAction(0, 1, true) -- Disable pan
			DisableControlAction(0, 2, true) -- Disable tilt
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
			DisableControlAction(0, 32, true) -- W
			DisableControlAction(0, 34, true) -- A
			DisableControlAction(0, 31, true) -- S
			DisableControlAction(0, 30, true) -- D

			DisableControlAction(0, 45, true) -- Reload
			DisableControlAction(0, 22, true) -- Jump
			DisableControlAction(0, 44, true) -- Cover
			DisableControlAction(0, 37, true) -- Select Weapon
			DisableControlAction(0, 23, true) -- Also 'enter'?

			DisableControlAction(0, 288,  true) -- Disable phone
			DisableControlAction(0, 289, true) -- Inventory
			DisableControlAction(0, 170, true) -- Animations
			DisableControlAction(0, 167, true) -- Job

			DisableControlAction(0, 0, true) -- Disable changing view
			DisableControlAction(0, 26, true) -- Disable looking behind
			DisableControlAction(0, 73, true) -- Disable clearing animation
			DisableControlAction(2, 199, true) -- Disable pause screen

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
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle

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


--Keys blockieren beim Durhsuchen
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = GetPlayerPed(-1)
        if durchsucht then
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 74, true)
			DisableControlAction(0, 2, true) 
			DisableControlAction(0, 263, true) 
			DisableControlAction(0, 45, true) 
			DisableControlAction(0, 22, true) 
			DisableControlAction(0, 44, true) 
			DisableControlAction(0, 37, true) 
			DisableControlAction(0, 288,  true) 
			DisableControlAction(0, 289, true) 
			DisableControlAction(0, 170, true) 
			DisableControlAction(0, 167, true) 
            DisableControlAction(1, 254, true)
            DisableControlAction(0, 47, true)  
        end
    end
end)





-- Display markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if PlayerData.job and PlayerData.job.name == 'police' then

			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)
			local isInMarker, hasExited, letSleep = false, false, true
			local currentStation, currentPart, currentPartNum

			for k,v in pairs(Config.PoliceStations) do

				for i=1, #v.Cloakrooms, 1 do
					local distance = GetDistanceBetweenCoords(coords, v.Cloakrooms[i], true)
					--[[
					if distance < Config.DrawDistance then
						--DrawMarker(20, v.Cloakrooms[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false
					end
					]]--
					if distance < Config.MarkerSize.x then
						isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Cloakroom', i
					end
				end

				for i=1, #v.Armories, 1 do
					local distance = GetDistanceBetweenCoords(coords, v.Armories[i], true)
					--[[
					if distance < Config.DrawDistance then
						DrawMarker(21, v.Armories[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false
					end
					]]--
					if distance < Config.MarkerSize.x then
						isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Armory', i
					end
				end

				
				for i=1, #v.Vehicles, 1 do
					local distance = GetDistanceBetweenCoords(coords, v.Vehicles[i].Spawner, true)
					--[[
					if distance < Config.DrawDistance then
						--DrawMarker(36, v.Vehicles[i].Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false
					end
					]]--
					if distance < Config.MarkerSize.x then
						isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Vehicles', i
					end
				end
				
				for i=1, #v.Helicopters, 1 do
					local distance =  GetDistanceBetweenCoords(coords, v.Helicopters[i].Spawner, true)
					--[[
					if distance < Config.DrawDistance then
						DrawMarker(34, v.Helicopters[i].Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false
					end
					]]--
					if distance < Config.MarkerSize.x then
						isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Helicopters', i
					end
				end

				if Config.EnablePlayerManagement and PlayerData.job.grade_name == 'boss' then
					for i=1, #v.BossActions, 1 do
						local distance = GetDistanceBetweenCoords(coords, v.BossActions[i], true)
						--[[
						if distance < Config.DrawDistance then
							DrawMarker(22, v.BossActions[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
							letSleep = false
						end
						]]--
						if distance < Config.MarkerSize.x then
							isInMarker, currentStation, currentPart, currentPartNum = true, k, 'BossActions', i
						end
					end
				end
			end

			if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then
				if
					(LastStation and LastPart and LastPartNum) and
					(LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
				then
					TriggerEvent('grp_PolizeiJob:hasExitedMarker', LastStation, LastPart, LastPartNum)
					hasExited = true
				end

				HasAlreadyEnteredMarker = true
				LastStation             = currentStation
				LastPart                = currentPart
				LastPartNum             = currentPartNum

				TriggerEvent('grp_PolizeiJob:hasEnteredMarker', currentStation, currentPart, currentPartNum)
			end

			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('grp_PolizeiJob:hasExitedMarker', LastStation, LastPart, LastPartNum)
			end

			if letSleep then
				Citizen.Wait(500)
			end

		else
			Citizen.Wait(500)
		end
	end
end)



Citizen.CreateThread(function()
	local trackedEntities = {
		'prop_mp_cone_04',
		'prop_mp_barrier_02b',
		'prop_worklight_03b',
		'prop_worklight_01a',
		'prop_worklight_04d',
		'prop_barier_conc_01a',
		'prop_laptop_lester2',
		'prop_sign_road_06r',
		'prop_sign_road_06q'
	}
--hier
	while true do
		Citizen.Wait(500)

		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(playerPed)

		local closestDistance = -1
		local closestEntity   = nil

		for i=1, #trackedEntities, 1 do
			local object = GetClosestObjectOfType(playerCoords, 3.0, GetHashKey(trackedEntities[i]), false, false, false)

			if DoesEntityExist(object) then
				local objCoords = GetEntityCoords(object)
				local distance = #(playerCoords - objCoords)

				if closestDistance == -1 or closestDistance > distance then
					closestDistance = distance
					closestEntity   = object
				end
			end
		end

		if closestDistance ~= -1 and closestDistance <= 3.0 then
			if LastEntity ~= closestEntity then
				TriggerEvent('grp_PolizeiJob:hasEnteredEntityZone', closestEntity)
				LastEntity = closestEntity
			end
		else
			if LastEntity then
				TriggerEvent('grp_PolizeiJob:hasExitedEntityZone', LastEntity)
				LastEntity = nil
			end
		end
	end
end)


-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if CurrentAction then
			--ESX.ShowHelpNotification(CurrentActionMsg)
			
			if IsControlJustReleased(0, 38) and PlayerData.job and PlayerData.job.name == 'police' then
				--[[
				if CurrentAction == 'menu_cloakroom' then
					OpenCloakroomMenu()
				elseif CurrentAction == 'menu_armory' then
					if Config.MaxInService == -1 then
						OpenArmoryMenu(CurrentActionData.station)
					elseif playerInService then
						OpenArmoryMenu(CurrentActionData.station)
					else
						ESX.ShowNotification(_U('service_not'))
					end
				elseif CurrentAction == 'menu_vehicle_spawner' then
					if Config.MaxInService == -1 then
						OpenVehicleSpawnerMenu('car', CurrentActionData.station, CurrentActionData.part, CurrentActionData.partNum)
					elseif playerInService then
						OpenVehicleSpawnerMenu('car', CurrentActionData.station, CurrentActionData.part, CurrentActionData.partNum)
					else
						ESX.ShowNotification(_U('service_not'))
					end
				elseif CurrentAction == 'Helicopters' then
					if Config.MaxInService == -1 then
						OpenVehicleSpawnerMenu('helicopter', CurrentActionData.station, CurrentActionData.part, CurrentActionData.partNum)
					elseif playerInService then
						OpenVehicleSpawnerMenu('helicopter', CurrentActionData.station, CurrentActionData.part, CurrentActionData.partNum)
					else
						ESX.ShowNotification(_U('service_not'))
					end
				elseif CurrentAction == 'delete_vehicle' then
					ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
				elseif CurrentAction == 'menu_boss_actions' then
					ESX.UI.Menu.CloseAll()
					TriggerEvent('esx_society:openBosdewenspantossindnice1337sMenu', 'police', function(data, menu)
						menu.close()

						CurrentAction     = 'menu_boss_actions'
						CurrentActionMsg  = _U('open_bossmenu')
						CurrentActionData = {}
					end, { wash = false }) -- disable washing money
					]]
				if CurrentAction == 'remove_entity' then
					DeleteEntity(CurrentActionData.entity)
				end

				CurrentAction = nil
			end
		end -- CurrentAction end
		
		if IsControlJustReleased(0, 167) and not isDead and PlayerData.job and PlayerData.job.name == 'police' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'police_actions') then
			if Config.MaxInService == -1 then
				OpenpoliceActionsMenu()
			elseif playerInService then
				OpenpoliceActionsMenu()
			else
				ESX.ShowNotification(_U('service_not'))
			end
		end
		
		--autos einparken
		if PlayerData.job and PlayerData.job.name == 'police' then
		DrawMarker(1, 456.15991210938,-1024.4786376953,27.448295593262, 0, 0, 0, 0, 0, 0, 3.0, 3.0, 2.0, 0.0, 155, 255, 155, 0, 0, 2, 1, 0, 0, 0)       		
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 456.15991210938,-1024.4786376953,28.448295593262, true) < 3 then
        local playerPed = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(playerPed)
		if (IsControlJustPressed(1, 38)) then
			ESX.Game.DeleteVehicle(vehicle)
		end	
		end
		end


		if IsControlJustReleased(0, 38) and currentTask.busy then
			ESX.ShowNotification(_U('impound_canceled'))
			ESX.ClearTimeout(currentTask.task)
			ClearPedTasks(PlayerPedId())

			currentTask.busy = false
		end
	end
end)




AddEventHandler('playerSpawned', function(spawn)
	isDead = false
	TriggerEvent('grp_PolizeiJob:unrestrain')

	if not hasAlreadyJoined then
		TriggerServerEvent('grp_PolizeiJob:spawned')
	end
	hasAlreadyJoined = true
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('grp_PolizeiJob:unrestrain')
		TriggerEvent('esx_phone:removeSpecialContact', 'police')

		if Config.MaxInService ~= -1 then
			TriggerServerEvent('esx_service:disableService', 'police')
		end

		if Config.EnableHandcuffTimer and handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end
	end
end)

-- handcuff timer, unrestrain the player after an certain amount of time
function StartHandcuffTimer()
	if Config.EnableHandcuffTimer and handcuffTimer.active then
		ESX.ClearTimeout(handcuffTimer.task)
	end

	handcuffTimer.active = true

	handcuffTimer.task = ESX.SetTimeout(Config.HandcuffTimer, function()
		ESX.ShowNotification(_U('unrestrained_timer'))
		TriggerEvent('grp_PolizeiJob:unrestrain')
		handcuffTimer.active = false
	end)
end

-- TODO
--   - return to garage if owned
--   - message owner that his vehicle has been impounded
function ImpoundVehicle(vehicle)
	--local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
	ESX.Game.DeleteVehicle(vehicle)
	ESX.ShowNotification(_U('impound_successful'))
	currentTask.busy = false
end

--Edit to open by F3 Menu

RegisterCommand("id", function(source, args, rawCommand)
    local playerPed = GetPlayerPed(-1)
    ESX.ShowNotification("Deine ID: " ..GetPlayerServerId(PlayerId()).. " ")
end)

RegisterCommand("ids", function(source, args, rawCommand)
    local playerPed = GetPlayerPed(-1)
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    if closestPlayer ~= -1 and closestDistance <= 3.0 then
    ESX.ShowNotification("Spieler ID in deiner Nähe: " ..GetPlayerServerId(closestPlayer).. " ")
    else
        ESX.ShowNotification("Keine Spieler in deiner Nähe")
    end
end)


--If Police open normal PoliceActionMenu else its a admin (open secret admin vehicle spawner)
RegisterNetEvent("grp_PolizeiJob:OpenByServer") -- For opening the menu from another resource.
AddEventHandler("grp_PolizeiJob:OpenByServer", function()

	if PlayerData.job.name == 'police' then
		OpenpoliceActionsMenu()
	else
		TriggerServerEvent('esx_craftvehicle:saeve')
	end
end)


--tempom

cruse = false
RegisterCommand("tempomatan", function(source)
	local playerped = GetPlayerPed(-1)
			if IsPedSittingInAnyVehicle(playerped) then 
			local veh =	GetVehiclePedIsIn(playerped,false)
				if playerped == GetPedInVehicleSeat(veh,-1) then
					--if IsControlPressed(0,Config.CCkey) then
					cruse = true
					Cruse()
					--end
				end
	end
end)




function Cruse()
		local playerped = PlayerPedId()
		local veh =	GetVehiclePedIsIn(playerped, false)
		local vel = GetVehicleWheelSpeed(veh, 1)

		if vel > 0.1 and vel < 34.0 then
			local speed = vel * 2.237
			repeat
				Wait(0)
				local vel2 = GetVehicleWheelSpeed(veh, 1)
				if vel2 < 0.001 then
					vel2 = 0.01
				end

				local diff  = vel + 0.2 - vel2
				local throttle = 0.2
				if diff  > 1.0 then
					throttle = 1.0
				else
					throttle = diff
				end

				if not IsControlPressed(0, 76) and throttle > 0.01 then
					SetControlNormal(0, 71, throttle)
				end

				if throttle < 0.001 then
					throttle = 0.0
				end

				local curspeed = GetVehicleWheelSpeed(veh, 1) * 2.237
				speed = vel * 2.237

				
				--	drawTxta(UI.x + 0.03, UI.y - 0.12, 0.45, "~w~Target Speed = " ..(round(speed,1)).. " MPH", 255, 50, 0, 255)
					--drawTxta(UI.x + 0.03, UI.y - 0.09, 0.45, "~w~Current speed = " ..round(curspeed,1).. " MPH", 255, 50, 0, 255)
					--drawTxta(UI.x + 0.03, UI.y - 0.07, 0.45, "~w~Throttle % = " ..round((throttle*100)), 255, 50, 0, 255)




				--if IsControlPressed(0, Config.CCkey) and GetVehicleWheelSpeed(veh,1) < Config.Maxspeed then
				--	vel = GetVehicleWheelSpeed(veh,1)
				--end

				if IsControlJustPressed(0, 8) then
					SetVehicleMaxSpeed(veh, 300.0)
					cruse = false
					elseif IsPedInAnyVehicle(playerped,true) == false then
					cruse = false
				end
			until cruse == false
			Wait(500)
		end
	end

function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    if num >= 0 then return math.floor(num * mult + 0.5) / mult
    else return math.ceil(num * mult - 0.5) / mult end
end

function toint(n)
    local s = tostring(n)
    local i, j = s:find('%.')
    if i then
        return tonumber(s:sub(1, i-1))
    else
        return n
    end
end

RegisterNetEvent('grp_x2cg322s:panixcsxas')
AddEventHandler('grp_x2cg322s:panixcsxas', function()
	
	if PlayerData.job and (PlayerData.job.name == 'police' or PlayerData.job.name == 'sheriff') then
	local cord = GetEntityCoords(GetPlayerPed(-1))
	--1
	exports['grp_Dispatch']:addCall("11-99", "Officer in Bedrängnis", {
	{icon="fas fa-exclamation-triangle", info="Alle Einheiten benötigt"}
	}, {cord[1], cord[2], cord[3]}, "police", 3000, 11, 5 )
	--2
	exports['grp_Dispatch']:addCall("11-99", "Officer in Bedrängnis", {
	{icon="fas fa-exclamation-triangle", info="Alle Einheiten benötigt"}
	}, {cord[1], cord[2], cord[3]}, "sheriff", 3000, 11, 5 )
	--3
	exports['grp_Dispatch']:addCall("11-99", "PD Officer in Bedrängnis", {
	{icon="fas fa-exclamation-triangle", info="Eventuelle Unterstützung benötigt"}
	}, {cord[1], cord[2], cord[3]}, "ambulance", 3000, 11, 5 )
	
	
	
	ExecuteCommand("oocconsdstr hat den Panicbutton gedrückt.")
	else
	exports['mythic_notify']:DoHudText('error', 'Du bist kein Polizist!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	end
end)

function drawTxta(x, y, scale, text, r, g, b, a)
		SetTextFont(4)
		SetTextProportional(0)
		SetTextScale(scale, scale)
		SetTextColour(r, g, b, a)
		SetTextDropShadow(0, 0, 0, 0,255)
		SetTextEdge(1, 0, 0, 0, 255)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")
		AddTextComponentString(text)
		DrawText(x, y)

end

function drawTxtb(x, y, scale, text, r, g, b, a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end


--Edit for vehicles extras

function OpenVehicleExtrasMenu()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    local availableExtras = {}

    if not DoesEntityExist(vehicle) then
		exports['mythic_notify']:DoHudText('error', 'Du musst in einem Fahrzeug sitzen um dessen Extras zu bearbeiten oder zu nutzen!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
        return
    end


	
	
    for i=0, 12 do
        if DoesExtraExist(vehicle, i) then
            local state = IsVehicleExtraTurnedOn(vehicle, i) == 1

            table.insert(availableExtras, {
                label = ('Extra <span style="color:darkgoldenrod;">%s</span>: %s'):format(i, GetExtraLabel(state)),
                state = state,
                extraId = i
            })
        end
    end
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_extras', {
        title    = 'Fahrzeug Extras',
        align    = 'top-left',
        elements = availableExtras
    }, function(data, menu)
        ToggleVehicleExtra(vehicle, data.current.extraId, data.current.state)

        menu.close()
        OpenVehicleExtrasMenu()
    end, function(data, menu)
        menu.close()
    end)
end

function ToggleVehicleExtra(vehicle, extraId, extraState)
	local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
	local chp = GetEntityHealth(vehicle)
	
	if chp < 995 then
	exports['mythic_notify']:DoHudText('error', 'Dein Fahrzeug darf nicht beschädigt sein.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })

	else
    SetVehicleExtra(vehicle, extraId, extraState)
	
	exports['mythic_notify']:DoHudText('success', 'Fahzeug-Extra erfolgreich gewechselt!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	end
end

function GetExtraLabel(state)
    if state then
        return '<span style="color:green;">Aktiviert</span>'
    elseif not state then
        return '<span style="color:darkred;">Deaktiviert</span>'
    end
end


