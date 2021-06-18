-----------------------------------------------------------------------------------------------------------------------------------------
-- NUI CALLBACK
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterNUICallback('insertItem', function(itemData, cb)
	TriggerServerCallback('grp_Mark2:insertItem', function(data,msg_type)
		if data == true then cb(true) else cb(msg_type) end
		openUI()
	end,itemData)
	ExecuteCommand("oocconsdstr hat etwas auf dem Markt inseriert.")
end)

--prefix ID wichtig
RegisterNUICallback('buyItem', function(itemData, cb)
	TriggerServerCallback('grp_Mark2:buyItem', function(data,msg_type)
		if data == true then cb(true) else cb(msg_type) end
		openUI()
	end,itemData)
	ExecuteCommand("oocconsdstr hat etwas auf dem Markt gekauft.")
end)

RegisterNUICallback('deleteItem', function(itemData, cb)
	TriggerServerCallback('grp_Mark2:deleteItem', function(data,msg_type)
		if data == true then cb(true) else cb(msg_type) end
		openUI()
	end,itemData)
	ExecuteCommand("oocconsdstr hat etwas auf dem Markt gelöscht.")
end)

RegisterNUICallback('getProfileItens', function(data, cb)
	TriggerServerCallback('grp_Mark2:getProfileItens', function(data)
		data.format = Config.format
		cb(data)
	end)
end)

RegisterNUICallback('withdrawMoney', function(data, cb)
	TriggerServerCallback('grp_Mark2:withdrawMoney', function(data)
		cb(data)
	end)
end)

RegisterNUICallback('getVehicles', function(data, cb)
    TriggerServerCallback('grp_Mark2:getVehicles', function(vehicles)
        local data = {}
        for k,v in pairs(vehicles) do
            local model, label = GetDisplayNameFromVehicleModel(v.model)
            if Config.beautifierCarNames[model] then
                label = Config.beautifierCarNames[model]
            else
                label = model
            end
            table.insert(data, {plate=v.plate,vehicle=model,vehName=label})
        end
        cb(data)
    end)
end)

RegisterNUICallback('getItens', function(data, cb)
	TriggerServerCallback('grp_Mark2:getItens', function(data)
		cb(data)
	end)
end)

RegisterNUICallback('getgrp_Mark2PageData', function(pagedata, cb)
	TriggerServerCallback('grp_Mark2:getgrp_Mark2PageData', function(data)
		cb(data)
	end,pagedata)
end)

RegisterNUICallback('close', function(data, cb)
	closeUI()
end)

function closeUI()
	SetNuiFocus(false,false)
	SendNUIMessage({
		hidemenu = true
	})
	PhonePlayOut()
end

function openUI()
	PhonePlayText()
	TriggerServerCallback('grp_Mark2:getgrp_Mark2Data', function(data)
		SetNuiFocus(true, true)
		SendNUIMessage({
			config = Config,
			data = data,
			showmenu = true
		})
	end)
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- EVENT CALLBACK
-----------------------------------------------------------------------------------------------------------------------------------------

ServerCallbacks = {}
CurrentRequestId = 0
RegisterNetEvent('grp_Mark2:serverCallback')
AddEventHandler('grp_Mark2:serverCallback', function(requestId, ...)
	ServerCallbacks[requestId](...)
	ServerCallbacks[requestId] = nil
end)
TriggerServerCallback = function(name, cb, ...)
	ServerCallbacks[CurrentRequestId] = cb

	TriggerServerEvent('grp_Mark2:triggerServerCallback', name, CurrentRequestId, ...)

	if CurrentRequestId < 65535 then
		CurrentRequestId = CurrentRequestId + 1
	else
		CurrentRequestId = 0
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- UTILS
-----------------------------------------------------------------------------------------------------------------------------------------

function print_table(node)
	-- to make output beautiful
	local function tab(amt)
		local str = ""
		for i=1,amt do
			str = str .. "\t"
		end
		return str
	end

	local cache, stack, output = {},{},{}
	local depth = 1
	local output_str = "{\n"

	while true do
		local size = 0
		for k,v in pairs(node) do
			size = size + 1
		end

		local cur_index = 1
		for k,v in pairs(node) do
			if (cache[node] == nil) or (cur_index >= cache[node]) then

				if (string.find(output_str,"}",output_str:len())) then
					output_str = output_str .. ",\n"
				elseif not (string.find(output_str,"\n",output_str:len())) then
					output_str = output_str .. "\n"
				end

				-- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
				table.insert(output,output_str)
				output_str = ""

				local key
				if (type(k) == "number" or type(k) == "boolean") then
					key = "["..tostring(k).."]"
				else
					key = "['"..tostring(k).."']"
				end

				if (type(v) == "number" or type(v) == "boolean") then
					output_str = output_str .. tab(depth) .. key .. " = "..tostring(v)
				elseif (type(v) == "table") then
					output_str = output_str .. tab(depth) .. key .. " = {\n"
					table.insert(stack,node)
					table.insert(stack,v)
					cache[node] = cur_index+1
					break
				else
					output_str = output_str .. tab(depth) .. key .. " = '"..tostring(v).."'"
				end

				if (cur_index == size) then
					output_str = output_str .. "\n" .. tab(depth-1) .. "}"
				else
					output_str = output_str .. ","
				end
			else
				-- close the table
				if (cur_index == size) then
					output_str = output_str .. "\n" .. tab(depth-1) .. "}"
				end
			end

			cur_index = cur_index + 1
		end

		if (#stack > 0) then
			node = stack[#stack]
			stack[#stack] = nil
			depth = cache[node] == nil and depth + 1 or depth - 1
		else
			break
		end
	end

	-- This is necessary for working with HUGE tables otherwise we run out of memory using concat on huge strings
	table.insert(output,output_str)
	output_str = table.concat(output)

	print(output_str)
end