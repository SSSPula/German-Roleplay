
local assert = assert
local MenuV = assert(MenuV)
local godmode = false
local unsichtbarkeyt
local invisibility = false
local noclip

Admin = {
	showcoords = false,
	showcrosshair = false,
	ghostmode = false,
    godmode = false,
    showName = false,
    gamerTags = {}
}

local menu = MenuV:CreateMenu(false, 'GRP Adminmenu', 'topleft', 255, 0, 0, 'size-125', 'spadmin')
local menu2 = MenuV:CreateMenu(false, 'GRP Admin', 'topleft', 255, 0, 0, 'size-125', 'spadmin')
local menu3 = MenuV:CreateMenu(false, 'GRP Admin', 'topleft', 255, 0, 0, 'size-125', 'spadmin')
local menu4 = MenuV:CreateMenu(false, 'GRP Admin', 'topleft', 255, 0, 0, 'size-125', 'spadmin')
local menuneo = MenuV:CreateMenu(false, 'GRP Admin', 'topleft', 255, 0, 0, 'size-125', 'spadmin')
local m1 = MenuV:CreateMenu(false, 'GRP Admin', 'topleft', 255, 0, 0, 'size-125', 'spadmin')
local m2 = MenuV:CreateMenu(false, 'GRP Admin', 'topleft', 255, 0, 0, 'size-125', 'spadmin')
local m8 = MenuV:CreateMenu(false, 'GRP Admin', 'topleft', 255, 0, 0, 'size-125', 'spadmin')
local women = MenuV:CreateMenu(false, 'GRP Admin', 'topleft', 255, 0, 0, 'size-125', 'spadmin')
local men = MenuV:CreateMenu(false, 'GRP Admin', 'topleft', 255, 0, 0, 'size-125', 'spadmin')
local costume = MenuV:CreateMenu(false, 'GRP Admin', 'topleft', 255, 0, 0, 'size-125', 'spadmin')
local animalmenu = MenuV:CreateMenu(false, 'GRP Admin', 'topleft', 255, 0, 0, 'size-125', 'spadmin')

local menu_button = menu:AddButton({ icon = '😃', label = 'Selbst', value = menu2, description = 'NoClip / Unsterblichkeit und mehr !' })
local markertp = menu2:AddButton({ icon = '🚶‍', label = 'TP Marker', value = menu90000, description = 'Ich mach TP zwischen Routen damit Admins schneller farmen' })
local markertocoord = menu2:AddButton({ icon = '🚶‍', label = 'TP to Coords', value = menu90000, description = 'Extrawunsch von Dewen jebinski' })
--local noclip = menu2:AddCheckbox({ icon = '👁️‍🗨️', label = 'No Clip (Maus)', value = menu30, description = 'Wenn man mal nicht laufen will' })
local noclipv2 = menu2:AddCheckbox({ icon = '👁️‍🗨️', label = 'No Clip ', value = menu301, description = 'Wenn man mal nicht laufen will' })
--local autorepair = menu2:AddCheckbox({ icon = '🚗', label = 'Auto reparieren', value = menu40, description = 'wenn man von amcas verfolgt wird' })
--local godmode = menu2:AddCheckbox({ icon = '♥️', label = 'GodMode', value = menu40, description = 'Für Gambo' })
--local showcrosshair = menu2:AddCheckbox({ icon = '🖱️', label = 'Fadenkreuz', value = menu40, description = 'Für einen unfairen Vorteil gegenüber normalen Spielern' })


--[[
local svmaxArmor = menu2:AddConfirm({ icon = '⛷️', label = 'Fast Sprint', value = armor, description = 'Fast Sprint' })
local toggleFastSwim = menu2:AddConfirm({ icon = '🏊', label = 'Fast Swim', value = armor, description = 'Fast Swim' })
local toggleSuperJump = menu2:AddConfirm({ icon = '✈️', label = 'Super Jump', value = armor, description = 'Super Jump' })
local toggleInfStamina = menu2:AddConfirm({ icon = '🌬️', label = 'Infinite Stamina', value = armor, description = 'Infinite Stamina' })
local giveallweapon = menu2:AddConfirm({ icon = '🔫', label = 'Give All Weapons', value = menu50, description = 'Give All Weapons' }) 
]]

local toggleInvisibility = menu2:AddCheckbox({ icon = '🌌', label = 'Unsichtbar werden', value = armor, description = 'Zum heimlichen belauschen von Gesprächen' })
local modo_showcoord = menu2:AddCheckbox({ icon = '🧭', label = 'Koordinaten anzeigen', value = menu70, description = 'Ich ficke Albi' }) 
--[[
local heal = menu2:AddCheckbox({ icon = '💉', label = 'Heal', value = menu60, description = 'Heal' }) 
local admin_give_money = menu2:AddSlider({ icon = '💲', label = 'Give Myself Money', value = menu80, values = {
    { label = 'Cash', value = 1, description = '' },
    { label = 'Bank', value = 2, description = '' },
    { label = 'Dirty', value = 3, description = '' }
}})

admin_give_money:On('select', function(i, selectedValue)
 

  if (selectedValue == 1) then
    admin_give_money()
  elseif (selectedValue == 2) then
    admin_give_bank()
  elseif (selectedValue == 3) then
    admin_give_dirty()
  end
end)
local changer_skin = menu2:AddConfirm({ icon = '🙎‍', label = 'Change Appearance', value = menu90, description = 'Change Appearance' }) 
]]

