Config = {}
Config.Locale = 'en'

Config.DoorList = {

	

	

	----Bank
	--{
	--	objHash = GetHashKey('hei_v_ilev_bk_gate2_pris'),
	--	objHeading = 250.0,
	--	objCoords = vector3(261.99899291992, 221.50576782227, 106.68346405029),
	--	textCoords = vector3(261.99899291992, 221.50576782227, 107.68346405029),
	--	authorizedJobs = {'police','offpolice','hitman','banker'},
	--	locked = true,
	--	maxDistance = 2.0
	--},

		--cardealer
		{
			objHash = GetHashKey('v_ilev_fib_door1'),
			objHeading = 70.0,
			objCoords = vector3(-34.16, -1108.03, 26.43),
			textCoords = vector3(-34.16, -1108.03, 26.43),
			authorizedJobs = {'cardealer'},
			locked = true,
			maxDistance = 2.0
		},

	
	--PILLBOX HOSPITAL GABS BLUE / RED
	{
		textCoords = vector3(303.78, -582.09, 43.28),
		authorizedJobs = {'ambulance','hitman'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey('gabz_pillbox_doubledoor_l'), objHeading = -20.0, objCoords  = vector3(303.63, -580.96, 43.28)},
			{objHash = GetHashKey('gabz_pillbox_doubledoor_r'), objHeading = -20.0, objCoords  = vector3(304.87, -581.5, 43.28)}
		}
	},
	--
	-- Sandy Shores
	--

	-- Entrance
	{
		objHash = GetHashKey('v_ilev_shrfdoor'),
		objHeading = 30.0,
		objCoords = vector3(1855.1, 3683.5, 34.2),
		textCoords = vector3(1855.1, 3683.5, 35.0),
		authorizedJobs = {'police','offpolice','hitman','fib','offfib'},
		locked = false,
		maxDistance = 2.0
	},

	--
	-- Paleto Bay
	--

	-- Entrance (double doors)
	{
		textCoords = vector3(-443.5, 6016.3, 32.0),
		authorizedJobs = {'police','offpolice','hitman','fib','offfib'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_shrf2door'), objHeading = 315.0, objCoords  = vector3(-443.1, 6015.6, 31.7)},
			{objHash = GetHashKey('v_ilev_shrf2door'), objHeading = 135.0, objCoords  = vector3(-443.9, 6016.6, 31.7)}
		}
	},


	--Ambulance Pillbox

	{
		textCoords = vector3(303.08, -581.57, 43.28),
		authorizedJobs = {'ambulance','hitman','offambulance','police','fib','offfib'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_cor_firedoor'), objHeading = 315.0, objCoords  = vector3(303.08, -581.57, 43.28)},
			{objHash = GetHashKey('v_ilev_cor_firedoor'), objHeading = 135.0, objCoords  = vector3(304.84, -582.19, 43.28)}
		}
	},

	{
		textCoords = vector3(325.17, -589.48, 43.28),
		authorizedJobs = {'ambulance','hitman','offambulance','police','fib','offfib'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('gabz_pillbox_doubledoor_l'), objHeading = -20.0, objCoords  = vector3(324.81, -589.22, 43.28)},
			{objHash = GetHashKey('gabz_pillbox_doubledoor_r'), objHeading = -20.0, objCoords  = vector3(326.32, -589.22, 43.28)}
		}
	},
	--OP
	{
		textCoords = vector3(317.44, -578.4477, 43.43391),
		authorizedJobs = {'ambulance','hitman','offambulance','fib','offfib'},
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('gabz_pillbox_doubledoor_l'), objHeading = -200.0, objCoords  = vector3(318.4847, -579.2281, 43.43391)},
			{objHash = GetHashKey('gabz_pillbox_doubledoor_r'), objHeading = -200.0, objCoords  = vector3(316.0657, -578.3477, 43.43391)}
		}
	},
	--2. OP
	{
		textCoords = vector3(313.22, -571.88, 43.28),
		authorizedJobs = {'ambulance','hitman','offambulance','fib','offfib'},
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('gabz_pillbox_doubledoor_l'), objHeading = -20.0, objCoords  = vector3(312.67, -571.19, 43.28)},
			{objHash = GetHashKey('gabz_pillbox_doubledoor_r'), objHeading = -20.0, objCoords  = vector3(313.91, -571.61, 43.28)}
		}
	},
	--Common room
	{
	objHash = GetHashKey('gabz_pillbox_singledoor'),
	objHeading = -20.0,
	objCoords  = vector3(361.5034, -588.9995, 43.43391),
	textCoords = vector3(361.5034, -588.9995, 43.43391),
	authorizedJobs = {'ambulance','hitman','offambulance','fib','offfib'},
	locked = true,
	maxDistance = 2.55,
	size = 1
	},
	--Single Room
	{
		objHash = GetHashKey('gabz_pillbox_singledoor'),
		objHeading = -112.0,
		objCoords  = vector3(357.4908, -580.6105, 43.43391),
		textCoords = vector3(357.4908, -580.6105, 43.43391),
		authorizedJobs = {'ambulance','hitman','offambulance','fib','offfib'},
		locked = true,
		maxDistance = 2.55,
		size = 1
	},
	--Single Room2
	{
		objHash = GetHashKey('gabz_pillbox_singledoor'),
		objHeading = -112.0,
		objCoords  = vector3(355.82, -584.02, 43.43391),
		textCoords = vector3(355.82, -584.02, 43.43391),
		authorizedJobs = {'ambulance','hitman','offambulance','fib','offfib'},
		locked = true,
		maxDistance = 2.55,
		size = 1
	},
	--Single Room3
	{
		objHash = GetHashKey('gabz_pillbox_singledoor'),
		objHeading = -112.0,
		objCoords  = vector3(350.54, -598.65, 43.43391),
		textCoords = vector3(350.54, -598.65, 43.43391),
		authorizedJobs = {'ambulance','hitman','offambulance','fib','offfib'},
		locked = true,
		maxDistance = 2.55,
		size = 1
	},
	--Behandlung
	{
		objHash = GetHashKey('gabz_pillbox_singledoor'),
		objHeading = 70.0,
		objCoords  = vector3(347.2, -593.22, 43.43391),
		textCoords = vector3(347.2, -593.22, 43.43391),
		authorizedJobs = {'ambulance','hitman','offambulance','fib','offfib'},
		locked = true,
		maxDistance = 2.55,
		size = 1
	},
	--WARD B to C
	{
		textCoords = vector3(348.85, -587.5, 43.43391),
		authorizedJobs = {'ambulance','hitman','offambulance','police','fib','offfib'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('gabz_pillbox_doubledoor_l'), objHeading = -110.0, objCoords  = vector3(348.85, -587.0, 43.43391)},
			{objHash = GetHashKey('gabz_pillbox_doubledoor_r'), objHeading = -110.0, objCoords  = vector3(348.85, -588.0, 43.43391)}
		}
	},
	--XRAY
	{
		objHash = GetHashKey('gabz_pillbox_singledoor'),
		objHeading = -20.0,
		objCoords  = vector3(347.24, -584.32, 43.43391),
		textCoords = vector3(347.24, -584.32, 43.43391),
		authorizedJobs = {'ambulance','hitman','offambulance','fib','offfib'},
		locked = true,
		maxDistance = 2.55,
		size = 1
	},
	--MRI
	{
		objHash = GetHashKey('gabz_pillbox_singledoor'),
		objHeading = -20.0,
		objCoords  = vector3(336.65, -580.46, 43.43391),
		textCoords = vector3(336.65, -580.46, 43.43391),
		authorizedJobs = {'ambulance','hitman','offambulance','fib','offfib'},
		locked = true,
		maxDistance = 2.55,
		size = 1
	},
	
	--Büro Administration
	{
		objHash = GetHashKey('gabz_pillbox_singledoor'),
		objHeading = -20.0,
		objCoords  = vector3(339.62, -587.0, 43.43391),
		textCoords = vector3(339.62, -587.0, 43.43391),
		authorizedJobs = {'ambulance','hitman','offambulance','fib','offfib'},
		locked = true,
		maxDistance = 2.55,
		size = 1
	},
	
	--WARD A to B
	{
		textCoords = vector3(326.12, -579.5, 43.43391),
		authorizedJobs = {'ambulance','hitman','offambulance','police','fib','offfib'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('gabz_pillbox_doubledoor_l'), objHeading = -110.0, objCoords  = vector3(326.12, -579.0, 43.43391)},
			{objHash = GetHashKey('gabz_pillbox_doubledoor_r'), objHeading = -110.0, objCoords  = vector3(326.12, -579.0, 43.43391)}
		}
	},

	--OP 3
	{
		textCoords = vector3(324.56, -575.97, 43.43391),
		authorizedJobs = {'ambulance','hitman','offambulance','fib','offfib'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('gabz_pillbox_doubledoor_l'), objHeading = -20.0, objCoords  = vector3(323.0, -575.97, 43.43391)},
			{objHash = GetHashKey('gabz_pillbox_doubledoor_r'), objHeading = -20.0, objCoords  = vector3(325.0, -575.97, 43.43391)}
		}
	},

	--OP 1
	{
		textCoords = vector3(324.56, -575.97, 43.43391),
		authorizedJobs = {'ambulance','hitman','offambulance','fib','offfib'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('gabz_pillbox_doubledoor_l'), objHeading = -20.0, objCoords  = vector3(323.0, -575.97, 43.43391)},
			{objHash = GetHashKey('gabz_pillbox_doubledoor_r'), objHeading = -20.0, objCoords  = vector3(325.0, -575.97, 43.43391)}
		}
	},

	--OP 2
	{
		textCoords = vector3(318.83, -573.85, 43.28),
		authorizedJobs = {'ambulance','hitman','offambulance','fib','offfib'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('gabz_pillbox_doubledoor_l'), objHeading = -20.0, objCoords  = vector3(318.48, -573.36, 43.28)},
			{objHash = GetHashKey('gabz_pillbox_doubledoor_r'), objHeading = -20.0, objCoords  = vector3(319.64, -574.38, 43.28)}
		}
	},
	--Zur Rezeption
	{
		objHash = GetHashKey('gabz_pillbox_singledoor'),
		objHeading = 250.0,
		objCoords  = vector3(313.19, -596.38, 43.28),
		textCoords = vector3(313.19, -596.38, 43.28),
		authorizedJobs = {'ambulance','hitman','offambulance','fib','offfib'},
		locked = true,
		maxDistance = 2.55,
		size = 1
	},
	--Zur Rezeption
	{
		objHash = GetHashKey('gabz_pillbox_singledoor'),
		objHeading = 160.0,
		objCoords  = vector3(308.55, -597.51, 43.28),
		textCoords = vector3(308.55, -597.51, 43.28),
		authorizedJobs = {'ambulance','hitman','offambulance','fib','offfib'},
		locked = true,
		maxDistance = 2.55,
		size = 1
	},
	--Zum Teamraum
	{
		objHash = GetHashKey('gabz_pillbox_singledoor'),
		objHeading = 250.0,
		objCoords  = vector3(303.76, -597.08, 43.28),
		textCoords = vector3(303.76, -597.08, 43.28),
		authorizedJobs = {'ambulance','hitman','offambulance','fib','offfib'},
		locked = true,
		maxDistance = 2.55,
		size = 1
	},


	-- Bolingbroke Penitentiary
	--

	-- Entrance (Two big gates)
	{
		objHash = GetHashKey('prop_gate_prison_01'),
		objCoords = vector3(1844.9, 2604.8, 44.6),
		textCoords = vector3(1844.9, 2608.5, 48.0),
		authorizedJobs = {'police','offpolice','hitman', 'ambulance', 'doj', 'sheriff','fib','offfib'},
		locked = true,
		maxDistance = 12,
		size = 2
	},

	{
		objHash = GetHashKey('prop_gate_prison_01'),
		objCoords = vector3(1818.5, 2604.8, 44.6),
		textCoords = vector3(1818.5, 2608.4, 48.0),
		authorizedJobs = {'police','offpolice','hitman', 'ambulance', 'doj', 'sheriff','fib','offfib'},
		locked = true,
		maxDistance = 12,
		size = 2
	},

