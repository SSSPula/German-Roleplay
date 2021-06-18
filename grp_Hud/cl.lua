local health = 0
local armor = 0
local food = 0
local thirst = 0
local oxygen = 100
local tension = 0
local posi = "bottom"
local isTalking = false
local isMuted = false
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()  -- Thread to remove health and armour hud
    local minimap = RequestScaleformMovie("minimap")
    SetRadarBigmapEnabled(true, false)
    Wait(10)
    SetRadarBigmapEnabled(false, false)
    while true do
        Wait(100)
        BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()	
    end
end)

function doUpdate()
	if IsEntityDead(GetPlayerPed(-1)) then
		health = 0
	else
		health = math.ceil(GetEntityHealth(GetPlayerPed(-1)) - 100)
	end
	armor = math.ceil(GetPedArmour(GetPlayerPed(-1)))
	oxygen = math.ceil(GetPlayerUnderwaterTimeRemaining(PlayerId())) * 4
	local r = exports['saltychat']:GetVoiceRange()
	
	SendNUIMessage({
		posi = posi,
		show = IsPauseMenuActive(),  -- Disable hud if settings menu is active
		health = health,
		armor = armor,
		food = food,
		thirst = thirst,
		oxygen = oxygen,
		tension = tension,
		talking = isTalking,
		muted = isMuted,
		range = r
	})
end

Citizen.CreateThread(	 -- Thread to move the minimap position and disable north blip
  function()
    local minimap = RequestScaleformMovie("minimap")
    while not HasScaleformMovieLoaded(minimap) do
      Wait(0)
    end
    SetMinimapComponentPosition("minimap", "L", "B", -0.0045, 0.002, 0.150, 0.188888)
    SetMinimapComponentPosition("minimap_mask", "L", "B", 0.020, 0.032, 0.111, 0.159)
    SetMinimapComponentPosition("minimap_blur", "L", "B", -0.03, 0.002, 0.266, 0.237)
	SetBlipAlpha(GetNorthRadarBlip(), 0)

  end
)

AddEventHandler('playerSpawned', function()  -- Enable hud only after player spawn
	Citizen.CreateThread(function()
		Wait(100)
		while true do 
			Wait(100)
			doUpdate()
		end
	end)
end)

RegisterNetEvent("SaltyChat_TalkStateChanged")
AddEventHandler("SaltyChat_TalkStateChanged", function(t)
	isTalking = t
	doUpdate()
end)

RegisterNetEvent("SaltyChat_MicStateChanged")
AddEventHandler("SaltyChat_MicStateChanged", function(t)
	isMuted = t
	doUpdate()
end)

