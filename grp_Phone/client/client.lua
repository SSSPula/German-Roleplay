Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil
local PhoneisOpen = false
local incall = false
local flightmode = false
local sharependingrequest = false
local sharependingname = nil
local sharependingnumber = nil
local cooldown = 30000
local source = GetPlayerServerId(PlayerId())
local eigenenummer = nil
local eigenername = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

AddEventHandler('onResourceStop', function(resource)
  if resource == GetCurrentResourceName() then
    SetNuiFocus(false, false)
  end
end)

RegisterNUICallback("close", function(data, cb)
    SetNuiFocus(false, false)
	SendNUIMessage({
		hidePhone = true
	})
	phoneopen = false

	if incall == false then
		DoPhoneAnimation('cellphone_text_out')
		SetTimeout(400, function()
			StopAnimTask(PlayerPedId(), PhoneData.AnimationData.lib, PhoneData.AnimationData.anim, 2.5)
			deletePhone()
			PhoneData.AnimationData.lib = nil
			PhoneData.AnimationData.anim = nil
		end)
	else
		DoPhoneAnimation('cellphone_text_to_call')
	end

	PhoneisOpen = false
end)

-- CONTACT
RegisterNUICallback("loadcontact", function(data, cb)
	TriggerServerEvent("grp_Phone:server:loadcontact")
end)

RegisterNUICallback("addcontact", function(data, cb)
	local name, number = data.name, data.number

	TriggerServerEvent("grp_Phone:server:addcontact", GetPlayerServerId(PlayerId()), name, number)
end)

RegisterNUICallback("editcontact", function(data, cb)
	local name, number, name2, number2 = data.name, data.number, data.name2, data.number2
	TriggerServerEvent("grp_Phone:server:editcontact", GetPlayerServerId(PlayerId()), data.name, number, name2, number2)
end)


RegisterNUICallback("addcontactfavourit", function(data, cb)
	local name, number = data.name, data.number

	TriggerServerEvent("grp_Phone:server:addcontactfavourit", GetPlayerServerId(PlayerId()), name, number)
end)

RegisterNUICallback("deletecontact", function(data, cb)
	local name, number = data.name, data.number

	TriggerServerEvent("grp_Phone:server:deletecontact", GetPlayerServerId(PlayerId()), name, number)
end)

 
-- SHARE CONTACT
RegisterNUICallback("sharecontact", function(data, cb)
	local name, number = data.name, data.number
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

	if closestPlayer ~= -1 and closestDistance <= 3.0 then
        TriggerServerEvent("grp_Phone:server:sharecontact", GetPlayerServerId(closestPlayer), name, number)
    else
		SendNotify(_U("noperson"), 2500)
	end
	--TriggerServerEvent("grp_Phone:server:sharecontact", GetPlayerServerId(PlayerId()), name, number)
end)


RegisterNetEvent("grp_Phone:client:kontaktteilen")
AddEventHandler("grp_Phone:client:kontaktteilen", function(name, number)
	local name, number = 'geteilter Kontakt', mynumber
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

	if closestPlayer ~= -1 and closestDistance <= 3.0 then
        TriggerServerEvent("grp_Phone:server:sharecontact", GetPlayerServerId(closestPlayer), name, number)
    else
		SendNotify(_U("noperson"), 2500)
	end
	--TriggerServerEvent("grp_Phone:server:sharecontact", GetPlayerServerId(PlayerId()), name, number)
end)



Citizen.CreateThread(function()
    while true do
		Citizen.Wait(1000)
		if sharependingrequest == true then
			cooldown = cooldown - 1000
			if  cooldown  == 0 then
				sharependingrequest = false
				sharependingname = nil
				sharependingnumber = nil
				cooldown = 30000
			end
		end
	end
end)

RegisterNetEvent("grp_Phone:client:sharecontact")
AddEventHandler("grp_Phone:client:sharecontact", function(name, number)
	sharependingrequest = true
	sharependingname = name
	sharependingnumber = number

	TriggerEvent("grp-notification", _U("sharecontact"), 10000)
end)






