local myLoading = {
	{img = "loading.gif", text = translate.TR_LOADING, text2 = translate.TR_LOADING2, 
	callBack = function()
		
	end}
}

local configs_loading = {
	size = 0.8,
	positionY = "30%",
	itemSelectedColor = "rgba(0, 0, 0, 0.8)"
}

CreateThread(function()
    while not NetworkIsSessionStarted() do Wait(0) end
	Wait(5000)

	SendNUIMessage({
        config = true,
        translate = translate,
        NameResource = GetCurrentResourceName(),
		logo = logo
    })
end)

RegisterNetEvent('Documents: OpenMenu')
AddEventHandler('Documents: OpenMenu', function()
	local myItems = {
		{img = "create.png", text = translate.TR_CREATE, text2 = translate.TR_CREATE2, 
		callBack = function()
			TriggerEvent('Documents: CreateDocument')
		end},

		{img = "folder.png", text = translate.TR_VIEW_MODELS, text2 = translate.TR_VIEW_MODELS2, 
		callBack = function()
			IconMenu.OpenMenu(myLoading, configs_loading)
			TriggerServerEvent('Documents: viewModels')
		end},

		{img = "add-file.png", text = translate.TR_CREATE, text2 = translate.TR_CREATE3, 
		callBack = function()
			IconMenu.OpenMenu(myLoading, configs_loading)
			TriggerServerEvent('Documents: loadModels')
		end},

		{img = "archive.png", text = translate.TR_VIEW_DOCUMENTS, text2 = translate.TR_VIEW_DOCUMENTS2, 
		callBack = function()
			IconMenu.OpenMenu(myLoading, configs_loading)
			TriggerServerEvent('Documents: viewDocuments')
		end},
	}
	local configs = {
		size = 0.8,
		positionY = "30%"
	}

	IconMenu.OpenMenu(myItems, configs)
end)

RegisterNetEvent('Documents: loadModels')
AddEventHandler('Documents: loadModels', function(models)
	local myItems = {
		{img = "back.png", text = translate.TR_BACK, text2 = translate.TR_BACK2, callBack = function()
			ExecuteCommand(commands.documentmenu)
		end},
	}

	for i,k in pairs(models) do
		local scope = k.scope
		if k.scope and string.len(k.scope) > 30 then
			scope = string.sub(k.scope, 1, 30)
		end

		table.insert(myItems, {
			img = "product.png",
			text = k.title,
			text2 = scope,
			callBack = function()
				local name = InsertValue(translate.TR_CREATE4, '', 20)
				if name and #name > 1 then
					k.name = name
					k.images = json.decode(k.images)
					k.signatures = json.decode(k.signatures)
					k.text = k.scope
					SendNUIMessage({
						openCreateDocument = true,
						infos_document = k
					})
					SetNuiFocus(true, true)
				end
			end
		})
	end

	local configs = {
		size = 0.8,
		positionY = "30%"
	}

	IconMenu.OpenMenu(myItems, configs)
end)

RegisterNetEvent('Documents: viewModels')
AddEventHandler('Documents: viewModels', function(models)
	local configs = {
		size = 0.8,
		positionY = "30%"
	}

	local myItems = {
		{img = "back.png", text = translate.TR_BACK, text2 = translate.TR_BACK2, callBack = function()
			ExecuteCommand(commands.documentmenu)
		end},
	}

	for i,k in pairs(models) do
		local scope = k.scope
		if k.scope and string.len(k.scope) > 30 then
			scope = string.sub(k.scope, 1, 30)
		end

		table.insert(myItems, {
			img = "product.png",
			text = k.title,
			text2 = scope,
			callBack = function()
				local myOptions = {
					{img = "back.png", text = translate.TR_BACK, text2 = translate.TR_BACK3, callBack = function()
						IconMenu.OpenMenu(myItems, configs)
					end},
					{img = "edit.png", text = translate.TR_EDIT, text2 = translate.TR_EDIT2 .. k.title, callBack = function()
						k.images = json.decode(k.images)
						k.signatures = json.decode(k.signatures)
						k.text = k.scope
						SendNUIMessage({
							openEditModel = true,
							infos_document = k
						})
						SetNuiFocus(true, true)
						ExecuteCommand(commands.documentmenu)
					end},
					{img = "delete.png", text = translate.TR_DELETE, text2 = translate.TR_DELETE2 .. k.title, callBack = function()
						TriggerServerEvent('Documents: DeleteDocument', k)
						IconMenu.OpenMenu(myLoading, configs_loading)
						SetTimeout(3000, function()
							ExecuteCommand(commands.documentmenu)
						end)
					end}
				}	
				IconMenu.OpenMenu(myOptions, configs)
			end
		})
	end

	IconMenu.OpenMenu(myItems, configs)
end)

