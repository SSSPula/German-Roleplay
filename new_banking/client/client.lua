--================================================================================================--
--==                                VARIABLES - DO NOT EDIT                                     ==--
--================================================================================================--
ESX                         = nil
inMenu                      = true
local atbank = false
local bankMenu = true

function playAnim(animDict, animName, duration)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
	TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
	RemoveAnimDict(animDict)
end

--================================================================================================
--==                                THREADING - DO NOT EDIT                                     ==
--================================================================================================

--===============================================
--==           Base ESX Threading              ==
--===============================================
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)





--===============================================
--==             Core Threading                ==
--===============================================


RegisterNetEvent('bank:bankoeffnen')
AddEventHandler('bank:bankoeffnen', function()
openUI()
TriggerServerEvent('bank:balance')
end)



Citizen.CreateThread(function()
	local atms = { 
		506770882,
		-1126237515,
		-1364697528,
		-870868698,
		168901740,
		962420079,
		-1884707448,
		-814212222,
	}

	exports['bt-target']:AddBoxZone("FleecaWuerfelp", vector3(149.74, -1041.08, 30.37), 0.4, 0.6, {
	name="FleecaWuerfelp",
	heading=160,
	debugPoly=false,
	minZ=29.64,
	maxZ=29.84
    }, {
        options = {
            {
                event = "bank:bankoeffnen",
                icon = "fas fa-money-check-alt",
                label = "Karte einlegen",
            },
        },
        job = {"all"},
        distance = 2.5
    })
	exports['bt-target']:AddTargetModel(atms, {
        options = {
            {
                event = "bank:bankoeffnen",
                icon = "fas fa-money-check-alt",
                label = "Karte einlegen",
            },
        },
        job = {"all"},
        distance = 2.5
    })
end)




--===============================================
--==           Deposit Event                   ==
--===============================================
RegisterNetEvent('currentbalance1')
AddEventHandler('currentbalance1', function(balance)
	local id = PlayerId()
	local playerName = GetPlayerName(id)

	ESX.TriggerServerCallback('bank:getname', function(nombre, apellido)

	SendNUIMessage({
		type = "balanceHUD",
		balance = balance,
		player = nombre .. " " .. apellido
		})
	end)
end)
--===============================================
--==           Deposit Event                   ==
--===============================================
RegisterNUICallback('deposit', function(data)
	TriggerServerEvent('bank:depdewenspantossindnice1337osit', tonumber(data.amount))
	TriggerServerEvent('bank:balance')
end)

--===============================================
--==          Withdraw Event                   ==
--===============================================
RegisterNUICallback('withdrawl', function(data)
	TriggerServerEvent('bank:withddewenspantossindnice1337raw', tonumber(data.amountw))
	TriggerServerEvent('bank:balance')
end)

--===============================================
--==         Balance Event                     ==
--===============================================
RegisterNUICallback('balance', function()
	TriggerServerEvent('bank:balance')
end)

RegisterNetEvent('balance:back')
AddEventHandler('balance:back', function(balance)
	SendNUIMessage({type = 'balanceReturn', bal = balance})
end)


--===============================================
--==         Transfer Event                    ==
--===============================================
RegisterNUICallback('transfer', function(data)
	TriggerServerEvent('bank:trandewenspantossindnice1337sfer', data.to, data.amountt)
	TriggerServerEvent('bank:balance')
end)

--===============================================
--==         Result   Event                    ==
--===============================================
RegisterNetEvent('bank:result')
AddEventHandler('bank:result', function(type, message)
	SendNUIMessage({type = 'result', m = message, t = type})
end)

--===============================================
--==               NUIFocusoff                 ==
--===============================================
RegisterNUICallback('NUIFocusOff', function()
	closeUI()
end)

AddEventHandler('onResourceStop', function (resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
	closeUI()
end)

AddEventHandler('onResourceStart', function (resourceName)
	if(GetCurrentResourceName() ~= resourceName) then
		return
	end
	closeUI()
end)


--===============================================
--==            Capture Bank Distance          ==
--===============================================




function closeUI()
	inMenu = false
	SetNuiFocus(false, false)
	if Config.Animation then 
		playAnim('mp_common', 'givetake1_a', Config.AnimationTime)
		Citizen.Wait(Config.AnimationTime)
	end
	SendNUIMessage({type = 'closeAll'})
end

function openUI()
	if Config.Animation then 
		playAnim('mp_common', 'givetake1_a', Config.AnimationTime)
		Citizen.Wait(Config.AnimationTime)
	end
	inMenu = true
	SetNuiFocus(true, true)
	SendNUIMessage({type = 'openGeneral'})
end


function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