RegisterNetEvent("grp_Phone:client:acceptsharecontact")
AddEventHandler("grp_Phone:client:acceptsharecontact", function()
	if sharependingrequest == true then
		TriggerServerEvent("grp_Phone:server:addcontact", GetPlayerServerId(PlayerId()), sharependingname, sharependingnumber)

		sharependingrequest = false
		sharependingname = nil
		sharependingnumber = nil

		TriggerEvent("grp-notification", _U("sharecontactaccepted"))
	else
		TriggerEvent("grp-notification", _U("nosharecontact"))
	end
end)

RegisterNetEvent("grp_Phone:client:declinesharecontact")
AddEventHandler("grp_Phone:client:declinesharecontact", function()
	if sharependingrequest == true then
		sharependingrequest = false
		sharependingname = nil
		sharependingnumber = nil

		TriggerEvent("grp-notification",  _U("sharecontactdeclined"))
	else
		TriggerEvent("grp-notification",  _U("nosharecontact"))
	end
end)

--LOAD CONTACT
RegisterNetEvent("grp_Phone:client:loadcontact")
AddEventHandler("grp_Phone:client:loadcontact", function(html)
    SendNUIMessage({
      showContacts = true,
      html = html
    })
end)


-- NORMAL
local hasnumber = false
local hasphone = false
local isprogess = false
local phoneopen = false
local mynumber = nil
local firstTime = true

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		if IsControlJustReleased(0, 288) then
			if firstTime == true then
				TriggerServerEvent("grp_Phone:server:setvalues", GetPlayerServerId(PlayerId()), Config.backgroundurl, Config.darkbackgroundurl)
				SendNUIMessage({
					setvalues = true,
					backgroundurl = Config.backgroundurl ,
					darkbackgroundurl = Config.darkbackgroundurl ,
				})
				firstTime = false
			end
			
			
			if incall == true and phoneopen == true then 
				SendNUIMessage({
					hidePhone = true
				})
				phoneopen = false 
			else
				if isprogess == false then
					TriggerServerEvent("grp_Phone:server:checkphone", GetPlayerServerId(PlayerId()))
					isprogess = true
					Wait(100)
					if hasphone == true then
						DoPhoneAnimation('cellphone_text_in')
						if hasnumber == false then
							TriggerServerEvent("grp_Phone:server:checkphonenumber", GetPlayerServerId(PlayerId()))
						end
						Wait(100)

						TriggerServerEvent("grp_Phone:server:getphonedata", GetPlayerServerId(PlayerId()))
						TriggerServerEvent("grp_Phone:server:loadcontact", GetPlayerServerId(PlayerId()))
						newPhoneProp()
						
					else
						isprogess = false
						TriggerEvent("grp-notification", _U("needphone"))
					end
				end
			end
		end
    end
end)

RegisterNetEvent("grp_Phone:client:showphone")
AddEventHandler("grp_Phone:client:showphone", function(data, jobs)
	SetNuiFocus(true, true)
	local PlayerData = ESX.GetPlayerData()
	local business = ''
	local hasapp = 0
	local onlyboss = 0
	PhoneisOpen = false
	isprogess = false
	phoneopen = true
	for _,v in pairs(jobs) do
		if v.name == PlayerData.job.name then
			hasapp = v.hasapp
			onlyboss = v.onlyboss
		end
	end
	business = business .. string.format('<div class="phone-application" data-toggle="tooltip" id="businessicon" data-placement="bottom" data-appslot="5" data-job="%s"  title="business" data-app="business"> <i class="ApplicationIcon fas fa-briefcase"></i></div>', PlayerData.job.label )
	if hasapp ==  1 and onlyboss == 0 then
		SendNUIMessage({
			loadBusiness = true,
			business = business
		})

		SendNUIMessage({
			showPhone = true,
			data = data
		})
	elseif hasapp ==  1 and onlyboss == 1 and PlayerData.job.grade_name  == "boss" then
		SendNUIMessage({
			loadBusiness = true,
			business = business
		})

		SendNUIMessage({
			showPhone = true,
			data = data
		})
	else
		SendNUIMessage({
			showPhone = true,
			data = data,
			unemployed = true
		})
	end

	SendNUIMessage({
		updatetime = true,
		InGameTime = CalculateTimeToDisplay()
	})
end)

