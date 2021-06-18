local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
    ["~"] = 243, ["SHIFT"] = 155, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 111, ["N9"] = 118
}



ESX = nil

Citizen.CreateThread(function ()
	while ESX == nil do
		TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


function StaminaMechanicsOn()
	local playerYeet = GetPlayerPed(PlayerId())
	
	RestorePlayerStamina(playerYeet, Config.StaminaRatio)
	
	-- Other elements
	if Config.EnableAnimation then
		if Config.ShakeEnabled then
			ShakeCam(GetRenderingCam(), 'DRUNK_SHAKE', 0)
		end
	end
end

function StaminaMechanicsOff()
	local playerYeet = GetPlayerPed(PlayerId())
	
	RestorePlayerStamina(playerYeet, Config.StaminaDefaultRatio)
	
	-- Other elements
	if Config.EnableAnimation then
		if Config.ShakeEnabled then
			ShakeCam(GetRenderingCam(), 'DRUNK_SHAKE', 1)
		end
	end
end






Citizen.CreateThread(function()
    while true do
        N_0x4757f00bc6323cfe(-1553120962, 0.0) 
        Wait(0)
    end
end)


------------------------------------ TELEPORT WENN SPIELER ZU TIEF IST 

--Citizen.CreateThread(function()
--    while true do
--        Citizen.Wait(5000)
--        local playerCoords = GetEntityCoords(PlayerPedId())
--
--        if playerCoords.z < -70 then
--            local playerCoordsUP = GetEntityCoords(PlayerPedId())
--            playerCoordsUP = vector3(playerCoordsUP.x, playerCoordsUP.y, playerCoordsUP.z + 200)
--
--            local unusedBool, nearZ = GetGroundZFor_3dCoord(playerCoordsUP.x, playerCoordsUP.y, 99999.0, 1)
--
--            nearZ = nearZ + 2.0
--
--            playerCoordsUP = vector3(playerCoordsUP.x, playerCoordsUP.y, nearZ)
--
--            SetEntityCoords(PlayerPedId(), playerCoordsUP.x, playerCoordsUP.y, nearZ)
--        end
--
--    end
--end)


-----------------------------------
---- NO VDM DAMAGE FROM VEHICLE ----
-----------------------------------

Citizen.CreateThread( function()
	while true do
	Citizen.Wait(500)
	ResetPlayerStamina(PlayerId())
    SetBigmapActive(false, false)
	end
end)

-----------------------------------
---- Horn Flash, Made by FAXES ----
-----------------------------------

--- Config ---
RestrictEmer = false -- Only allow the feature for emergency vehicles.
lightMultiplier = 5.0 -- This is not capped, highly recommended to go above 12.0!

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		local ped = GetPlayerPed(-1)
	
		

		
		
		
        if IsPedInAnyVehicle(ped, false) then
			local veh = GetVehiclePedIsUsing(ped)
            if GetPedInVehicleSeat(veh, -1) == ped then
                if RestrictEmer then
                    if GetVehicleClass(veh) == 18 then
                        if IsDisabledControlJustPressed(0, 86) then
                            SetVehicleLights(veh, 2)
                            SetVehicleLightMultiplier(veh, lightMultiplier)
                        elseif IsDisabledControlJustReleased(0, 86) then
                            SetVehicleLights(veh, 0)
                            SetVehicleLightMultiplier(veh, 1.0)
                        end
                    end
                else
                    if IsDisabledControlJustPressed(0, 86) then
                        SetVehicleLights(veh, 2)
                        SetVehicleLightMultiplier(veh, lightMultiplier)
                    elseif IsDisabledControlJustReleased(0, 86) then
                        SetVehicleLights(veh, 0)
                        SetVehicleLightMultiplier(veh, 1.0)
                    end
                end
            end
        end
	end
end)