--local admin = menu:AddButton({ icon = '👑', label = 'Admin', value = m2, description = 'Categories Car' })
--[[
local spec = m2:AddConfirm({ icon = '👁️‍🗨️', label = 'Spectate ', value = pil1, description = 'Spectate Player' })
local tag = m2:AddCheckbox({ icon = '🛡️', label = 'Tag Admin', value = pil2, description = 'Tag Admin' })
local reporthistory = m2:AddCheckbox({ icon = '⚙️‍', label = 'Reports history', value = pil5, description = 'Reports history' })
local banplayer = m2:AddCheckbox({ icon = '⚙️‍', label = 'Ban Player', value = pil9, description = 'Ban Player' })
local banplayerh = m2:AddCheckbox({ icon = '⚙️‍', label = 'Ban List', value = pil9, description = 'Ban List Player' })
local warnplayer = m2:AddCheckbox({ icon = '⚙️‍', label = 'Warn Player', value = pil9, description = 'Warn Player' })
local warnplayerh = m2:AddCheckbox({ icon = '⚙️‍', label = 'Warn List', value = pil9, description = 'Warn List Player' })
local adminmode = m2:AddConfirm({ icon = '👁️‍🗨️', label = 'Sow Coord Players', value = pil1, description = 'Sow Coord Players' })
local checkstaff = m2:AddCheckbox({ icon = '👁️‍🗨️', label = 'Check Staff Online', value = pil1, description = 'Check Staff Online' })
local blipsplayer = m2:AddConfirm({ icon = '◻️', label = 'Players Blips', value = pil3, description = 'Show Players Blips' })
]]
--local nameplayer = m2:AddCheckbox({ icon = '🚶‍', label = 'Players Name', value = pil4, description = 'Show Players Name' })
--local playerslistof = menu:AddCheckbox({ icon = '📃', label = 'Spieler', value = player, description = 'Die bis zu 1024 Coolsten Menschen der Welt' })
--local ped = menu:AddButton({ icon = '🙎', label = 'Ped', value = menu3, description = 'Lots of ped' })
--[[
local keyped = menu3:AddCheckbox({ icon = '🙎', label = 'Choose a Ped', value = pedcose, description = 'Choose a ped' })
local animal = menu3:AddButton({ icon = '🙎‍', label = 'Animals', value = animalmenu, description = 'Animals ped' })
local women1 = menu3:AddButton({ icon = '🙎‍', label = 'Women', value = women, description = 'Women ped' })
local men1 = menu3:AddButton({ icon = '🙎‍', label = 'Men', value = men, description = 'Men ped' })
local costume1 = menu3:AddButton({ icon = '🙎‍', label = 'Costume', value = costume, description = 'Costume ped' })

local monkey = animalmenu:AddConfirm({ icon = '🙎‍', label = 'Monkey', value = menu101, description = 'ped' })
local stripper = women:AddConfirm({ icon = '🙎‍', label = 'Stripper', value = menu104, description = 'ped' })
local cosmonaut = costume:AddConfirm({ icon = '🙎‍', label = 'Cosmonaut', value = menu105, description = 'ped' })
local alien = costume:AddConfirm({ icon = '🙎‍', label = 'Alien', value = menu106, description = 'ped' })
local costume2 = costume:AddConfirm({ icon = '🙎‍', label = 'Juggerna', value = menu132, description = 'ped' })
local costume3 = costume:AddConfirm({ icon = '🙎‍', label = 'Pogo', value = menu132, description = 'ped' })
local costume4 = costume:AddConfirm({ icon = '🙎‍', label = 'Ranger', value = menu132, description = 'ped' })
local costume5 = costume:AddConfirm({ icon = '🙎‍', label = 'Imporage', value = menu132, description = 'ped' })
local beach = women:AddConfirm({ icon = '🙎‍', label = 'Beach', value = menu107, description = 'ped' })
local women1 = women:AddConfirm({ icon = '🙎‍', label = 'Buisiness Women', value = menu132, description = 'ped ' })
local women2 = women:AddConfirm({ icon = '🙎‍', label = 'Body Buil', value = menu132, description = 'ped ' })
local women4 = women:AddConfirm({ icon = '🙎‍', label = 'Downtow', value = menu132, description = 'ped' })
local women5 = women:AddConfirm({ icon = '🙎‍', label = 'Eastsa', value = menu132, description = 'ped' })

local women7 = women:AddConfirm({ icon = '🙎‍', label = 'FtaBla', value = menu132, description = 'ped' })
local women8 = women:AddConfirm({ icon = '🙎‍', label = 'FatCult', value = menu132, description = 'ped' })
local women9 = women:AddConfirm({ icon = '🙎‍', label = 'FatWhite', value = menu132, description = 'ped' })
local women10 = women:AddConfirm({ icon = '🙎‍', label = 'Ktown', value = menu132, description = 'ped' })
local women12 = women:AddConfirm({ icon = '🙎‍', label = 'Prolhost', value = menu132, description = 'ped' })
local women13 = women:AddConfirm({ icon = '🙎‍', label = 'Salton', value = menu132, description = 'ped' })
local women14 = women:AddConfirm({ icon = '🙎‍', label = 'Skidrow', value = menu132, description = 'ped' })
local women15 = women:AddConfirm({ icon = '🙎‍', label = 'Soucent', value = menu132, description = 'ped' })
local women18 = women:AddConfirm({ icon = '🙎‍', label = 'Tourist', value = menu132, description = 'ped' })
local women19 = women:AddConfirm({ icon = '🙎‍', label = 'Tramp', value = menu132, description = 'ped' })
local women20 = women:AddConfirm({ icon = '🙎‍', label = 'Tramp-Bea', value = menu132, description = 'ped' })
local women21 = women:AddConfirm({ icon = '🙎‍', label = 'Genstreet', value = menu132, description = 'ped' })
local women22 = women:AddConfirm({ icon = '🙎‍', label = 'Indian', value = menu132, description = 'ped' })
local women23 = women:AddConfirm({ icon = '🙎‍', label = 'Stown', value = menu132, description = 'ped' })
local women28 = women:AddConfirm({ icon = '🙎‍', label = 'Bevhills', value = menu132, description = 'ped' })
local women31 = women:AddConfirm({ icon = '🙎‍', label = 'Clubcust', value = menu132, description = 'ped' })
local men1 = men:AddConfirm({ icon = '🙎‍', label = 'Acult', value = menu132, description = 'ped' })
local men2 = men:AddConfirm({ icon = '🙎‍', label = 'Afriamer', value = menu132, description = 'ped' })
local men3 = men:AddConfirm({ icon = '🙎‍', label = 'Beach', value = menu132, description = 'ped' })
local men4 = men:AddConfirm({ icon = '🙎‍', label = 'Beach 2', value = menu132, description = 'ped ' })
local men5 = men:AddConfirm({ icon = '🙎‍', label = 'Bevhills', value = menu132, description = 'ped' })
local men6 = men:AddConfirm({ icon = '🙎‍', label = 'Buisiness Men', value = menu132, description = 'ped ' })
local men7 = men:AddConfirm({ icon = '🙎‍', label = 'Eastsa', value = menu132, description = 'ped' })
local men8 = men:AddConfirm({ icon = '🙎‍', label = 'Farmer', value = menu132, description = 'ped' })
local men9 = men:AddConfirm({ icon = '🙎‍', label = 'Fatlatin', value = menu132, description = 'ped' })
local men10 = men:AddConfirm({ icon = '🙎‍', label = 'Genfat', value = menu132, description = 'ped' })
local men11 = men:AddConfirm({ icon = '🙎‍', label = 'Golfer', value = menu132, description = 'ped' })
local men12 = men:AddConfirm({ icon = '🙎‍', label = 'Ballas', value = menu132, description = 'ped' })
local men13 = men:AddConfirm({ icon = '🙎‍', label = 'Famillies', value = menu132, description = 'ped' })
local men14 = men:AddConfirm({ icon = '🙎‍', label = 'Salvagoo', value = menu132, description = 'ped' })
local men15 = men:AddConfirm({ icon = '🙎‍', label = 'Chigoon', value = menu132, description = 'ped' })
local men16 = men:AddConfirm({ icon = '🙎‍', label = 'Paper', value = menu132, description = 'ped' })
local men17 = men:AddConfirm({ icon = '🙎‍', label = 'Popov', value = menu132, description = 'ped' })
local men18 = men:AddConfirm({ icon = '🙎‍', label = 'Priest', value = menu132, description = 'ped' })
local men19 = men:AddConfirm({ icon = '🙎‍', label = 'Talc', value = menu132, description = 'ped' })
local men20 = men:AddConfirm({ icon = '🙎‍', label = 'Money', value = menu132, description = 'ped' })
local ped15 = animalmenu:AddConfirm({ icon = '🙎‍', label = 'Boar', value = menu122, description = 'ped' })
local ped16 = animalmenu:AddConfirm({ icon = '🙎‍', label = 'Cat', value = menu123, description = 'ped' })
local ped18 = animalmenu:AddConfirm({ icon = '🙎‍', label = 'Cormorant', value = menu125, description = 'ped' })
local ped19 = animalmenu:AddConfirm({ icon = '🙎‍', label = 'Cow', value = menu126, description = 'ped' })
local ped20 = animalmenu:AddConfirm({ icon = '🙎‍', label = 'Coyote', value = menu127, description = 'ped' })
local ped21 = animalmenu:AddConfirm({ icon = '🙎‍', label = 'Crow', value = menu128, description = 'ped' })
local ped22 = animalmenu:AddConfirm({ icon = '🙎‍', label = 'Deer', value = menu129, description = 'ped' })
local ped23 = animalmenu:AddConfirm({ icon = '🙎‍', label = 'Dolphin', value = menu130, description = 'ped' })
local ped24 = animalmenu:AddConfirm({ icon = '🙎‍', label = 'Fish', value = menu131, description = 'ped' })
]]





 