--	-- Jail Entry
--	{
--		objHash = GetHashKey('v_ilev_gtdoor'),
--		objHeading = 90.0,
--		objCoords  = vector3(1845.25, 2586.07, 45.88),
--		textCoords = vector3(1845.25, 2586.07, 45.88),
--		authorizedJobs = {'police','offpolice','hitman'},
--		locked = true,
--		maxDistance = 2.55,
--		size = 1
--	},
--	--Jail Door to Room with multiple Doors HALLWAY
--	{
--		objHash = GetHashKey('v_ilev_gtdoor'),
--		objHeading = 90.0,
--		objCoords  = vector3(1837.87, 2585.89, 46.25),
--		textCoords = vector3(1837.87, 2585.89, 46.25),
--		authorizedJobs = {'police','offpolice','hitman'},
--		locked = true,
--		maxDistance = 2.55,
--		size = 1.5
--	},
--	--Jail Door 
--	
--	{
--		objHash = GetHashKey('v_ilev_phroofdoor'),
--		objHeading = 90.0,
--		objCoords  = vector3(1765.61, 2566.80, 45.56),
--		textCoords = vector3(1765.61, 2566.80, 45.56),
--		authorizedJobs = {'police','offpolice','hitman'},
--		locked = true,
--		maxDistance = 5.55,
--		size = 1.5
--	},
--	{
--		objHash = GetHashKey('v_ilev_gtdoor'),
--		objHeading = 0.0,
--		objCoords  = vector3(1828.747, 2583.597, 45.9523),
--		textCoords = vector3(1828.44, 2584.5, 45.95),
--		authorizedJobs = {'police','offpolice','hitman'},
--		locked = true,
--		maxDistance = 2.55,
--		size = 1.5
--	},
--	--Outside
--	{
--		objHash = GetHashKey('v_ilev_gtdoor'),
--		objHeading = 90.0,
--		objCoords  = vector3(1826.747, 2585.5, 45.75),
--		textCoords = vector3(1826.747, 2585.5, 45.75),
--		authorizedJobs = {'police','offpolice','hitman'},
--		locked = false,
--		maxDistance = 2.55,
--		size = 1.5
--	},
--	--another fucking jail door
--	{
--		objHash = GetHashKey('v_ilev_gtdoor'),
--		objHeading = 0.0,
--		objCoords  = vector3(1828.1, 2587.7, 45.95),
--		textCoords = vector3(1828.1, 2587.7, 45.95),
--		authorizedJobs = {'police','offpolice','hitman'},
--		locked = false,
--		maxDistance = 2.55,
--		size = 1.5
--	},
--	--YET ANOTHER JAIL DOOR lel
--	{
--		objHash = GetHashKey('v_ilev_gtdoor'),
--		objHeading = 90.0,
--		objCoords  = vector3(1818.76, 2594.47, 45.72),
--		textCoords = vector3(1818.76, 2594.47, 45.72),
--		authorizedJobs = {'police','offpolice','hitman'},
--		locked = true,
--		maxDistance = 2.55,
--		size = 1.5
--	},

	 -- VIP Door Nightclub 1
	 {
		objHash = GetHashKey('ba_prop_door_club_glass'),
		objHeading = 140.0,
		objCoords  = vector3(-1614.40, -3008.41, -75.21),
		textCoords = vector3(-1614.40, -3008.41, -75.00),
		authorizedJobs = {'nightclub','hitman','fib','offfib'},
		locked = false,
		maxDistance = 2.55,
		size = 1
	},
	--Tür zu Club und den Klos
	{
		objHash = GetHashKey('ba_prop_door_club_glam_generic'),
		objHeading = 180.0,
		objCoords  = vector3(-1610.78, -3005.05, -79.01),
		textCoords = vector3(-1610.78, -3005.05, -78.00),
		authorizedJobs = {'nightclub','hitman','fib','offfib'},
		locked = false,
		maxDistance = 2.55,
		size = 2
	},
	----SHERIFF TRY THIS FUCKERINGO
	--{
	--	objHash = GetHashKey('v2_sheriff_door4_2'),
	--	objHeading = -15.0,
	--	objCoords = vector3(1854.88, 3683.97, 201.921),
	--	textCoords = vector3(1854.88, 3683.97, 201.921),
	--	authorizedJobs = {'police','offpolice','sheriff'},
	--	locked = true,
	--	maxDistance = 2.00
	--},
	--DOJ Eingang
	{
		objHash = GetHashKey('v_ilev_fib_door1'),
		objHeading = -15.0,
		objCoords = vector3(-429.47, 1108.83, 327.68),
		textCoords = vector3(-429.47, 1108.83, 327.68),
		authorizedJobs = {'police','offpolice','doj','fib','offfib'},
		locked = true,
		maxDistance = 2.00
	},
	--DOJ Raum 1
	{
		objHash = GetHashKey('v_ilev_cbankcountdoor01'),
		objHeading = -195.0,
		objCoords = vector3(-431.97, 1098.31, 327.69),
		textCoords = vector3(-431.97, 1098.31, 327.69),
		authorizedJobs = {'police','offpolice','doj','fib','offfib'},
		locked = false,
		maxDistance = 2.00
	},
	--DOJ Raum 2
	{
		objHash = GetHashKey('v_ilev_cbankcountdoor01'),
		objHeading = 70.0,
		objCoords = vector3(-433.07, 1103.94, 327.67),
		textCoords = vector3(-433.07, 1103.94, 327.67),
		authorizedJobs = {'police','offpolice','doj','fib','offfib'},
		locked = false,
		maxDistance = 2.00
	},
	
	--LSPD START
	{         textCoords = vector3(434.8244, -981.9556, 30.8153),         authorizedJobs = {'police','sheriff','offpolice','offsheriff','hitman','doj','fib','offfib'},         locked = true,         maxDistance = 4,         doors = {             {objHash = GetHashKey('gabz_mrpd_reception_entrancedoor'), objHeading = -90.0, objCoords  = vector3(434.7444, -980.7556, 30.8153)},             {objHash = GetHashKey('gabz_mrpd_reception_entrancedoor'), objHeading = 90.0, objCoords  = vector3(434.7444, -983.0781, 30.8153)}         }     },
	{         textCoords = vector3(441.9692, -998.7262, 30.8153),         authorizedJobs = {'police','offpolice','sheriff','offsheriff','hitman','doj','fib','offfib'},        locked = true,         maxDistance = 4,         doors = {             {objHash = GetHashKey('gabz_mrpd_reception_entrancedoor'), objHeading = 0.0, objCoords  = vector3(440.7392, -998.7462, 30.8153)},             {objHash = GetHashKey('gabz_mrpd_reception_entrancedoor'), objHeading = 180.0, objCoords  = vector3(443.0618, -998.7462, 30.8153)}         }     },
