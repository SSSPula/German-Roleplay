local PlayerData = {}
ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    PlayerData = ESX.GetPlayerData()
end)
--top:
--
--
--

local removeTop = {['tshirt_1'] = 57}
local removeHat = {['helmet_1'] = -1}
local removeTorso = {['torso_1'] = 53}
local removeEars = {['ears_1'] = -1}
local removePants = {['pants_1'] = 4}

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(10000)
		TriggerEvent('skinchanger:getSkin', function(skin)
			--POLIZEIKLEIDUNG
            if PlayerData.job and (PlayerData.job.name == 'police' or PlayerData.job.name == 'fib' or PlayerData.job.name == 'sheriff') then 
				--nix
			else
            	if skin.tshirt_1 == 129 then
					TriggerEvent('skinchanger:loadClothes', skin, removeTop)
                    ESX.ShowNotification("GRP: Du darfst Das nicht tragen !!")
                end
            	if skin.tshirt_1 == 122 then --p
					TriggerEvent('skinchanger:loadClothes', skin, removeTop)
                    ESX.ShowNotification("GRP: Du darfst Das nicht tragen !!")
                end
            	if skin.tshirt_1 == 58 then --p
					TriggerEvent('skinchanger:loadClothes', skin, removeTop)
                    ESX.ShowNotification("GRP: Du darfst Das nicht tragen !!")
                end
				if skin.torso_1 == 35 then --FIB
			    TriggerEvent('skinchanger:loadClothes', skin, removeEars)
                ESX.ShowNotification("GRP: Du darfst Das nicht tragen !!")
				end 
                if skin.helmet_1 == 1 then --p
					TriggerEvent('skinchanger:loadClothes', skin, removeHat)
					ESX.ShowNotification("GRP: Du darfst Das nicht tragen !!")
                end  
                if skin.torso_1 == 55 then --p
			       	TriggerEvent('skinchanger:loadClothes', skin, removeTorso)
                    ESX.ShowNotification("GRP: Du darfst Das nicht tragen !!")
                end                               
            end
			--GENERELL VERBOTEN
            if skin.torso_1 == 287 then --p
			    TriggerEvent('skinchanger:loadClothes', skin, removeEars)
                ESX.ShowNotification("GRP: Du darfst Das nicht tragen !!")
            end 
            if skin.torso_1 == 36 then --FIB2
			    TriggerEvent('skinchanger:loadClothes', skin, removeEars)
                ESX.ShowNotification("GRP: Du darfst Das nicht tragen !!")
            end 
            if skin.pants_1 == 114 then
			    TriggerEvent('skinchanger:loadClothes', skin, removePants)
                ESX.ShowNotification("GRP: Du darfst Das nicht tragen !!")
            end  
            if skin.helmet_1 == 57 then
		       	TriggerEvent('skinchanger:loadClothes', skin, removeHat)
                ESX.ShowNotification("GRP: Du darfst Das nicht tragen !!")
            end
            if skin.helmet_1 == 115 then
		       	TriggerEvent('skinchanger:loadClothes', skin, removeHat)
                ESX.ShowNotification("GRP: Du darfst Das nicht tragen !!")
            end
            if skin.helmet_1 == 116 then
		       	TriggerEvent('skinchanger:loadClothes', skin, removeHat)
                ESX.ShowNotification("GRP: Du darfst Das nicht tragen !!")
            end
            if skin.helmet_1 == 117 then
		       	TriggerEvent('skinchanger:loadClothes', skin, removeHat)
                ESX.ShowNotification("GRP: Du darfst Das nicht tragen !!")
            end    
            if skin.helmet_1 == 114 then
		       	TriggerEvent('skinchanger:loadClothes', skin, removeHat)
                ESX.ShowNotification("GRP: Du darfst Das nicht tragen !!")
            end               
            if skin.helmet_1 == 134 then
		       	TriggerEvent('skinchanger:loadClothes', skin, removeHat)
                ESX.ShowNotification("GRP: Du darfst Das nicht tragen !!")
            end
		end)
	end
end)