RegisterCommand('tp', function(source, args, rawCommand)
	
		ESX.TriggerServerCallback('grd_Pets:Gruppegetten', function(plyGroup)
	if plyGroup == 'superadmin' or plyGroup == 'admin' then
	local coords = {}
	for coord in string.gmatch(args[1] or "0,0,0","[^,]+") do
		table.insert(coords,tonumber(coord))
	end

	local x,y,z = 0,0,0
	if coords[1] ~= nil then x = coords[1] end
	if coords[2] ~= nil then y = coords[2] end
	if coords[3] ~= nil then z = coords[3] end

	SetEntityCoords(GetPlayerPed(-1), x,y,z, false)
	else
	exports['mythic_notify']:SendAlert('error', 'Du musst Admin sein.!', 2500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	end
	end)
	
end)

--[[
local menu_car = menu:AddButton({ icon = '🚗', label = 'Car', value = menu4, description = 'Categories Car' })
local spawncar = menu4:AddButton({ icon = '🚗', label = 'Spawn Car', value = m1, description = 'Spawn Car' })
local supercar = m1:AddSlider({ icon = '🏎️', label = 'Super', value = menu8402, values = {
    { label = 'adder', value = 1, description = '' },
    { label = 'cheetah', value = 2, description = '' },
    { label = 'cyclone', value = 4, description = '' },
    { label = 't20', value = 5, description = '' },
    { label = 'osiris', value = 6, description = '' },
    { label = 'fmj', value = 7, description = '' },	
    { label = 'entityxf', value = 8, description = '' },	
    { label = 'turismor', value = 9, description = '' },	
    { label = 'infernus', value = 10, description = '' },	
}})
supercar:On('select', function(i, selectedValue)
  if (selectedValue == 1) then
     ExecuteCommand("dv")
 ExecuteCommand("car adder")
  elseif (selectedValue == 2) then
     ExecuteCommand("dv")
 ExecuteCommand("car cheetah")
  elseif (selectedValue == 4) then
     ExecuteCommand("dv")
 ExecuteCommand("car cyclone")	
  elseif (selectedValue == 5) then
     ExecuteCommand("dv")
 ExecuteCommand("car t20")		
  elseif (selectedValue == 6) then
     ExecuteCommand("dv")
 ExecuteCommand("car osiris")		
  elseif (selectedValue == 7) then
     ExecuteCommand("dv")
 ExecuteCommand("car fmj")
  elseif (selectedValue == 8) then
     ExecuteCommand("dv")
 ExecuteCommand("car entityxf")	
  elseif (selectedValue == 9) then
     ExecuteCommand("dv")
 ExecuteCommand("car turismor")		
  elseif (selectedValue == 10) then
     ExecuteCommand("dv")
 ExecuteCommand("car infernus")		
  end 
end)
local sportclas = m1:AddSlider({ icon = '🚗', label = 'Sports / Classics', value = menu1842, values = {
    { label = 'alpha', value = 1, description = '' },
    { label = 'bestiagts', value = 2, description = '' },
    { label = 'coquette', value = 4, description = '' },
    { label = 'furoregt', value = 5, description = '' },
    { label = 'jester', value = 6, description = '' },
    { label = 'penumbra', value = 7, description = '' },	
    { label = 'pigalle', value = 8, description = '' },	
    { label = 'revolter', value = 9, description = '' },	
    { label = 'gt500', value = 10, description = '' },	
}})
sportclas:On('select', function(i, selectedValue)
  if (selectedValue == 1) then
   ExecuteCommand("dv")
 ExecuteCommand("car alpha")
  elseif (selectedValue == 2) then
  ExecuteCommand("dv")
 ExecuteCommand("car bestiagts")
  elseif (selectedValue == 4) then
     ExecuteCommand("dv")
 ExecuteCommand("car coquette")	
  elseif (selectedValue == 5) then
     ExecuteCommand("dv")
 ExecuteCommand("car furoregt")		
  elseif (selectedValue == 6) then
     ExecuteCommand("dv")
 ExecuteCommand("car jester")		
  elseif (selectedValue == 7) then
     ExecuteCommand("dv")
 ExecuteCommand("car penumbra")
  elseif (selectedValue == 8) then
     ExecuteCommand("dv")
 ExecuteCommand("car pigalle")	
  elseif (selectedValue == 9) then
     ExecuteCommand("dv")
 ExecuteCommand("car revolter")		
  elseif (selectedValue == 10) then
     ExecuteCommand("dv")
 ExecuteCommand("car gt500")
 
  end
end)
local sportclas = m1:AddSlider({ icon = '🚚', label = 'Off Road', value = menu1842, values = {
    { label = 'bfinjection', value = 1, description = '' },
    { label = 'bifta', value = 2, description = '' },
    { label = 'brawler', value = 4, description = '' },
    { label = 'dubsta3', value = 5, description = '' },
    { label = 'guardian', value = 6, description = '' },
    { label = 'monster', value = 7, description = '' },	
    { label = 'riata', value = 8, description = '' },	
    { label = 'trophytruck', value = 9, description = '' },	
    { label = 'rebel2', value = 10, description = '' },	
}})
sportclas:On('select', function(i, selectedValue)
  if (selectedValue == 1) then
     ExecuteCommand("dv")
 ExecuteCommand("car bfinjection")
  elseif (selectedValue == 2) then
     ExecuteCommand("dv")
 ExecuteCommand("car bifta")
  elseif (selectedValue == 4) then
     ExecuteCommand("dv")
 ExecuteCommand("car brawler")	
  elseif (selectedValue == 5) then
     ExecuteCommand("dv")
 ExecuteCommand("car dubsta3")		
  elseif (selectedValue == 6) then
  ExecuteCommand("dv")
 ExecuteCommand("car guardian")		
  elseif (selectedValue == 7) then
     ExecuteCommand("dv")
 ExecuteCommand("car monster")
  elseif (selectedValue == 8) then
     ExecuteCommand("dv")
 ExecuteCommand("car riata")	
  elseif (selectedValue == 9) then
     ExecuteCommand("dv")
 ExecuteCommand("car trophytruck")		
  elseif (selectedValue == 10) then
     ExecuteCommand("dv")
 ExecuteCommand("car rebel2")
 
  end
end)
local moto = m1:AddSlider({ icon = '🏍️', label = 'Bike', value = menu1842, values = {
    { label = 'sanchez', value = 1, description = '' },
    { label = 'manchez', value = 2, description = '' },
    { label = 'bati', value = 4, description = '' },
    { label = 'hakuchou', value = 6, description = '' },	
}})
moto:On('select', function(i, selectedValue)
  if (selectedValue == 1) then
     ExecuteCommand("dv")
 ExecuteCommand("car sanchez")
  elseif (selectedValue == 2) then
     ExecuteCommand("dv")
 ExecuteCommand("car manchez")
  elseif (selectedValue == 4) then
     ExecuteCommand("dv")
 ExecuteCommand("car bati")			
  elseif (selectedValue == 6) then
     ExecuteCommand("dv")
 ExecuteCommand("car hakuchou")		
  end
end)
local boostcar = menu4:AddCheckbox({ icon = '🛠️', label = 'Full Vehicle Boost', value = menu102, description = 'Full Vehicle Boostr' })
local plaquecar = menu4:AddCheckbox({ icon = '✏️', label = 'Change The Number Plate', value = menu103, description = 'Change The Number Plate' })
local admin_vehicle_repair = menu4:AddCheckbox({ icon = '🔧', label = 'Repair Vehicle', value = menu104, description = 'Repair Vehicle' })
local deletecar = menu4:AddCheckbox({ icon = '✂️', label = 'Delete Vehicle', value = menu185, description = 'Delete Vehicle' })
local colorcar = menu4:AddSlider({ icon = '🟢', label = 'Color', value = menu840, values = {
    { label = 'Red', value = 1, description = '' },
    { label = 'Green', value = 2, description = '' },
    { label = 'Black', value = 4, description = '' },
    { label = 'Purple', value = 5, description = '' },
    { label = 'White', value = 6, description = '' }
}})
colorcar:On('select', function(i, selectedValue)
  if (selectedValue == 1) then
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
                SetVehicleCustomPrimaryColour(vehicle, 255, 0, 0)
                SetVehicleCustomSecondaryColour(vehicle, 255, 0, 0)	
  elseif (selectedValue == 2) then
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
                SetVehicleCustomPrimaryColour(vehicle, 0, 255, 0)
                SetVehicleCustomSecondaryColour(vehicle, 0, 255, 0)	
  elseif (selectedValue == 4) then
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
                SetVehicleCustomPrimaryColour(vehicle, 0, 0, 0)
                SetVehicleCustomSecondaryColour(vehicle, 0, 0, 0)	
  elseif (selectedValue == 5) then
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
                SetVehicleCustomPrimaryColour(vehicle, 100, 0, 60)
                SetVehicleCustomSecondaryColour(vehicle, 100, 0, 60)	
  elseif (selectedValue == 6) then
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)				
                SetVehicleCustomPrimaryColour(vehicle, 255, 255, 255)
                SetVehicleCustomSecondaryColour(vehicle, 255, 255, 255)		
  end
end)
local neon = menu4:AddButton({ icon = '💡', label = 'Neon', value = menuneo, description = 'Neon' })
local neongive = menuneo:AddConfirm({ icon = '✔️', label = 'Active the Neon', value = menuneo1, description = 'Active the Neon' })
local colorneon = menuneo:AddSlider({ icon = '🟣', label = 'Color', value = menu800, values = {
    { label = 'Blue', value = 1, description = '' },
    { label = 'Green', value = 2, description = '' },
    { label = 'Red', value = 3, description = '' },
    { label = 'White', value = 4, description = '' },
    { label = 'Purple', value = 5, description = '' },
    { label = 'Black', value = 6, description = '' }
}})
colorneon:On('select', function(i, selectedValue)
  if (selectedValue == 1) then
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    SetVehicleNeonLightsColour(vehicle, 0, 0, 255)
  elseif (selectedValue == 2) then
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    SetVehicleNeonLightsColour(vehicle, 0, 255, 0)
  elseif (selectedValue == 3) then
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    SetVehicleNeonLightsColour(vehicle, 255, 0, 0)
  elseif (selectedValue == 4) then
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    SetVehicleNeonLightsColour(vehicle, 255, 255, 255)	
  elseif (selectedValue == 5) then
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    SetVehicleNeonLightsColour(vehicle, 100, 0, 60)		
  elseif (selectedValue == 6) then
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    SetVehicleNeonLightsColour(vehicle, 0, 0, 0)	
  end
end)



warnplayerh:On('check', function(i)
MenuV:CloseAll()
ExecuteCommand("bwh warnlist")
end)
warnplayer:On('check', function(i)
MenuV:CloseAll()
ExecuteCommand("bwh warn")
end)
banplayerh:On('check', function(i)
MenuV:CloseAll()
ExecuteCommand("bwh banlist")
end)
banplayer:On('check', function(i)
MenuV:CloseAll()
ExecuteCommand("bwh ban")
end)
reporthistory:On('check', function(i)
MenuV:CloseAll()
TriggerEvent('reports:history')
end)
reporthistory:On('uncheck', function(i)
  
end)



tag:On('check', function(i)
ExecuteCommand("tag")
ESX.ShowNotification('Tag Staff : ~g~ON')
end)
tag:On('uncheck', function(i)
ExecuteCommand("tag")
ESX.ShowNotification('Tag Staff : ~r~OFF')
end)

keyped:On('check', function(i)
keyped()
end)
keyped:On('uncheck', function(i)
TriggerEvent('grp_admin:openMenuPlayerZero')
end)
]]