--tür 1 oder so
	--Ordnungsamt
	{
		objHash = GetHashKey('v_ilev_arm_secdoor'),
		objHeading = 317.0,
		objCoords = vector3(357.94, -1685.47, 27.3),
		textCoords = vector3(356.82, -1685.36, 27.3),
		authorizedJobs = {'offordnungsamt','ordnungsamt','fib','offfib'},
		locked = true,
		maxDistance = 2.00,
		size = 1
	},
	--tür 1 oder so
 {
        textCoords = vector3(457.1662, -972.173, 30.81531),
        authorizedJobs = {'police','offpolice','hitman','sheriff','doj','fib','offfib'},
        locked = true,
        maxDistance = 4,
        doors = {
            {objHash = GetHashKey('gabz_mrpd_reception_entrancedoor'), objHeading = 0.0, objCoords  = vector3(455.8862, -972.2543, 30.81531)},
            {objHash = GetHashKey('gabz_mrpd_reception_entrancedoor'), objHeading = -180.0, objCoords  = vector3(458.2087, -972.2543, 30.81531)}
        }
    },	
--tür 2 (viel spaß beim suchen dewen)	
 {
        textCoords = vector3(457.1662, -972.173, 30.81531),
        authorizedJobs = {'police','offpolice','hitman','sheriff','doj','fib','offfib'},
        locked = true,
        maxDistance = 4,
        doors = {
            {objHash = GetHashKey('gabz_mrpd_reception_entrancedoor'), objHeading = 0.0, objCoords  = vector3(455.8862, -972.2543, 30.81531)},
            {objHash = GetHashKey('gabz_mrpd_reception_entrancedoor'), objHeading = -180.0, objCoords  = vector3(458.2087, -972.2543, 30.81531)}
        }
    },