RegisterNetEvent("grp_Phone:client:hasphone")
AddEventHandler("grp_Phone:client:hasphone", function()
	hasphone = true
end)


RegisterNetEvent("grp_Phone:client:hasnumber")
AddEventHandler("grp_Phone:client:hasnumber", function(number)
	hasnumber = true
	mynumber = number

	SendNUIMessage({
		updatenumber = true,
		number = number
	})
end)

-- Notification
RegisterNUICallback("notification", function(data, cb)
	SendNotify(data.text, data.length)
end)

RegisterNetEvent("grp-notification")
AddEventHandler("grp-notification", function(text, length, color)
	SendNotify(text, length, color)
end)

function SendNotify(text, length2, color2)
	
	exports['mythic_notify']:DoHudText('inform', text, { ['background-color'] = '#ffffff', ['color'] = '#000000' })

	
	--[[
	local length
	local color
	if length2 ~= nil then
		length = length2
	else
		length = 2500
	end
	
	print(color2)
	if color2 ~= nil then
		color = color2
	else
		color = "rgba(32, 32, 32, 0.4)"
	end

	SendNUIMessage({
		showNotification = true,
		--type = type,
		text = text,
		length = length,
		color = color
	})
	]]
	
end


-- MESSAGE
RegisterNUICallback("loadmessage", function(data, cb)
	local number =data.number
	TriggerServerEvent("grp_Phone:server:loadmessage", GetPlayerServerId(PlayerId()),  number)
end)

RegisterNUICallback("loadrecentmessage", function(data, cb)
	TriggerServerEvent("grp_Phone:server:loadrecentmessage", GetPlayerServerId(PlayerId()))
end)

RegisterNUICallback("sendgps", function(data, cb)
	local number = data.number
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	local position = {x = coords.x, y = coords.y, z = coords.z-1}
	
	TriggerServerEvent("grp_Phone:server:sendgps", GetPlayerServerId(PlayerId()), number, position)
end)

RegisterNUICallback("setgps", function(data, cb)
	local x = tonumber(data.x)
	local y = tonumber(data.y)

	SetNewWaypoint(x, y)
	TriggerEvent("grp-notification", _U("waypointset"))
end)


RegisterNUICallback("sendmessage", function(data, cb)
	local message = data.message
	local  number = data.number

	TriggerServerEvent("grp_Phone:server:sendmessage", GetPlayerServerId(PlayerId()), message, number)
end)

RegisterNetEvent("grp_Phone:client:loadmessages")
AddEventHandler("grp_Phone:client:loadmessages", function(html)
    SendNUIMessage({
      showMessages = true,
      html = html
    })
end)

RegisterNetEvent("grp_Phone:client:loadrecentmessages")
AddEventHandler("grp_Phone:client:loadrecentmessages", function(html)
    SendNUIMessage({
      showRecentMessages = true,
      html = html
	})
end)


-- SETTINGS
RegisterNUICallback("flightmode", function(data, cb)
	local state = data.state
	if state == 1 then
		flightmode = true
	else
		flightmode = false
	end
	
end)

RegisterNUICallback("changewallpaper", function(data, cb)
	local url = data.url

	TriggerServerEvent("grp_Phone:server:changewallpaper", GetPlayerServerId(PlayerId()), url)
end)

RegisterNetEvent("grp_Phone:client:changewallpaper")
AddEventHandler("grp_Phone:client:changewallpaper", function(url)
    SendNUIMessage({
      changeWallpaper = true,
      url = url
    })
end)


RegisterNUICallback("changedarkmode", function(data, cb)
	local state = data.state

	TriggerServerEvent("grp_Phone:server:changedarkmode", GetPlayerServerId(PlayerId()), state)
end)