markertp:On('select', function(item)
admin_tp_marker()
PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
end)


markertocoord:On('select', function(item)
tpcoord()
PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
end)


--[[
checkstaff:On('check', function(i)
ExecuteCommand('admins')
end)

adminmode:On('confirm', function(item) ExecuteCommand('adminmode')	 end) 
adminmode:On('deny', function(item) ExecuteCommand('adminmode')	 end) 

toggleInfStamina:On('confirm', function(item) TriggerEvent('grp_admin:toggleInfStamina')	 end) 
toggleInfStamina:On('confirm', function(item) ESX.ShowNotification('Infinite Stamina : ~g~ON')	 end) 
toggleInfStamina:On('deny', function(item) TriggerEvent('grp_admin:toggleInfStamina')	 end) 
toggleInfStamina:On('deny', function(item) ESX.ShowNotification('Infinite Stamina : ~r~OFF')	 end) 
]]

toggleInvisibility:On('check', function(i)
  TriggerEvent('grp_admin:toggleInvisibility') 
  PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
    unsichtbarkeyt = true
end)
toggleInvisibility:On('uncheck', function(i)
  TriggerEvent('grp_admin:toggleInvisibility')   
  PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
  unsichtbarkeyt = false
end)


--[[
toggleSuperJump:On('confirm', function(item) TriggerEvent('grp_admin:toggleSuperJump')	 end) 
toggleSuperJump:On('confirm', function(item) ESX.ShowNotification('Super Jump : ~g~ON')	 end) 
toggleSuperJump:On('deny', function(item) TriggerEvent('grp_admin:toggleSuperJump')	 end) 
toggleSuperJump:On('deny', function(item) ESX.ShowNotification('Super Jump : ~r~OFF')	 end) 

svmaxArmor:On('confirm', function(item) TriggerEvent('grp_admin:toggleFastSprint')	 end) 
svmaxArmor:On('confirm', function(item) ESX.ShowNotification('Fast Sprint : ~g~ON')	 end) 
svmaxArmor:On('deny', function(item) TriggerEvent('grp_admin:toggleFastSprint')	 end) 
svmaxArmor:On('deny', function(item) ESX.ShowNotification('Fast Sprint : ~r~OFF')	 end) 

toggleFastSwim:On('confirm', function(item) TriggerEvent('grp_admin:toggleFastSwim')	 end) 
toggleFastSwim:On('confirm', function(item) ESX.ShowNotification('Fast Swim : ~g~ON')	 end) 
toggleFastSwim:On('deny', function(item) TriggerEvent('grp_admin:toggleFastSwim')	 end) 
toggleFastSwim:On('deny', function(item) ESX.ShowNotification('Fast Swim : ~r~OFF')	 end)
neongive:On('confirm', function(item) neonon() end)
neongive:On('deny', function(item) neonoff() end)
]]