--anti driveby ab geschwindigkeit erst
--[[
-- Allow passengers to shoot
local passengerDriveBy = true


Citizen.CreateThread(function()
	while true do
		Wait(1)
		local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local speed = GetEntitySpeed(vehicle)
		local kmh = 3.6
		local mph = 2.23694
		local vehicleClass = GetVehicleClass(vehicle)
		local vehicleModel = GetEntityModel(vehicle)
			
			
		if vehicleClass ~= 15 and 16 then
		GetEntitySpeed(GetPedInVehicleSeat(GetPlayerPed(-1), false)) 
		-- If you want mph, then replace kmh with mph under here. If you want more or less than 30 also change it here
		if math.floor(speed*kmh) > 30 then
				SetPlayerCanDoDriveBy(PlayerId(), false)
			elseif passengerDriveBy then
				SetPlayerCanDoDriveBy(PlayerId(), true)
			else
				SetPlayerCanDoDriveBy(PlayerId(), false)
			end
		end
	end
end)
]]

Citizen.CreateThread(function()
    while true do
	Citizen.Wait(0)
	
		local playerPed = GetPlayerPed(-1)
		local playerVeh = GetVehiclePedIsIn(playerPed, false)
		SetPedMaxTimeUnderwater(playerPed, 60.00)
		if IsPedInAnyVehicle(playerPed, true) then
			DisplayRadar(true)
		else
			DisplayRadar(false)
		end
    end
end)

function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
  AddTextEntry('PM_PANE_LEAVE', '~r~-')
  AddTextEntry('PM_PANE_QUIT', '~r~Gehe Schlafen')
  AddTextEntry('PM_SCR_MAP', '~r~Karte')
  AddTextEntry('PM_SCR_GAM', '~r~Schlafen gehen')
  AddTextEntry('PM_SCR_INF', '~r~-')
  AddTextEntry('PM_SCR_SET', '~r~Muskel')
  AddTextEntry('PM_SCR_STA', '~r~Smartwatch')
  AddTextEntry('PM_SCR_GAL', '~r~iPhoto')
  AddTextEntry('PM_SCR_RPL', '~r~iMovie')
  AddTextEntry('PM_SCR_SET', '~r~Nervensystem')
  AddTextEntry('PM_PANE_DIS', '~r~Reflexe')
  AddTextEntry('PM_PANE_GFX', '~r~Auge')
  AddTextEntry('PM_PANE_AUD', '~r~Ohr')
  AddTextEntry('PM_PANE_MCON', '~r~Hand')
  AddTextEntry('PM_PANE_GPC', '~r~Schulter')
  AddTextEntry('PM_PANE_KEYS', '~r~Muskel')
  AddTextEntry('PM_PANE_CAM', '~r~Wahrnehmung')
  AddTextEntry('PM_PANE_AGFX', '~r~Kontaktlinsen')
  AddTextEntry('MO_VOUT', '~r~Mund')
  AddTextEntry('PM_SCR_RPL', '~r~iMovie')
end)

--[[
Citizen.CreateThread(function()
    local dict = "missminuteman_1ig_2"
    local lPed = GetPlayerPed(-1)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(100)
	end
    local handsup = false
	while true do
		Citizen.Wait(0)
		--if not IsPedInAnyVehicle(lPed, false) and IsPedOnFoot(lPed) then
		if IsControlJustPressed(1, 323) then --Start holding X
            if not handsup then
                TaskPlayAnim(GetPlayerPed(-1), dict, "handsup_enter", 8.0, 8.0, -1, 50, 0, false, false, false)
				local player = GetPlayerPed(-1)
				SetCurrentPedWeapon(player,GetHashKey("WEAPON_UNARMED"),true)
                handsup = true
            else
                handsup = false
                ClearPedTasks(GetPlayerPed(-1))
            end
        --end
        end
    end
end)
]]





local type = nil
local _menu = {
    {label = 'Zurücksetzen',  value = 'reset'},
    {label = 'Ultra Low Einstellung',    value = 'ulow'},
    {label = 'Low Einstellung',    value = 'low'},
    {label = 'Medium Einstellung', value = 'medium'},
}


