local PlayerData
local CurrentAction, CurrentActionMsg, CurrentActionData = nil, '', {}
local HasAlreadyEnteredMarker, LastHospital, LastPart, LastPartNum
local isBusy, deadPlayers, deadPlayerBlips, isOnDuty = false, {}, {}, false
isInShopMenu = false
local pa = false
local schlauch = false
local helmet = false
local muhHelmet
local onlyflasche
local onlyMaske

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



RegisterNetEvent('grp_Sanitaeter:menueoeefnen')
AddEventHandler('grp_Sanitaeter:menueoeefnen', function()
OpenAmbulanceActionsMenu()
end)


RegisterNetEvent('grp_Sanitaeter:kleidungzurueeeck')
AddEventHandler('grp_Sanitaeter:kleidungzurueeeck', function()
KleidungZurueck()
end)
RegisterNetEvent('grp_Sanitaeter:opkleyyddd')
AddEventHandler('grp_Sanitaeter:opkleyyddd', function()
opkleyydd()
end)
RegisterNetEvent('grp_Sanitaeter:erklareerung')
AddEventHandler('grp_Sanitaeter:erklareerung', function()
PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
exports['mythic_notify']:DoHudText('inform', 'Bringe einen bewusstlosen Spieler in die Nähe', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
Citizen.Wait(1000)
PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
exports['mythic_notify']:DoHudText('inform', 'Drücke auf "Spieler wiederbeleben", zahle die Gebühr und die wiederbelebung beginnt.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
end)


RegisterNetEvent('grp_Sanitaeter:wennkeyyynerdaististt')
AddEventHandler('grp_Sanitaeter:wennkeyyynerdaististt', function()
if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 295.32403564453,-590.97259521484,43.249389648438, true) < 3 and not isDead then				
	 PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
	 TriggerServerEvent('grd_defi:wievielemedics')
end
end)



Citizen.CreateThread(function()
    local garderobemedic = {
        1585260068,
        1010590096,
    }
	local kleidungzurueck = {
        -1035084591,
    }
	local opkleiddd = {
        1291456491,
    }
	local ambuautoausp = {
        `s_m_m_doctor_01`,
    }
	local ambuhelioausp = {
        `s_m_m_pilot_01`,
    }
	local meedciccsfrau = {
        `ig_magenta`,
    }
	exports['bt-target']:AddTargetModel(meedciccsfrau, {
        options = {
            {
                event = "grp_Sanitaeter:wennkeyyynerdaististt",
                icon = "fas fa-ambulance",
                label = "Spieler wiederbeleben (2.500$)",
            },
            {
                event = "grp_Sanitaeter:erklareerung",
                icon = "far fa-question-circle",
                label = "Erklärung",
            },
        },
        job = {"all"},
        distance = 2.5
    })
	exports['bt-target']:AddTargetModel(ambuhelioausp, {
        options = {
            {
                event = "grp_Sanitaeter:heliausparuken",
                icon = "fas fa-helicopter",
                label = "Heli ausparken",
            },
        },
        job = {"ambulance"},
        distance = 2.5
    })
	exports['bt-target']:AddTargetModel(ambuautoausp, {
        options = {
            {
                event = "grp_Sanitaeter:autoausparuken",
                icon = "fas fa-car",
                label = "Auto ausparken",
            },
        },
        job = {"ambulance"},
        distance = 2.5
    })
    exports['bt-target']:AddTargetModel(garderobemedic, {
        options = {
            {
                event = "grp_Sanitaeter:menueoeefnen",
                icon = "fas fa-briefcase-medical",
                label = "Garderobe öffnen",
            },
        },
        job = {"ambulance"},
        distance = 2.5
    })
	
	exports['bt-target']:AddTargetModel(kleidungzurueck, {
        options = {
            {
                event = "grp_Sanitaeter:kleidungzurueeeck",
                icon = "fas fa-tshirt",
                label = "Kleidung zurück holen",
            },
        },
        job = {"all"},
        distance = 2.5
    })
	
	exports['bt-target']:AddTargetModel(opkleiddd, {
        options = {
            {
                event = "grp_Sanitaeter:opkleyyddd",
                icon = "fas fa-tshirt",
                label = "OP-Kleidung anziehen",
            },
        },
        job = {"ambulance"},
        distance = 2.5
    })	
end)


RegisterNetEvent('grp_Sanitaeter:autoausparuken')
AddEventHandler('grp_Sanitaeter:autoausparuken', function()
OpenVehicleSpawnerMenu('car', CurrentActionData.hospital, CurrentAction, CurrentActionData.partNum)

end)

RegisterNetEvent('grp_Sanitaeter:heliausparuken')
AddEventHandler('grp_Sanitaeter:heliausparuken', function()
OpenVehicleSpawnerMenu('helicopter', CurrentActionData.hospital, CurrentAction, CurrentActionData.partNum)

end)




function OpenAmbulanceActionsMenu()
	local elements = {{label = _U('cloakroom'), value = 'cloakroom'}}
	--table.insert(elements, {label = ("Ausrüstung holen"), value = 'ausruestung'})
	if Config.EnablePlayerManagement and ESX.PlayerData.job.grade_name == 'boss' then
		table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ambulance_actions', {
		title    = _U('ambulance'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'cloakroom' then
			OpenCloakroomMenu()
		elseif data.current.value == 'ausruestung' then
			-- tazer
			GiveWeaponToPed(PlayerPedId(), 0x3656C8C1, 250, false, true)
			ESX.ShowNotification("Du hast Dich ausgerüstet")	
		elseif data.current.value == 'boss_actions' then
			TriggerEvent('esx_society:openBosdewenspantossindnice1337sMenu', 'ambulance', function(data, menu)
				menu.close()
			end, {wash = false})
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenMobileAmbulanceActionsMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mobile_ambulance_actions', {
		title    = _U('ambulance'),
		align    = 'top-left',
		elements = {
			{label = _U('ems_menu'), value = 'citizen_interaction'},
			{label = ("Objekte platzieren"), value = 'object_spawner'},
			{label = _U('fw_menu'), value = 'fw_interaction'}
	}}, function(data, menu)
		if data.current.value == 'fw_interaction' then
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fw_interaction', {
				title    = _U('fw_menu_title'),
				align    = 'top-left',
				elements = {
				{ label = "PA auf-/abziehen", value = "pressluftatmung" },
				--{ label = "Helm auf-/abziehen", value = "helm" },
				{ label = "Taschenlampe", value = "taschenlampe" },
				{ label = "Feuerwehraxt", value = "feuerwehraxt" },
				{ label = "Hammer", value = "hammer" },
				{ label = "Rohrzange", value = "zange" }
			}
		}, 
	function(data, menu)

		local action = data.current.value

		if action == "pressluftatmung" then
			if pa == false then
				exports['progressBars']:startUI(10000, "Atemschutz aufsetzen")
				menu.close()
				Citizen.Wait(10000)
				ESX.ShowNotification("~g~Du hast dein Atemschutzset aufgezogen!")
				pa = true
			local playerPed  = GetPlayerPed(-1)
			local coords     = GetEntityCoords(playerPed)
			local boneIndex  = GetPedBoneIndex(playerPed, 12844)
			local boneIndex2 = GetPedBoneIndex(playerPed, 24818)

			ESX.Game.SpawnObject('p_s_scuba_mask_s', {
				x = coords.x,
				y = coords.y,
				z = coords.z - 3
				}, function(maske)
			ESX.Game.SpawnObject('p_s_scuba_tank_s', {
			x = coords.x,
			y = coords.y,
			z = coords.z - 3
				}, function(flasche)
					onlyflasche = flasche
			AttachEntityToEntity(flasche, playerPed, boneIndex2, -0.30, -0.22, 0.0, 0.0, 90.0, 180.0, true, true, false, true, 1, true)
			AttachEntityToEntity(maske, playerPed, boneIndex, 0.0, 0.0, 0.0, 0.0, 90.0, 180.0, true, true, false, true, 1, true)
			SetPedDiesInWater(playerPed, false)
			
			ESX.ShowNotification('Volumen: 300 bar / 100%')
			Citizen.Wait(1200000)	
			ESX.ShowNotification('Volumen: 3 bar / 1%  ~r~Grenzwerte erreicht!', true)
			Citizen.Wait(20000)
			SetPedDiesInWater(playerPed, true)
			DeleteObject(maske)
			DeleteObject(flasche)
			ClearPedSecondaryTask(playerPed)
			
			pa = false
				end)
				onlyMaske = maske
			end)

			else
			local playerPed  = GetPlayerPed(-1)
			local coords     = GetEntityCoords(playerPed)
			local boneIndex  = GetPedBoneIndex(playerPed, 12844)
			local boneIndex2 = GetPedBoneIndex(playerPed, 24818)
			exports['progressBars']:startUI(3000, "Atemschutz absetzen")
			Citizen.Wait(3000)
			ESX.Game.DeleteObject(onlyMaske)
			ESX.Game.DeleteObject(onlyflasche)
			SetPedDiesInWater(playerPed, true)
			ESX.ShowNotification("~r~Pressluftatmer abgezogen")
			pa = false
			menu.close()
			end
		end

		if action == "helm" then
			if helmet == false then
			local playerPed  = GetPlayerPed(-1)
			local coords     = GetEntityCoords(playerPed)
			local boneIndex  = GetPedBoneIndex(playerPed, 12844)
			local boneIndex2 = GetPedBoneIndex(playerPed, 24818)
			--exports['progressBars']:startUI(6000, "Helm aufziehen")
			--Citizen.Wait(5000)

			ESX.Game.SpawnObject('prop_tool_hardhat', {
				x = coords.x,
				y = coords.y,
				z = coords.z - 3
				}, function(helm)

				AttachEntityToEntity(helm, playerPed, boneIndex, 0.0, 0.0, 1.0, 0.0, 90.0, 0.0, true, true, false, true, 1, true)
				ESX.ShowNotification("~g~Helm aufgezogen")
				muhHelmet = helm
				helmet = true
				menu.close()
				end)
			else
				local playerPed  = GetPlayerPed(-1)
				local coords     = GetEntityCoords(playerPed)
				local boneIndex  = GetPedBoneIndex(playerPed, 12844)
				local boneIndex2 = GetPedBoneIndex(playerPed, 24818)
				ESX.Game.DeleteObject(muhHelmet)
				ESX.ShowNotification("~r~Helm abgezogen!")
				helmet = false
				menu.close()
			end
		end

	
		if action == "taschenlampe" then
			local playerPed  = GetPlayerPed(-1)
			exports['progressBars']:startUI(2000, "Taschenlampe herausholen")
			Citizen.Wait(2000)
			GiveWeaponToPed(
				playerPed --[[ Ped ]], 
				0x8BB05FD7 --[[ Hash ]], 
				20000 --[[ integer ]], 
				false --[[ boolean ]], 
				true --[[ boolean ]]
			)
			ESX.ShowNotification("~g~Taschenlampe bereit!")
			menu.close()
		end
		if action == "feuerwehraxt" then
			local playerPed  = GetPlayerPed(-1)
			exports['progressBars']:startUI(6000, "Axt herausholen")
			Citizen.Wait(6000)
			GiveWeaponToPed(
				playerPed --[[ Ped ]], 
				0xF9DCBF2D --[[ Hash ]], 
				20000 --[[ integer ]], 
				false --[[ boolean ]], 
				true --[[ boolean ]]
			)
			ESX.ShowNotification("~g~Axt heraus geholt!")
			menu.close()
		end
		if action == "hammer" then
			local playerPed  = GetPlayerPed(-1)
			exports['progressBars']:startUI(1000, "Hammer holen")
			Citizen.Wait(1000)
			GiveWeaponToPed(
				playerPed --[[ Ped ]], 
				0x4E875F73 --[[ Hash ]], 
				20000 --[[ integer ]], 
				false --[[ boolean ]], 
				true --[[ boolean ]]
			)
			ESX.ShowNotification("~g~Hammer herausgeholt!")
			menu.close()
		end
		if action == "zange" then
			local playerPed  = GetPlayerPed(-1)
			exports['progressBars']:startUI(3000, "Rohrzange herausholen")
			Citizen.Wait(3000)
			GiveWeaponToPed(
				playerPed --[[ Ped ]], 
				0x19044EE0 --[[ Hash ]], 
				20000 --[[ integer ]], 
				false --[[ boolean ]], 
				true --[[ boolean ]]
			)
			ESX.ShowNotification("~g~Rohrzange herausgeholt!")
			menu.close()
		end

	end, function(data, menu)
		menu.close()
	end)	