--nameplayer:On('confirm', function(item) TriggerEvent('adminmenueee:namettgggs')	 end) 
--nameplayer:On('deny', function(item) TriggerEvent('adminmenueee:namettgggs')	 end)


--[[
blipsplayer:On('confirm', function(item) TriggerEvent('mostraBlipsonn', source)	 end)
blipsplayer:On('confirm', function(item) ESX.ShowNotification('Players Blips : ~g~ON') end) 
blipsplayer:On('deny', function(item) TriggerEvent('mostraBlipsofff', source)	 end)
blipsplayer:On('deny', function(item) ESX.ShowNotification('Players Blips : ~r~OFF') end) 
monkey:On('confirm', function(item) TriggerEvent('grp_admin:monkeyped') end)
monkey:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
stripper:On('confirm', function(item) TriggerEvent('grp_admin:stripper') end)
stripper:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
costume2:On('confirm', function(item) TriggerEvent('grp_admin:costume2') end)
costume2:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
costume3:On('confirm', function(item) TriggerEvent('grp_admin:costume3') end)
costume3:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
costume4:On('confirm', function(item) TriggerEvent('grp_admin:costume4') end)
costume4:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
costume5:On('confirm', function(item) TriggerEvent('grp_admin:costume5') end)
costume5:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
women1:On('confirm', function(item) TriggerEvent('grp_admin:women1') end)
women1:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
women2:On('confirm', function(item) TriggerEvent('grp_admin:women2') end)
women2:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
women4:On('confirm', function(item) TriggerEvent('grp_admin:women4') end)
women4:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
women5:On('confirm', function(item) TriggerEvent('grp_admin:women5') end)
women5:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)

women7:On('confirm', function(item) TriggerEvent('grp_admin:women7') end)
women7:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
women8:On('confirm', function(item) TriggerEvent('grp_admin:women8') end)
women8:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
women9:On('confirm', function(item) TriggerEvent('grp_admin:women9') end)
women9:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
women10:On('confirm', function(item) TriggerEvent('grp_admin:women10') end)
women10:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
women12:On('confirm', function(item) TriggerEvent('grp_admin:women12') end)
women12:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
women13:On('confirm', function(item) TriggerEvent('grp_admin:women13') end)
women13:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
women14:On('confirm', function(item) TriggerEvent('grp_admin:women14') end)
women14:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
women15:On('confirm', function(item) TriggerEvent('grp_admin:women15') end)
women15:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
women18:On('confirm', function(item) TriggerEvent('grp_admin:women18') end)
women18:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
women19:On('confirm', function(item) TriggerEvent('grp_admin:women19') end)
women19:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
women20:On('confirm', function(item) TriggerEvent('grp_admin:women20') end)
women20:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
women21:On('confirm', function(item) TriggerEvent('grp_admin:women21') end)
women21:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
women22:On('confirm', function(item) TriggerEvent('grp_admin:women22') end)
women22:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
women23:On('confirm', function(item) TriggerEvent('grp_admin:women23') end)
women23:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
women28:On('confirm', function(item) TriggerEvent('grp_admin:women28') end)
women28:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
women31:On('confirm', function(item) TriggerEvent('grp_admin:women31') end)
women31:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)