RegisterCommand("fpsboost", function()
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fps', {
		title    = 'GRP FPS-Boost',
		align    = 'top-left',
		elements = _menu
	}, function(data, menu)
        local v = data.current.value

        
		if v == "reset" then
            RopeDrawShadowEnabled(true)
            CascadeShadowsSetAircraftMode(true)
            CascadeShadowsEnableEntityTracker(false)
            CascadeShadowsSetDynamicDepthMode(true)
            CascadeShadowsSetEntityTrackerScale(5.0)
            CascadeShadowsSetDynamicDepthValue(5.0)
            CascadeShadowsSetCascadeBoundsScale(5.0)
            
            SetFlashLightFadeDistance(10.0)
            --SetLightsCutoffDistanceTweak(10.0)
            DistantCopCarSirens(true)
           -- SetArtificialLightsState(false)
        elseif v == "ulow" then
            RopeDrawShadowEnabled(false)

            CascadeShadowsClearShadowSampleType()
            CascadeShadowsSetAircraftMode(false)
            CascadeShadowsEnableEntityTracker(true)
            CascadeShadowsSetDynamicDepthMode(false)
            CascadeShadowsSetEntityTrackerScale(0.0)
            CascadeShadowsSetDynamicDepthValue(0.0)
            CascadeShadowsSetCascadeBoundsScale(0.0)
		
			
          --  SetFlashLightFadeDistance(0.0)
           -- SetLightsCutoffDistanceTweak(0.0)
            DistantCopCarSirens(false)
        elseif v == "low" then
            RopeDrawShadowEnabled(false)

            CascadeShadowsClearShadowSampleType()
            CascadeShadowsSetAircraftMode(false)
            CascadeShadowsEnableEntityTracker(true)
            CascadeShadowsSetDynamicDepthMode(false)
            CascadeShadowsSetEntityTrackerScale(0.0)
            CascadeShadowsSetDynamicDepthValue(0.0)
            CascadeShadowsSetCascadeBoundsScale(0.0)
			
			
           -- SetFlashLightFadeDistance(5.0)
           -- SetLightsCutoffDistanceTweak(5.0)
            DistantCopCarSirens(false)
        elseif v == "medium" then
            RopeDrawShadowEnabled(true)

            CascadeShadowsClearShadowSampleType()
            CascadeShadowsSetAircraftMode(false)
            CascadeShadowsEnableEntityTracker(true)
            CascadeShadowsSetDynamicDepthMode(false)
            CascadeShadowsSetEntityTrackerScale(5.0)
            CascadeShadowsSetDynamicDepthValue(3.0)
            CascadeShadowsSetCascadeBoundsScale(3.0)
			
           -- SetFlashLightFadeDistance(3.0)
           -- SetLightsCutoffDistanceTweak(3.0)
            DistantCopCarSirens(false)
            --SetArtificialLightsState(false)
		end

        type = v
	end, function(data, menu)
		menu.close()
	end)
end)



