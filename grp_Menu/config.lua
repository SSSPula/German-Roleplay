Config = {


OpenKeyBindsCommand = 'tastenbelegung',
Keybinds = { -- Available function for keybinds (EVERY COMMAND USED NEEDS TO BE HERE FOR IT TO NOT GLITCH)
   -- {label = "Menü öffnen", command = "grpmenu"},
    --{label = "Jobmenu öffnen", command = "jobmenu"},
    {label = "Emote Menu", command = "emotemenu"},
    {label = "Motor an/aus", command = "motoran"},
    {label = "Polizei Dispatchmenü", command = "dispachkgksjv0ijgssj"},
    {label = "Autopilot an/aus", command = "autopilotan"},
    {label = "Auto auf/zu", command = "autoauf"},
    {label = "Inventar", command = "inventartog"},
    {label = "Fernglas nutzen", command = "fernglas"},
    {label = "Tacho an/aus", command = "tachoan"},
    {label = "Tempomat an/aus", command = "tempomatan"},
   -- {label = "Kleidungsrad", command = "kleidungsrad"},
    {label = "Tierverwandlung[VIP]", command = "tier"},
    {label = "Waffenskin[VIP]", command = "waffenskin"},
    {label = "Markt[VIP]", command = "markt"},
   -- {label = "Hände hoch", command = "haendehoch"},
    {label = "Admin rufen", command = "report"},
    {label = "Hinfallen", command = "hinfallen"},
   -- {label = "Auf etwas zeigen", command = "fingerzeigen"},
    {label = "Person tragen", command = "carry"},
    {label = "Punkt-Fadenkreuz perm.", command = "crosspoint"},
    {label = "Fahrzeugmenu", command = "vehcontrol"},
    {label = "Im Auto rutschen", command = "shuff"}
},

DefaultKeybinds = { -- Keybinds that will be set by default
   ['K'] = 'hinfallen',
   ['G'] = 'autoauf',
   ['F9'] = 'dispachkgksjv0ijgssj',
  -- ['X'] = 'haendehoch',
   ['F5'] = 'crosspoint',
   ['F7'] = 'tachoan',
   ['F2'] = 'inventartog'
},

BlockKeys = { -- Block keys to be used in keybinds
    ['F1'] = true
},

Menus = {

    ['general'] = {
        Label = 'MENU', -- Label
        OpenCommand = 'grpmenu', -- Open Command if you dont want to open with command leave '' (IF U WANT TO OPEN WITH KEY ADD TO KEYBINDS)
        OpenLocations = nil, -- Open Locations if you dont want to open in location leave {} otherwise {vector3(x,y,z), ...}  
        JobWhitelist = {}, -- Jobs that can open this menu leave {} if you want everybody to open
        Fill = true, -- Fills remaining squares that do nothing
        CloseOnClick = true, -- Closes menu when clicked
        OnlyVehicle = false, -- Can only be opened in vehicle
        Boxes = {

            {
                label = 'weiter', -- Label of box
                icon = 'fas fa-arrow-right', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'openseitezwei' -- This will be used to identify in client script what to do after press
            },
            {
                label = 'Inventar', -- Label of box
                icon = 'fas fa-briefcase', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'inventartog' -- This will be used to identify in client script what to do after press
            },
            {
                label = 'Ausweise', -- Label of box
                icon = 'fas fa-id-card', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'openID' -- This will be used to identify in client script what to do after press
            },
            {
                label = 'Tablet', -- Label of box
                icon = 'fas fa-tablet-alt', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'opentableet' -- This will be used to identify in client script what to do after press
            },
            {
                label = 'Animationen', -- Label of box
                icon = 'fas fa-walking', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'openAnim' -- This will be used to identify in client script what to do after press
            },
			{
                label = 'Tastenbelegung', -- Label of box
                icon = 'fas fa-cog', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'openTastenbelegungen' -- This will be used to identify in client script what to do after press
            },
            {
                label = 'Rechnungen', -- Label of box
                icon = 'fas fa-file-invoice', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'openrechnnungen' -- This will be used to identify in client script what to do after press
            },	
            {
                label = 'Markt', -- Label of box
                icon = 'fas fa-shopping-basket', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'openmarrkt' -- This will be used to identify in client script what to do after press
            },
            {
                label = 'Autopilot', -- Label of box
                icon = 'fas fa-robot', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'openautopi' -- This will be used to identify in client script what to do after press
            },
            {
                label = 'Kofferraum', -- Label of box
                icon = 'fas fa-car', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'openkofefrraum' -- This will be used to identify in client script what to do after press
            },	
            {
                label = 'Fahrzeugmenu', -- Label of box
                icon = 'fas fa-car', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'openfahrzeugmen' -- This will be used to identify in client script what to do after press
            },
            {
                label = 'Rüber rutschen', -- Label of box
                icon = 'fas fa-car', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'rutschenmen' -- This will be used to identify in client script what to do after press
            }
        }


    },

     ['weiter'] = {
        Label = 'MENU', -- Label
        OpenCommand = '', -- Open Command if you dont want to open with command leave '' (IF U WANT TO OPEN WITH KEY ADD TO KEYBINDS)
        --OpenLocations = {{coords = vector3(1251.3848876953,-515.60424804688,69.349075317), text = "[~r~E~w~] Open", marker = {markerSize = 1.3, markerColor = {255,255,255}, markerType = 27}, blip =  {useBlip = true, blipSprite = 126, blipColor = 64, blipText = "Mission"} }}, -- Open Locations if you dont want to open in location leave {} otherwise {vector3(x,y,z), ...}  
        OpenLocations = nil, -- Open Locations if you dont want to open in location leave {} otherwise {vector3(x,y,z), ...}  
        JobWhitelist = {}, -- Jobs that can open this menu leave {} if you want everybody to open
        Fill = false, -- Fills remaining squares that do nothing
        CloseOnClick = true, -- Closes menu when clicked
        OnlyVehicle = false, -- Can only be opened in vehicle
        Boxes = {

			{
                label = 'zurück', -- Label of box
                icon = 'fas fa-arrow-left', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'openseiteeins' -- This will be used to identify in client script what to do after press
            },
			{
                label = 'Fernglas', -- Label of box
                icon = 'fas fa-binoculars', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'openfrendglas' -- This will be used to identify in client script what to do after press
            },
			{
                label = 'Dokumente', -- Label of box
                icon = 'fas fa-book', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'opendokumentee' -- This will be used to identify in client script what to do after press
            },
			{
                label = 'Hausschlüssel', -- Label of box
                icon = 'fas fa-key', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'openhausschluessel' -- This will be used to identify in client script what to do after press
            },	
			
            {
                label = 'Taschenrechner', -- Label of box
                icon = 'fas fa-calculator', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'opentaschenrech' -- This will be used to identify in client script what to do after press
            },
			{
                label = 'Bug melden', -- Label of box
                icon = 'fas fa-info-circle', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'bugöfnnen' -- This will be used to identify in client script what to do after press
            },
			{
                label = 'Admin rufen', -- Label of box
                icon = 'fas fa-info-circle', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'openadminrufen' -- This will be used to identify in client script what to do after press
            }
		
           

        }


    },



 ['autopi'] = {
        Label = 'MENU', -- Label
        OpenCommand = '', -- Open Command if you dont want to open with command leave '' (IF U WANT TO OPEN WITH KEY ADD TO KEYBINDS)
       -- OpenLocations = {{coords = vector3(1251.3848876953,-515.60424804688,69.349075317), text = "[~r~E~w~] Open", marker = {markerSize = 1.3, markerColor = {255,255,255}, markerType = 27}, blip =  {useBlip = true, blipSprite = 126, blipColor = 64, blipText = "Mission"} }}, -- Open Locations if you dont want to open in location leave {} otherwise {vector3(x,y,z), ...}  
        JobWhitelist = {}, -- Jobs that can open this menu leave {} if you want everybody to open
        Fill = false, -- Fills remaining squares that do nothing
        CloseOnClick = true, -- Closes menu when clicked
        OnlyVehicle = false, -- Can only be opened in vehicle
        Boxes = {

            {
                label = 'Autopilot starten', -- Label of box
                icon = 'fas fa-play', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'autopiaus' -- This will be used to identify in client script what to do after press
            },
            {
                label = 'Autopilot stoppen', -- Label of box
                icon = 'fas fa-play', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'autopian' -- This will be used to identify in client script what to do after press
            },
            {
                label = 'Fahrzeug rufen', -- Label of box
                icon = 'fas fa-play', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'autorufen' -- This will be used to identify in client script what to do after press
            },
            {
                label = 'Hauptmenu', -- Label of box
                icon = 'fas fa-arrow-left', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'openseiteeins' -- This will be used to identify in client script what to do after press
            }
           

        }


    },

     ['vehcontrol'] = {
        Label = 'MENU', -- Label
        OpenCommand = 'vehcontrol', -- Open Command if you dont want to open with command leave '' (IF U WANT TO OPEN WITH KEY ADD TO KEYBINDS)
        OpenLocations = nil,
        JobWhitelist = {}, -- Jobs that can open this menu leave {} if you want everybody to open
        Fill = true, -- Fills remaining squares that do nothing
        CloseOnClick = false, -- Closes menu when clicked
        OnlyVehicle = true, -- Can only be opened in vehicle
        Boxes = {

            {
                label = 'Hauptmenu', -- Label of box
                icon = 'fas fa-arrow-left', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'openseiteeins' -- This will be used to identify in client script what to do after press
            },
			{
                label = 'Motor an/aus', -- Label of box
                icon = 'fas fa-power-off', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'startEngine' -- This will be used to identify in client script what to do after press
            },
            {
                label = 'Vorne links', -- Label of box
                icon = 'fas fa-car-side', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'frontLeft' -- This will be used to identify in client script what to do after press
            },
             {
                label = 'Vorne rechts', -- Label of box
                icon = 'fas fa-car-side', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'frontRight' -- This will be used to identify in client script what to do after press
            },
            {
                label = 'Hinten links', -- Label of box
                icon = 'fas fa-car-side', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'backLeft' -- This will be used to identify in client script what to do after press
            },
            {
                label = 'Hinten rechts', -- Label of box
                icon = 'fas fa-car-side', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'backRight' -- This will be used to identify in client script what to do after press
            },
             {
                label = 'Motorhaube', -- Label of box
                icon = 'fas fa-car-side', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'hood' -- This will be used to identify in client script what to do after press
            },
             {
                label = 'Kofferraum', -- Label of box
                icon = 'fas fa-car-side', -- Icon from fontawsome.com
                jobWhitelist = {}, -- Jobs that will see this box. Leave {} if you want everybody to see
                trigger = 'trunk' -- This will be used to identify in client script what to do after press
            }


        }


    }

   


},




Text = {

    ['not_in_vehicle'] = 'Du musst in einem Auto sitzen',
    ['key_not_usable'] = 'Taste %s kann nicht benutzt werden!',
    ['no_such_menu'] = 'Dieses Menu gibt es nicht',
    ['not_whitelisted'] = 'Du hast keine Berechtigung'

}

}

--if F3 then exec grpmenu


function SendTextMessage(msg)

        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0,1)

        --EXAMPLE USED IN VIDEO
        --exports['mythic_notify']:SendAlert('inform', msg)

end