RegisterNetEvent("grp_Phone:client:changedarkmode")
AddEventHandler("grp_Phone:client:changedarkmode", function(state)
    SendNUIMessage({
		changedarkmode = true,
		state = state
    })
end)

-- NOTHING SPECIAL
--[[
RegisterNUICallback("print", function(data, cb)
	print("NUIPRINT:")
	print(data.message)
end)
]]

-- CALL
local incallwith = nil
local wantcall = nil
local wantcallnumber = nil
local callnumber = nil

local startcallnumber = nil
RegisterNUICallback("startcall", function(data, cb)
	incall = true
	startcallnumber = data.number
	
	TriggerServerEvent("grp_Phone:server:startcall", GetPlayerServerId(PlayerId()), data.number)
	DoPhoneAnimation('cellphone_text_to_call')
end)

RegisterNUICallback("stopcall", function(data, cb)
	DoPhoneAnimation('cellphone_text_in')
	TriggerServerEvent("grp_Phone:server:stopcall", GetPlayerServerId(PlayerId()), startcallnumber)
	incall = false
end)

RegisterNUICallback("endcall", function(data, cb)
	TriggerServerEvent("grp_Phone:server:endcall", GetPlayerServerId(PlayerId()), incallwith)
end)

RegisterNUICallback("declinecall", function(data, cb)
	TriggerServerEvent("grp_Phone:server:declinecall", GetPlayerServerId(PlayerId()), wantcall)
	wantcall = nil
	wantcallnumber = nil
end)

RegisterNUICallback("acceptcall", function(data, cb)
	local randomcallnumber = math.random(1000, 100000)

	TriggerServerEvent("grp_Phone:server:acceptcall", GetPlayerServerId(PlayerId()), wantcall, wantcallnumber, mynumber, randomcallnumber)
	TriggerServerEvent("grp_Phone:server:acceptcall", wantcall, GetPlayerServerId(PlayerId()), mynumber, wantcallnumber, randomcallnumber)
	wantcall = nil
	wantcallnumber = nil
	incall = true

	if PhoneisOpen then
		DoPhoneAnimation('cellphone_text_to_call')
	else
		DoPhoneAnimation('cellphone_call_listen_base')
	end
end)

RegisterNetEvent("grp_Phone:client:callrequest")
AddEventHandler("grp_Phone:client:callrequest", function(requester, requesternumber, sourcenumber, contact)
	if incall == false and flightmode == false then 
		wantcall = requester
		wantcallnumber = requesternumber
		sourcenumber = mynumber
	
		SendNUIMessage({
			incomingCall = true,
			number = requesternumber,
			contact = contact
		})
	else
		TriggerServerEvent("grp-notification", requester, _U("cantcall"), 5000)
		TriggerServerEvent("grp_Phone:server:declinecall", GetPlayerServerId(PlayerId()), requester)
	end
end)

RegisterNetEvent("grp_Phone:client:acceptcall")
AddEventHandler("grp_Phone:client:acceptcall", function(source, number, callnumber2, contactname)
	SendNUIMessage({
		acceptCall = true,
		number = number,
		contact = contactname
	  })
	  incall = true
	  incallwith = source
	  callnumber = callnumber2
	  SetNuiFocus(false, false)
	  
		TriggerServerEvent("grp_Phone:server:acceptsalty", source, GetPlayerServerId(PlayerId()))
	
end)

RegisterNetEvent("grp_Phone:client:endcall")
AddEventHandler("grp_Phone:client:endcall", function()
	SendNUIMessage({
		endcall = true
	  })
	  incall = false
	  SetNuiFocus(true, true)
	  
		TriggerServerEvent("grp_Phone:server:endsalty", incallwith, GetPlayerServerId(PlayerId()))

	
	DoPhoneAnimation('cellphone_text_in')
	  incallwith = nil
	  incall = false
end)

RegisterNetEvent("grp_Phone:client:declinecall")
AddEventHandler("grp_Phone:client:declinecall", function()
	SendNUIMessage({
		declinecall = true
	  })
end)

