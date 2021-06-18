local v1 = vector3(1734.65, 3297.99, 41.22) --Festival TDM HINWEIS
local v2 = vector3(-1603.29, 5237.8, 3.97) --Hinweis auf Fahrzeugproduktion am Spawn (Steg).
local v3 = vector3(-1615.57, -1074.36, 13.07) --Hinweis Markt Hub 1 Strand LS
local v4 = vector3(2340.83, 3127.93, 48.21) --Hinweis Markt Hub 2 Sandy Shores 
local v5 = vector3(-1588.94, 5218.07, 3.99) --Hinweis auf Referral Codes am Spawn (Steg)
local v6 = vector3(1776.79, 3236, 42.32) --Hinweis auf Tablet-Funktion am Spawn (Steg)
local v7 = vector3(421.22, 6468.15, 28.81) --Hinweis Markt Hub 3 Paleto Bay
local v8 = vector3(296.60, -590.58, 43.28) --Selbst wiederbeleben beim LSMD
local v9 = vector3(1772.09, 3246.97, 42.03) --Token zurück zu $ tauschen am FESTIVAL.
local v10 = vector3(-72.89, -815.9, 243.39) --Adminjail Kleidung
local v11 = vector3(-1985.69, 3211.2, 32.81) --Schönheitsklinik
local v12 = vector3(-1983.9, 3225.74, 32.81) --Drücke E um dein Leben zu beginnen
--local v13 = vector3(-1634.93, -1049.99, 13.15) --Powernap
--local v14 = vector3(-2166.42, 5197.23, 16.88) --Pablos Bro
--local v15 = vector3(2352.54, 3121.55, 48.21) --Powernap2
--Hinweis Waffenskins Hubs
local v16 = vector3(2349.46, 3129.74, 48.21) --Waffenskins Hub Hinweis 1 sandy
local v17 = vector3(-1600.94, -1056.45, 13.02) --Waffenskins Hub Hinweis 2 ls
local v18 = vector3(415.75, 6470.86, 28.81) --Waffenskins Hub Hinweis 3 paleto
local v21 = vector3(1106.55,111.39,80.89) --Waffenskins Hub Hinweis 4 ls hub 2
--Hinweis auf Fraktionserstelleung
local v19 = vector3(-1614.62, -1054.1, 13.08) --Fraktionserstelleung 1
local v20 = vector3(-1605.1765136719,5247.0830078125,3.9750990867615) --spawntext interagieren mit ALT
local v22 = vector3(1120.1123046875,82.319465637207,80.890350341797) --lshub2
local v23 = vector3(1124.01,109.09,80.762855529785) --lshub2 ref
local v24 = vector3(1164.0206298828,143.50624084473,80.811912536621) --lshub2 fraktionen
local v25 = vector3(1139.0,100.11,80.811912536621) --lshub2 markt
local v26 = vector3(1110.84,95.52,80.841912536621) --fpsboosterinfo lshub2
local v27 = vector3(-1626.0206298828,-1056.50624084473,13.141912536621) --fpsboosterinfo lshub
local v28 = vector3(2336.6406298828,3137.32624084473,48.191912536621) --fpsboosterinfo sandyshoreshub
local v29 = vector3(432.4206298828,6465.85624084473,28.741912536621) --fpsboosterinfo paletobayhub
local v30 = vector3(-1583.8906298828,5199.76624084473,3.981912536621) --fpsboosterinfo spawn
local v31 = vector3(1764.6406298828,2551.58624084473,45.571912536621) --Knast Text

--local v20 = vector3(-1598.51, -1055.9, 13.02) --Tiermenü Hub Hinweis 2
--local v21 = vector3(416.29, 6469.27, 28.84) --Tiermenü Hub Hinweis 3

--------------------------------------------------------------------------------------------------
--GERD HANSEN IST EIN SMARTER BOI, DER DEWEN ABER AUCH--------------------------------------------
--------------------------------------------------------------------------------------------------
function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.35)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
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

