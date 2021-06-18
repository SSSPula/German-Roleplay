Config                 = {}
Config.DrawDistance    = 100.0
Config.MaxErrors       = 8
Config.SpeedMultiplier = 3.6
Config.Locale = 'en'

Config.Prices = {
	dmv         = 0,
	drive       = 0,
	drive_bike  = 0,
	drive_truck = 0
}

Config.VehicleModels = {
	drive       = 'dilettante',
	drive_bike  = 'pcj',
	drive_truck = 'pounder2'
}

Config.SpeedLimits = {
	residence = 85,
	town      = 85,
	freeway   = 125
}

Config.Zones = {

	DMVSchool = {
		Pos   = {x = 690.23, y = 601.64, z = 127.92},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 0
	},

	VehicleSpawnPoint = {
		Pos   = {x = 652.23, y = 615.59, z = 127.91, h = 339.41},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1
	}

}

Config.CheckPoints = {

	{
		Pos = {x = 663.3, y = 638.11, z = 127.91},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('next_point_speed', Config.SpeedLimits['residence']), 5000)
		end
	},

	{
		Pos = {x = 779.61, y = 595.2, z = 124.78},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = 852.22, y = 537.93, z = 124.78},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			Citizen.CreateThread(function()
				DrawMissionText(_U('stop_for_ped'), 5000)
				PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
				FreezeEntityPosition(vehicle, true)
				Citizen.Wait(4000)

				FreezeEntityPosition(vehicle, false)
				DrawMissionText(_U('good_lets_cont'), 5000)
			end)
		end
	},

	{
		Pos = {x = 1010.51, y = 496.84, z = 96.89},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('town')

			Citizen.CreateThread(function()
				DrawMissionText(_U('stop_look_left', Config.SpeedLimits['town']), 5000)
				PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
				FreezeEntityPosition(vehicle, true)
				Citizen.Wait(6000)

				FreezeEntityPosition(vehicle, false)
				DrawMissionText(_U('good_turn_right'), 5000)
			end)
		end
	},
--stage 1
	{
		Pos = {x = 942.68, y = 343.9, z = 88.23},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('watch_traffic_lightson'), 5000)
		end
	},

	{
		Pos = {x = 704.26, y = 32.86, z = 83.21},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},
-- stage2
	{
		Pos = {x = 536.38, y = 80.08, z = 95.38},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('stop_for_passing'), 5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
			FreezeEntityPosition(vehicle, true)
			Citizen.Wait(6000)
			FreezeEntityPosition(vehicle, false)
		end
	},

	{
		Pos = {x = 224.9, y = 196.39, z = 104.48},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},
--stage 3
	{
		Pos = {x = 269.58, y = 364.75, z = 105.3},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = 269.54, y = 545.81, z = 140.78},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('town')

			DrawMissionText(_U('hway_time', Config.SpeedLimits['town']), 5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
		end
	},

	{
		Pos = {x = 473.2, y = 376.83, z = 136.94},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},
--stage4
	{
		Pos = {x = 692.79, y = 340.5, z = 110.83},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},

	{
		Pos = {x = 913.41, y = 517.49, z = 119.57},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('go_next_point'), 5000)
		end
	},
--stage5
	{
		Pos = {x = 761.76, y = 618.27, z = 124.78},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('town')
			DrawMissionText(_U('in_town_speed', Config.SpeedLimits['town']), 5000)
		end
	},

	{
		Pos = {x = 649.56, y = 657.87, z = 127.91},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			DrawMissionText(_U('gratz_stay_alert'), 5000)
			PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', false, 0, true)
		end
	},

	{
		Pos = {x = 683.36, y = 630.47, z = 127.91},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			ESX.Game.DeleteVehicle(vehicle)
		end
	}

}
