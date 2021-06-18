Config = {} -- DON'T TOUCH

Config.DrawDistance       = 60.0 -- Change the distance before you can see the marker. Less is better performance.
Config.EnableBlips        = false -- Set to false to disable blips.

Config.Locale             = 'en' 

Config.NPCEnable          = false -- Set to false to disable NPC Ped at shop location.
Config.NPC	          = { 
   
}
Config.GiveBlack          = true -- Wanna use Blackmoney?


Config.Zones = {
    [1] = {coords = vector3(-2991.32, 1585.34, 26.11), name = _U('map_blip_shop'), color = 47, sprite = 280, radius = 25.0, Pos = { x = 3065.33, y = 2222.19, z = 3.11}, Size  = { x = 3.0, y = 3.0, z = 6.0 }, opentext  ='Drücke ~g~[E]~g~ ~w~um an Pablo E. zu verkaufen', closedtext = ''},
    [2] = {coords = vector3(-2094.59, -1014.83, 7.98), name = _U('map_blip_shop2'), color = 47, sprite = 280, radius = 25.0, Pos = { x = 0.88, y = 0.59, z = -5.84}, Size  = { x = 3.0, y = 3.0, z = 6.0 }, opentext  ='Drücke ~g~[E]~g~ ~w~um an "Z100" zu verkaufen', closedtext = ''},
}

Config.Items = {
    --Preise für Verkauf an NPC. --ILLEGAL--

    ------------
    --P---
    ------------
    { name = 'bulletproof', price =2000, storenumber = 1},
    --100g
    { name = '100gcoke', price = 13000, storenumber = 1},
    { name = '100gweed', price = 15000, storenumber = 1},
    { name = '100glsd', price = 22500, storenumber = 1},
    { name = '100gmeth', price = 170000, storenumber = 1},
    { name = '100gheroin', price = 11500, storenumber = 1},
    { name = '100gmdma', price = 31000, storenumber = 1},
    { name = '100gcroc', price = 28000, storenumber = 1},
    { name = '100gxanax', price = 45505, storenumber = 1},
    { name = '100gfentanyl', price = 67636, storenumber = 1},
    { name = '100gtillidin', price = 80485, storenumber = 1},

    
    ---1KG
    { name = '1kgcoke', price = 135000, storenumber = 1},
    { name = '1kgweed', price = 160000, storenumber = 1},
    { name = '1kglsd', price = 235000, storenumber = 1},
    { name = '1kgmdma', price = 320000, storenumber = 1},
    { name = '1kgmeth', price = 1800000, storenumber = 1},
    { name = '1kgheroin', price = 120000, storenumber = 1},
    { name = '1kgcroc', price = 290000, storenumber = 1},
    { name = '1kgxanax', price = 796500, storenumber = 1},
    { name = '1kgfentanyl', price = 1197187, storenumber = 1},
    { name = '1kgtillidin', price = 1468040, storenumber = 1},
    --100g gestreckt
    { name = '100gcoke_cut', price = 33840, storenumber = 1},
    { name = '100gweed_cut', price = 31155, storenumber = 1},
    { name = '100glsd_cut', price = 38530, storenumber = 1},
    { name = '100gmeth_cut', price = 335000, storenumber = 1},
    { name = '100gheroin_cut', price = 21170, storenumber = 1},
    { name = '100gmdma_cut', price = 56230, storenumber = 1},
    { name = '100gcroc_cut', price = 37233, storenumber = 1},
    --1KG gestreckt
    { name = '1kgcoke_cut', price = 377740, storenumber = 1},
    { name = '1kgweed_cut', price = 353705, storenumber = 1},
    { name = '1kglsd_cut', price = 434830, storenumber = 1},
    { name = '1kgmdma_cut', price = 629530, storenumber = 1},
    { name = '1kgmeth_cut', price = 3795000, storenumber = 1},
    { name = '1kgheroin_cut', price = 238370, storenumber = 1},
    { name = '1kgcroc_cut', price = 530558, storenumber = 1},
    --------
    --Z100--
    --------
    { name = 'croc', price =260, storenumber = 2},
    { name = 'meth', price =1600, storenumber = 2},
    { name = 'packed_croc', price =2700, storenumber = 2},
    { name = 'weed', price =100, storenumber = 2},
    { name = 'coke', price = 125, storenumber = 2},
    { name = 'lsd', price = 220, storenumber = 2},
    { name = 'mdma_pills', price = 250, storenumber = 2},
    { name = 'mdma', price = 300, storenumber = 2},
    { name = 'packaged_weed', price = 190, storenumber = 2},
    { name = 'heroin', price = 110, storenumber = 2},
    { name = 'xanax', price = 2886, storenumber = 2},
    { name = 'tillidin_drops', price = 5323, storenumber = 2},
    { name = 'tillidin_pure', price = 6154, storenumber = 2},
    { name = 'fentanyl_pflaster', price = 5475, storenumber = 2},
    { name = 'fentanyl_cooked', price = 6525, storenumber = 2},
    { name = 'fentanyl_pure', price = 7286, storenumber = 2},

}

