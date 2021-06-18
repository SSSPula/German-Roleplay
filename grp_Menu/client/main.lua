local PlayerData



local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}

ESX = nil

local Locations = {}
local Keybinds = {}

local job = ""

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

        for k, v in pairs(Config.Menus) do
            if v.OpenCommand ~= "" then
                RegisterCommand(
                    v.OpenCommand,
                    function(source, args, rawCommand)
                        openMenu(k)
                    end
                )
            end

            if v.OpenLocations ~= nil then
                Locations[k] = v.OpenLocations

                for _, t in ipairs(v.OpenLocations) do
                    if t.blip.useBlip then
                        local blip = AddBlipForCoord(t.coords)

                        SetBlipSprite(blip, t.blip.blipSprite)
                        SetBlipScale(blip, 0.8)
                        SetBlipColour(blip, t.blip.blipColor)
                        SetBlipAsShortRange(blip, true)

                        BeginTextCommandSetBlipName("STRING")
                        AddTextComponentString(t.blip.blipText)
                        EndTextCommandSetBlipName(blip)
                    end
                end
            end
        end

        TriggerServerEvent("core_keybinds:getUserKeybinds")
    end
)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(0, 170) then
		ExecuteCommand("grpmenu")
		end
	end
end)		



RegisterNetEvent("core_keybinds:getUserKeybinds_c")
AddEventHandler(
    "core_keybinds:getUserKeybinds_c",
    function(k)
        if k == false then
            for k, v in pairs(Config.DefaultKeybinds) do
                Keybinds[k] = v
            end
        else
            Keybinds = k
        end
    end
)

function openKeybinds()
    SetNuiFocus(true, true)

    SendNUIMessage(
        {
            type = "keybinds",
            keybinds = Config.Keybinds,
            current = Keybinds
        }
    )

    Keybinds = {}
end

function openMenu(name)
    if Config.Menus[name] == nil then
        SendTextMessage(Config.Text["no_such_menu"])
        return
    end

    local menu = Config.Menus[name]

    local ped = GetPlayerPed(-1)
	local pedcar = GetVehiclePedIsIn(ped, false)
    if menu.OnlyVehicle then
        if GetPedInVehicleSeat(pedcar, -1) ~= ped then
            SendTextMessage(Config.Text["not_in_vehicle"])
            return
        end
    end

    if #menu.JobWhitelist ~= 0 then
        local whitelisted = false
        for _, v in ipairs(menu.JobWhitelist) do
            if v == job then
                whitelisted = true
            end
        end

        if not whitelisted then
            SendTextMessage(Config.Text["not_whitelisted"])
            return
        end
    end

    SetNuiFocus(true, true)
    SendNUIMessage(
        {
            type = "menu",
            label = menu.Label,
            boxes = menu.Boxes,
            fill = menu.Fill,
            close = menu.CloseOnClick,
            job = job
        }
    )
end

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)

            local ped, pedcoords

            ped = GetPlayerPed(-1)
            pedcoords = GetEntityCoords(ped)

            for k, v in pairs(Keybinds) do
                if IsControlJustReleased(1, Keys[k]) then
                    ExecuteCommand(v)
                end
            end

            for k, v in pairs(Locations) do
                for _, g in ipairs(v) do
                    local lcoords = g.coords
                    local dst = #(lcoords - pedcoords)

                    if dst < g.marker.markerSize then
                        DrawText3D(lcoords[1], lcoords[2], lcoords[3], g.text)
                        if IsControlJustReleased(0, Keys["E"]) then
                            openMenu(k)
                        end
                    end
                    if dst < 50 then
                        DrawMarker(
                            g.marker.markerType,
                            lcoords[1],
                            lcoords[2],
                            lcoords[3] - 0.95,
                            0.0,
                            0.0,
                            0.0,
                            0.0,
                            0.0,
                            0.0,
                            g.marker.markerSize,
                            g.marker.markerSize,
                            1.0,
                            g.marker.markerColor[1],
                            g.marker.markerColor[2],
                            g.marker.markerColor[3],
                            100,
                            false,
                            true,
                            2,
                            true,
                            false,
                            false,
                            false
                        )
                    end
                end
            end
        end
    end
)

RegisterCommand(
    Config.OpenKeyBindsCommand,
    function()
        openKeybinds()
    end
)

RegisterNUICallback(
    "close",
    function(data)
        SetNuiFocus(false, false)
    end
)

RegisterNUICallback(
    "registerKeybind",
    function(data)
        if Keys[data["key"]] ~= nil and Config.BlockKeys[data["key"]] == nil then
            Keybinds[data["key"]] = data["command"]

            TriggerServerEvent("core_keybinds:saveKeybind", data["key"], data["command"])
        else
            SendTextMessage(string.format(Config.Text["key_not_usable"], data["key"]))
        end
    end
)

RegisterNUICallback(
    "updateKeybinds",
    function(data)
        TriggerServerEvent("core_keybinds:updateKeybinds", Keybinds)
    end
)

function doorControl(indx)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsIn(ped, false)

    if GetVehicleDoorAngleRatio(veh, indx) ~= 0 then
        SetVehicleDoorShut(veh, indx, 1)
    else
        SetVehicleDoorOpen(veh, indx, 0, 1)
    end
