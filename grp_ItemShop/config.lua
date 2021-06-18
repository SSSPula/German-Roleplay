Config = {} -- DON'T TOUCH

Config.DrawDistance       = 60.0 -- Change the distance before you can see the marker. Less is better performance.
Config.EnableBlips        = true -- Set to false to disable blips.

Config.Locale             = 'en' -- Change the language. Currently available (en or fr).

Config.NPCEnable          = false -- Set to false to disable NPC Ped at shop location.
Config.NPC	          = {

}
Config.GiveBlack          = false -- Wanna use Blackmoney?


Config.Zones = {
    [1] = {coords = vector3(412.73, 313.56, 102.99), name = _U('map_blip_shop'), color = 50, sprite = 500, radius = 25.0, Pos = { x = 412.73, y = 313.56, z = 103.02}, Size  = { x = 3.0, y = 3.0, z = 1.0 }, opentext  ='Drücke ~g~[E]~g~ ~w~ um an Justus zu verkaufen', closedtext = '~r~Justus handelt nur am Tag! Versuchs Später!'},
    [2] = {coords = vector3(182.91, -1319.44, 29.32), name = _U('map_blip_shop2'), color = 25, sprite = 480, radius = 25.0, Pos = { x = 182.85, y = -1319.34, z = 29.32}, Size  = { x = 3.0, y = 3.0, z = 1.0 }, opentext  ='Drücke ~g~[E]~g~ ~w~ um an Peter zu verkaufen', closedtext = '~g~Peter handelt nur am Tag! Versuchs Später!'},
    [3] = {coords = vector3(1866.34, 307.50, 163.12), name = _U('map_blip_shop3'), color = 47, sprite = 280, radius = 25.0, Pos = { x = -1866.34, y = 307.50, z = 163.12}, Size  = { x = 3.0, y = 3.0, z = 1.0 }, opentext  ='Drücke ~g~[E]~g~ ~w~um an Bob zu verkaufen', closedtext = '~r~Bob handelt nur am Tag! Versuchs Später!'},
    [4] = {coords = vector3(486.17, -986.05, 30.69), name = _U('map_blip_shop4'), color = 47, sprite = 280, radius = 25.0, Pos = { x = 486.17, y = -986.05, z = 30.69}, Size  = { x = 3.0, y = 3.0, z = 6.0 }, opentext  ='Drücke ~g~[E]~g~ ~w~um Drogen an ~y~Franky~w~ (Justiz) zu übergeben', closedtext = 'Abonniert Gerd Hansen!'},
}

