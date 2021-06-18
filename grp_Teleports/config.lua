Config                            = {}

Config.Teleport2ers = {
--	['PDM'] = {
--		['Job'] = 'cardealer',
--		['Enter'] = { 
--			['x'] = -28.78, 
--			['y'] = -1094.37, 
--			['z'] = 25.45,
--			['Information'] = '~g~[E] Kino verlassen',
--		},
--		['Exit'] = {
--			['x'] = -24.48, 
--			['y'] = -1106.62, 
--			['z'] = 34.92, 
--			['Information'] = '~g~[E] Kino betreten' 
--		}
--	},

		--LOAF FIB Heist | Aufzüge in den 49. Stock und runter
		['FIBAUFZUG'] = {
			['Job'] = 'FIBAUFZUG',
			['Enter'] = { 
				['x'] = 136.02, 
				['y'] = -762.05, 
				['z'] = 241.25,
				['Information'] = '~g~[E] Kino verlassen',
			},
			['Exit'] = {
				['x'] = 136.02, 
				['y'] = -762.05, 
				['z'] = 44.85, 
				['Information'] = '~g~[E] Kino betreten' 
			}
		},

		--LOAF FIB Heist | 2. Aufzüge in den 49. Stock und runter
		['FIBAUFZUG2'] = {
			['Job'] = 'FIBAUFZUG2',
			['Enter'] = { 
				['x'] = 136.02, 
				['y'] = -762.05, 
				['z'] = 241.25,
				['Information'] = '~g~[E] Kino verlassen',
			},
			['Exit'] = {
				['x'] = 139.0, 
				['y'] = -762.83, 
				['z'] = 44.85, 
				['Information'] = '~g~[E] Kino betreten' 
			}
		},

			--FIB AUFZUG ZUM HELIPAD


	['FIBHELIPAD'] = {
		['Job'] = 'spawn',
		['Enter'] = { 
			['x'] = 138.36, 
			['y'] = -764.56, 
			['z'] = 241.15,
			['Information'] = '',
		},
		['Exit'] = {
			['x'] = -69.13, 
			['y'] = -818.06, 
			['z'] = 325.18, 
			['Information'] = '' 
		}
	},

	['FIBGARAGE'] = {
		['Job'] = 'spawn',
		['Enter'] = { 
			['x'] = 141.15, 
			['y'] = -765.62, 
			['z'] = 44.75,
			['Information'] = '',
		},
		['Exit'] = {
			['x'] = 109.83, 
			['y'] = -736.04, 
			['z'] = 32.13, 
			['Information'] = '' 
		}
	},

	--	--Skybar Aufzug 1
	--	['FIBAUFZUG2'] = {
	--		['Job'] = 'FIBAUFZUG2',
	--		['Enter'] = { 
	--			['x'] = 315.32, 
	--			['y'] = -929.66, 
	--			['z'] = 51.81,
	--			['Information'] = '~g~[E] Kino verlassen',
	--		},
	--		['Exit'] = {
	--			['x'] = 315.32, 
	--			['y'] = -929.66, 
	--			['z'] = 28.47, 
	--			['Information'] = '~g~[E] Kino betreten' 
	--		}
	--	},
--
	--	--Skybar Aufzug 2
	--	['FIBAUFZUG2'] = {
	--		['Job'] = 'FIBAUFZUG2',
	--		['Enter'] = { 
	--			['x'] = 309.92, 
	--			['y'] = -929.68, 
	--			['z'] = 51.81,
	--			['Information'] = '~g~[E] Kino verlassen',
	--		},
	--		['Exit'] = {
	--			['x'] = 309.92, 
	--			['y'] = -929.68, 
	--			['z'] = 28.47, 
	--			['Information'] = '~g~[E] Kino betreten' 
	--		}
	--	},

		--[[
	['spawn'] = {
		['Job'] = 'spawn',
		['Enter'] = { 
			['x'] = -1984.35, 
			['y'] = 3225.03, 
			['z'] = 31.81,
			['Information'] = 'Drücke [E] um Dein neues Leben zu starten.',
		},
		['Exit'] = {
			['x'] = -1820.18, 
			['y'] = 5612.04, 
			['z'] = 297.06, 
			['Information'] = '' 
		}
	},
	]]
	['lab2'] = {
		['Job'] = 'lab2',
		['Enter'] = { 
			['x'] = 996.877, 
			['y'] = -3200.6652, 
			['z'] = -37.39,
			['Information'] = '~g~[E] Verarbeiter verlassen',
		},
		['Exit'] = {
			['x'] = -1512.65,   
			['y'] = 1517.16, 
			['z'] = 114.20, 
			['Information'] = '~g~[E]  Verarbeiter betreten' 
		}
	},

	['KHDACHMEDIC'] = {
		['Job'] = 'ambulance',
		['Enter'] = { 
			['x'] = 339.29, 
			['y'] = -584.3, 
			['z'] = 73.30,
			['Information'] = '~g~[E] Aufs Dach',
		},
		['Exit'] = {
			['x'] = 332.14,   
			['y'] = -595.53, 
			['z'] = 42.38, 
			['Information'] = '~g~[E] ins Krankenhaus' 
		}
	},

	['HAUSAMWUERFELPARKTERASSE'] = {
		['Job'] = 'HAUSAMWUERFELPARKTERASSE',
		['Enter'] = { 
			['x'] = 109.28, 
			['y'] = -1090.53, 
			['z'] = 29.3,
			['Information'] = '~g~[E] Aufs Dach',
		},
		['Exit'] = {
			['x'] = 91.41,   
			['y'] = -1097.77, 
			['z'] = 63.29, 
			['Information'] = '~g~[E] Runter' 
		}
	},


	['InWohnung1von3'] = {
		['Job'] = '',
		['Enter'] = { 
			['x'] = -761.75, 
			['y'] = 351.89, 
			['z'] = 87.09,
			['Information'] = '~g~[E] in die Wohnung',
		},
		['Exit'] = {
			['x'] = -781.79,   
			['y'] = 326.26, 
			['z'] = 176.0, 
			['Information'] = '~g~[E] aus der Wohnung' 
		}
	},

	['InWohnung2von3'] = {
		['Job'] = '',
		['Enter'] = { 
			['x'] = -794.24, 
			['y'] = 351.96, 
			['z'] = 87.09,
			['Information'] = '~g~[E] in die Wohnung',
		},
		['Exit'] = {
			['x'] = -785.06,   
			['y'] = 323.59, 
			['z'] = 211.0, 
			['Information'] = '~g~[E] aus der Wohnung' 
		}
	},

	['Psychologe'] = {
		['Job'] = 'ambulance',
		['Enter'] = { 
			['x'] = -1911.46, 
			['y'] = -575.82, 
			['z'] = 18.1,
			['Information'] = '~g~[E] in die Wohnung',
		},
		['Exit'] = {
			['x'] = -1909.27,   
			['y'] = -574.87, 
			['z'] = 18.1, 
			['Information'] = '~g~[E] aus der Wohnung' 
		}
	},

	['Autohausmit2stockwerken'] = {
		['Job'] = 'cardealer2',
		['Enter'] = { 
			['x'] = 138.38, 
			['y'] = -137.29, 
			['z'] = 53.86,
			['Information'] = '~g~[E] ins erste Stockwerk',
		},
		['Exit'] = {
			['x'] = 137.56,   
			['y'] = -134.33, 
			['z'] = 59.52, 
			['Information'] = '~g~[E] ins Erdgeschoss' 
		}
	},

	--Hochzeit
	['Hochzeit'] = {
		['Job'] = 'nonee',
		['Enter'] = { 
			['x'] = -785.08, 
			['y'] = -14.72, 
			['z'] = -17.77,
			['Information'] = '~g~[E] zum Verlassen',
		},
		['Exit'] = {
			['x'] = -766.32,   
			['y'] = -23.97, 
			['z'] = 40.08, 
			['Information'] = '~g~[E]' 
		}
	},

	['KHDACHMEDIC2'] = {
		['Job'] = 'ambulance',
		['Enter'] = { 
			['x'] = 330.26, 
			['y'] = -601.02, 
			['z'] = 42.38,
			['Information'] = '~g~[E] Zur Garage',
		},
		['Exit'] = {
			['x'] = 339.96,   
			['y'] = -584.65, 
			['z'] = 27.8, 
			['Information'] = '~g~[E] ins Krankenhaus' 
		}
	}

	



	--Next here
}