men1:On('confirm', function(item) TriggerEvent('grp_admin:men1') end)
men1:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
men2:On('confirm', function(item) TriggerEvent('grp_admin:men2') end)
men2:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
men3:On('confirm', function(item) TriggerEvent('grp_admin:men3') end)
men3:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
men4:On('confirm', function(item) TriggerEvent('grp_admin:men4') end)
men4:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
men5:On('confirm', function(item) TriggerEvent('grp_admin:men5') end)
men5:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
men6:On('confirm', function(item) TriggerEvent('grp_admin:men6') end)
men6:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
men7:On('confirm', function(item) TriggerEvent('grp_admin:men7') end)
men7:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
men8:On('confirm', function(item) TriggerEvent('grp_admin:men8') end)
men8:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
men9:On('confirm', function(item) TriggerEvent('grp_admin:men9') end)
men9:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
men10:On('confirm', function(item) TriggerEvent('grp_admin:men10') end)
men10:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
men11:On('confirm', function(item) TriggerEvent('grp_admin:men11') end)
men11:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
men12:On('confirm', function(item) TriggerEvent('grp_admin:men12') end)
men12:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
men13:On('confirm', function(item) TriggerEvent('grp_admin:men13') end)
men13:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
men14:On('confirm', function(item) TriggerEvent('grp_admin:men14') end)
men14:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
men15:On('confirm', function(item) TriggerEvent('grp_admin:men15') end)
men15:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
men16:On('confirm', function(item) TriggerEvent('grp_admin:men16') end)
men16:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
men17:On('confirm', function(item) TriggerEvent('grp_admin:men17') end)
men17:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
men18:On('confirm', function(item) TriggerEvent('grp_admin:men18') end)
men18:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
men19:On('confirm', function(item) TriggerEvent('grp_admin:men19') end)
men19:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
men20:On('confirm', function(item) TriggerEvent('grp_admin:men20') end)
men20:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
cosmonaut:On('confirm', function(item) TriggerEvent('grp_admin:cosmonaut') end)
cosmonaut:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
alien:On('confirm', function(item) TriggerEvent('grp_admin:alien') end)
alien:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
beach:On('confirm', function(item) TriggerEvent('grp_admin:beach') end)
beach:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
ped15:On('confirm', function(item) TriggerEvent('grp_admin:ped15') end)
ped15:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
ped16:On('confirm', function(item) TriggerEvent('grp_admin:ped16') end)
ped16:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
ped18:On('confirm', function(item) TriggerEvent('grp_admin:ped18') end)
ped18:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
ped19:On('confirm', function(item) TriggerEvent('grp_admin:ped19') end)
ped19:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
ped20:On('confirm', function(item) TriggerEvent('grp_admin:ped20') end)
ped20:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
ped21:On('confirm', function(item) TriggerEvent('grp_admin:ped21') end)
ped21:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
ped22:On('confirm', function(item) TriggerEvent('grp_admin:ped22') end)
ped22:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
ped23:On('confirm', function(item) TriggerEvent('grp_admin:ped23') end)
ped23:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)
ped24:On('confirm', function(item) TriggerEvent('grp_admin:ped24') end)
ped24:On('deny', function(item) TriggerEvent('grp_admin:openMenuPlayerZero') end)

spec:On('confirm', function(item) TriggerEvent('esx_spectate:spectate') end)
spec:On('confirm', function(item) MenuV:CloseAll() end)
spec:On('deny', function(item)  end)

changer_skin:On('confirm', function(item) MenuV:CloseAll() end)
changer_skin:On('confirm', function(item) changer_skin() end) 
changer_skin:On('deny', function(item) print('SP Admin V2') end)
giveallweapon:On('confirm', function(item) TriggerServerEvent('grp_admin:giveweapon') end) 
giveallweapon:On('confirm', function(item) ESX.ShowNotification('~g~Give All Weapons : ~g~✔️') end) 
giveallweapon:On('deny', function(item) TriggerServerEvent('grp_admin:removeweapon') end)
giveallweapon:On('deny', function(item) ESX.ShowNotification('~r~Remove All Weapons : ~r~✔️') end) 
]]
--menu:On('switch', function(item, currentItem, prevItem) print(('YOU HAVE SWITCH THE ITEMS FROM %s TO %s'):format(prevItem.__type, currentItem.__type)) end)

noclipv2:On('check', function(i)
noclipv2()
PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
end)


noclipv2:On('uncheck', function(i)
noclipv2()
PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
end)

--[[
deletecar:On('check', function(i)
	ExecuteCommand("dv")
end)
deletecar:On('uncheck', function(i)
  
end)

admin_vehicle_repair:On('check', function(i)
	admin_vehicle_repair()
end)
admin_vehicle_repair:On('uncheck', function(i)
  
end)

plaquecar:On('check', function(i)
	local newname = KeyboardInput('New 8 Characters Plate.', '', 8) 
    SetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false) , newname)
end)
plaquecar:On('uncheck', function(i)
 
end)

]]--

--[[
playerslistof:On('check', function(i)
MenuV:CloseAll()
TriggerEvent('grp_admin:openlistjoueur')
PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET")
end)


playerslistof:On('uncheck', function(i)
  
end)
]]
--[[
boostcar:On('check', function(i)
  FullVehicleBoost()
  ESX.ShowNotification('Full Boost : ~g~ON')
end)
boostcar:On('uncheck', function(i)
  
end)
]]


--onesync fehler
function getOnlinePlayers()
  local players = {}
  local me = PlayerId(-1)
  for i=0, maxPlayers, 1 do
    -- if NetworkIsPlayerConnected(i) and i ~= me then
    if NetworkIsPlayerConnected(i) then
      local playerName = GetPlayerName(i)
      local serverID = GetPlayerServerId(i)

      table.insert(players, {
        ['ped'] = GetPlayerPed(i),
        ['name'] = playerName,
        ['id'] = i,
        ['serverID'] = serverID,
      })
    end
  end
  return players
end
function admin_vehicle_repair()

    local ped = GetPlayerPed(-1)
    local car = GetVehiclePedIsUsing(ped)
	
		SetVehicleFixed(car)
		SetVehicleDirtLevel(car, 0.0)

