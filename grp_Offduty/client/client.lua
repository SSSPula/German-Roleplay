local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}



ESX                           = nil
local PlayerData              = {}
local Keys                      = {}
local xPlayer                   = {}


Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  ESX.PlayerData.job = job
end)

function hintToDisplay(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end


Citizen.CreateThread(function()

	exports['bt-target']:AddBoxZone("PolizeiDuty", vector3(441.79, -982.07, 30.69), 0.4, 0.6, {
	name="PolizeiDuty",
	heading=91,
	debugPoly=false,
	minZ=30.79,
	maxZ=30.99
    }, {
        options = {
            {
                event = "grp_Offduty:oeffnen",
                icon = "far fa-clipboard",
                label = "Dienstblatt",
            },
        },
        job = {"police", "sheriff", "offpolice", "offsheriff"},
        distance = 1.5
    })
	exports['bt-target']:AddBoxZone("AmbuDuty", vector3(307.55, -595.34, 43.12), 0.4, 0.6, {
	name="AmbuDuty",
	heading=63,
	debugPoly=false,
	minZ=43.12,
	maxZ=43.32
    }, {
        options = {
            {
                event = "grp_Offduty:oeffnen",
                icon = "far fa-clipboard",
                label = "Dienstblatt",
            },
        },
        job = {"ambulance", "offambulance"},
        distance = 1.5
    })
	exports['bt-target']:AddBoxZone("SherrDuty", vector3(1852.50, 3687.22, 34.36), 0.4, 0.6, {
	name="SherrDuty",
	heading=200,
	debugPoly=false,
	minZ=34.36,
	maxZ=34.56
    }, {
        options = {
            {
                event = "grp_Offduty:oeffnen",
                icon = "far fa-clipboard",
                label = "Dienstblatt",
            },
        },
        job = {"police", "sheriff", "offpolice", "offsheriff"},
        distance = 1.5
    })
end)




RegisterNetEvent('grp_Offduty:oeffnen')
AddEventHandler('grp_Offduty:oeffnen', function()
OpenDutyMenu()

end)






function LogIn()
	Citizen.CreateThread(function()
		local ped = PlayerPedId()	
		RequestAnimDict("gestures@f@standing@casual")
		Citizen.Wait(100)
		TaskPlayAnim((ped), 'gestures@f@standing@casual', 'gesture_hand_down', 8.0, 8.0, -1, 81, 0, 0, 0, 0)
		Citizen.Wait(1200)
		ClearPedTasks(ped)
	end)
end

function Typing()
	Citizen.CreateThread(function()
		local ped = PlayerPedId()	
		RequestAnimDict("mp_fbi_heist")
		Citizen.Wait(100)
		TaskPlayAnim((ped), 'mp_fbi_heist', 'loop', 8.0, 8.0, -1, 81, 0, 0, 0, 0)
		Citizen.Wait(5000)
		ClearPedTasks(ped)
	end)
end

function DrawText3D(x,y,z, text)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local p = GetGameplayCamCoords()
	local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
	local scale = (1 / distance) * 2
	local fov = (1 / GetGameplayCamFov()) * 100
	local scale = scale * fov
	if onScreen then
		  SetTextScale(0.35, 0.35)
		  SetTextFont(4)
		  SetTextProportional(1)
		  SetTextColour(255, 255, 255, 215)
		  SetTextEntry("STRING")
		  SetTextCentre(1)
		  AddTextComponentString(text)
		  DrawText(_x,_y)
		  local factor = (string.len(text)) / 370
		  DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 255, 11, 41, 1000)
	  end
end

function OpenDutyMenu()
ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'on_duty',
            {
                title = _U('duty_menu'),
                align = 'right',
                elements = {
                    {label = _U('duty'), value = 'duty'},
		            --{label = _U('leave'), value = 'unemployed'},
                },
            },
        function(data,menu)
menu.close()
        if data.current.value == 'duty' then
            OpenDuty()
        end
    end,
    function(data,menu)
        menu.close()
      end
    )
end   



function OpenDuty()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'duty',
        {
       title = _U('duty_select'),
       align = 'right',     
       elements = {
           {label = _U('onduty'), value = 'onduty'},
           {label = _U('offduty'), value = 'offduty'}
         }
    },

    function(data,menu)
        if data.current.value == 'onduty' then
            exports['progressBars']:startUI(1000, _U('log_in'))
		LogIn()
            TriggerServerEvent('russell-duty:onduty')
        ESX.ShowNotification(_U('on_success'))
	ESX.UI.Menu.CloseAll()
        elseif data.current.value == 'offduty' then
            exports['progressBars']:startUI(1000, _U('log_off'))
		LogIn()
            TriggerServerEvent('russell-duty:offduty')
        ESX.ShowNotification(_U('off_success'))
	ESX.UI.Menu.CloseAll()
           end
    end,
    function(data,menu)
        menu.close()
    end
    )
end