--einfach top oder heli oder irgend nen scheiss mach dach mach dach das hat 4 buchstaben he he he he du soast ja okay 
{
        objHash = GetHashKey('gabz_mrpd_door_03'),
        objHeading = 90.0,
        objCoords = vector3(464.3086, -984.5284, 43.77124),
        textCoords = vector3(464.3386, -983.7784, 43.77124),
        authorizedJobs = {'police','offpolice','hitman','sheriff','doj','fib','offfib'},
        locked = true,
        maxDistance = 2.0
    },
--nicht wie beim skrambelt objekt
{
        objHash = GetHashKey('gabz_mrpd_room13_parkingdoor'),
        objHeading = 270.0,
        objCoords = vector3(464.1591, -974.6656, 26.3707),
        textCoords = vector3(464.2091, -975.3956, 26.3707),
        authorizedJobs = {'police','offpolice','hitman','sheriff','doj','fib','offfib'},
        locked = true,
        maxDistance = 2.0
    },
--mein kaffee ist kalt
{
        objHash = GetHashKey('gabz_mrpd_room13_parkingdoor'),
        objHeading = 90.0,
        objCoords = vector3(464.1566, -997.5093, 26.3707),
        textCoords = vector3(464.1701, -996.9093, 26.3707),
        authorizedJobs = {'police','offpolice','hitman','sheriff','doj','fib','offfib'},
        locked = true,
        maxDistance = 2.0
    },