RegisterNetEvent("grp_Phone:client:stopcall")
AddEventHandler("grp_Phone:client:stopcall", function()
	SendNUIMessage({
		stopcall = true
	  })
end)

--[[
RegisterNUICallback("loadrecentcalls", function(data, cb)
	TriggerServerEvent("grp_Phone:server:loadrecentcalls", GetPlayerServerId(PlayerId()))
end)


RegisterNetEvent("grp_Phone:client:loadrecentcalls")
AddEventHandler("grp_Phone:client:loadrecentcalls", function(recentcalls)
	SendNUIMessage({
		loadrecentcalls = true,
		recentcalls = recentcalls,
	  })
end)
]]


-- Service
RegisterNUICallback("sendservice", function(data, cb)
	local service, message, sendnumber, number, gps = data.service, data.message, data.sendnumber, data.number, data.sendgps

	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	local position = {x = coords.x, y = coords.y, z = coords.z}

	TriggerServerEvent("grp_Phone:server:sendservicemessage", GetPlayerServerId(PlayerId()), message, service, sendnumber, gps, position)
end)

-- Business
RegisterNUICallback("showBusiness", function(data, cb)
	local job = data.job

	TriggerServerEvent("grp_Phone:server:showBusiness", GetPlayerServerId(PlayerId()), job)
end)


RegisterNetEvent("grp_Phone:client:showBusiness")
AddEventHandler("grp_Phone:client:showBusiness", function(member, onlinemember, motd)
	SendNUIMessage({
		showBusiness = true,
		member = member,
		onlinemember = onlinemember,
		motd = motd
	  })
end)


RegisterNUICallback("showBusinessMessages", function(data, cb)
	local number =data.number
	TriggerServerEvent("grp_Phone:server:loadbusinessrecentmessage", GetPlayerServerId(PlayerId()), data.job)

end)

RegisterNetEvent("grp_Phone:client:loadbusinessrecentmessage")
AddEventHandler("grp_Phone:client:loadbusinessrecentmessage", function(html)
    SendNUIMessage({
      showRecentBusinessMessages = true,
      html = html
	})
end)

RegisterNUICallback("loadbusinessmessage", function(data, cb)
	local number, job = data.number, data.job
	TriggerServerEvent("grp_Phone:server:loadbusinessmessage", GetPlayerServerId(PlayerId()), job, number)
end)

RegisterNetEvent("grp_Phone:client:loadbusinessmessages")
AddEventHandler("grp_Phone:client:loadbusinessmessages", function(html)
    SendNUIMessage({
      showBusinessMessages = true,
      html = html
    })
end)

RegisterNUICallback("sendbusinessmessage", function(data, cb)
	local message = data.message
	local  number = data.number
	local job = data.job

	TriggerServerEvent("grp_Phone:server:sendbusinessmessage", GetPlayerServerId(PlayerId()), message, number, job)
end)

RegisterNUICallback("sendbusinessgps", function(data, cb)
	local number = data.number
	local job = data.job
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	local position = {x = coords.x, y = coords.y, z = coords.z-1}
	
	TriggerServerEvent("grp_Phone:server:sendbusinessgps", GetPlayerServerId(PlayerId()), number, pos, job, position)
end)


RegisterNUICallback("changemotd", function(data, cb)
	TriggerServerEvent("grp_Phone:server:changemotd", GetPlayerServerId(PlayerId()), data.job, data.message)
end)

RegisterNUICallback("serviceaccept", function(data, cb)
	local number, job = data.number, data.job
	
	TriggerServerEvent("grp_Phone:server:serviceaccept", GetPlayerServerId(PlayerId()), job, number)
end)

RegisterNUICallback("serviceclose", function(data, cb)
	local number, job = data.number, data.job
	
	TriggerServerEvent("grp_Phone:server:serviceclose", GetPlayerServerId(PlayerId()), job, number)
end)