local distance_until_text_disappears = 45
local distance_until_text_disappears2 = 60

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(6)
            if Vdist2(GetEntityCoords(PlayerPedId(), false), v1) < distance_until_text_disappears2 then
                Draw3DText(v1.x,v1.y,v1.z, "~r~[Team-Deathmath-Paintball]~s~\n~b~Bis zu 10 Spieler~s~\nKosten: ~y~[50 Festival Token] / Match")
            elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v2) < distance_until_text_disappears then
                Draw3DText(v2.x,v2.y,v2.z, "Hier gibt es deine erste ~r~Quest~s~!\n Sprich ~b~mich~w~ an!")
            elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v3) < distance_until_text_disappears then
                Draw3DText(v3.x,v3.y,v3.z, "Drücke \n~p~[ALT]~w~\n~g~Unterstützer~w~ mit dem ~y~Business-Paket~w~ können dies von überall!")
            elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v4) < distance_until_text_disappears then
                Draw3DText(v4.x,v4.y,v4.z, "Drücke \n~p~[ALT]~w~\n~g~Unterstützer~w~ mit dem ~y~Business-Paket~w~ können dies von überall!")
            elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v5) < distance_until_text_disappears then
                Draw3DText(v5.x,v5.y,v5.z, "Hol dir einen ~o~Vorteil~w~!\nSprich mich an! ~w~\n~r~Belohnungen~w~ warten!")
            elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v6) < distance_until_text_disappears then
                Draw3DText(v6.x,v6.y,v6.z, "~y~[Festival Token]~w~\nWährung des Festivals\nNutze sie für ~r~Spiel und Spaß!")
            elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v7) < distance_until_text_disappears then
                Draw3DText(v7.x,v7.y,v7.z, "Drücke \n~p~[ALT]~w~\n~g~Unterstützer~w~ mit dem ~y~Business-Paket~w~ können dies von überall!")
            elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v8) < distance_until_text_disappears then
                Draw3DText(v8.x,v8.y,v8.z, "~g~ Hier~w~ hast Du die ~g~Möglichkeit~w~ \nSpieler ~r~gegen Geld ~w~ amateurhaft ~w~zu verarzten!") 
            elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v9) < distance_until_text_disappears then
                Draw3DText(v9.x,v9.y,v9.z, "~g~[E]~w~ Tausche deine ~y~[FESTIVAL TOKEN]~w~\nin Cash ~g~|$|~w~ ein!\nNur hier auf dem ~y~Festival~w~!")
            elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v10) < distance_until_text_disappears then
                Draw3DText(v10.x,v10.y,v10.z, "Ein ~p~Admin~w~ findet du solltest deine\n~b~Kleidung~w~ wechseln\nAchte auf legitime Kleidung!")
            elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v11) < distance_until_text_disappears then
                Draw3DText(v11.x,v11.y,v11.z, "Die ~b~[Schönheitsklinik]~w~: \nÄndere deine ~y~Erscheinung~w~ falls dir was nicht passt")
            elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v12) < distance_until_text_disappears then
                Draw3DText(v12.x,v12.y,v12.z, "Drücke ~g~[E]~w um dein neues\nLeben zu beginnen!")
       --     elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v13) < distance_until_text_disappears then
       --         Draw3DText(v13.x,v13.y,v13.z, "Etwas klappt nicht?!\nEin ~r~Powernap~w~ könnte helfen!\nSie müssen ~b~erholt~w~ sein!")
         --   elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v14) < distance_until_text_disappears then
          --      Draw3DText(v14.x,v14.y,v14.z, "Na ~o~Süßer~w~! Hast du meinen ~r~Bruder~w~ gesehen?\n Er hat wohl ein ~b~Boot~w~ genommen...")
     --       elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v15) < distance_until_text_disappears then
     --           Draw3DText(v15.x,v15.y,v15.z, "Etwas klappt nicht?!\nEin ~r~Powernap~w~ könnte helfen!\nSie müssen ~b~erholt~w~ sein!")
            elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v16) < distance_until_text_disappears then
                Draw3DText(v16.x,v16.y,v16.z, "~g~Unterstützer~w~ können Ihren ~p~Waffenskin~w~ ändern\n Oder sich in ein ~p~Tier verwandeln.")   
            elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v17) < distance_until_text_disappears then
                Draw3DText(v17.x,v17.y,v17.z, "~g~Unterstützer~w~ können Ihren ~p~Waffenskin~w~ ändern\n Oder sich in ein ~p~Tier verwandeln.")   
            elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v18) < distance_until_text_disappears then
                Draw3DText(v18.x,v18.y,v18.z, "~g~Unterstützer~w~ können Ihren ~p~Waffenskin~w~ ändern\n Oder sich in ein ~p~Tier verwandeln.")
            elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v19) < distance_until_text_disappears then
                Draw3DText(v19.x,v19.y,v19.z, "Hier kannst du \neine ~p~eigene Fraktion~w~ gründen!\n Nur für ~g~Unterstützer~w~!")   
			elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v20) < distance_until_text_disappears then
                Draw3DText(v20.x,v20.y,v20.z, "~r~Wichtig:~w~ Drücke ~g~[ALT] ~w~um mit NPCS,Objekten und Spielern zu interagieren!") 
			elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v21) < distance_until_text_disappears then
                Draw3DText(v21.x,v21.y,v21.z, "~g~Unterstützer~w~ können Ihren ~p~Waffenskin~w~ ändern\n Oder sich in ein ~p~Tier verwandeln.")	
            elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v23) < distance_until_text_disappears then
                Draw3DText(v23.x,v23.y,v23.z, "Werbe ~g~Freunde~w~ und erhalte ~o~saftige Belohnungen~w~!")	
            elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v24) < distance_until_text_disappears then
                Draw3DText(v24.x,v24.y,v24.z, "Hier kannst du \neine ~p~eigene Fraktion~w~ gründen!\n Nur für ~g~Unterstützer~w~!")	
            elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v25) < distance_until_text_disappears then
                Draw3DText(v25.x,v25.y,v25.z, "Drücke \n~p~[ALT]~w~\n~g~Unterstützer~w~ mit dem ~y~Business-Paket~w~ können dies von überall!")
            elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v26) < distance_until_text_disappears then
                Draw3DText(v26.x,v26.y,v26.z, "Deine Hardware kann nicht mithalten?\n~w~Mit ~o~/fpsboost ~w~kannst Du deine Performance verbessern!")
            elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v27) < distance_until_text_disappears then
                Draw3DText(v27.x,v27.y,v27.z, "Deine Hardware kann nicht mithalten?\n~w~Mit ~o~/fpsboost ~w~kannst Du deine Performance verbessern!")
            elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v28) < distance_until_text_disappears then
                Draw3DText(v28.x,v28.y,v28.z, "Deine Hardware kann nicht mithalten?\n~w~Mit ~o~/fpsboost ~w~kannst Du deine Performance verbessern!")
            elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v29) < distance_until_text_disappears then
                Draw3DText(v29.x,v29.y,v29.z, "Deine Hardware kann nicht mithalten?\n~w~Mit ~o~/fpsboost ~w~kannst Du deine Performance verbessern!")
            elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v30) < distance_until_text_disappears then
                Draw3DText(v30.x,v30.y,v30.z, "Deine Hardware kann nicht mithalten?\n~w~Mit ~o~/fpsboost ~w~kannst Du deine Performance verbessern!")
            elseif Vdist2(GetEntityCoords(PlayerPedId(), false), v31) < distance_until_text_disappears then
                Draw3DText(v31.x,v31.y,v31.z, "Willkommen im ~o~Gefängnis~w~!\nMache ~o~Aufgaben~w~ und ~o~verringere~w~ Deine ~o~Haftstrafe~w~  !")

               
        end          
    end
end)


--------------------------------------------------------------------------------------------------
--GERD HANSEN IST EIN SMARTER BOI, DER DEWEN ABER AUCH--------------------------------------------
--------------------------------------------------------------------------------------------------