Config.Items = {
    --Preise für Verkauf an NPC.
    --Tobacco 1$
    --Cut Tobacco 4$
    --Packaged_Tobacco 16$
    --Chemicals 24$
    --Iron 1$
    --Copper 1$
    --Jewels 75$
    --Asche 4$
    --Verdichtete Asche 6$
    --Verpackte Verdichtete Asche 14$
    --Sand 1$
    --Lebende Möwe 5$
    --Geschlachte Möwe 12$ 
    --Möwen McNuggets 25$
    --Schutzwesten 1500$
    --Justus
    { name = 'lsa', price = 45, storenumber = 1},
    { name = 'tobacco', price = 2, storenumber = 1},
    { name = 'jewels', price = 75, storenumber = 1},
    { name = 'iron', price = 3, storenumber = 1},
    { name = 'copper', price = 3, storenumber = 1},
    { name = 'chemicals', price = 24, storenumber = 1},
    { name = 'cut_tobacco', price = 8, storenumber = 1},
    { name = 'packaged_tobacco', price = 16, storenumber = 1},
    { name = 'ash', price = 2, storenumber = 1},
    { name = 'vash', price = 50, storenumber = 1},
    { name = 'packaged_vash', price = 300, storenumber = 1},
    { name = 'alive_chicken', price = 7, storenumber = 1},
    { name = 'slaughtered_chicken', price =15, storenumber = 1},
    { name = 'packaged_chicken', price =30, storenumber = 1},
    { name = 'bulletproof', price =1000, storenumber = 1},
    { name = 'sand', price =3, storenumber = 1},
    { name = 'paper', price =35, storenumber = 1},
    { name = 'kevlar', price =410, storenumber = 1},

    --Peter
    { name = 'lsa', price = 45, storenumber = 2},
    { name = 'iron', price = 3, storenumber = 2},
    { name = 'copper', price = 3, storenumber = 2},
    { name = 'tobacco', price = 2, storenumber = 2},
    { name = 'jewels', price = 65, storenumber = 2},
    { name = 'chemicals', price = 24, storenumber = 2},
    { name = 'cut_tobacco', price = 8, storenumber = 2},
    { name = 'packaged_tobacco', price = 16, storenumber = 2},
    { name = 'ash', price = 2, storenumber = 2},
    { name = 'vash', price = 50, storenumber = 2},
    { name = 'packaged_vash', price = 300, storenumber = 2},
    { name = 'alive_chicken', price = 7, storenumber = 2},
    { name = 'slaughtered_chicken', price =15, storenumber = 2},
    { name = 'packaged_chicken', price =30, storenumber = 2},
    { name = 'bulletproof', price =1000, storenumber = 2},
    { name = 'sand', price =3, storenumber = 2},
    { name = 'paper', price =35, storenumber = 2},
    { name = 'kevlar', price =410, storenumber = 2},

    --Bob
    { name = 'jewels', price = 55, storenumber = 3},
    { name = 'chemicals', price = 24, storenumber = 3},
    { name = 'tobacco', price = 2, storenumber = 3},
    { name = 'lsa', price = 45, storenumber = 3},
    { name = 'iron', price = 3, storenumber = 3},
    { name = 'copper', price = 3, storenumber = 3},
    { name = 'cut_tobacco', price = 8, storenumber = 3},
    { name = 'packaged_tobacco', price = 16, storenumber = 3},
    { name = 'ash', price = 2, storenumber = 3},
    { name = 'vash', price = 50, storenumber = 3},
    { name = 'packaged_vash', price = 300, storenumber = 3},
    { name = 'alive_chicken', price = 7, storenumber = 3},
    { name = 'slaughtered_chicken', price =15, storenumber = 3},
    { name = 'packaged_chicken', price =30, storenumber = 3},
    { name = 'bulletproof', price =1000, storenumber = 3},
    { name = 'sand', price =3, storenumber = 3},
    { name = 'paper', price =35, storenumber = 3},
    { name = 'kevlar', price =410, storenumber = 3},

--Police
    { name = 'coca_leaf', price = 10, storenumber = 4},
    { name = 'coke', price = 35, storenumber = 4},
    { name = '100gcoke', price = 2600, storenumber = 4},
    { name = '1kgcoke', price = 26000, storenumber = 4},
    { name = 'poppyresin', price = 10, storenumber = 4},
    { name = 'heroin', price = 25, storenumber = 4},
    { name = '100gheroin', price = 2300, storenumber = 4},
    { name = '1kgheroin', price = 23000, storenumber = 4},
    { name = 'chemicals', price = 15, storenumber = 4},
    { name = 'thionyl_chloride', price = 15, storenumber = 4},
    { name = 'hydrochloric_acid', price = 15, storenumber = 4},
    { name = 'sulfur_crystal', price = 35, storenumber = 4},
    { name = 'mdma', price = 50, storenumber = 4},
    { name = 'mdma_crystals', price =30, storenumber = 4},
    { name = 'mdma_pills', price =30, storenumber = 4},
    { name = 'packed_mdma', price =350, storenumber = 4},
    { name = '100gmdma', price =4000, storenumber = 4},
    { name = '1kgmdma', price =44000, storenumber = 4},
    { name = 'croc', price =70, storenumber = 4},
    { name = 'packed_croc', price =550, storenumber = 4},
    { name = '100gcroc', price =5500, storenumber = 4},
    { name = '1kgcroc', price =55000, storenumber = 4},
    { name = 'lsa', price =20, storenumber = 4},
    { name = 'lsd', price =60, storenumber = 4},
    { name = '100glsd', price =5000, storenumber = 4},
    { name = '1kglsd', price =50000, storenumber = 4},
    { name = 'cannabis', price =10, storenumber = 4},
    { name = 'dry_weed', price =10, storenumber = 4},
    { name = 'cut_weed', price =35, storenumber = 4},
    { name = 'packaged_weed', price =35, storenumber = 4},
    { name = 'sulfuric_acid', price =35, storenumber = 4},
    { name = 'sodium_hydroxide', price =35, storenumber = 4},  
    { name = '100gweed', price =4000, storenumber = 4},
    { name = '1kgweed', price =40000, storenumber = 4},
    { name = 'ephedrin', price =30, storenumber = 4},
    { name = 'ephedrin_crystals', price =65, storenumber = 4}, 
    { name = 'meth', price =90, storenumber = 4}, 
    { name = '100gmeth', price =9000, storenumber = 4},
    { name = '1kgmeth', price =90000, storenumber = 4},
--
    { name = 'xanax', price = 155, storenumber = 4},
    { name = 'tillidin_drops', price = 170, storenumber = 4},
    { name = 'tillidin_pure', price = 181, storenumber = 4},
    { name = 'fentanyl_pflaster', price = 194, storenumber = 4},
    { name = 'fentanyl_cooked', price = 214, storenumber = 4},
    { name = 'fentanyl_pure', price = 234, storenumber = 4},
    { name = '100gxanax', price = 16046, storenumber = 4},
    { name = '100gfentanyl', price = 25073, storenumber = 4},
    { name = '100gtillidin', price = 19110, storenumber = 4},
    { name = '1kgxanax',    price = 165329, storenumber = 4},
    { name = '1kgfentanyl', price = 266743, storenumber = 4},
    { name = '1kgtillidin', price = 201172, storenumber = 4},

    --CUT_DRUGS--

    { name = '100gcoke_cut', price = 5929, storenumber = 4},
    { name = '100gweed_cut', price = 2019, storenumber = 4},
    { name = '100glsd_cut', price = 4451, storenumber = 4},
    { name = '100gmeth_cut', price = 42267, storenumber = 4},
    { name = '100gheroin_cut', price = 1742, storenumber = 4},
    { name = '100gmdma_cut', price = 5016, storenumber = 4},
    { name = '100gcroc_cut', price = 4913, storenumber = 4},
    --1KG gestreckt
    { name = '1kgcoke_cut', price = 60070, storenumber = 4},
    { name = '1kgweed_cut', price = 20819, storenumber = 4},
    { name = '1kglsd_cut', price = 45348, storenumber = 4},
    { name = '1kgmdma_cut', price = 51012, storenumber = 4},
    { name = '1kgmeth_cut', price = 431046, storenumber = 4},
    { name = '1kgheroin_cut', price = 17795, storenumber = 4},
    { name = '1kgcroc_cut', price = 49983, storenumber = 4},

    --WEAPONS--
    { name = 'snspistol', price =200, storenumber = 4},
    { name = 'snspistol_mk2', price =200, storenumber = 4},
    { name = 'pistol', price =200, storenumber = 4},
    { name = 'pistol_mk2', price =200, storenumber = 4},
    { name = 'smg', price =1000, storenumber = 4},
}

