ESX = nil
local PlayerData = {}
local isAnimal = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer


end)


RegisterNetEvent('grp_Pets:tier')
AddEventHandler('grp_Pets:tier', function()
MenuOeffnen()
end)
local hund = false
function MenuOeffnen()
    menuOpen = true
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'test', {
        title   = '[Donator]Tier auswählen',
        align   = 'top-left',
        elements = {
            {label = ('🕺Mensch(reset)'), value = 'default'},
            {label = ('🐈Katze'), value = 'katze'},
            {label = ('🐾Mops'), value = 'mops'},
            {label = ('🐩Pudel'), value = 'pudel'},
            {label = ('🦮Westy'), value = 'westy'},
            {label = ('🐇Hase'), value = 'hase'}
        }
    }, function(data, menu)
        
		local playerPed = GetPlayerPed(-1)
		local player = GetPlayerPed(-1)
		
		if data.current.value == 'default' then
		PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
		SetEntityInvincible(playerPed, false)
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
          local model = nil

          if skin.sex == 0 then
            model = GetHashKey("mp_m_freemode_01")
          else
            model = GetHashKey("mp_f_freemode_01")
          end

          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(1)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)

          TriggerEvent('skinchanger:loadSkin', skin)
          TriggerEvent('esx:restoreLoadout')
		  hund = false
		  
        end)
		isAnimal = false
        elseif data.current.value == 'katze' then
		local ped = 'a_c_cat_01'
		local hash = GetHashKey(ped)
		PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
		RequestModel(hash)
			while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
		end	
		SetPlayerModel(PlayerId(), hash)
		SetEntityInvincible(playerPed, true)
		isAnimal = false
		hund = false
		elseif data.current.value == 'mops' then
		local ped = 'a_c_pug'
		local hash = GetHashKey(ped)
		PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
		RequestModel(hash)
		while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
		SetPlayerModel(PlayerId(), hash)
		SetEntityInvincible(playerPed, true)
		isAnimal = true
		hund = true
		SetEntityInvincible(playerPed, true)
		elseif data.current.value == 'pudel' then
		local ped = 'a_c_poodle'
		local hash = GetHashKey(ped)
		PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
		RequestModel(hash)
		while not HasModelLoaded(hash)
		do RequestModel(hash)
				Citizen.Wait(0)
		end	
		SetPlayerModel(PlayerId(), hash)
		SetEntityInvincible(playerPed, true)
		isAnimal = true
		hund = true
		SetEntityInvincible(playerPed, true)
		elseif data.current.value == 'westy' then
		local ped = 'a_c_westy'
		local hash = GetHashKey(ped)
		PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
		RequestModel(hash)
		while not HasModelLoaded(hash)
		do RequestModel(hash)
			Citizen.Wait(0)
		end	
		SetPlayerModel(PlayerId(), hash)
		SetEntityInvincible(playerPed, true)
		isAnimal = true
		hund = true
		elseif data.current.value == 'hase' then
		local ped = 'a_c_rabbit_01'
		local hash = GetHashKey(ped)
		PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
		RequestModel(hash)
		while not HasModelLoaded(hash)
		do RequestModel(hash)
			Citizen.Wait(0)
		end	
		SetPlayerModel(PlayerId(), hash)
		SetEntityInvincible(playerPed, true)
		isAnimal = true
		hund = false
        end
    end, function(data, menu)
        menuOpen = false
        menu.close()
    end)
end

local animations = {
	{ dictionary = "creatures@rottweiler@amb@sleep_in_kennel@", animation = "sleep_in_kennel", name = "Lay Down", },
	{ dictionary = "creatures@rottweiler@amb@world_dog_barking@idle_a", animation = "idle_a", name = "Bark", },
	{ dictionary = "creatures@rottweiler@amb@world_dog_sitting@base", animation = "base", name = "Sit", },
	{ dictionary = "creatures@rottweiler@amb@world_dog_sitting@idle_a", animation = "idle_a", name = "Itch", },
	{ dictionary = "creatures@rottweiler@indication@", animation = "indicate_high", name = "Draw Attention", },
	{ dictionary = "creatures@rottweiler@melee@", animation = "dog_takedown_from_back", name = "Attack", },
	{ dictionary = "creatures@rottweiler@melee@streamed_taunts@", animation = "taunt_02", name = "Taunt", },
	{ dictionary = "creatures@rottweiler@swim@", animation = "swim", name = "Swim", },
}