--lol
    {
        textCoords = vector3(468.6186, -1014.316, 26.48382),
        authorizedJobs = {'police','offpolice','hitman','sheriff','doj','fib','offfib'},
        locked = true,
        maxDistance = 4,
        doors = {
            {objHash = GetHashKey('gabz_mrpd_door_03'), objHeading = -180.0, objCoords  = vector3(469.7743, -1014.406, 26.48382)},
            {objHash = GetHashKey('gabz_mrpd_door_03'), objHeading = 0.0, objCoords  = vector3(467.3686, -1014.406, 26.48382)}
        }
    },
--zellelele 1
    {
        objHash = GetHashKey('gabz_mrpd_cells_door'),
        objHeading = 0.0,
        objCoords = vector3(486.9131, -1012.189, 26.48005),
        textCoords = vector3(486.2631, -1012.169, 26.48005),
        authorizedJobs = {'police','offpolice','hitman','sheriff','doj','fib','offfib'},
        locked = true,
        maxDistance = 2.0
    },
--zelle 2
    {
        objHash = GetHashKey('gabz_mrpd_cells_door'),
        objHeading = 0.0,
        objCoords = vector3(483.9127, -1012.189, 26.48005),
        textCoords = vector3(483.1627, -1012.229, 26.48005),
        authorizedJobs = {'police','offpolice','hitman','sheriff','doj','fib','offfib'},
        locked = true,
        maxDistance = 2.0
    },