end		

--ende bisher
		if data.current.value == 'citizen_interaction' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
				title    = _U('ems_menu_title'),
				align    = 'top-left',
				elements = {
					--{label = _U('handcuff'), value = 'handcuff'},
					--{label = _U('entfesseln'), value = 'uncuff'},	
					{label = _U('ems_menu_revive'), value = 'revive'},
					{label = _U('ems_menu_small'), value = 'small'},
					{label = _U('ems_menu_big'), value = 'big'},
					{label = ("💶Rechnungen ausstellen"),       value = 'billing'},
					{label = ("💶Rechnungen einsehen"), value = 'unpaid_bills'},
					{label = _U('ems_menu_putincar'), value = 'put_in_vehicle'}
			}}, function(data, menu)
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if isBusy then return end
						
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if closestPlayer == -1 or closestDistance > 1.0 then
					ESX.ShowNotification(_U('no_players'))
				else
					if data.current.value == 'billing' then
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'billing', {
					title = ("Betrag")
						}, function(data, menu)
							local amount = tonumber(data.value)

							if amount == nil or amount < 0 then
								ESX.ShowNotification(("Ungültige Eingabe"))
						else
					local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
					if closestPlayer == -1 or closestDistance > 3.0 then
						ESX.ShowNotification(("Keine Spieler in der Nähe"))
					else
						menu.close()
						TriggerServerEvent('esx_bidewenspantossindnice1337lling:sendBill', GetPlayerServerId(closestPlayer), 'society_ambulance', ("Mediziner"), amount)
						ESX.ShowNotification(("Du hast eine Rechnung ausgestellt"))
						end
						end
						end, function(data, menu)
						menu.close()
					end)
					elseif data.current.value == 'unpaid_bills' then
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						OpenUnpaidBillsMenu(closestPlayer)	
					elseif data.current.value == 'revive' then
						reveifPlayer(closestPlayer)
					elseif data.current.value == 'small' then
						ESX.TriggerServerCallback('grp_SanitaeterUndSo:getItemAmount', function(quantity)

								local closestPlayerPed = GetPlayerPed(closestPlayer)
								local health = GetEntityHealth(closestPlayerPed)
								
								if health > 0 then
									local playerPed = PlayerPedId()

									isBusy = true
									ESX.ShowNotification(_U('heal_inprogress'))
									exports['progressBars']:startUI(12785, "Versorge kleinere Wunden...") --12.785 Sekunden
									TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
									Citizen.Wait(10000)
									ClearPedTasks(playerPed)

									
									TriggerServerEvent('grp_SanitaeterUndSo:heal', GetPlayerServerId(closestPlayer), 'small')
									ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
									isBusy = false
								else
									ESX.ShowNotification(_U('player_not_conscious'))
								end

						end, 'bandage')

					elseif data.current.value == 'big' then

						ESX.TriggerServerCallback('grp_SanitaeterUndSo:getItemAmount', function(quantity)

								local closestPlayerPed = GetPlayerPed(closestPlayer)
								local health = GetEntityHealth(closestPlayerPed)

								if health > 0 then
									local playerPed = PlayerPedId()

									isBusy = true
									ESX.ShowNotification(_U('heal_inprogress'))
									exports['progressBars']:startUI(12785, "Versorge größere Wunden...") --12.785 Sekunden
									TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
									Citizen.Wait(10000)
									ClearPedTasks(playerPed)


									TriggerServerEvent('grp_SanitaeterUndSo:heal', GetPlayerServerId(closestPlayer), 'big')
									ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
									isBusy = false
								else
									ESX.ShowNotification(_U('player_not_conscious'))
								end

						end, 'medikit')

					elseif data.current.value == 'put_in_vehicle' then
						TriggerServerEvent('grp_SanitaeterUndSo:putInVehicle', GetPlayerServerId(closestPlayer))
					elseif action == 'customdannwirdbesser' then
						
						OpenCustomRechnungMenu(closestPlayer)

					end
				end
			end, function(data, menu)
				menu.close()
			end)
		
		elseif data.current.value == 'object_spawner' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
				title    = _U('traffic_interaction'),
				align    = 'top-left',
				elements = {
				--{label = _U('cone'), model = 'prop_mp_cone_04'},
				--{label = _U('barrier'), model = 'prop_mp_barrier_02b'},
				{label = _U('Baustrahler3'), model = 'prop_worklight_03b'},
				{label = _U('Baustrahler2'), model = 'prop_worklight_01a'},
				{label = _U('Baustrahler1'), model = 'prop_worklight_04d'}
				--{label = _U('Beton'), model = 'prop_barier_conc_01a'},
				--{label = _U('Laptop'), model = 'prop_laptop_lester2'},
				--{label = _U('Umleitung1'), model = 'prop_sign_road_06r'},
				--{label = _U('Umleitung2'), model = 'prop_sign_road_06q'}
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




local bereitsgenutzt = false

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

AddEventHandler('grp_PolizeiJob:hasEnteredEntityZone', function(entity)
	local playerPed = PlayerPedId()

	if PlayerData.job and PlayerData.job.name == 'ambulance' and IsPedOnFoot(playerPed) then
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

RegisterNetEvent("grd_defi:nutzen")
AddEventHandler("grd_defi:nutzen", function()
  local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
 if not bereitsgenutzt then
 if closestPlayer == -1 or closestDistance > 3.0 then
	exports['mythic_notify']:DoHudText('error', 'Keine Bewustlose Person in der Nähe.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
  else
    
        local closestPlayerPed = GetPlayerPed(closestPlayer)
        local health = GetEntityHealth(closestPlayerPed)
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 295.32403564453,-590.97259521484,43.249389648438, true) < 3 then
        if health == 0 then
          local playerPed = GetPlayerPed(-1)
          
		  exports['progressBars']:startUI(10000, "Reanimiere Person...") 
          TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
          Citizen.Wait(10000)
          ClearPedTasks(playerPed)
          
		bereitsgenutzt = true
          TriggerServerEvent('grp_SanitaeterUndSo:redewenspantossindnice1337vive', GetPlayerServerId(closestPlayer))
        else
		exports['mythic_notify']:DoHudText('error', 'Diese Person braucht keine reanimation.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
        end
		end
      end
	  else
		exports['mythic_notify']:DoHudText('error', 'Du kannst nur alle 30 Minuten jemanden wiederbeleben.', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
    end 
end)

Citizen.CreateThread(function()
		while bereitsgenutzt do
			Citizen.Wait(1800000)

			bereitsgenutzt = false
		end	

end)



function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function GetClosestPlayer(radius)
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(ply, 0)

    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = GetDistanceBetweenCoords(targetCoords['x'], targetCoords['y'], targetCoords['z'], plyCoords['x'], plyCoords['y'], plyCoords['z'], true)
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end
	
	if closestDistance <= radius then
		return closestPlayer
	else
		return nil
	end
end

function drawNativeNotification(text)
    SetTextComponentFormat('STRING')
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

--carry ende

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
			title    = ("unbezahlte Rechnungen"),
			align    = 'top-left',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end

function reveifPlayer(closestPlayer)
	isBusy = true

	ESX.TriggerServerCallback('grp_SanitaeterUndSo:getItemAmount', function(quantity)
			local closestPlayerPed = GetPlayerPed(closestPlayer)

			if IsPedDeadOrDying(closestPlayerPed, 1) then
				local playerPed = PlayerPedId()
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				local lib, anim = 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest'
				ESX.ShowNotification(_U('revive_inprogress'))
				exports['progressBars']:startUI(14600, "Reanimiere Person...") --14.6 Sekunden
				for i=1, 15 do
					Citizen.Wait(900)

					ESX.Streaming.RequestAnimDict(lib, function()
						TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
					end)
				end

	
				TriggerServerEvent('grp_SanitaeterUndSo:kleidungjail', GetPlayerServerId(closestPlayer))
				TriggerServerEvent('grp_SanitaeterUndSo:auszeitgeben', GetPlayerServerId(closestPlayer))
				ClearPedTasksImmediately(GetPlayerServerId(closestPlayer))
				TriggerServerEvent('grp_SanitaeterUndSo:redewenspantossindnice1337vive', GetPlayerServerId(closestPlayer))
				TriggerServerEvent('esx_society:JobGeld', "ambulance", "500")
				TriggerServerEvent('esx_PolizeiJob:message', GetPlayerServerId(closestPlayer), ("Dir wurde Patientenkleidung angezogen."))
			else
				ESX.ShowNotification(_U('player_not_unconscious'))
			end
		isBusy = false
	end, 'medikit')
end

function FastTravel(coords, heading)
	local playerPed = PlayerPedId()

	DoScreenFadeOut(800)

	while not IsScreenFadedOut() do
		Citizen.Wait(500)
	end

	ESX.Game.Teleport(playerPed, coords, function()
		DoScreenFadeIn(800)

		if heading then
			SetEntityHeading(playerPed, heading)
		end
	end)
end

-- Draw markers & Marker logic
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
			local playerCoords = GetEntityCoords(PlayerPedId())
			local letSleep, isInMarker, hasExited = true, false, false
			local currentHospital, currentPart, currentPartNum

			for hospitalNum,hospital in pairs(Config.Hospitals) do

				-- Vehicle Spawners
				for k,v in ipairs(hospital.Vehicles) do
					local distance = #(playerCoords - v.Spawner)
				--[[
					if distance < Config.DrawDistance then
						DrawMarker(v.Marker.type, v.Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
						letSleep = false
						]]--
						if distance < v.Marker.x then
							isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Vehicles', k
						end
					
				end

				-- Helicopter Spawners
				for k,v in ipairs(hospital.Helicopters) do
					local distance = #(playerCoords - v.Spawner)
					--[[
					if distance < Config.DrawDistance then
						DrawMarker(v.Marker.type, v.Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
						letSleep = false
					--]]
						if distance < v.Marker.x then
							isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Helicopters', k
						end
					
				end

				
			end

			-- Logic for exiting & entering markers
			if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastHospital ~= currentHospital or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then
				if
					(LastHospital ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
					(LastHospital ~= currentHospital or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
				then
					TriggerEvent('grp_SanitaeterUndSo:hasExitedMarker', LastHospital, LastPart, LastPartNum)
					hasExited = true
				end

				HasAlreadyEnteredMarker, LastHospital, LastPart, LastPartNum = true, currentHospital, currentPart, currentPartNum

				TriggerEvent('grp_SanitaeterUndSo:hasEnteredMarker', currentHospital, currentPart, currentPartNum)
			end

			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('grp_SanitaeterUndSo:hasExitedMarker', LastHospital, LastPart, LastPartNum)
			end

			if letSleep then
				Citizen.Wait(500)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

-- Fast travels
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords, letSleep = GetEntityCoords(PlayerPedId()), true

		for hospitalNum,hospital in pairs(Config.Hospitals) do
			-- Fast Travels
			for k,v in ipairs(hospital.FastTravels) do
				local distance = #(playerCoords - v.From)

				if distance < Config.DrawDistance then
					DrawMarker(v.Marker.type, v.From, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
					letSleep = false

					if distance < v.Marker.x then
						FastTravel(v.To.coords, v.To.heading)
					end
				end
			end
		end

		if letSleep then
			Citizen.Wait(500)
		end
	end
end)

AddEventHandler('grp_SanitaeterUndSo:hasEnteredMarker', function(hospital, part, partNum)
	if part == 'AmbulanceActions' then
		CurrentAction = part
		CurrentActionMsg = _U('actions_prompt')
		CurrentActionData = {}
	elseif part == 'Pharmacy' then
		CurrentAction = part
		CurrentActionMsg = _U('open_pharmacy')
		CurrentActionData = {}
	elseif part == 'Vehicles' then
		CurrentAction = part
		CurrentActionMsg = _U('garage_prompt')
		CurrentActionData = {hospital = hospital, partNum = partNum}
	elseif part == 'Helicopters' then
		CurrentAction = part
		CurrentActionMsg = _U('helicopter_prompt')
		CurrentActionData = {hospital = hospital, partNum = partNum}
	elseif part == 'FastTravelsPrompt' then
		local travelItem = Config.Hospitals[hospital][part][partNum]

		CurrentAction = part
		CurrentActionMsg = travelItem.Prompt
		CurrentActionData = {to = travelItem.To.coords, heading = travelItem.To.heading}
	end
end)

AddEventHandler('grp_SanitaeterUndSo:hasExitedMarker', function(hospital, part, partNum)
	if not isInShopMenu then
		ESX.UI.Menu.CloseAll()
	end

	CurrentAction = nil
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, 38) then
				if CurrentAction == 'Pharmacy' then
					OpenPharmacyMenu()
				elseif CurrentAction == 'Vehicles' then
					OpenVehicleSpawnerMenu('car', CurrentActionData.hospital, CurrentAction, CurrentActionData.partNum)
				elseif CurrentAction == 'Helicopters' then
					OpenVehicleSpawnerMenu('helicopter', CurrentActionData.hospital, CurrentAction, CurrentActionData.partNum)
				elseif CurrentAction == 'FastTravelsPrompt' then
					FastTravel(CurrentActionData.to, CurrentActionData.heading)
				
				elseif CurrentAction == 'remove_entity' then
					DeleteEntity(CurrentActionData.entity)
				end
				CurrentAction = nil
			end
		
		elseif ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' and not isDead then
			if IsControlJustReleased(0, 167) then
				OpenMobileAmbulanceActionsMenu()
			end
		else
			Citizen.Wait(500)
		end
		
	end
	
end)



RegisterNetEvent('grp_SanitaeterUndSo:putInVehicle')
AddEventHandler('grp_SanitaeterUndSo:putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

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
			end
		end
	end
end)

--Kleidung Jail
RegisterNetEvent('grp_SanitaeterUndSo:kleidungjail')
AddEventHandler('grp_SanitaeterUndSo:kleidungjail', function(source)
	local playerPed = GetPlayerPed(-1)
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					local clothesSkin = {
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1'] = 104, ['torso_2'] = 0,
			['arms'] = 3,
			['pants_1'] = 14, ['pants_2'] = 1,
			['shoes_1'] = 16, ['shoes_2'] = 0,
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
				else
					local clothesSkin = {
			['tshirt_1'] = 15, ['tshirt_2'] = 0,
			['torso_1'] = 141, ['torso_2'] = 0,
			['arms'] = 0,
			['pants_1'] = 10, ['pants_2'] = 1,
			['shoes_1'] = 5, ['shoes_2'] = 0,
		}
		TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
				end
	end)
end)

local verletzt = false
RegisterNetEvent('grp_SanitaeterUndSo:auszeitgeben')
AddEventHandler('grp_SanitaeterUndSo:auszeitgeben', function(source)
	local playerPed = GetPlayerPed(-1)
	verletzt = true
	--exports['mythic_notify']:DoHudText('inform', 'test', { ['background-color'] = '#ffffff', ['color'] = '#000000' })

	
	Citizen.Wait(600000) --10mins
	verletzt = false
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		--if not verletzt then
		if verletzt and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 3525.8786621094,3711.6784667969,36.638118743896, true) > 120 then
		local ped = PlayerPedId()
		DisablePlayerFiring(ped, true)
		DisableControlAction(0, 37, true)
		DisableControlAction(0, 24, true)
		DisableControlAction(0, 45, true)
		DisableControlAction(0, 140, true)
		DisableControlAction(0, 263, true)
		DrawAdvancedText(0.891, 0.953, 0.005, 0.0028, 0.4, "Du wurdest von einem Mediziner verarztet.", 255, 255, 255, 255, 6, 0)
		DrawAdvancedText(0.891, 0.973, 0.005, 0.0028, 0.4, "Du solltest dich etwas erholen. Du kannst nicht Schlagen/Schiessen.", 255, 255, 255, 255, 6, 0)
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

function cleanPlayer(playerPed)
	SetPedArmour(playerPed, 0)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	
end




--feuerwehr kleidung
function feuerwehrkleidung()
	local playerPed = PlayerPedId()
	

	local elements = {
		{ label = ("Feuerwehrkleidung anziehen"), value = 'feuerwehr' }
	}


	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = _U('cloakroom'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		cleanPlayer(playerPed)

		if data.current.value == 'feuerwehr' then
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

function opkleyydd()
	local playerPed = PlayerPedId()
	

	local elements = {
		{ label = ("OP-Kleidung anziehen"), value = 'citizen_wear' }
	}


	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = _U('cloakroom'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		cleanPlayer(playerPed)

		if data.current.value == 'citizen_wear' then
			if Config.EnableNonFreemodePeds then
				local playerPed = PlayerPedId()
				setUniform('medickleidung', playerPed)
				
			else
				local playerPed = PlayerPedId()
				setUniform('medickleidungop', playerPed)
			end
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	end)
end
--kleidung zurück im md
function KleidungZurueck()
	local playerPed = PlayerPedId()
	

	local elements = {
		{ label = ("Kleidung wieder anziehen"), value = 'citizen_wear' }
	}


	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = _U('cloakroom'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		cleanPlayer(playerPed)

		if data.current.value == 'citizen_wear' then
			if Config.EnableNonFreemodePeds then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					local isMale = skin.sex == 0

					TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
							TriggerEvent('skinchanger:loadSkin', skin)
							TriggerEvent('esx:restoreLoadout')
						end)
					end)

				end)
			else
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
				end)
			end
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	end)
end

--ende


function OpenCloakroomMenu()
	local playerPed = PlayerPedId()
	

	local elements = {
		{ label = _U('citizen_wear'), value = 'citizen_wear' },
		{ label = ("Mediziner Kleidung"), value = 'medickleidung' },		
		{ label = ("Feuerwehr Kleidung"), value = 'feuerwehr' },		
		{ label = _U('gilet_wear'), value = 'gilet_wear' }
	}


	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = _U('cloakroom'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		cleanPlayer(playerPed)

		if data.current.value == 'citizen_wear' then
			if Config.EnableNonFreemodePeds then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					local isMale = skin.sex == 0

					TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
							TriggerEvent('skinchanger:loadSkin', skin)
							TriggerEvent('esx:restoreLoadout')
						end)
					end)

				end)
			else
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
				end)
			end

			if Config.MaxInService ~= -1 then
				ESX.TriggerServerCallback('esx_service:isInService', function(isInService)
					if isInService then
						playerInService = false

						local notification = {
							title    = _U('service_anonunce'),
							subject  = '',
							msg      = _U('service_out_announce', GetPlayerName(PlayerId())),
							iconType = 1
						}

						TriggerServerEvent('esx_service:notifyAllInService', notification, 'ambulance')

						TriggerServerEvent('esx_service:disableService', 'ambulance')
						TriggerEvent('esx_PolizeiJob:updateBlip')
						ESX.ShowNotification(_U('service_out'))
					end
				end, 'ambulance')
			end
		end

		if
			data.current.value == 'medickleidung' or
			data.current.value == 'feuerwehr' or
			data.current.value == 'bullet_wear' or
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

function OpenPharmacyMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pharmacy', {
		title    = _U('pharmacy_menu_title'),
		align    = 'top-left',
		elements = {
			{label = _U('pharmacy_take', _U('medikit')), item = 'medikit', type = 'slider', value = 1, min = 1, max = 100},
			{label = _U('pharmacy_take', _U('bandage')), item = 'bandage', type = 'slider', value = 1, min = 1, max = 100}
	}}, function(data, menu)
		TriggerServerEvent('grp_SanitaeterUndSo:giveItem', data.current.item, data.current.value)
	end, function(data, menu)
		menu.close()
	end)
