
ESX              = nil
local PlayerData = {}


local Position1 = { --TDM rundenende
        {x = 3457.813, y = 3718.295, z = 36.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 3482.813, y = 3738.295, z = 36.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 3513.813, y = 3726.295, z = 36.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 3553.813, y = 3735.295, z = 36.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 3537.813, y = 3706.295, z = 36.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 3568.813, y = 3709.295, z = 36.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 3603.813, y = 3726.295, z = 36.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 3508.813, y = 3702.295, z = 36.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 3487.813, y = 3719.295, z = 36.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 3576.813, y = 3698.295, z = 36.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},


}

local hubs = { --TDM rundenende
        {x = 410.813, y = 6475.295, z = 28.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 448.813, y = 6468.295, z = 29.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 415.813, y = 6454.295, z = 28.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 396.813, y = 6485.295, z = 28.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 426.813, y = 6552.295, z = 27.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = -1617.813, y = -1047.295, z = 13.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = -1608.813, y = -1017.295, z = 13.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = -1672.813, y = -1116.295, z = 13.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 1107.813, y = 105.295, z = 80.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 1137.813, y = 147.295, z = 80.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 1165.813, y = 123.295, z = 80.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 1141.813, y = 107.295, z = 80.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 1139.813, y = 124.295, z = 80.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 1151.813, y = 82.295, z = 80.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 2353.813, y = 3161.295, z = 48.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 2283.813, y = 3148.295, z = 48.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 2320.813, y = 3131.295, z = 48.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 2335.813, y = 3099.295, z = 48.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 2367.813, y = 3104.295, z = 48.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 2372.813, y = 3134.295, z = 48.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 2351.813, y = 3131.295, z = 56.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},	
}


local Position2 = {
    {x = -750.813, y = -2394.295, z = 14.573, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = -768.813, y = -2372.295, z = 14.573, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = -790.813, y = -2360.295, z = 14.573, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = -814.813, y = -2373.295, z = 14.573, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = -820.813, y = -2390.295, z = 14.573, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = -818.813, y = -2408.295, z = 14.573, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = -805.813, y = -2434.295, z = 14.573, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = -784.813, y = -2448.295, z = 14.573, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = -775.813, y = -2429.295, z = 14.573, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},




}