RegisterNetEvent("grp_Phone:client:syncbpbabutton")
AddEventHandler("grp_Phone:client:syncbpbabutton", function(number)
    SendNUIMessage({
		syncbpbabutton = true,
      	number = number
	})
end)

RegisterNetEvent("grp_Phone:client:syncclosebmessage")
AddEventHandler("grp_Phone:client:syncclosebmessage", function(number)
    SendNUIMessage({
		syncclosebmessage = true,
      	number = number
	})
end)


-- Services

RegisterNUICallback("LoadServices", function(data, cb)
	TriggerServerEvent("grp_Phone:server:loadservices", GetPlayerServerId(PlayerId()))
end)


RegisterNetEvent("grp_Phone:client:loadservices")
AddEventHandler("grp_Phone:client:loadservices", function(html)
    SendNUIMessage({
      loadservices = true,
      html = html
	})
end)


RegisterNetEvent("grp_Phone:client:playmessagesound")
AddEventHandler("grp_Phone:client:playmessagesound", function()
    SendNUIMessage({
      playmessagesound = true
	})
end)

RegisterNetEvent("grp_Phone:client:playbusinessmessagesound")
AddEventHandler("grp_Phone:client:playbusinessmessagesound", function()
    SendNUIMessage({
		playbusinessmessagesound = true
	})
end)


-- Radio
RegisterNUICallback("setRadio", function(data, cb)
	TriggerEvent("grp_Phone:client:setradio", data.freq)
end)

RegisterNUICallback("leaveRadio", function(data, cb)
	TriggerEvent("grp_Phone:client:removeradio")
end)


