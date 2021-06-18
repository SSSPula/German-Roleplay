Config = {
    IndependentGarage = false, -- if you store a vehicle in garage A, you can not take it out from garage B.
    ShowJobVehicles = false, -- show job vehicles such as police cars
    Damages = false, -- save & load damages when storing / retrieving a car?
    Use3DText = true, -- use 3d text?
    ImpoundPrice = 0, -- price to retrieve a vehicle from the impound
    AllowMultiple = false, -- allow people to take out vehicles from the impound if it is already out?
    DefaultJob = "", -- this is the job for cars which are not for jobs. For some servers, this should be just "" and for others "civ"
    DefaultType = "car", -- if type is not defined for the garage, it will chec kif the "type" in owned_vehicles is DefaultType

    Impounding = {
        AllowJobsToImpound = false, -- allow specific jobs to impound vehicles?
        Command = "impound", -- command for impounding, or false for disabled
        AllowedJobs = { -- the specific jobs allowed to impound vehicles, if AllowJobsToImpound is enabled
            "police",
        },
    },

    Interior = {
        Enabled = false, -- should you browse vehicles at the interior or at the garage location?
        Coords = vector4(228.8, -986.97, -99.96, 180.0) -- vector4(x, y, z, heading) location of the interior.
    },
    
    Garages = {
        --[[
            garage_name = coords = vector4(x, y, z, heading) -- garage location
        ]]
        square = {
            location = vector4(232.2, -792.48, 29.61, 160.0),
            vehicletype = "car",
        },
        airport = 
        {
            location = vector4(-742.92, -2473.92, 13.45, 330.0),
            vehicletype = "car",
        },
        motel = {
            location = vector4(288.39, -339.62, 43.94, 160.0),
            vehicletype = "car",
        },
        sandy = {
            location = vector4(1419.45, 3619.47, 33.92, 200.0),
            vehicletype = "car",
        },
        paleto = {
            location = vector4(56.66, 6385.43, 31.23, 343.02),   --Ab Hier weiter prüfen
            vehicletype = "car",
        },
        -----ADDON-----
        grape = {
            location = vector4(2742.51, 4404.23, 47.48, 150.22),
            vehicletype = "car",
        },
        wuerfelparkgarage = {
            location = vector4(221.93, -878.97, 17.32, 150.22),
            vehicletype = "car",
        },
        uni = {
            location = vector4(-1669.11, 65.76, 62.51, 292.17),
            vehicletype = "car",
        },
        garage33 = {
            location = vector4(1547.18, 3785.06, 34.07, 292.17),
            vehicletype = "car",
        },
        doj = {
            location = vector4(-406.89, 1213.63, 324.64, 164.4),
            vehicletype = "car",
        },
        gangarage = {
            location = vector4(1404.77, 1118.12, 114.84, 85.76),
            vehicletype = "car",
        },
        gangarage2 = {
            location = vector4(1156.83, -1663.02, 35.63, 208.68),
            vehicletype = "car",
        },
        knast = {
            location = vector4(1857.53, 2718.77, 44.93, 30.59),
            vehicletype = "car",
        },
        garage5018 = {
            location = vector4(-1537.13, 886.07, 180.68, 260.37),
            vehicletype = "car",
        },
        asche = {
            location = vector4(-1091.66, 4911.45, 213.88, 251.54),
            vehicletype = "car",
        },

        oamt = {
            location = vector4(405.6, -1641.98, 28.29, 225.38),
            vehicletype = "car",
        },
        weinberg = {
            location = vector4(-1918.32, 2057.17, 138.81, 250.38),
            vehicletype = "car",
        },
        pillbox = {
            location = vector4(-316.32, -1026.17, 29.39, 250.38),
            vehicletype = "car",
        },
        lswest = {
            location = vector4(-1060.25, -1410.15, 4.46, 78.38),
            vehicletype = "car",
        },
        mechaniker = {
            location = vector4(-162.81, -1303.24, 30.29, 87.45),
            vehicletype = "car",
        },
        hubsandy = {
            location = vector4(2311.43, 3145.54, 46.94, 88.44),
            vehicletype = "car",
        },
        hublossantos = {
            location = vector4(-633.15, -74.93, 39.41, 356.51),
            vehicletype = "car",
        },
        spawn = {
            location = vector4(-1575.63, 5148.1, 19.03, 185.13),
            vehicletype = "car",
        },
        grovetanke = {
            location = vector4(-63.63, -1838.56, 25.74, 229.13),
            vehicletype = "car",
        },
        autohaus2 = {
            location = vector4(-781.94, -193.94, 36.28, 29.87),
            vehicletype = "car",
        },
        tankstelle = {
            location = vector4(-2528.63, 2346.16, 32.03, 208.13),
            vehicletype = "car",
        },
        hafen = {
            location = vector4(782.33, -2977.16, 4.80, 71.43),
            vehicletype = "car",
        },
        flughafen = {
            location = vector4(-1032.53, -2723.14, 12.70, 235.13),
            vehicletype = "car",
        },
        eisenschmelze = {
            location = vector4(1065.05, -1972.33, 30.01, 326.61),
            vehicletype = "car",
        },
        eisenmine = {
            location = vector4(2962.07, 2745.96, 42.26, 301.93),
            vehicletype = "car",
        },
        MechanikerGaragePaletoBay = {
            location = vector4(134.61, 6653.08, 31.93, 225.0632),
            vehicletype = "car",
        },
        paletohub = {
            location = vector4(410.08758544922,6480.12109375,27.808757781982, 345.75),
            vehicletype = "car",
        },
        autohaus = {
            location = vector4(-42.831607818604,-1114.564453125,25.436136245728, 91.81),
            vehicletype = "car",
        },
        lossantoshub = {
            location = vector4(-1593.97, -1024.9, 12.02, 340.01),
            vehicletype = "car",
        },

        lossantoshubschiffe = {
            location = vector4(-1797.43, -1224.47, 0.61, 340.01),
            vehicletype = "car",
        },

        lossantosstrand1 = {
            location = vector4(-1247.04, -1863.49, 0.6, 119.01),
            vehicletype = "car",
        },

        lossantosstrand1 = {
            location = vector4(708.8, 4113.5, 29.75, 119.01),
            vehicletype = "car",
        },

        sushiladengarage = {
            location = vector4(-141.88, 276.26, 93.43, 178.56),
            vehicletype = "car",
        },

        cardealeroberesstockwerk = {
            location = vector4(127.78, -118.83, 53.83, 77.04),
            vehicletype = "car",
        },

        cardealerunteresstockwerk = {
            location = vector4(85.09, -210.57, 53.49, 345.62),
            vehicletype = "car",
        },

        ganggarage3 = {
            location = vector4(-135.1, 903.71, 234.79, 243.93),
            vehicletype = "car",
        },

        ganggarage5 = {
            location = vector4(-2552.53, 1912.12, 169.3, 240.0),
            vehicletype = "car",
        },

        ganggarage4 = {
            location = vector4(-67.26, 892.41, 234.55, 40.1),
            vehicletype = "car",
        },

        ganggarage6 = {
            location = vector4(-1795.25, 480.6, 132.81, 356.01),
            vehicletype = "car",
        },

        lshub2 = {
            location = vector4(1132.38, 61.99, 79.76, 145.1),
            vehicletype = "car",
        },
		
		lshub2boot = {
            location = vector4(1202.14, 192.63, 78.43, 27.1),
            vehicletype = "car",
        },

        franklinvilla = {
            location = vector4(13.71, 550.4, 176.36, 108.1),
            vehicletype = "car",
        },

        shopgarage55 = {
            location = vector4(-3040.39, 604.02, 6.55, 292.1),
            vehicletype = "car",
        },

        SeeGarage1 = {
            location = vector4(1434.38, 3825.27, 30.48, 304.52),
            vehicletype = "car",
        },

        SeeGarage2 = {
            location = vector4(1332.37, 4256.47, 32.36, 114.32),
            vehicletype = "car",
        },

        ---ADDON END----


        --Flugzeuge
        hangar = {
            location = vector4(-1274.35, -3381.59, 13.0, 331.31),
            vehicletype = "airplane",
        },
        --Boote
        --haven = {
        --    browse = vector3(-987.9, -1391.31, 0.6),
        --    spawn = vector4(-991.95, -1380.99, 0.0, 290.0),
        --    vehicletype = "boat"
        --}
    },

    Impounds = {

		--NEU
		
		{
            Retrieve = vector3(398.51803588867,-1649.1123046875,29.292642593384), -- where you open the menu to retrieve the car
            Spawn = vector4(403.64166259766,-1644.3804931641,29.291933059692, 139.39), -- where the car spawns
            vehicletype = "car",
        },
		
        {
			Retrieve = vector3(-3038.98, 594.52, 7.82),
            Spawn = vector4(-3049.68, 601.52, 6.3, 289.2),
            vehicletype = "car",
        },


        {
			Retrieve = vector3(1332.37, 4256.47, 32.36),
            Spawn = vector4(1332.37, 4256.47, 32.36, 114.32),
            vehicletype = "car",
        },

		{
			Retrieve = vector3(232.2, -792.48, 29.61),
            Spawn = vector4(232.2, -792.48, 29.61, 160.0),
            vehicletype = "car",
        },
         
        {
			Retrieve = vector3(-742.92, -2473.92, 13.45),
            Spawn = vector4(-742.92, -2473.92, 13.45, 330.0),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(288.39, -339.62, 43.94),
            Spawn = vector4(288.39, -339.62, 43.94, 160.0),
            vehicletype = "car",
        },
       
	--	{
	--		Retrieve = vector3(1419.45, 3619.47, 33.92),
    --        Spawn = vector4(1443.16, 3832.53, 33.92, 200.0),
    --        vehicletype = "car",
    --    },
        {
			Retrieve = vector3(56.66, 6385.43, 31.23),
            Spawn = vector4(56.66, 6385.43, 31.23, 343.02),   --Ab Hier weiter prüfen
            vehicletype = "car",
        },
        -----ADDON-----
        {
			Retrieve = vector3(2742.51, 4404.23, 47.48),
            Spawn = vector4(2742.51, 4404.23, 47.48, 150.22),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(1419.11, 3821.63, 32.03),
            Spawn = vector4(1434.38, 3825.27, 30.48, 304.52),
            vehicletype = "car",
        },
        --Mechaniker in PaletoBay

        {
			Retrieve = vector3(134.61,  6653.08, 31.93),
            Spawn = vector4(134.61, 6653.08, 31.93, 150.22),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(221.93, -878.97, 17.32),
            Spawn = vector4(221.93, -878.97, 17.32, 150.22),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(-1669.11, 65.76, 62.51),
            Spawn = vector4(-1669.11, 65.76, 62.51, 292.17),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(1547.18, 3785.06, 34.07),
            Spawn = vector4(1547.18, 3785.06, 34.07, 292.17),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(-406.89, 1213.63, 324.64),
            Spawn = vector4(-406.89, 1213.63, 324.64, 164.4),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(1404.77, 1118.12, 114.84),
            Spawn = vector4(1404.77, 1118.12, 114.84, 85.76),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(1156.83, -1663.02, 35.63),
            Spawn = vector4(1156.83, -1663.02, 35.63, 208.68),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(1857.53, 2718.77, 44.93),
            Spawn = vector4(1857.53, 2718.77, 44.93, 30.59),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(-1537.13, 886.07, 180.68),
            Spawn = vector4(-1537.13, 886.07, 180.68, 260.37),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(-1091.66, 4911.45, 213.88),
            Spawn = vector4(-1091.66, 4911.45, 213.88, 251.54),
            vehicletype = "car",
        },

        {
			Retrieve = vector3(405.6, -1641.98, 28.29),
            Spawn = vector4(405.6, -1641.98, 28.29, 225.38),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(-1918.32, 2057.17, 138.81),
            Spawn = vector4(-1918.32, 2057.17, 138.81, 250.38),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(-316.32, -1026.17, 29.39),
            Spawn = vector4(-316.32, -1026.17, 29.39, 250.38),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(-1060.25, -1410.15, 4.46),
            Spawn = vector4(-1060.25, -1410.15, 4.46, 78.38),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(-162.81, -1303.24, 30.29),
            Spawn = vector4(-162.81, -1303.24, 30.29, 87.45),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(2311.43, 3145.54, 46.94),
            Spawn = vector4(2311.43, 3145.54, 46.94, 88.44),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(-633.15, -74.93, 39.41),
            Spawn = vector4(-633.15, -74.93, 39.41, 356.51),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(-1575.63, 5148.1, 19.03),
            Spawn = vector4(-1575.63, 5148.1, 19.03, 185.13),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(-63.63, -1838.56, 25.74),
            Spawn = vector4(-63.63, -1838.56, 25.74, 229.13),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(-781.94, -193.94, 36.28),
            Spawn = vector4(-781.94, -193.94, 36.28, 29.87),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(-2528.63, 2346.16, 32.03),
            Spawn = vector4(-2528.63, 2346.16, 32.03, 208.13),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(782.33, -2977.16, 4.80),
            Spawn = vector4(782.33, -2977.16, 4.80, 71.43),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(-1032.53, -2723.14, 12.70),
            Spawn = vector4(-1032.53, -2723.14, 12.70, 235.13),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(1065.05, -1972.33, 30.01),
            Spawn = vector4(1065.05, -1972.33, 30.01, 326.61),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(2962.07, 2745.96, 42.26),
            Spawn = vector4(2962.07, 2745.96, 42.26, 301.93),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(410.08758544922,6480.12109375,27.808757781982),
            Spawn = vector4(410.08758544922,6480.12109375,27.808757781982, 345.75),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(-42.831607818604,-1114.564453125,25.436136245728),
            Spawn = vector4(-42.831607818604,-1114.564453125,25.436136245728, 91.81),
            vehicletype = "car",
        },
        {
			Retrieve = vector3(-1593.97, -1024.9, 12.02),
            Spawn = vector4(-1593.97, -1024.9, 12.02, 340.01),
            vehicletype = "car",
        },

        {
			Retrieve = vector3(-1797.43, -1224.47, 0.61),
            Spawn = vector4(-1797.43, -1224.47, 0.61, 340.01),
            vehicletype = "car",
        },

        {
			Retrieve = vector3(-1247.04, -1863.49, 0.6),
            Spawn = vector4(-1247.04, -1863.49, 0.6, 119.01),
            vehicletype = "car",
        },

        {
			Retrieve = vector3(708.8, 4113.5, 29.75),
            Spawn = vector4(708.8, 4113.5, 29.75, 119.01),
            vehicletype = "car",
        },

        {
			Retrieve = vector3(-141.88, 276.26, 93.43),
            Spawn = vector4(-141.88, 276.26, 93.43, 178.56),
            vehicletype = "car",
        },

        {
			Retrieve = vector3(140.94, -150.59, 59.49),
            Spawn = vector4(131.55, -119.59, 54.84, 73.24),
            vehicletype = "car",
        },

        {
			Retrieve = vector3(85.09, -210.57, 53.49),
            Spawn = vector4(85.09, -210.57, 53.49, 345.62),
            vehicletype = "car",
        },

        {
			Retrieve = vector3(-135.1, 903.71, 234.79),
            Spawn = vector4(-135.1, 903.71, 234.79, 243.93),
            vehicletype = "car",
        },

        {
			Retrieve = vector3(-2552.53, 1912.12, 169.3),
            Spawn = vector4(-2552.53, 1912.12, 169.3, 240.0),
            vehicletype = "car",
        },

        {
			Retrieve = vector3(-67.26, 892.41, 234.55),
            Spawn = vector4(-67.26, 892.41, 234.55, 40.1),
            vehicletype = "car",
        },

        {
			Retrieve = vector3(-1795.25, 480.6, 132.81),
            Spawn = vector4(-1795.25, 480.6, 132.81, 356.01),
            vehicletype = "car",
        },

        {
			Retrieve = vector3(1132.38, 61.99, 79.76),
            Spawn = vector4(1132.38, 61.99, 79.76, 145.1),
            vehicletype = "car",
        },
		
        {
			Retrieve = vector3(1202.14, 192.63, 78.43),
            Spawn = vector4(1202.14, 192.63, 78.43, 27.1),
            vehicletype = "car",
        },

        {
			Retrieve = vector3(13.71, 550.4, 176.36),
            Spawn = vector4(13.71, 550.4, 176.36, 108.1),
            vehicletype = "car",
        },
		
		
		--NEU ENDE


        --Mechaniker | Bennys 
        {
            Retrieve = vector3(-188.98, -1276.83, 30.29), -- where you open the menu to retrieve the car
            Spawn = vector4(-184.13, -1286.73, 31.3, 201.78), -- where the car spawns
            vehicletype = "car",
        },

        {
            Retrieve = vector3(470.49, -981.26, 25.20), -- where you open the menu to retrieve the car
            Spawn = vector4(450.81, -975.87, 25.66, 87.2), -- where the car spawns
            vehicletype = "car",
        },



      

        {
            Retrieve = vector3(-31.63, -1110.01, 25.43), -- where you open the menu to retrieve the car
            Spawn = vector4(-57.81, -1108.88, 26.43, 71.27), -- where the car spawns
            vehicletype = "car",
        },

        {
            Retrieve = vector3(-791.76, -218.02, 36.08), -- where you open the menu to retrieve the car
            Spawn = vector4(-784.26, -223.95, 37.32, 137.25), -- where the car spawns
            vehicletype = "car",
        },
        --Autohaus 2 Stockwerke
        {
            Retrieve = vector3(145.03, -119.56, 54.83), -- where you open the menu to retrieve the car
            Spawn = vector4(148.83, -125.71, 54.83, 174.47), -- where the car spawns
            vehicletype = "car",
        },
        

      --  --anderes Autohaus 
      --  {
      --      Retrieve = vector3(-759.7, -209.8, 36.27), -- where you open the menu to retrieve the car
      --      Spawn = vector4(-767.35, -219.76, 36.28, 28.65), -- where the car spawns
      --      vehicletype = "car",
      --  },
        
    --    {
    --        Retrieve = vector3(-1014.86, -3587.55, 1.18), -- where you open the menu to retrieve the car
    --        Spawn = vector4(-999.59, -3584.88, 1.27, 238.68), -- where the car spawns
    --        vehicletype = "car",
    --    },


        {
            Retrieve = vector3(-1615.52, -3137.48, 13.00), -- where you open the menu to retrieve the plane
            Spawn = vector4(-1654.096, -3146.48, 13.57, 329.89), -- where the plane spawns
            vehicletype = "airplane",
        },



    --   {
    --       Retrieve = vector3(-944.03, -1375.26, 0.6), -- where you open the menu to retrieve the boat
    --       Spawn = vector4(-947.69, -1365.79, 0.0, 290.0), -- where the boat spawns
    --       vehicletype = "boat",
    --   },
    }
}