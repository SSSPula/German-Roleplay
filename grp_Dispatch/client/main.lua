local currentPlate = ""
local currentType = 0

local job = ""
local grade = 0

local unitCooldown = false
local alertsToggled = true
local unitBlipsToggled = true
local callBlipsToggled = true

local callBlips = {}
local blips = {}

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
        grade = ESX.GetPlayerData().job.grade

        Citizen.Wait(2000)

        local jobInfo = {}
        jobInfo[Config.JobOne.job] = {
            color = Config.JobOne.color,
            column = 1,
            label = Config.JobOne.label,
            canRequestLocalBackup = Config.JobOne.canRequestLocalBackup,
            canRequestOtherJobBackup = Config.JobOne.canRequestOtherJobBackup,
            forwardCall = Config.JobOne.forwardCall,
            canRemoveCall = Config.JobOne.canRemoveCall
        }
        jobInfo[Config.JobTwo.job] = {
            color = Config.JobTwo.color,
            column = 2,
            label = Config.JobTwo.label,
            canRequestLocalBackup = Config.JobTwo.canRequestLocalBackup,
            canRequestOtherJobBackup = Config.JobTwo.canRequestOtherJobBackup,
            forwardCall = Config.JobTwo.forwardCall,
            canRemoveCall = Config.JobTwo.canRemoveCall
        }
        jobInfo[Config.JobThree.job] = {
            color = Config.JobThree.color,
            column = 3,
            label = Config.JobThree.label,
            canRequestLocalBackup = Config.JobThree.canRequestLocalBackup,
            canRequestOtherJobBackup = Config.JobThree.canRequestOtherJobBackup,
            forwardCall = Config.JobThree.forwardCall,
            canRemoveCall = Config.JobThree.canRemoveCall
        }

        ESX.TriggerServerCallback(
            "grp_Dispatch:getPersonalInfo",
            function(firstname, lastname)
                SendNUIMessage(
                    {
                        type = "Init",
                        firstname = firstname,
                        lastname = lastname,
                        jobInfo = jobInfo
                    }
                )
            end
        )
    end
)

RegisterNetEvent("esx:setJob")
AddEventHandler(
    "esx:setJob",
    function(j)
        job = j.name
        grade = j.grade
    end
)


RegisterCommand("dispachkgksjv0ijgssj", function(source)
	
	openDispach()

end)



RegisterCommand(
    Config.JobOne.callCommand,
    function(source, args, rawCommand)
        local msg = rawCommand:sub(5)
        local cord = GetEntityCoords(GetPlayerPed(-1))
        TriggerServerEvent(
            "grp_Dispatch:addMessage",
            msg,
            {cord[1], cord[2], cord[3]},
            Config.JobOne.job,
            5000,
            Config.callCommandSprite,
            Config.callCommandColor
        )
    end,
    false
)

RegisterCommand(
    Config.JobTwo.callCommand,
    function(source, args, rawCommand)
        local msg = rawCommand:sub(5)
        local cord = GetEntityCoords(GetPlayerPed(-1))
        TriggerServerEvent(
            "grp_Dispatch:addMessage",
            msg,
            {cord[1], cord[2], cord[3]},
            Config.JobTwo.job,
            5000,
            Config.callCommandSprite,
            Config.callCommandColor
        )
    end,
    false
)

RegisterCommand(
    Config.JobThree.callCommand,
    function(source, args, rawCommand)
        local msg = rawCommand:sub(5)
        local cord = GetEntityCoords(GetPlayerPed(-1))
        TriggerServerEvent(
            "grp_Dispatch:addMessage",
            msg,
            {cord[1], cord[2], cord[3]},
            Config.JobThree.job,
            5000,
            Config.callCommandSprite,
            Config.callCommandColor
        )
    end,
    false
)

function addBlipForCall(sprite, color, coords, text)
    local alpha = 250
    local radius = AddBlipForRadius(coords, 40.0)
    local blip = AddBlipForCoord(coords)

    SetBlipSprite(blip, sprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 1.3)
    SetBlipColour(blip, color)
    SetBlipAsShortRange(blip, false)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(tostring(text))
    EndTextCommandSetBlipName(blip)

    SetBlipHighDetail(radius, true)
    SetBlipColour(radius, color)
    SetBlipAlpha(radius, alpha)
    SetBlipAsShortRange(radius, true)

    table.insert(callBlips, blip)
    table.insert(callBlips, radius)

    while alpha ~= 0 do
        Citizen.Wait(Config.CallBlipDisappearInterval)
        alpha = alpha - 1
        SetBlipAlpha(radius, alpha)

        if alpha == 0 then
            RemoveBlip(radius)
            RemoveBlip(blip)
         
            return
        end
    end
end



function openDispach()
    if Config.JobOne.job == job or Config.JobTwo.job == job or Config.JobThree.job == job then
        SetNuiFocus(false, false)
        ESX.TriggerServerCallback(
            "grp_Dispatch:getInfo",
            function(units, calls)
                SetNuiFocus(true, true)
                SendNUIMessage(
                    {
                        type = "open",
                        units = units,
                        calls = calls,
                        job = job,
                        id = GetPlayerServerId(PlayerId())
                    }
                )
            end
        )
    end