--zelle 3
    {
        objHash = GetHashKey('gabz_mrpd_cells_door'),
        objHeading = 0.0,
        objCoords = vector3(480.9128, -1012.189, 26.48005),
        textCoords = vector3(480.0728, -1012.129, 26.48005),
        authorizedJobs = {'police','offpolice','hitman','sheriff','doj','fib','offfib'},
        locked = true,
        maxDistance = 2.0
    },
--zelle 4
    {
        objHash = GetHashKey('gabz_mrpd_cells_door'),
        objHeading = 0.0,
        objCoords = vector3(477.9126, -1012.189, 26.48005),
        textCoords = vector3(476.9926, -1012.289, 26.48005),
        authorizedJobs = {'police','offpolice','hitman','sheriff','doj','fib','offfib'},
        locked = true,
        maxDistance = 2.0
    },
--zelle5
    {
        objHash = GetHashKey('gabz_mrpd_cells_door'),
        objHeading = -90.0,
        objCoords = vector3(476.6157, -1008.875, 26.48005),
        textCoords = vector3(476.537, -1007.955, 26.48005),
        authorizedJobs = {'police','offpolice','hitman','sheriff','doj','fib','offfib'},
        locked = true,
        maxDistance = 2.0
    },
	--unnötige scheisstür die nur bugs hervorruft
	{
        objHash = GetHashKey('gabz_mrpd_door_01'),
        objHeading = 180.0,
        objCoords = vector3(475.9539, -1006.938, 26.40639),
        textCoords = vector3(475.0539, -1006.978, 26.40639),
        authorizedJobs = {'police','offpolice','hitman','sheriff','doj','fib','offfib'},
        locked = true,
        maxDistance = 1.0
    },		
    {
        objHash = GetHashKey('gabz_mrpd_cells_door'),
        objHeading = 180.0,
        objCoords = vector3(481.0084, -1004.118, 26.48005),
        textCoords = vector3(481.8684, -1004.098, 26.48005),
        authorizedJobs = {'police','offpolice','hitman','sheriff','doj','fib','offfib'},
        locked = true,
        maxDistance = 2.0
	},
	--Poller vor PD Hurensohn | Wenn du das liest abonnier mal Gerd Hansen du Hund

