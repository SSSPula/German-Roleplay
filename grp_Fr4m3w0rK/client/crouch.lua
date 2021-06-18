

----Schläge machen weniger Schaden.
--Citizen.CreateThread(function()
--    while true do
--	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.48) 
--	Wait(0)
--    end
--end)
--Stop Seat Shuffle when in vehicle.
CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped, false) and not disabled then
            local veh = GetVehiclePedIsIn(ped, false)
            if GetPedInVehicleSeat(veh, 0) == ped then
                if not GetIsTaskActive(ped, 164) and GetIsTaskActive(ped, 165) then
                    SetPedIntoVehicle(PlayerPedId(), veh, 0)
                end
            end
        end
    end
end)


RegisterCommand("shuff", function()
    CreateThread(function()
        disabled = true
        Wait(3000)
        disabled = false
    end)
end)

RegisterCommand("rutschen", function()
    CreateThread(function()
        disabled = true
        Wait(3000)
        disabled = false
    end)
end)


--grp_LeaveEngineRunnign
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = GetPlayerPed(-1)
		if DoesEntityExist(ped) and IsPedInAnyVehicle(ped, false) and IsControlPressed(2, 75) and not IsEntityDead(ped) and not IsPauseMenuActive() then
			local engineWasRunning = GetIsVehicleEngineRunning(GetVehiclePedIsIn(ped, true))
			Citizen.Wait(1000)
			if DoesEntityExist(ped) and not IsPedInAnyVehicle(ped, false) and not IsEntityDead(ped) and not IsPauseMenuActive() then
				local veh = GetVehiclePedIsIn(ped, true)
				if (engineWasRunning) then
					SetVehicleEngineOn(veh, true, true, true)
				end
			end
		end
	end
end)

--grp_No Streetnames

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		HideHudComponentThisFrame(3) -- CASH
		HideHudComponentThisFrame(4) -- MP CASH
--		HideHudComponentThisFrame(2) -- weapon icon
		HideHudComponentThisFrame(9) -- STREET NAME
		HideHudComponentThisFrame(7) -- Area NAME
		HideHudComponentThisFrame(8) -- Vehicle Class
		HideHudComponentThisFrame(6) -- Vehicle Name
	end
end)

--DisableCloseCombat

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		local ped = PlayerPedId()
            	if IsPedArmed(ped, 6) then
	    	DisableControlAction(1, 140, true)
            	DisableControlAction(1, 141, true)
            	DisableControlAction(1, 142, true)
        end
    end
end)

--No Explosion Vehicle



Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(5000) 
        for theveh in EnumerateVehicles() do 
            if GetEntityHealth(theveh) == 0 then 
                SetEntityAsMissionEntity(theveh, false, false) 
                DeleteEntity(theveh) 
            end
		end
    end
end)



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
	return coroutine.wrap(function()
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
	end)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end


local gates = {
	'p_barier_test_s',
	'prop_sec_barier_01a',
	'prop_sec_barier_02a',
	'prop_sec_barier_02b',
	'prop_sec_barier_03a',
	'prop_sec_barier_03b',
	'prop_sec_barier_04a',
	'prop_sec_barier_04b',
	'prop_sec_barier_base_01',
	'prop_sec_barrier_ld_01a',
	'prop_sec_barrier_ld_02a',
	'prop_gate_airport_01',
	'prop_facgate_01',
	'prop_facgate_03_l',
	'prop_facgate_03_r',
	'prop_gate_docks_ld'
}

Citizen.CreateThread(function()
   while true do
		for i=1, #gates do
			local coords = GetEntityCoords(PlayerPedId(), false)
			local gate = GetClosestObjectOfType(coords.x, coords.y, coords.z, 100.0, GetHashKey(gates[i]), 0, 0, 0)
			if gate ~= 0 then
				SetEntityAsMissionEntity(gate, 1, 1)
				DeleteObject(gate)
				SetEntityAsNoLongerNeeded(gate)
			end
		end
	   Citizen.Wait(2500)
   end
end)