end



RegisterNetEvent("grp_Dispatch:callAdded")
AddEventHandler(
    "grp_Dispatch:callAdded",
    function(id, call, j, cooldown, sprite, color)
        if job == j and alertsToggled then
            SendNUIMessage(
                {
                    type = "call",
                    id = id,
                    call = call,
                    cooldown = cooldown
                }
            )

            if Config.AddCallBlips then
                addBlipForCall(sprite, color, vector3(call.coords[1], call.coords[2], call.coords[3]), id)
            end
        end
    end
)

RegisterNUICallback(
    "dismissCall",
    function(data)
        local id = data["id"]:gsub("call_", "")

        TriggerServerEvent("grp_Dispatch:unitDismissed", id)
        DeleteWaypoint()
    end
)


RegisterNUICallback(
    "sendnotice",
    function(data)
        local caller = data["caller"]

        if Config.EnableUnitArrivalNotice then
            TriggerServerEvent("grp_Dispatch:arrivalNotice", caller)
        end
    end
)

RegisterNetEvent("grp_Dispatch:arrivalNotice")
AddEventHandler(
    "grp_Dispatch:arrivalNotice",
    function()
        if not unitCooldown then
            SendTextMessage(Config.Text["someone_is_reacting"])
            unitCooldown = true
            Citizen.Wait(20000)
            unitCooldown = false
        end
    end
)

RegisterNUICallback(
    "reqbackup",
    function(data)
        local j = data["job"]
        local req = data["requester"]
        local firstname = data["firstname"]
        local lastname = data["lastname"]
        SendTextMessage(Config.Text["backup_requested"])
        local cord = GetEntityCoords(GetPlayerPed(-1))
        TriggerServerEvent(
            "grp_Dispatch:addCall",
            "00-00",
            req .. " benötigt Unterstützung",
            {{icon = "fa-user-friends", info = firstname .. " " .. lastname}},
            {cord[1], cord[2], cord[3]},
            j
        )
    end
)

RegisterNUICallback(
    "toggleoffduty",
    function(data)
        ToggleDuty()
    end
)

RegisterNUICallback(
    "togglecallblips",
    function(data)
        callBlipsToggled = not callBlipsToggled

        if callBlipsToggled then
            for _, z in pairs(callBlips) do
                SetBlipDisplay(z, 4)
            end
            SendTextMessage(Config.Text["call_blips_turned_on"])
        else
            for _, z in pairs(callBlips) do
                SetBlipDisplay(z, 0)
            end

            SendTextMessage(Config.Text["call_blips_turned_off"])
        end
    end
)

RegisterNUICallback(
    "toggleunitblips",
    function(data)
        unitBlipsToggled = not unitBlipsToggled

        if unitBlipsToggled then
            addBlipsForUnits()
            SendTextMessage(Config.Text["unit_blips_turned_on"])
        else
            for _, z in pairs(blips) do
                RemoveBlip(z)
            end

            blips = {}
            SendTextMessage(Config.Text["unit_blips_turned_off"])
        end
    end
)

RegisterNUICallback(
    "togglealerts",
    function(data)
        alertsToggled = not alertsToggled

        if alertsToggled then
            SendTextMessage(Config.Text["alerts_turned_on"])
        else
            SendTextMessage(Config.Text["alerts_turned_off"])
        end
    end
)

RegisterNUICallback(
    "copynumber",
    function(data)
        SendTextMessage(Config.Text["phone_number_copied"])
    end
)

RegisterNUICallback(
    "forwardCall",
    function(data)
        local id = data["id"]:gsub("call_", "")

        SendTextMessage(Config.Text["call_forwarded"])
        TriggerServerEvent("grp_Dispatch:forwardCall", id, data["job"])
    end
)

RegisterNUICallback(
    "acceptCall",
    function(data)
        local id = data["id"]:gsub("call_", "")

        SetNewWaypoint(tonumber(data["x"]), tonumber(data["y"]))

        TriggerServerEvent("grp_Dispatch:unitResponding", id, job)
    end
)

RegisterNUICallback(
    "removeCall",
    function(data)
        local id = data["id"]:gsub("call_", "")
        SendTextMessage(Config.Text["call_removed"])
        TriggerServerEvent("grp_Dispatch:removeCall", id)
    end
)

RegisterNUICallback(
    "close",
    function(data)
        SetNuiFocus(false, false)
    end
)




--EXPORTS

exports(
    "addCall",
    function(code, title, extraInfo, coords, job, cooldown, sprite, color)
        TriggerServerEvent("grp_Dispatch:addCall", code, title, extraInfo, coords, job, cooldown or 5000, sprite or 11, color or 5)
    end
)

exports(
    "addMessage",
    function(message, coords, job, cooldown, sprite, color)
        TriggerServerEvent("grp_Dispatch:addMessage", message, coords, job, sprite, cooldown or 5000, sprite or 11, color or 5)
    end
)