--	{
--		textCoords = vector3(410.01, -1024.226, 29.22022),
--		authorizedJobs = {'police'},
--		locked = true,
--		maxDistance = 5,
--		doors = {
--			{objHash = GetHashKey('gabz_mrpd_bollards2'), objHeading = 90.0, objCoords  = vector3(410.01, -1024.226, 29.22022)},
--			{objHash = GetHashKey('gabz_mrpd_bollards1'), objHeading = 90.0, objCoords  = vector3(410.0258, -1024.22, 29.22022)}
--		}
--	},
	--Poller vor PD Hurensohn 2


	--FOYER
	{
        objHash = GetHashKey('gabz_mrpd_door_04'),
        objHeading = 0.0,
        objCoords = vector3(440.5201, -977.6011, 29.82319),
        textCoords = vector3(441.6, -977.68, 30.82319),
        authorizedJobs = {'police','offpolice','hitman','sheriff','doj','fib','offfib'},
        locked = true,
        maxDistance = 2.0
	},	


	--DOJ
	--FOYER
	{
        objHash = GetHashKey('v_ilev_fh_frontdoor'),
        objHeading = -12.0,
        objCoords = vector3(-429.64, 1109.3, 327.68),
        textCoords = vector3(-429.64, 1109.3, 327.68),
        authorizedJobs = {'hitman','doj','fib','offfib'},
        locked = false,
        maxDistance = 2.0
	},
	--DOJ ENDE
	
	--FOYER2
	{
        objHash = GetHashKey('gabz_mrpd_door_05'),
        objHeading = 180.0,
        objCoords = vector3(440.5201, -986.2335, 30.82319),
        textCoords = vector3(440.5201, -986.2335, 30.82319),
        authorizedJobs = {'police','offpolice','hitman','sheriff','doj','fib','offfib'},
        locked = true,
        maxDistance = 2.0
    },


		-- Entrance
		{
			objHash = GetHashKey('p_e2_fightclubdoor'),
			objHeading = 30.0,
			objCoords = vector3(928.6, -1787.9, 30.75),
			textCoords = vector3(928.6, -1787.9, 30.75),
			authorizedJobs = {'offambulance','hitman','sheriff','doj','fib','offfib'},
			locked = false,
			maxDistance = 2.0
		},

	--letzte tür große zelle
{
        objHash = GetHashKey('gabz_mrpd_cells_door'),
        objHeading = 180.0,
        objCoords = vector3(484.1763, -1007.734, 26.48005),
        textCoords = vector3(485.0863, -1007.744, 26.48005),
        authorizedJobs = {'police','offpolice','hitman','sheriff','doj','fib','offfib'},
        locked = true,
        maxDistance = 2.0
    }

}