end

RegisterNetEvent('grp_SanitaeterUndSo:heal')
AddEventHandler('grp_SanitaeterUndSo:heal', function(healType, quiet)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)

	if healType == 'small' then
		local health = GetEntityHealth(playerPed)
		local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 8))
		SetEntityHealth(playerPed, newHealth)
		
	elseif healType == 'big' then
		SetEntityHealth(playerPed, maxHealth)
	end

	if not quiet then
		ESX.ShowNotification(_U('healed'))
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	if isOnDuty and job ~= 'ambulance' then
		for playerId,v in pairs(deadPlayerBlips) do
			RemoveBlip(v)
			deadPlayerBlips[playerId] = nil
		end

		isOnDuty = false
	end
end)

RegisterNetEvent('grp_SanitaeterUndSo:setDeadPlayers')
AddEventHandler('grp_SanitaeterUndSo:setDeadPlayers', function(_deadPlayers)
	deadPlayers = _deadPlayers

	if isOnDuty then
		for playerId,v in pairs(deadPlayerBlips) do
			RemoveBlip(v)
			deadPlayerBlips[playerId] = nil
		end

		for playerId,status in pairs(deadPlayers) do
			if status == 'distress' then
				local player = GetPlayerFromServerId(playerId)
				local playerPed = GetPlayerPed(player)
				local blip = AddBlipForEntity(playerPed)

				SetBlipSprite(blip, 303)
				SetBlipColour(blip, 1)
				SetBlipFlashes(blip, true)
				SetBlipCategory(blip, 7)

				BeginTextCommandSetBlipName('STRING')
				AddTextComponentSubstringPlayerName(_U('blip_dead'))
				EndTextCommandSetBlipName(blip)

				deadPlayerBlips[playerId] = blip
			end
		end
	end
end)


RegisterNetEvent("grp_SanitaeterUndSo:OpenByServer") -- For opening the documents menu from another resource.
AddEventHandler("grp_SanitaeterUndSo:OpenByServer", function()
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
		OpenMobileAmbulanceActionsMenu()
	else
		TriggerServerEvent('esx_craftvehicle:saeve')
		print("Keine Chance für Modder")
	end
end)

