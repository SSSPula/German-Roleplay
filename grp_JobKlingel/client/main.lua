ESX = nil
local alerted = false
local timeleft = 0

local job = "unemployed"

Citizen.CreateThread(
    function()
        while ESX == nil do
            TriggerEvent(
                "esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect",
                function(obj)
                    ESX = obj
                end
            )
            Citizen.Wait(0)
        end

        while ESX.GetPlayerData().job == nil do
            Citizen.Wait(10)
        end

        job = ESX.GetPlayerData().job.name
    end
)

RegisterNetEvent("esx:setJob")
AddEventHandler(
    "esx:setJob",
    function(j)
        job = j.name
    end
)

local geklingelt

RegisterNetEvent("grp_JobKlingel:alert_c")
AddEventHandler(
    "grp_JobKlingel:alert_c",
    function(ans)
	if not geklingelt then
        if string.match(ans, job) then
            SendNotice(Config.Text["someone_is_waiting"])
        end
	geklingelt = true
	end
    end

)

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(1000)
			if geklingelt then
			Citizen.Wait(28000)
			geklingelt = false
			end
        end
    end
)

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(1000)

            if timeleft == 0 then
                alerted = false
            end

            if timeleft >= 0 then
                timeleft = timeleft - 1
            end
        end
    end
)

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(5)
            for __, v in ipairs(Config.Desks) do
                if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v.coords) < 3 then
                    if alerted then
						--marker
						DrawMarker(25, v.coords[1], v.coords[2], v.coords[3], 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 0, 155, 255, 155, 0, 0, 2, 2, 0, 0, 0)
                    else
						--marker
                        DrawMarker(25, v.coords[1], v.coords[2], v.coords[3], 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 0, 155, 255, 155, 0, 0, 2, 2, 0, 0, 0)
                        if IsControlJustReleased(0, 38) then
                            alerted = true
                            timeleft = 30
                            TriggerServerEvent("grp_JobKlingel:alert_s", v.job)
                        end
                    end
                end
            end
        end
    end
)