end

function neonon()
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
                SetVehicleNeonLightEnabled(vehicle, 0, true)
                SetVehicleNeonLightEnabled(vehicle, 1, true)
                SetVehicleNeonLightEnabled(vehicle, 2, true)
                SetVehicleNeonLightEnabled(vehicle, 3, true)
end		
function neonoff()
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
                SetVehicleNeonLightEnabled(vehicle, 0, false)
                SetVehicleNeonLightEnabled(vehicle, 1, false)
                SetVehicleNeonLightEnabled(vehicle, 2, false)
                SetVehicleNeonLightEnabled(vehicle, 3, false)	
end			
	local noclip2
	--hier
function noclipv2()
            noclipActive = not noclipActive

            if IsPedInAnyVehicle(PlayerPedId(), false) then
                noclipEntity = GetVehiclePedIsIn(PlayerPedId(), false)
            else
                noclipEntity = PlayerPedId()
            end
			
			unsichtbarkeyt = noclipActive
            SetEntityCollision(noclipEntity, not noclipActive, not noclipActive)
            FreezeEntityPosition(noclipEntity, noclipActive)
            SetEntityInvincible(noclipEntity, noclipActive)
			
            SetVehicleRadioEnabled(noclipEntity, not noclipActive) 
end

modo_showcoord:On('check', function(i)
  Admin.showcoords = not Admin.showcoords  
    
end)
modo_showcoord:On('uncheck', function(i)
  Admin.showcoords = not Admin.showcoords    
end)
--[[
noclip:On('check', function(i)
  admin_no_clip()
  --hier
noclip = true
end)

noclip:On('uncheck', function(i)
admin_no_clip()
  noclip = false
end)
]]

--[[
heal:On('check', function(i)
ExecuteCommand("heal")
 notification("SP Life", "Administration", "Heal : ~r~✔️")
end)
heal:On('uncheck', function(i)
	
end)
]]

--[[
function changer_skin()
	TriggerEvent('esx_skin:openSaveableMenu', source)
   notification("SP Life", "Administration", "Change Bien ton skin p'tit coquin")
end

]]


RegisterNetEvent('grp_admin:menuv')
AddEventHandler('grp_admin:menuv', function()
	ESX.TriggerServerCallback('grd_Pets:Gruppegetten', function(plyGroup)
	if plyGroup == 'superadmin' or plyGroup == 'admin' then
	menu()
	else
	
	end
	end)
end)

local noclip = false
local noclip_speed = 1.0
function admin_no_clip()
  noclip = not noclip
  local ped = GetPlayerPed(-1)
  local entity = ped
  if noclip then -- activé
    SetEntityInvincible(ped, true)
    SetEntityVisible(ped, false, false)
  else -- désactivé
    SetEntityInvincible(ped, false)
    SetEntityVisible(ped, true, false)

  end
end

CreateThread(function()
  while true do
    Wait(0)
	local ped = GetPlayerPed(-1)
	local entity = ped
    if zeigmich then
    SetEntityLocallyVisible(entity)
	end
  end
end)

function getPosition()
  local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
  return x,y,z
end
function getCamDirection()
  local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(GetPlayerPed(-1))
  local pitch = GetGameplayCamRelativePitch()

  local x = -math.sin(heading*math.pi/180.0)
  local y = math.cos(heading*math.pi/180.0)
  local z = math.sin(pitch*math.pi/180.0)

  local len = math.sqrt(x*x+y*y+z*z)
  if len ~= 0 then
    x = x/len
    y = y/len
    z = z/len
  end

  return x,y,z
end
function isNoclip()
  return noclip
end



Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
	local ped = GetPlayerPed(-1)
	local entity = ped
	local autohurensohn = GetVehiclePedIsIn(ped)

    if unsichtbarkeyt then
	--hier
	SetEntityVisible(entity, false, false)
	SetEntityVisible(autohurensohn, false, false)
	SetEntityLocallyVisible(entity)
	SetEntityLocallyVisible(autohurensohn)
	DrawAdvancedText(1, 0.053, 0.005, 0.0028, 0.4, "Du bist unsichtbar", 255, 0, 0, 255, 6, 0)
	DrawAdvancedText(1, 0.053, 0.008, 0.0261, 0.4, "Andere Spieler können Dich nicht sehen..", 255, 0, 0, 255, 6, 0)
	else
	SetEntityVisible(entity, true, false)
	SetEntityVisible(autohurensohn, true, false)
	end		
   if noclip then
      local ped = GetPlayerPed(-1)
      local x,y,z = getPosition()
      local dx,dy,dz = getCamDirection()
      local speed = noclip_speed
	  local entity = ped
	
      -- reset du velocity
      SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)
      -- aller vers le haut
      if IsControlPressed(0,32) then -- MOVE UP
        x = x+speed*dx
        y = y+speed*dy
        z = z+speed*dz
      end

      -- aller vers le bas
      if IsControlPressed(0,269) then -- MOVE DOWN
        x = x-speed*dx
        y = y-speed*dy
        z = z-speed*dz
      end

      SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
    end
  end
end)
    Citizen.CreateThread(function()
    while true do
    	if Admin.showcoords then
            x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
            roundx=tonumber(string.format("%.2f",x))
            roundy=tonumber(string.format("%.2f",y))
            roundz=tonumber(string.format("%.2f",z))
            DrawTxt("~b~X:~s~ "..roundx,0.05,0.00)
            DrawTxt("     ~r~Y:~s~ "..roundy,0.11,0.00)
            DrawTxt("        ~g~Z:~s~ "..roundz,0.17,0.00)
            DrawTxt("              ~p~Heading:~s~ "..GetEntityHeading(PlayerPedId()),0.21,0.00)
        end
        if Admin.showcrosshair then
            DrawTxt('+', 0.495, 0.484, 1.0, 0.3, MainColor)
        end
    	Citizen.Wait(0)
    end
end)


function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end


--[[
function admin_give_money()
	DisplayOnscreenKeyboard(true, "FMMC_KEY_TIP8", "", "", "", "", "", 120)
	inputmoney = 1
end
]]


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
                --if group == true then 
					local ped = GetPlayerPed(-1)

	local unsichtstatus = IsEntityVisible(ped)
	--print(unsichtstatus)
					--[[
					if IsControlJustReleased(0, 101) and noclip then
					noclipv2()
					noclip = false
					print("lol")
					Citizen.Wait(100)
					end
					if IsControlJustReleased(0, 101) and noclip2 then
					print("lol2")
					admin_no_clip()
					noclip2 = false
					Citizen.Wait(100)
					end
					]]--
					if IsControlJustReleased(0, 344) then 
					ESX.TriggerServerCallback('grd_Pets:Gruppegetten', function(plyGroup)
					if plyGroup == 'superadmin' or plyGroup == 'admin' then					
					noclipv2()
					Citizen.Wait(100)
					else
					end
				end)
            end
        --end
    end