local emotePlaying = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		local Key = 24
		local Key2 = 45
		local playerPed = GetPlayerPed(-1)
			
			if ((IsControlJustPressed(1, Key)) or (IsControlJustPressed(1, Key2))) and isAnimal then
				SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
				exports['mythic_notify']:DoHudText('inform', 'Du bist ein Tier, Du hast keine Chance!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
				Citizen.Wait(2000)
			end
			
			if hund then
			local ped = PlayerPedId()
			DrawAdvancedText(0.891, 0.953, 0.005, 0.0028, 0.4, "Drücke [G] um das Animationsmenü zu öffnen.", 255, 255, 255, 255, 6, 0)
				if IsControlJustPressed(1, 47) then
				menuauf()				
				end
				if emotePlaying then
				if IsControlPressed(0, 73) then
                cancelEmote()
				end
			end
		end
	end
end)


function menuauf()
	ESX.UI.Menu.CloseAll()
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gg', {
		title    = 'Animationsmenü',
		align    = 'top-left',
		elements = {
			{label = ('Kratzen'), value = 'eins'},
			{label = ('Hinsetzen'), value = 'einseins'},
			{label = ('Hinlegen'), value = 'einseinseins'},
			{label = ('Schütteln'), value = 'zwei'},
			{label = ('Bellen'), value = 'zweizwei'},
			{label = ('Tanzen'), value = 'zweizweizwei'},
			{label = ('Schlafen/Tot stellen'), value = 'drei'},
			{label = ('Schlafen/Tot stellen 2'), value = 'dreidrei'},
			{label = ('menü schliessen'), value = 'dddd'},
			
	}}, function(data, menu)
			local coordsrunter = { x = -1652.73,  y = -919.64, z = 0.46}
			local playerPed = GetPlayerPed(-1)
		    if data.current.value == 'eins' then
			playAnimation("creatures@pug@amb@world_dog_sitting@idle_a", "idle_a")
			
		    elseif data.current.value == 'einseins' then
			playAnimation("creatures@pug@amb@world_dog_sitting@idle_a", "idle_b")
			
		    elseif data.current.value == 'einseinseins' then
			playAnimation("creatures@pug@amb@world_dog_sitting@idle_a", "idle_c")
		    elseif data.current.value == 'zwei' then
			playAnimation("creatures@pug@amb@world_dog_barking@idle_a", "idle_c")
			
		    elseif data.current.value == 'zweizwei' then
			playAnimation("creatures@pug@amb@world_dog_barking@idle_a", "idle_a")
			
		    elseif data.current.value == 'zweizweizwei' then
			playAnimation("creatures@pug@move", "idle_turn_0")
		    elseif data.current.value == 'drei' then
			playAnimation("creatures@pug@move", "dead_right")
			
		    elseif data.current.value == 'dreidrei' then
			playAnimation("creatures@pug@move", "dead_left")
		    elseif data.current.value == 'dddd' then
			menu.close()
		end
	end)
end



function playAnimation(dictionary, animation)
	if emotePlaying then
		cancelEmote()
	end
	RequestAnimDict(dictionary)
	while not HasAnimDictLoaded(dictionary) do
		Wait(1)
	end
	TaskPlayAnim(GetPlayerPed(-1), dictionary, animation, 8.0, 0.0, -1, 1, 0, 0, 0, 0)
	emotePlaying = true
end


function cancelEmote()
	ClearPedTasksImmediately(GetPlayerPed(-1))
	emotePlaying = false
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