Citizen.CreateThread(function()
    while true do
        if type == "ulow" then
            
            for ped in GetWorldPeds() do
                if not IsEntityOnScreen(ped) then
                    SetEntityAlpha(ped, 0)
                    SetEntityAsNoLongerNeeded(ped)
                else
                    if GetEntityAlpha(ped) == 0 then
                        SetEntityAlpha(ped, 255)
                    elseif GetEntityAlpha(ped) ~= 210 then
                        SetEntityAlpha(ped, 210)
                    end
                end

                SetPedAoBlobRendering(ped, false)
                Citizen.Wait(1)
            end

           
            for obj in GetWorldObjects() do
                if not IsEntityOnScreen(obj) then
                    SetEntityAlpha(obj, 0)
                    SetEntityAsNoLongerNeeded(obj)
                else
                    if GetEntityAlpha(obj) == 0 then
                        SetEntityAlpha(obj, 255)
                    elseif GetEntityAlpha(obj) ~= 170 then
                        SetEntityAlpha(obj, 170)
                    end
                end
                Citizen.Wait(1)
            end


            DisableOcclusionThisFrame()
            SetDisableDecalRenderingThisFrame()
            RemoveParticleFxInRange(GetEntityCoords(PlayerPedId()), 10.0)
            OverrideLodscaleThisFrame(0.4)
            --SetArtificialLightsState(true)
        elseif type == "low" then
            
            for ped in GetWorldPeds() do
                if not IsEntityOnScreen(ped) then
                    SetEntityAlpha(ped, 0)
                    SetEntityAsNoLongerNeeded(ped)
                else
                    if GetEntityAlpha(ped) == 0 then
                        SetEntityAlpha(ped, 255)
                    elseif GetEntityAlpha(ped) ~= 210 then
                        SetEntityAlpha(ped, 210)
                    end
                end
                SetPedAoBlobRendering(ped, false)

                Citizen.Wait(1)
            end

            
            for obj in GetWorldObjects() do
                if not IsEntityOnScreen(obj) then
                    SetEntityAlpha(obj, 0)
                    SetEntityAsNoLongerNeeded(obj)
                else
                    if GetEntityAlpha(obj) == 0 then
                        SetEntityAlpha(obj, 255)
                    elseif GetEntityAlpha(ped) ~= 210 then
                        SetEntityAlpha(ped, 210)
                    end
                end
                Citizen.Wait(1)
            end

            SetDisableDecalRenderingThisFrame()
            RemoveParticleFxInRange(GetEntityCoords(PlayerPedId()), 10.0)
            OverrideLodscaleThisFrame(0.6)
           -- SetArtificialLightsState(true)
        elseif type == "medium" then
            
            for ped in GetWorldPeds() do
                if not IsEntityOnScreen(ped) then
                    SetEntityAlpha(ped, 0)
                    SetEntityAsNoLongerNeeded(ped)
                else
                    if GetEntityAlpha(ped) == 0 then
                        SetEntityAlpha(ped, 255)
                    end
                end

                SetPedAoBlobRendering(ped, false)
                Citizen.Wait(1)
            end
        
           
            for obj in GetWorldObjects() do
                if not IsEntityOnScreen(obj) then
                    SetEntityAlpha(obj, 0)
                    SetEntityAsNoLongerNeeded(obj)
                else
                    if GetEntityAlpha(obj) == 0 then
                        SetEntityAlpha(obj, 255)
                    end
                end
                Citizen.Wait(1)
            end

            OverrideLodscaleThisFrame(0.8)
        else
            Citizen.Wait(500)
        end
        Citizen.Wait(8)
    end
end)

Citizen.CreateThread(function()
    while true do
        if type == "ulow" or type == "low" then
            ClearAllBrokenGlass()
            ClearAllHelpMessages()
            LeaderboardsReadClearAll()
            ClearBrief()
            ClearGpsFlags()
            ClearPrints()
            ClearSmallPrints()
            ClearReplayStats()
            LeaderboardsClearCacheData()
            ClearFocus()
            ClearHdArea()
            ClearPedBloodDamage(PlayerPedId())
            ClearPedWetness(PlayerPedId())
            ClearPedEnvDirt(PlayerPedId())
            ResetPedVisibleDamage(PlayerPedId())
            ClearExtraTimecycleModifier()
            ClearTimecycleModifier()
            ClearOverrideWeather()
            ClearHdArea()
            DisableVehicleDistantlights(false)
            DisableScreenblurFade()
			SetRainLevel(0.0)
            SetWindSpeed(0.0)
            Citizen.Wait(300)
        elseif type == "medium" then
            ClearAllBrokenGlass()
            ClearAllHelpMessages()
            LeaderboardsReadClearAll()
            ClearBrief()
            ClearGpsFlags()
            ClearPrints()
            ClearSmallPrints()
            ClearReplayStats()
            LeaderboardsClearCacheData()
            ClearFocus()
            ClearHdArea()
            SetWindSpeed(0.0)
            Citizen.Wait(1000)
        else
            Citizen.Wait(1500)
        end
    end
end)






--// Entity Enumerator (https://gist.github.com/IllidanS4/9865ed17f60576425369fc1da70259b2#file-entityiter-lua)
local entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enum.handle then
            enum.destructor(enum.handle)
        end
        enum.destructor = nil
        enum.handle = nil
    end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(
        function()
            local iter, id = initFunc()
            if not id or id == 0 then
                disposeFunc(iter)
                return
            end

            local enum = {handle = iter, destructor = disposeFunc}
            setmetatable(enum, entityEnumerator)

            local next = true
            repeat
                coroutine.yield(id)
                next, id = moveFunc(iter)
            until not next

            enum.destructor, enum.handle = nil, nil
            disposeFunc(iter)
        end
    )
