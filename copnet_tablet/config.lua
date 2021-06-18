Config = {}

--[[
Befehl "/copnet"?
Ja = true
Nein = false
]]
Config.Commands = false

--[[
Man soll das Tablet nur in eine Fahrzeug öffnen können?
Ja = true
Nein = false
]]
Config.OnlyInVehicle = false

--[[
Man soll das Tablet nur in eine Dienstfahrzeug öffnen können? (Fahrzeug muss in der Emergency Class sein)
Wird nur beachtet, wenn "OnlyInVehicle" auf "true" ist
Ja = true
Nein = false
]]
Config.OnlyInEmergencyVehicle = false

-- Für CopNet:
Config.Hotkey = 'F10' 
-- Für MedicNet:
Config.MedicHotkey = 'nil'



--[[
Animation beim öffnen des Tablets?
Ja = true
Nein = false
]]
Config.Animation = true