end

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px, py, pz, x, y, z, 1)

    local scale = ((1 / dist) * 2) * (1 / GetGameplayCamFov()) * 100

    if onScreen then
        SetTextColour(255, 255, 255, 255)
        SetTextScale(0.0 * scale, 0.35 * scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextCentre(true)

        SetTextDropshadow(1, 1, 1, 1, 255)

        BeginTextCommandWidth("STRING")
        AddTextComponentString(text)
        local height = GetTextScaleHeight(0.55 * scale, 4)
        local width = EndTextCommandGetWidth(4)

        SetTextEntry("STRING")
        AddTextComponentString(text)
        EndTextCommandDisplayText(_x, _y)
    end
end

--VEHICLE CONTROL TRIGGERS

RegisterNUICallback(
    "frontLeft",
    function(data)
        doorControl(0)
    end
)

RegisterNUICallback(
    "frontRight",
    function(data)
        doorControl(1)
    end
)

RegisterNUICallback(
    "backRight",
    function(data)
        doorControl(3)
    end
)

RegisterNUICallback(
    "backLeft",
    function(data)
        doorControl(2)
    end
)

RegisterNUICallback(
    "hood",
    function(data)
        doorControl(4)
    end
)

RegisterNUICallback(
    "trunk",
    function(data)
        doorControl(5)
    end
)


RegisterCommand("motoran", function(data)
        local ped = GetPlayerPed(-1)
        local veh = GetVehiclePedIsIn(ped, false)
        if veh ~= 0 then
            if GetIsVehicleEngineRunning(veh) then
                SetVehicleEngineOn(veh, false, false, true)
            else
                SetVehicleEngineOn(veh, true, false, true)
            end
        end
    
end)

local isInRagdoll = false

Citizen.CreateThread(function()
 while true do
    Citizen.Wait(10)
    if isInRagdoll then
      SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
	  SetPlayerInvincibleKeepRagdollEnabled(GetPlayerPed(-1), false)
    end
  end
end)



RegisterCommand("hinfallen", function(data)
   if IsPedOnFoot(PlayerPedId()) then
    if isInRagdoll then
        isInRagdoll = false
    else
        isInRagdoll = true
        Wait(500)
    end
end
end)

RegisterNUICallback(
    "startEngine",
    function(data)
        local ped = GetPlayerPed(-1)
        local veh = GetVehiclePedIsIn(ped, false)
        if veh ~= 0 then
            if GetIsVehicleEngineRunning(veh) then
                SetVehicleEngineOn(veh, false, false, true)
            else
                SetVehicleEngineOn(veh, true, false, true)
            end
        end
    end
)

--REGISTER YOUR TRIGGERS

RegisterNUICallback(
    "openadminrufen",
    function(data)
        ExecuteCommand("report")
    end
)

RegisterNUICallback(
    "bugöfnnen",
    function(data)
        ExecuteCommand("bug")
    end
)

RegisterNUICallback(
    "openAnim",
    function(data)
        ExecuteCommand("emotemenu")
    end
)



--jobverteiler

--if police then exec polizeimenu



RegisterNUICallback(
    "openID",
    function(data)
		TriggerEvent('jsfour-idcard:DewensKrasseMoeglichkeit')
		
		
    end
)

RegisterNUICallback(
    "autopian",
    function(data)
		TriggerEvent('grp_AutoDrive:vehpilot')
		
    end
)


RegisterNUICallback(
    "autorufen",
    function(data)
		    DeleteWaypoint()
	Citizen.Wait(1000)
	ExecuteCommand("veh pilot")
    end
)

RegisterNUICallback(
    "autopiaus",
    function(data)
		TriggerEvent('grp_AutoDrive:vehpilot')
		
		
		
    end
)

RegisterNUICallback(
    "openrechnnungen",
    function(data)
        TriggerEvent('esx_billing:openBillings')
    end
)

RegisterNUICallback(
    "openmarrkt",
    function(data)
        ExecuteCommand("markt")
    end
)

RegisterNUICallback(
    "openhausschluessel",
    function(data)
        TriggerEvent('loaf_keysystem:openMenu')
    end
)

RegisterNUICallback(
    "openkofefrraum",
    function(data)
        TriggerEvent('esx_truck:OpenByServer')
    end
)

RegisterNUICallback(
    "opendokumentee",
    function(data)
        TriggerEvent('Documents: OpenMenu')
    end
)



RegisterNUICallback(
    "openfrendglas",
    function(data)
        TriggerEvent('esx_extraitems:binoculars')
    end
)

RegisterNUICallback(
    "opentaschenrech",
    function(data)
        TriggerEvent('calc:calc')
    end
)




RegisterNUICallback(
    "opentableet",
    function(data)
        TriggerEvent('copnet_tablet:openTablet')
    end
)

RegisterNUICallback(
    "openfahrzeugmen",
    function(data)
        TriggerEvent('carcontrol:open')
    end
)


RegisterNUICallback(
    "rutschenmen",
    function(data)
        ExecuteCommand("shuff")
    end
)

RegisterNUICallback(
    "inventartog",
    function(data)
        ExecuteCommand("inventartog")
    end
)

RegisterNUICallback(
    "openseiteeins",
    function(data)
        openMenu("general")
    end
)

RegisterNUICallback(
    "openseitezwei",
    function(data)
        openMenu("weiter")
    end
)

RegisterNUICallback(
    "openCarControl",
    function(data)
        openMenu("vehcontrol")
    end
)


RegisterNUICallback(
    "openautopi",
    function(data)
        openMenu("autopi")
    end
)

RegisterNUICallback(
    "openTastenbelegungen",
    function(data)
        ExecuteCommand("tastenbelegung")
    end
)

RegisterNUICallback(
    "openDispatch",
    function(data)
        ExecuteCommand("dispatch")
    end
)