end

function GetWorldObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function GetWorldPeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function GetWorldVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function GetWorldPickups()
    return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end







--fpsboost ende

function SetData()
	players = {}
	for i = 0, 31 do
		if NetworkIsPlayerActive( i ) then
			table.insert( players, i )
		end
	end
	
	local name = GetPlayerName(PlayerId())
	local id = GetPlayerServerId(PlayerId())
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', '~r~GermanRoleplay    ~t~| ~r~   Ausweisnummer: ' .. id ..    '    ~t~|  ~r~ Name: ~r~' .. name .. '   ~t~|')
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		SetData()
	end
end)

NetworkSetVoiceActive(false)

--bt
local anims={
    animations = {
    dict = "rcmextreme2atv",
    [1] = "idle_b",
    [2] = "idle_c",
    [3] = "idle_a", 
    [4] = "idle_d", 
    [5] = "idle_e",
    }
}
Utils = {
    LeftNacNac = function()
        local ped = GetPlayerPed(-1)
        local ad = anims.animations.dict
        local anim = anims.animations[1]
        Utils.loadAnimDict(ad)
        Utils.PlayAnim(ped, ad, anim,0.0, 0.0, 1000, 01, 0, 0, 0, 0)
        ClearPedSecondaryTask(ped)
    end,
    RightNacNac = function()
        local ped = GetPlayerPed(-1)
        local ad = anims.animations.dict
        local anim = anims.animations[2]
        Utils.loadAnimDict(ad)
        Utils.PlayAnim(ped, ad, anim,0.0, 0.0, 1000, 01, 0, 0, 0, 0)
        ClearPedSecondaryTask(ped)
    end,
    NoHandZone = function()
        local ped = GetPlayerPed(-1)
        local ad = anims.animations.dict
        local anim = anims.animations[3]
        Utils.loadAnimDict(ad)
        Utils.PlayAnim(ped, ad, anim,0.0, 0.0, 1000, 01, 0, 0, 0, 0)
        ClearPedSecondaryTask(ped)
    end,
    HopScotch = function()
        local ped = GetPlayerPed(-1)
        local ad = anims.animations.dict
        local anim = anims.animations[4]
        Utils.loadAnimDict(ad)
        Utils.PlayAnim(ped, ad, anim,0.0, 0.0, 1000, 01, 0, 0, 0, 0)
        ClearPedSecondaryTask(ped)
    end,
    Egyptian = function()
        local ped = GetPlayerPed(-1)
        local ad = anims.animations.dict
        local anim = anims.animations[5]
        Utils.loadAnimDict(ad)
        Utils.PlayAnim(ped, ad, anim,0.0, 0.0, 1000, 01, 0, 0, 0, 0)
        ClearPedSecondaryTask(ped)
    end,
    loadAnimDict = function(dict)
        while (not HasAnimDictLoaded(dict)) do
            RequestAnimDict(dict)
            Citizen.Wait(0)
        end
    end,
    PlayAnim = function(ped, ad, anim,...)
        TaskPlayAnim(ped,ad,anim,...)
    end,
    Sleep = function(wait)
        Wait(wait)
    end,
    toboolean = function(bool)
        if bool then
            return true
        else
            return false
        end
    end,
};

fnTable = {
    [1] = Utils.LeftNacNac,
    [2] = Utils.RightNacNac,
    [3] = Utils.NoHandZone,
    [4] = Utils.HopScotch,
    [5] = Utils.Egyptian,
    [6] = Utils.toboolean(true),
    [7] = 1000
};

local stunts = false