end)

--[[alt working
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
                --if group == true then 
				
				
					if IsControlJustReleased(0, 101) and noclip then
					noclipv2()
					noclip = false
					print("lol")
					Citizen.Wait(100)
					end
					if IsControlJustReleased(0, 101) and noclip2 then
					print("lol2")
					admin_no_clip()
					noclip2 = false
					Citizen.Wait(100)
					end
					if IsControlJustReleased(0, 344) then 
					ESX.TriggerServerCallback('grd_Pets:Gruppegetten', function(plyGroup)
					if plyGroup == 'superadmin' or plyGroup == 'admin' then
					if not noclip2 then
					noclipv2()
					print("lol3")
					Citizen.Wait(100)
					else
					--hier
					SetEntityVisible(entity, true, false)
					noclip2 = false
					noclipv2()
					end

					else
					end
					end)
                    end
                --end
       		 end
    end)
]]


function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)


	AddTextEntry('FMMC_KEY_TIP1', TextEntry) --Sets the Text above the typing field in the black square
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) --Actually calls the Keyboard Input
	blockinput = true --Blocks new input while typing if **blockinput** is used

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do --While typing is not aborted and not finished, this loop waits
		Citizen.Wait(0)
	end
		
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult() --Gets the result of the typing
		Citizen.Wait(500) --Little Time Delay, so the Keyboard won't open again if you press enter to finish the typing
		blockinput = false --This unblocks new Input when typing is done
		return result --Returns the result
	else
		Citizen.Wait(500) --Little Time Delay, so the Keyboard won't open again if you press enter to finish the typing
		blockinput = false --This unblocks new Input when typing is done
		return nil --Returns nil if the typing got aborted
	end
end

RegisterNetEvent('grp_admin:openMenuPlayerZero')
AddEventHandler('grp_admin:openMenuPlayerZero', function()
	openMenuPlayerZero()
end)


--NAMETAGS
RegisterNetEvent('adminmenueee:namettgggs')
AddEventHandler('adminmenueee:namettgggs', function()
ESX.TriggerServerCallback('grd_Pets:Gruppegetten', function(plyGroup)
	if plyGroup == 'superadmin' or plyGroup == 'admin' then
	showIDsAboveHead = not showIDsAboveHead
	else
	Citizen.Wait(10000)
	end
end)
end)


--ID über kopf

local playerDistances = {}


function DrawText3D(x,y,z, text, r,g,b) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*7 
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(r, g, b, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

disPlayerNames = 35 --distance you see IDs at 
keyToToggleIDs = 19 --left alt by default

playerDistances = {}
showIDsAboveHead = false





Citizen.CreateThread(function()
    while true do
        for id = 0, 255 do
            if GetPlayerPed(id) ~= GetPlayerPed(-1) then
                x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
                distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))
                playerDistances[id] = distance
            end
        end
        Citizen.Wait(1000)
    end
end)



Citizen.CreateThread(function()
    while true do
        if showIDsAboveHead then
            for id = 0, 255 do 
                if NetworkIsPlayerActive(id) then
                    if GetPlayerPed(id) ~= GetPlayerPed(-1) then
                        if (playerDistances[id] < disPlayerNames) then
                            x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))                                                       
                                DrawText3D(x2, y2, z2+1, GetPlayerName(id) .. " [" .. GetPlayerServerId(id) .. "]", 255,255,255)    
                        end  
                    end
                end
            end
        end
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        for _, id in ipairs(GetActivePlayers()) do
            local targetPed = GetPlayerPed(id)
            if targetPed ~= playerPed then
                local distance = #(playerCoords-GetEntityCoords(targetPed))
				playerDistances[id] = distance
            end
        end
        Wait(1000)
    end
end)

--ID über kopf ende


--[[
RegisterNetEvent("grp_admin:toggleInfStamina")
AddEventHandler("grp_admin:toggleInfStamina", function()
  infStamina = not infStamina
  if infStamina then
  else
  end
end)
]]


RegisterNetEvent("grp_admin:toggleInvisibility")
AddEventHandler("grp_admin:toggleInvisibility", function()
  invisibility = not invisibility
  SetEntityVisible(GetPlayerPed(-1), not invisibility, 0)
  SetForcePedFootstepsTracks(invisibility) -- TODO: all players ?!
end) 


--[[
RegisterNetEvent("grp_admin:toggleFastSprint")
AddEventHandler("grp_admin:toggleFastSprint", function()
  fastSprint = not fastSprint
  if fastSprint then
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
  else
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
  end
end)
RegisterNetEvent("grp_admin:toggleSuperJump")
AddEventHandler("grp_admin:toggleSuperJump", function()
  superJump = not superJump
  if superJump then
  else
  end
end)


RegisterNetEvent("grp_admin:toggleFastSwim")
AddEventHandler("grp_admin:toggleFastSwim", function()
  fastSwim = not fastSwim
  if fastSwim then
    SetSwimMultiplierForPlayer(PlayerId(), 1.49)
  else
    SetSwimMultiplierForPlayer(PlayerId(), 1.0)
  end
end)
]]


 function tpcoord()
 
local keyboard = exports["nh-keyboard"]:KeyboardInput({
    header = "Zu Koordinaten teleportieren", 
    rows = {
        {
            id = 0, 
            txt = "X (OHNE DECIMAL)"
        },
        {
            id = 1, 
            txt = "Y (OHNE DECIMAL)"
        },
		{
            id = 2, 
            txt = "Z (OHNE DECIMAL)"
        }
    }
})

if keyboard ~= nil then
    if keyboard[1].input == nil or keyboard[2].input == nil or keyboard[3].input == nil then return end
	ExecuteCommand("tp " .. keyboard[1].input .. ".30," .. keyboard[2].input .. ".30," .. keyboard[3].input .. ".30")
end

end



 function admin_tp_marker()
  local WaypointHandle = GetFirstBlipInfoId(8)

  if DoesBlipExist(WaypointHandle) then
    local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

    for height = 1, 1000 do
      SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

      local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

      if foundGround then
        SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

        break
      end

      Citizen.Wait(0)
    end

   
  end
end