RegisterNetEvent('Documents: viewDocuments')
AddEventHandler('Documents: viewDocuments', function(models, hidden)
	local configs = {
		size = 0.8,
		positionY = "30%"
	}

	local myItems = {}

	if not hidden then
		table.insert(myItems, {
			img = "back.png", 
			text = translate.TR_BACK, 
			text2 = translate.TR_BACK4, callBack = function()
				ExecuteCommand(commands.documentmenu)
		end})
	end

	for i,k in pairs(models) do
		local scope = k.scope
		if k.scope and string.len(k.scope) > 30 then
			scope = string.sub(k.scope, 1, 30)
		end

		table.insert(myItems, {
			img = "file.png",
			text = k.name,
			text2 = k.title,
			callBack = function()
				local myOptions = {
					{img = "back.png", text = translate.TR_BACK, text2 = translate.TR_BACK5, callBack = function()
						IconMenu.OpenMenu(myItems, configs)
					end},
				}

				if k.isopen == 1 then
					table.insert(myOptions,	{
						img = "edit.png", 
						text = translate.TR_EDIT, 
						text2 = translate.TR_EDIT3 .. k.name, 
						callBack = function()
							k.images = json.decode(k.images)
							k.signatures = json.decode(k.signatures)
							k.text = k.scope
							SendNUIMessage({
								openEditDocument = true,
								infos_document = k
							})
							SetNuiFocus(true, true)
							ExecuteCommand(commands.documentmenu)
					end})	

					table.insert(myOptions,	{
						img = "close.png", 
						text = translate.TR_CLOSE, 
						text2 = translate.TR_CLOSE2 .. k.name, 
						callBack = function()
							k.images = json.decode(k.images)
							k.signatures = json.decode(k.signatures)
							k.text = k.scope
							TriggerServerEvent('Documents: CloseDocument', k)
							IconMenu.OpenMenu(myLoading, configs_loading)
							SetTimeout(3000, function()
								ExecuteCommand(commands.documentmenu)
							end)
					end})
				else
					table.insert(myOptions,	{
						img = "document.png", 
						text = translate.TR_OPEN, 
						text2 = translate.TR_OPEN2 .. k.name, 
						callBack = function()
							k.images = json.decode(k.images)
							k.signatures = json.decode(k.signatures)
							k.text = k.scope
							SendNUIMessage({
								openViewDocument = true,
								infos_document = k
							})
							SetNuiFocus(true, true)
							ExecuteCommand(commands.documentmenu)
					end})	

					table.insert(myOptions,	{
						img = "copy.png", 
						text = translate.TR_COPY, 
						text2 = translate.TR_COPY2 .. k.name, 
						callBack = function()
							k.images = json.decode(k.images)
							k.signatures = json.decode(k.signatures)
							k.text = k.scope
							k.name = translate.TR_COPY3 .. k.name
							TriggerServerEvent('Documents: CreateCopyDocument', k)
							IconMenu.OpenMenu(myLoading, configs_loading)
							SetTimeout(3000, function()
								ExecuteCommand(commands.documentmenu)
							end)
					end})	
				end
				local closest, dist = ClosestPlayer()

				if closest ~= -1 and dist < 2.0 then
					table.insert(myOptions, {
						img = "give.png", 
						text = translate.TR_GIVE, 
						text2 = translate.TR_GIVE2 .. k.name, 
						callBack = function()
							k.images = json.decode(k.images)
							k.signatures = json.decode(k.signatures)
							k.text = k.scope
							TriggerServerEvent('Documents: GiveDocument', GetPlayerServerId(closest), k)
							IconMenu.OpenMenu(myLoading, configs_loading)
							SetTimeout(3000, function()
								ExecuteCommand(commands.documentmenu)
							end)
					end})
				end

				table.insert(myOptions, {
					img = "delete.png", 
					text = translate.TR_DELETE, 
					text2 = translate.TR_DELETE3 .. k.name, 
					callBack = function()
						TriggerServerEvent('Documents: DeleteDocument', k)
						IconMenu.OpenMenu(myLoading, configs_loading)
						SetTimeout(3000, function()
							ExecuteCommand(commands.documentmenu)
						end)
				end})


				IconMenu.OpenMenu(myOptions, configs)
			end
		})
	end

	IconMenu.OpenMenu(myItems, configs)
end)

RegisterNetEvent('Documents: CreateDocument')
AddEventHandler('Documents: CreateDocument', function()
	SendNUIMessage({
		openCreateModel = true
	})

	SetNuiFocus(true, true)
end)

RegisterNUICallback('saveModel', function(data, cb)
	TriggerServerEvent('Documents: SaveModel', data)
	cb('ok')
end)

RegisterNUICallback('saveDocument', function(data, cb)
	TriggerServerEvent('Documents: SaveDocument', data)
	cb('ok')
end)

RegisterNUICallback('close', function(data, cb)
	SetNuiFocus(false, false)
	cb('ok')
end)

function InsertValue(title, text, maxsize)
	AddTextEntry('FMMC_KEY_TIP1', title)
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", text, "", "", "", maxsize)

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Wait(0)
	end
		
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Wait(500)
		return result
	else
		Wait(500)
		return nil
	end
end

function ClosestPlayer()
	local myPed = GetPlayerPed(-1)
	local dist = 99999.9
	local closest = -1

	local myPos = GetEntityCoords(myPed)
	for i, player in pairs(GetActivePlayers()) do
		local ped = GetPlayerPed(player)

		if DoesEntityExist(ped) and ped ~= myPed then
			local pos = GetEntityCoords(ped)
			local distance = #(pos - myPos)
			if dist > distance then
				dist = distance
				closest = player
			end
		end
	end

	return closest, dist
end