RegisterNetEvent("grp_Phone:client:setradio")
AddEventHandler("grp_Phone:client:setradio", function(freq)
	local frq = tonumber(freq)
	local playerName = GetPlayerName(PlayerId())
	local PlayerData = ESX.GetPlayerData()
	local canaccess = false


	if frq == 1 then
		if PlayerData.job.name ==  'police' or PlayerData.job.name ==  'sheriff' or PlayerData.job.name ==  'hitman' or PlayerData.job.name == 'doj' or PlayerData.job.name == 'fib' then
		exports['saltychat']:SetRadioChannel(freq, true)
		TriggerEvent("grp-notification", _U("setfreq", freq))
		else
		TriggerEvent("grp-notification", _U("cantsetfreq"))
		end
	elseif frq == 2 then
		if PlayerData.job.name ==  'police' or PlayerData.job.name ==  'sheriff' or PlayerData.job.name ==  'hitman' or PlayerData.job.name == 'doj' or PlayerData.job.name == 'fib' then
		exports['saltychat']:SetRadioChannel(freq, true)
		TriggerEvent("grp-notification", _U("setfreq", freq))
		else
		TriggerEvent("grp-notification", _U("cantsetfreq"))
		end
	elseif frq == 3 then
		if PlayerData.job.name ==  'police' or PlayerData.job.name ==  'sheriff' or PlayerData.job.name ==  'ambulance' or PlayerData.job.name ==  'hitman' or PlayerData.job.name == 'fib' or PlayerData.job.name == 'doj' then
		exports['saltychat']:SetRadioChannel(freq, true)
		TriggerEvent("grp-notification", _U("setfreq", freq))
		else
		TriggerEvent("grp-notification", _U("cantsetfreq"))
		end
	elseif frq == 4 then
		if PlayerData.job.name ==  'police' or PlayerData.job.name ==  'sheriff' or PlayerData.job.name ==  'doj' or PlayerData.job.name ==  'hitman' or PlayerData.job.name == 'fib' then
		exports['saltychat']:SetRadioChannel(freq, true)
		TriggerEvent("grp-notification", _U("setfreq", freq))
		else
		TriggerEvent("grp-notification", _U("cantsetfreq"))
		end
	elseif frq == 5 then
		if PlayerData.job.name ==  'police' or PlayerData.job.name ==  'sheriff' or PlayerData.job.name ==  'doj' or PlayerData.job.name ==  'hitman' or PlayerData.job.name == 'fib' then
		exports['saltychat']:SetRadioChannel(freq, true)
		TriggerEvent("grp-notification", _U("setfreq", freq))
		else
		TriggerEvent("grp-notification", _U("cantsetfreq"))
		end
	elseif frq == 6 then
		if PlayerData.job.name ==  'police' or PlayerData.job.name ==  'sheriff' or PlayerData.job.name ==  'hitman' or PlayerData.job.name == 'fib' then
		exports['saltychat']:SetRadioChannel(freq, true)
		TriggerEvent("grp-notification", _U("setfreq", freq))
		else
		TriggerEvent("grp-notification", _U("cantsetfreq"))
		end
	elseif frq == 7 then
		if PlayerData.job.name ==  'police' or PlayerData.job.name ==  'sheriff' or PlayerData.job.name ==  'hitman' or PlayerData.job.name == 'fib' or PlayerData.job.name == 'doj' then
		exports['saltychat']:SetRadioChannel(freq, true)
		TriggerEvent("grp-notification", _U("setfreq", freq))
		else
		TriggerEvent("grp-notification", _U("cantsetfreq"))
		end
	elseif frq == 8 then
		if PlayerData.job.name ==  'police' or PlayerData.job.name ==  'sheriff' or PlayerData.job.name ==  'hitman' or PlayerData.job.name == 'fib' or PlayerData.job.name == 'doj' then 
		exports['saltychat']:SetRadioChannel(freq, true)
		TriggerEvent("grp-notification", _U("setfreq", freq))
		else
		TriggerEvent("grp-notification", _U("cantsetfreq"))
		end
	elseif frq == 9 then
		if PlayerData.job.name ==  'police' or PlayerData.job.name ==  'sheriff' or PlayerData.job.name ==  'hitman' or PlayerData.job.name == 'fib' or PlayerData.job.name == 'doj' then 
		exports['saltychat']:SetRadioChannel(freq, true)
		TriggerEvent("grp-notification", _U("setfreq", freq))
		else
		TriggerEvent("grp-notification", _U("cantsetfreq"))
		end
	elseif frq == 10 then
		if PlayerData.job.name == 'fib' then
		exports['saltychat']:SetRadioChannel(freq, true)
		TriggerEvent("grp-notification", _U("setfreq", freq))
		else
		TriggerEvent("grp-notification", _U("cantsetfreq"))
		end
	elseif  frq >= 11 then
		
		exports['saltychat']:SetRadioChannel(freq, true)
		
		TriggerEvent("grp-notification",  _U("setfreq", freq))
	else
		TriggerEvent("grp-notification", _U("cantsetfreq"))
	end
end)

RegisterNetEvent("grp_Phone:client:removeradio")
AddEventHandler("grp_Phone:client:removeradio", function()
	local playerName = GetPlayerName(PlayerId())
	
	exports['saltychat']:SetRadioChannel('', true)
	

	TriggerEvent("grp-notification", _U("leftfreq"))
end)


-- Update Time
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(2000)

		SendNUIMessage({
			updatetime = true,
			InGameTime = CalculateTimeToDisplay(),
		})
	end
end)

function CalculateTimeToDisplay()
	hour = GetClockHours()
    minute = GetClockMinutes()
    
    local obj = {}
    
	if minute <= 9 then
		minute = "0" .. minute
    end
    
    obj.hour = hour
    obj.minute = minute

    return obj
end

-- Camera
RegisterNUICallback("openCamera", function(data, cb)
	SetNuiFocus(false, false)
	SendNUIMessage({
		hidePhone = true
	})
	DoPhoneAnimation('cellphone_text_out')
	SetTimeout(400, function()
		StopAnimTask(PlayerPedId(), PhoneData.AnimationData.lib, PhoneData.AnimationData.anim, 2.5)
		deletePhone()
		PhoneData.AnimationData.lib = nil
		PhoneData.AnimationData.anim = nil
	end)

	PhoneisOpen = false
	TriggerEvent("camera:phone")
end)

