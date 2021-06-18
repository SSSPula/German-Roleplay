RegisterNetEvent("tutorial:spawn")
AddEventHandler("tutorial:spawn", function()
    DoScreenFadeOut(1000)
  	-- Here is where you set where you want to player to spawn after they complete the tutorial
	Citizen.Wait(1000)
    SetEntityCoords(GetPlayerPed(-1), tonumber("-1616.66"), tonumber("5272.48"), tonumber("6.78"), 1, 0, 0, 1)
    DoScreenFadeIn(1000)   
	TriggerEvent("InteractSound_CL:PlayOnOne", "gelandet", 0.6)
	--GiveWeaponToPed(PlayerPedId(), 0xFBAB5776, 1, false, true)
end)

local Key = 38

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        DrawMarker(1, -1813.9922265625,5601.6230273438,296.06973266602, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 0, 155, 255, 155, 0, 0, 2, 0, 0, 0, 0)
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1813.9922265625,5601.6230273438,296.06973266602, true) < 2 then
            CurrentActionMsg  = ('press_menu')
            if (IsControlJustPressed(1, Key)) then
                TriggerServerEvent("grp_tutorial:an")
            end
        end
    end
end)