local keynot = { --keynote
        {x = 623.813, y = 595.295, z = 129.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 652.813, y = 582.295, z = 129.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 661.813, y = 568.295, z = 129.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 679.813, y = 559.295, z = 129.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 704.813, y = 554.295, z = 129.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 672.813, y = 557.295, z = 129.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 659.813, y = 581.295, z = 129.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 671.813, y = 585.295, z = 135.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 661.813, y = 595.295, z = 135.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 659.813, y = 581.295, z = 135.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 677.813, y = 599.295, z = 135.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 689.813, y = 595.295, z = 140.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 703.813, y = 564.295, z = 135.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 709.813, y = 563.295, z = 135.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 708.813, y = 568.295, z = 135.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 730.813, y = 550.295, z = 135.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
        {x = 728.813, y = 525.295, z = 135.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},


}

local keynotean = false

RegisterCommand("keynotean", function(source)
	
	ESX.TriggerServerCallback('grd_Pets:Gruppegetten', function(plyGroup)
	if plyGroup == 'superadmin' or plyGroup == 'admin' then
	
	keynotean = true
	exports['mythic_notify']:DoHudText('inform', 'Keynote: an', { ['background-color'] = '#ffffff', ['color'] = '#000000' })

	else
	exports['mythic_notify']:SendAlert('error', 'Du musst Admin sein.!', 2500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	end
	end)

end)

RegisterCommand("keynoteaus", function(source)
	
	ESX.TriggerServerCallback('grd_Pets:Gruppegetten', function(plyGroup)
	if plyGroup == 'superadmin' or plyGroup == 'admin' then
	
	keynotean = false
	exports['mythic_notify']:DoHudText('inform', 'Keynote: aus', { ['background-color'] = '#ffffff', ['color'] = '#000000' })

	else
	exports['mythic_notify']:SendAlert('error', 'Du musst Admin sein.!', 2500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	end
	end)

end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if IsControlJustPressed(0, 20) and keynotean then
		
		TriggerServerEvent('esx_rich-dext_effect:syncServer', 'scr_indep_fireworks', 'scr_indep_firework_starburst', 'keynot', 5000)	
		end
		

	end
end)



--[[
eff 8
eff 9
eff 2 (auf dach)




]]


local Position3 = { --alle hubs
        {x = -141.813, y = 397.295, z = 119.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},

}

local Position4 = {  --feuer
    {x = 259.86, y = 201.97, z = 110.594, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = 231.86, y = 215.97, z = 110.594, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = 231.86, y = 211.97, z = 104.594, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 2.0},
    {x = 229.86, y = 217.97, z = 104.594, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 2.0},
    {x = 256.86, y = 201.97, z = 104.594, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 2.0},
    {x = 261.86, y = 200.97, z = 104.594, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 2.0},
    {x = 261.86, y = 198.97, z = 104.594, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 2.0},
    {x = 252.86, y = 197.97, z = 104.594, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 2.0},
    {x = 243.86, y = 200.97, z = 104.594, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 2.0},
    {x = 235.86, y = 207.97, z = 104.594, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 2.0},
    {x = 228.86, y = 204.97, z = 104.594, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 2.0},
    {x = 227.86, y = 219.97, z = 104.594, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 2.0},
    {x = 242.86, y = 206.97, z = 104.594, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 2.0},
    {x = 254.86, y = 202.97, z = 104.594, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 2.0},
    {x = 249.86, y = 204.97, z = 104.594, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 2.0},
    {x = 238.86, y = 208.97, z = 104.594, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 2.0},
    {x = 235.86, y = 201.97, z = 104.594, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 2.0},
    {x = 231.86, y = 200.97, z = 104.594, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 2.0},
    {x = 224.86, y = 216.97, z = 104.594, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 2.0},
    {x = 227.86, y = 215.97, z = 104.594, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 2.0},
    {x = 230.86, y = 208.97, z = 104.594, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 2.0},
}

local Position5 = {
    {x = 259.86, y = 201.97, z = 110.594, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
	{x = 231.86, y = 215.97, z = 110.594, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
}

local Position6 = {
	{x = -109.813, y = 397.295, z = 119.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = -121.813, y = 374.295, z = 119.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = -129.813, y = 337.295, z = 119.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = -155.813, y = 355.295, z = 119.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = -141.813, y = 397.295, z = 119.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = -107.813, y = 409.295, z = 113.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = -115.813, y = 352.295, z = 112.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = -116.813, y = 385.295, z = 143.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
}

local Position7 = {
    {x = 143.813, y = -1293.295, z = 35.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = 119.813, y = -1307.295, z = 35.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = 105.813, y = -1287.295, z = 35.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = 171.813, y = -1287.295, z = 35.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = 172.813, y = -1320.295, z = 35.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = 131.813, y = -1337.295, z = 35.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = 123.813, y = -1331.295, z = 38.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = 110.813, y = -1311.295, z = 40.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = 166.813, y = -1335.295, z = 35.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = 156.813, y = -1271.295, z = 35.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
}







local Position8 = {
    {x = -109.813, y = 397.295, z = 119.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = -121.813, y = 374.295, z = 119.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = -129.813, y = 337.295, z = 119.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = -155.813, y = 355.295, z = 119.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = -141.813, y = 397.295, z = 119.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = -107.813, y = 409.295, z = 113.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = -115.813, y = 352.295, z = 112.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
    {x = -116.813, y = 385.295, z = 143.933, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
}

local EffectListOne = {
    {label = 'Feuerwerk Keynote', dict = 'scr_indep_fireworks', name = 'scr_indep_firework_starburst', pos = 'keynot', duration = 5000},
    {label = 'Feuerball Keynote', dict = 'scr_agencyheistb', name = 'scr_agency3b_heli_exp_trail', pos = 'keynot', duration = 5000},
     {label = 'Unicorn Feuerwerk', dict = 'scr_indep_fireworks', name = 'scr_indep_firework_starburst', pos = 'Position7', duration = 5000},
    {label = 'Unicorn Feuerball', dict = 'scr_agencyheistb', name = 'scr_agency3b_heli_exp_trail', pos = 'Position7', duration = 5000},
     {label = '6137 Feuerwerk', dict = 'scr_indep_fireworks', name = 'scr_indep_firework_starburst', pos = 'Position6', duration = 5000},
    {label = '6137 Feuerball', dict = 'scr_agencyheistb', name = 'scr_agency3b_heli_exp_trail', pos = 'Position6', duration = 5000},
    {label = 'Bank ', dict = 'scr_agencyheistb', name = 'scr_agency3b_heli_exp_trail', pos = 'Position5', duration = 5000},
    {label = 'Bank FEUER', dict = 'core', name = 'fire_vehicle', pos = 'Position4', duration = 240000},
    {label = 'tuningtreff Feuerwerk', dict = 'scr_indep_fireworks', name = 'scr_indep_firework_starburst', pos = 'Position2', duration = 5000},
    {label = 'tuningtreff Feuerball', dict = 'scr_agencyheistb', name = 'scr_agency3b_heli_exp_trail', pos = 'Position2', duration = 5000},
    {label = 'Um mich herum', dict = 'scr_indep_fireworks', name = 'scr_indep_firework_starburst', pos = 'ich', duration = 5000},
      

}

local EffectListTwo = {

}


--[[
local EffectListOne = {
    {label = 'Effetto Menu Uno 1', dict = 'scr_indep_fireworks', name = 'scr_indep_firework_shotburst', pos = 'Position1', duration = 5000},
    {label = 'Effetto Menu Uno 2', dict = 'scr_indep_fireworks', name = 'scr_indep_firework_starburst', pos = 'Position1', duration = 5000},
    {label = 'Effetto Menu Uno 3', dict = 'proj_indep_firework_v2', name = 'scr_firework_indep_spiral_burst_rwb', pos = 'Position1', duration = 5000},
    {label = 'Effetto Menu Uno 4', dict = 'scr_rcbarry2', name = 'scr_exp_clown', pos = 'Position1', duration = 5000},
    {label = 'Effetto Menu Uno 5', dict = 'scr_reconstructionaccident', name = 'scr_reconstruct_pipe_impact', pos = 'Position1', duration = 5000},
    {label = 'Effetto Menu Uno 6', dict = 'scr_recartheft', name = 'scr_wheel_burnout', pos = 'Position1', duration = 5000},
    {label = 'Effetto Menu Uno 7', dict = 'scr_josh3', name = 'scr_josh3_light_explosion', pos = 'Position1', duration = 5000},
    {label = 'Effetto Menu Uno 8', dict = 'scr_agencyheistb', name = 'scr_agency3b_heli_exp_trail', pos = 'Position1', duration = 5000},
    {label = 'Effetto Menu Uno 9', dict = 'weap_xs_vehicle_weapons', name = 'muz_xs_turret_flamethrower_looping', pos = 'Position3', duration = 5000},
    {label = 'Effetto Menu Uno 10', dict = 'cut_family5', name = 'cs_alien_light_bed', pos = 'Position6', duration = 5000},
    {label = 'Effetto Menu Uno 11', dict = 'scr_josh3', name = 'scr_josh3_light_explosion', pos = 'Position1', duration = 5000},
    {label = 'Effetto Menu Uno 12', dict = 'scr_indep_fireworks', name = 'scr_indep_firework_burst_spawn', pos = 'Position1', duration = 5000},
    {label = 'Effetto Menu Uno 13', dict = 'weap_xs_vehicle_weapons', name = 'muz_xs_turret_flamethrower_looping_sf', pos = 'Position3', duration = 5000},
    {label = 'Effetto Menu Uno 14', dict = 'core', name = 'ent_sht_flame', pos = 'Position1', duration = 5000},
    {label = 'Effetto NUOVO1', dict = 'proj_indep_firework', name = 'scr_indep_firework_grd_burst', pos = 'Position3', duration = 10000},
    {label = 'Effetto NUOVO2', dict = 'proj_indep_firework', name = 'proj_indep_flare_trail', pos = 'Position3', duration = 10000},
    {label = 'Effetto NUOVO3', dict = 'proj_indep_firework_v2', name = 'scr_xmas_firework_burst_fizzle', pos = 'Position3', duration = 10000},
    {label = 'Effetto NUOVO4', dict = 'proj_indep_firework_v2', name = 'scr_firework_indep_repeat_burst_rwb', pos = 'Position3', duration = 10000},
    {label = 'Effetto NUOVO5', dict = 'scr_stunts', name = 'scr_stunts_shotburst', pos = 'Position1', duration = 10000},
}

local EffectListTwo = {
    {label = 'Effetto Menu Due 1', dict = 'scr_indep_fireworks', name = 'scr_indep_firework_shotburst', pos = 'Position4', duration = 5000},
    {label = 'Effetto Menu Due 2', dict = 'scr_indep_fireworks', name = 'scr_indep_firework_starburst', pos = 'Position4', duration = 5000},
    {label = 'Effetto Menu Due 3', dict = 'proj_indep_firework_v2', name = 'scr_firework_indep_spiral_burst_rwb', pos = 'Position2', duration = 5000},
    {label = 'Effetto Menu Due 4', dict = 'scr_rcbarry2', name = 'scr_exp_clown', pos = 'Position4', duration = 5000},
    {label = 'Effetto Menu Due 5', dict = 'scr_reconstructionaccident', name = 'scr_reconstruct_pipe_impact', pos = 'Position2', duration = 5000},
    {label = 'Effetto Menu Due 6', dict = 'scr_recartheft', name = 'scr_wheel_burnout', pos = 'Position2', duration = 5000},
    {label = 'Effetto Menu Due 7', dict = 'scr_josh3', name = 'scr_josh3_light_explosion', pos = 'Position2', duration = 5000},
    {label = 'Effetto Menu Due 8', dict = 'scr_agencyheistb', name = 'scr_agency3b_heli_exp_trail', pos = 'Position4', duration = 5000},
    {label = 'Effetto Menu Due 9', dict = 'weap_xs_vehicle_weapons', name = 'muz_xs_turret_flamethrower_looping', pos = 'Position2', duration = 5000},
    {label = 'Effetto Menu Due 10', dict = 'cut_family5', name = 'cs_alien_light_bed', pos = 'Position5', duration = 5000},
    {label = 'Effetto Menu Due 11', dict = 'scr_josh3', name = 'scr_josh3_light_explosion', pos = 'Position2', duration = 5000},
    {label = 'Effetto Menu Due 12', dict = 'scr_indep_fireworks', name = 'scr_indep_firework_burst_spawn', pos = 'Position2', duration = 5000},
    {label = 'Effetto Menu Due 13', dict = 'weap_xs_vehicle_weapons', name = 'muz_xs_turret_flamethrower_looping_sf', pos = 'Position2', duration = 5000},
    {label = 'Effetto Menu Uno 14', dict = 'core', name = 'ent_sht_flame', pos = 'Position4', duration = 5000},
    {label = 'Effetto HP1', dict = 'core', name = 'proj_laser_player', pos = 'Position7', duration = 10000},
    {label = 'Effetto NUOVO1', dict = 'proj_indep_firework', name = 'scr_indep_firework_grd_burst', pos = 'Position2', duration = 10000},
    {label = 'Effetto NUOVO2', dict = 'proj_indep_firework', name = 'proj_indep_flare_trail', pos = 'Position2', duration = 10000},
    {label = 'Effetto NUOVO3', dict = 'proj_indep_firework_v2', name = 'scr_xmas_firework_burst_fizzle', pos = 'Position2', duration = 10000},
    {label = 'Effetto NUOVO4', dict = 'proj_indep_firework_v2', name = 'scr_firework_indep_repeat_burst_rwb', pos = 'Position2', duration = 10000},
    {label = 'Effetto NUOVO5', dict = 'scr_stunts', name = 'scr_stunts_shotburst', pos = 'Position4', duration = 10000},
}
]]


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getShdewenspantossindnice1337aredObjdewenspantossindnice1337ect', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

function MenuMixerOne()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mixer_menu', {
        title = 'Mixer 1',
        align = 'top-left',
        elements = EffectListOne
    }, function(data, menu)

        TriggerServerEvent('esx_rich-dext_effect:syncServer', data.current.dict, data.current.name, data.current.pos, data.current.duration)

    end, function(data, menu)
        menu.close()
    end)
end

function MenuMixerTwo()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mixer_menu', {
        title = 'Mixer 2',
        align = 'top-left',
        elements = EffectListTwo
    }, function(data, menu)

        TriggerServerEvent('esx_rich-dext_effect:syncServer', data.current.dict, data.current.name, data.current.pos, data.current.duration)

    end, function(data, menu)
        menu.close()
    end)
end

RegisterNetEvent('esx_rich-dext_effect:syncClient')
AddEventHandler('esx_rich-dext_effect:syncClient', function(effectDict, effectName, position, duration)
    doEffect(effectDict, effectName, position, duration)
end)

doEffect = function(effectDict, effectName, position, duration)
    local fuocoDict = effectDict
    local particleName = effectName
    local effectList = {}
	local ped = PlayerPedId()
	local cordsr = GetEntityCoords(ped)

    if position == 'Position1' then
        effectPos = Position1
    elseif position == 'Position2' then
        effectPos = Position2
    elseif position == 'Position3' then
        effectPos = Position3
    elseif position == 'Position4' then
        effectPos = Position4
    elseif position == 'Position5' then
        effectPos = Position5
    elseif position == 'Position6' then
        effectPos = Position6
    elseif position == 'Position7' then
        effectPos = Position7
	 elseif position == 'keynot' then
        effectPos = keynot	
	 elseif position == 'ich' then
        effectPos = ichh	
	 elseif position == 'hubs' then
        effectPos = hubs	
    end

    if not HasNamedPtfxAssetLoaded(fuocoDict) then
        RequestNamedPtfxAsset(fuocoDict)
    end

    while not HasNamedPtfxAssetLoaded(fuocoDict) do
        Citizen.Wait(0)
    end

    for _, search in pairs(effectPos) do
        UseParticleFxAssetNextCall(fuocoDict)

        local particle = StartParticleFxLoopedAtCoord(particleName, search.x, search.y, search.z, search.rootX, search.rootY, search.rootZ, search.scale, false, false, false, false)

        table.insert(effectList, 1, particle)

        Citizen.Wait(0)
    end

    Citizen.Wait(duration)

    for _, particle in pairs(effectList) do
        StopParticleFxLooped(particle, true)
    end
end


RegisterCommand("ummich", function(source)
		ESX.TriggerServerCallback('grd_Pets:Gruppegetten', function(plyGroup)
	if plyGroup == 'superadmin' or plyGroup == 'admin' then
	local ped = PlayerPedId()
	local cordsr = GetEntityCoords(ped)


	local ichh = {
			--{x = cordsr.x, y = cordsr.y, z = cordsr.z, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
			{x = (cordsr.x + 5), y = (cordsr.y + 5), z = cordsr.z, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
			{x = (cordsr.x - 5), y = (cordsr.y - 5), z = cordsr.z, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
			{x = (cordsr.x - 5), y = (cordsr.y + 5), z = cordsr.z, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
			{x = (cordsr.x + 15), y = (cordsr.y - 15), z = cordsr.z, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
			{x = (cordsr.x + 15), y = (cordsr.y + 15), z = cordsr.z, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
			{x = (cordsr.x - 15), y = (cordsr.y - 15), z = cordsr.z, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
			{x = (cordsr.x + 20), y = (cordsr.y - 20), z = cordsr.z, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
			{x = (cordsr.x + 20), y = (cordsr.y + 20), z = cordsr.z, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
			{x = (cordsr.x - 20), y = (cordsr.y - 20), z = cordsr.z, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
			{x = (cordsr.x + 25), y = (cordsr.y - 25), z = cordsr.z, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
			{x = (cordsr.x + 25), y = (cordsr.y + 25), z = cordsr.z, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},
			{x = (cordsr.x - 25), y = (cordsr.y - 25), z = cordsr.z, rootX = 0.0, rootY = 0.0, rootZ = 0.0, scale = 1.0},

	}

	TriggerServerEvent('esx_rich-dext_effect:syncServer', 'scr_indep_fireworks', 'scr_indep_firework_starburst', ichh, 5000)	
	

	
	
	else
	exports['mythic_notify']:SendAlert('error', 'Du musst Admin sein.!', 2500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	end
	end)
end)
	


RegisterCommand("keynote", function(source)
		ESX.TriggerServerCallback('grd_Pets:Gruppegetten', function(plyGroup)
	if plyGroup == 'superadmin' or plyGroup == 'admin' then
	
	MenuMixerOne()
	
	else
	exports['mythic_notify']:SendAlert('error', 'Du musst Admin sein.!', 2500, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
	end
	end)
end)