RegisterCommand("stuntman", function(source)
	ESX.TriggerServerCallback('grd_Pets:Gruppegetten', function(plyGroup)
	if plyGroup == 'superadmin' or plyGroup == 'admin' then
	
	if not stunts then
	stunts = true
	exports['mythic_notify']:SendAlert('inform', 'Stunts an')
	else
	stunts = false
	exports['mythic_notify']:SendAlert('inform', 'Stunts aus')
	end
	
	else
	exports['mythic_notify']:SendAlert('error', 'Du musst Admin sein.!', 2500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	end
	end)
	
	
end)

--Dewens kleine Schabernak-Spielerei

RegisterCommand("gewitter", function(source)
	ESX.TriggerServerCallback('grd_Pets:Gruppegetten', function(plyGroup)
	if plyGroup == 'superadmin' or plyGroup == 'admin' then
	ForceLightningFlash()
	else
	exports['mythic_notify']:SendAlert('error', 'Du musst Admin sein.!', 2500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	end
end)
end)




Citizen.CreateThread(function()
    while true do
       -- if fnTable[6] then
        local ped = GetPlayerPed(-1)
        local veh = GetVehiclePedIsIn(ped, false)
        local model = GetEntityModel(veh)
        local ragdoll = IsPedRagdoll(ped)
        local bicycle = IsThisModelABicycle(model)
        local motorcycle = IsThisModelABike(model)
        local veh = GetVehiclePedIsIn(ped, false)
        local schonan = false
        if (motorcycle and not ragdoll) or (not ragdoll and bicycle) then
       -- if IsControlPressed(0, Keys["SHIFT"]) then
		if stunts then
            if IsControlJustReleased(0, Keys["N6"]) then
                if not schonan then
				local ped = PlayerPedId()
                ClearPedSecondaryTask(ped)
				ClearPedTasks(ped)
                exports['mythic_notify']:SendAlert('inform', 'Stunts beendet')
                else
				ClearPedTasks(ped)
                ClearPedSecondaryTask(ped)
				schonan = false
				end




            elseif IsControlJustReleased(0, Keys["N4"]) then 
               if not schonan then
				schonan = true
                local ped = GetPlayerPed(-1)
				local ad = anims.animations.dict
				local anim = anims.animations[2]
				ClearPedTasks(ped)
				ClearPedSecondaryTask(ped)
				Utils.loadAnimDict(ad)
				Utils.PlayAnim(ped, ad, anim,0.0, 0.0, 1000, 01, 0, 0, 0, 0)
                
                exports['mythic_notify']:SendAlert('inform', 'Trick bereit: Rechter Nic Nac! Numpad 4 ')
                else
				ClearPedTasks(ped)
                ClearPedSecondaryTask(ped)
				schonan = false
				end



            elseif IsControlJustReleased(0, Keys["N5"]) then 
                if not schonan then
				schonan = true
                local ped = GetPlayerPed(-1)
				local ad = anims.animations.dict
				local anim = anims.animations[3]
				ClearPedTasks(ped)
				ClearPedSecondaryTask(ped)
				Utils.loadAnimDict(ad)
				Utils.PlayAnim(ped, ad, anim,0.0, 0.0, 1000, 01, 0, 0, 0, 0)
                
                exports['mythic_notify']:SendAlert('inform', 'Trick bereit: Ohne Hände! Numpad 5 ')
                else
				ClearPedTasks(ped)
                ClearPedSecondaryTask(ped)
				schonan = false
				end





            elseif IsControlJustReleased(0, Keys["N8"]) then
                if not schonan then
				schonan = true
                local ped = GetPlayerPed(-1)
				local ad = anims.animations.dict
				local anim = anims.animations[4]
				ClearPedTasks(ped)
				ClearPedSecondaryTask(ped)
				Utils.loadAnimDict(ad)
				Utils.PlayAnim(ped, ad, anim,0.0, 0.0, 1000, 01, 0, 0, 0, 0)
                
                exports['mythic_notify']:SendAlert('inform', 'Trick bereit: Springen! Numpad 8 ')
              else
				ClearPedTasks(ped)
                ClearPedSecondaryTask(ped)
				schonan = false
				end




                
            elseif IsControlJustReleased(0, Keys["N7"]) then 
                if not schonan then
				schonan = true
                local ped = GetPlayerPed(-1)
				local ad = anims.animations.dict
				local anim = anims.animations[5]
				ClearPedTasks(ped)
				ClearPedSecondaryTask(ped)
				Utils.loadAnimDict(ad)
				Utils.PlayAnim(ped, ad, anim,0.0, 0.0, 1000, 01, 0, 0, 0, 0)
				
                exports['mythic_notify']:SendAlert('inform', 'Trick bereit: Ägypter! Numpad 7 ')
                else
				ClearPedTasks(ped)
                ClearPedSecondaryTask(ped)
				schonan = false
				end
            end
        end
        end
        --end
       -- end
        Citizen.Wait(0)
    end
end)

--

--underglow


local light = false
local sound = false


RegisterCommand("ugan", function(source)
	ESX.TriggerServerCallback('grd_Pets:Gruppegetten', function(plyGroup)
	if plyGroup == 'superadmin' or plyGroup == 'admin' then
	
	ugan()
	
	else
	exports['mythic_notify']:SendAlert('error', 'Du musst Admin sein.!', 2500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	end
	end)
	

end)

RegisterCommand("ugaus", function(source)
	
	ESX.TriggerServerCallback('grd_Pets:Gruppegetten', function(plyGroup)
	if plyGroup == 'superadmin' or plyGroup == 'admin' then
	
	ugaus()
	
	else
	exports['mythic_notify']:SendAlert('error', 'Du musst Admin sein.!', 2500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	end
	end)

end)
	

function ugan()
local ped = GetPlayerPed(-1)
		if IsPedSittingInAnyVehicle(ped) then
			local veh = GetVehiclePedIsUsing(ped)
			if DoesEntityExist(veh) and (IsThisModelACar(GetEntityModel(veh)) or IsThisModelABike(GetEntityModel(veh)))  then
				
				PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
				SetNotificationTextEntry("STRING");
				AddTextComponentString("~r~Unterbodenbeleuchtung: ~g~an" );
				DrawNotification(false, true);
					if (light == false) then
					  light = true
					 while (light == true) do
						SetVehicleNeonLightsColour(veh,255,0,0) 
						SetVehicleNeonLightEnabled(veh,0,true)
						SetVehicleNeonLightEnabled(veh,1,true)
						SetVehicleNeonLightEnabled(veh,2,true)
						SetVehicleNeonLightEnabled(veh,3,true)
						Citizen.Wait(300)
						SetVehicleNeonLightsColour(veh,255,215,0) 
						Citizen.Wait(300)
						SetVehicleNeonLightsColour(veh,255,255,0)
						Citizen.Wait(300)
						SetVehicleNeonLightsColour(veh,0,255,0)
						Citizen.Wait(300)
						SetVehicleNeonLightsColour(veh,8,146,208)
						Citizen.Wait(300)
						SetVehicleNeonLightsColour(veh,0,0,255)
						Citizen.Wait(300)
						SetVehicleNeonLightsColour(veh,128,0,128)
						Citizen.Wait(300)
						SetVehicleNeonLightsColour(veh,255,105,180)
						Citizen.Wait(300)
					end
				end	
			 
		end
	end
end


function ugaus()
	local ped = GetPlayerPed(-1)
	if IsPedSittingInAnyVehicle(ped) then
		local veh = GetVehiclePedIsUsing(ped)
		if DoesEntityExist(veh) and (IsThisModelACar(GetEntityModel(veh)) or IsThisModelABike(GetEntityModel(veh)))  then
			
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
			SetNotificationTextEntry("STRING");
			AddTextComponentString("~r~Unterbodenbeleuchtung: ~r~aus" );
			DrawNotification(false, true);
				if (light == true) then
					SetVehicleNeonLightsColour(veh,255,0,0)
					SetVehicleNeonLightEnabled(veh,0,false)
					SetVehicleNeonLightEnabled(veh,1,false)
					SetVehicleNeonLightEnabled(veh,2,false)
					SetVehicleNeonLightEnabled(veh,3,false)
					light = false
				end
			
		end
	end	
end


--unterbodenbeleuchtung ende

