--quest by grd
-- ped liste: https://wiki.rage.mp/index.php?title=Peds
local Key = 38 -- E
local Key2 = 173 -- L
local Key3 = 27 -- Arrow Up
local drop = false
local spawnhallenmusik = false
local landemusik = false
local inspawn = false
local erstemalrocker = true
local myIdentity, myIdentifiers = {}, {}

--damit displayhelptext geht sonst nil
function DisplayHelpText(string1, string2, string3, time)
    BeginTextCommandDisplayHelp("THREESTRINGS")
    AddTextComponentSubstringWebsite(string1)
    AddTextComponentSubstringWebsite(string2)
    AddTextComponentSubstringWebsite(string3)
	EndTextCommandDisplayHelp(0, 0, 1, time or -1)
end



RegisterNetEvent('vMenuOLD:1')
AddEventHandler('vMenuOLD:1', function()
TriggerEvent("InteractSound_CL:PlayOnOne", "bademeisterhallo", 0.5)
				local bool = exports["grp_PopUp"]:Confirm("Ivanka", "привет меня зовут иванка")
					if bool then 
					TriggerEvent("InteractSound_CL:PlayOnOne", "bademeisteraufgabe", 0.5)
					exports["grp_PopUp"]:Confirm("Du hast also Interesse..", "Ich habe eine адача für Dich: geh den Steg entlang und die лестница hoch !")
					if bool then
						TriggerEvent("InteractSound_CL:PlayOnOne", "bademeisterende", 0.5)
						exports["grp_PopUp"]:Confirm("Okay", "Solltest Du die Aufgabe unterbrechen müssen, kannst Du jederzeit wieder zurück kommen!")
					else
					
					end
					else
					TriggerEvent("InteractSound_CL:PlayOnOne", "bademeisteraggro", 0.5)
					exports["grp_PopUp"]:Confirm("Oh ", "Warum lässt Du mich hier stehen? сука блядь! как ты можешь!")
					end
end)

RegisterNetEvent('vMenuOLD:2')
AddEventHandler('vMenuOLD:2', function()

	TriggerEvent("InteractSound_CL:PlayOnOne", "rockerwerbistdudenn", 0.5)
				local bool = exports["grp_PopUp"]:Confirm("Tim Streufeld", "Watt ! Wer bist Du denn?!")
					if bool then 
					TriggerEvent("InteractSound_CL:PlayOnOne", "rockeraufgabe", 0.5)
					exports["grp_PopUp"]:Confirm("Möhre für Möwe", "Willst Du nach Los Santos laufen oder watt?! Die richtigen Schuhe hast Du ja schon an, Macker! Bring mir mal 5 gebratene Möwen oder watt. Dann kriegst Du ne' Möhre(ein Auto) oder watt.")
					if bool then
					TriggerEvent("InteractSound_CL:PlayOnOne", "rockerende", 0.5)
					exports["grp_PopUp"]:Confirm("noch was", "Ich bin noch watt hier falls Du mich suchst. Und jetzt verpiss Dich wenn Du bleiben willst! oder watt.")
					erstemalrocker = true
					else
					end
					else
					TriggerEvent("InteractSound_CL:PlayOnOne", "rockerverpissdich", 0.5)
					exports["grp_PopUp"]:Confirm("Allet klar", "Verpiss Dich. Wenn Du bleiben willst!")
					Citizen.Wait(7000)
					end
					


end)

RegisterNetEvent('vMenuOLD:2.2')
AddEventHandler('vMenuOLD:2.2', function()
TriggerEvent("InteractSound_CL:PlayOnOne", "rockerwosindmeine", 0.5)
				local bool = exports["grp_PopUp"]:Confirm("Tim Streufeld", "Ey Macker! wo sind meine 5 gebratenen Möwen oder watt?!")
				if bool then 
				TriggerEvent("esx_craftvehicle2:OpenByServer")
				else
				TriggerEvent("InteractSound_CL:PlayOnOne", "rockerbringmirmeine", 0.5)
				exports["grp_PopUp"]:Confirm("Möhre für Möwe", "Bring mir meine Möwen ran und verpiss Dich wenn Du bleiben willst oder watt!")
			end
end)

RegisterNetEvent('vMenuOLD:3')
AddEventHandler('vMenuOLD:3', function()
TriggerEvent("InteractSound_CL:PlayOnOne", "rockerfrauhallo", 0.5)
				local bool = exports["grp_PopUp"]:Confirm("Warte mal...", "Ey Macker! Was willst Du mit dem Auto von meinem Mann oder watt?!")
					if bool then 
					TriggerEvent("InteractSound_CL:PlayOnOne", "rockerfrauaufgabe", 0.5)
					exports["grp_PopUp"]:Confirm("Hmm..", "Naja egal. Hier hast Du deine Einreisepapiere oder watt! Fahr zum Kontrolleur! Ich habe ihn Dir auf Dein Navi markiert oder watt!")
					SetNewWaypoint(-2659.189453125,2634.7189941406,16.672168731689);
					if bool then
						TriggerEvent("InteractSound_CL:PlayOnOne", "rockerfrauende", 0.5)
						exports["grp_PopUp"]:Confirm("Alles klar!", "Und jetzt verpiss Dich wenn Du bleiben willst.")
					else
					
					end
					else
					TriggerEvent("InteractSound_CL:PlayOnOne", "rockerfrauaggro", 0.5)
					exports["grp_PopUp"]:Confirm("Oh ", "Watt? Wer bist Du denn?! Verpiss Dich wenn Du bleiben willst! oder watt!")
					end

end)

RegisterNetEvent('vMenuOLD:4')
AddEventHandler('vMenuOLD:4', function()
TriggerEvent("InteractSound_CL:PlayOnOne", "kontrohallo", 0.5)
				local bool = exports["grp_PopUp"]:Confirm("Guten Tag", "Einmal Ihre Papiere bitte!")
					if bool then 
					TriggerEvent("InteractSound_CL:PlayOnOne", "kontroaufgabe1", 0.5)
					exports["grp_PopUp"]:Confirm("Soso..", "Das sieht gut aus. Sie sehen neu aus. Es wird schon seine Richtigkeit haben, Sie können durch.. ABER warum fahren Sie selbst? Nutzen Sie doch mit [F3] den Autopiloten.")
					TriggerEvent("InteractSound_CL:PlayOnOne", "kontroaufgabe2", 0.5)
					exports["grp_PopUp"]:Confirm("Hmm..", "Ich habe Ihnen mal etwas auf Ihrem Navi markiert. Fahren Sie dort per Autopilot hin. Und vergessen Sie nicht das Tablet mit [F10] während der Fahrt zu benutzen.")
					SetNewWaypoint(-2027.8853759766,2333.1350097656,33.62474822998);
					if bool then
						
						TriggerEvent("InteractSound_CL:PlayOnOne", "kontroende", 0.5)
						exports["grp_PopUp"]:Confirm("Ah gut", "Dann hat sich das hier ja erledigt. Und jetzt verpiss Dich!")
					else
					
					end
					else
					TriggerEvent("InteractSound_CL:PlayOnOne", "kontroaggro", 0.5)
					exports["grp_PopUp"]:Confirm("Oh ", "Sie wollen nicht einreisen?.. wollen Sie mich verarschen? Her mit den Papieren!")
					end

end)

RegisterNetEvent('vMenuOLD:5')
AddEventHandler('vMenuOLD:5', function()
TriggerEvent("InteractSound_CL:PlayOnOne", "rentnerhallo", 0.5)
				local bool = exports["grp_PopUp"]:Confirm("Oh man..", "Oma: Roboter! Opa: Überall nur noch Roboter! Oma: Sie verfolgen uns!")
					if bool then 
					TriggerEvent("InteractSound_CL:PlayOnOne", "rentneraufgabe2", 0.5)
					exports["grp_PopUp"]:Confirm("aber..", "Opa:Die Straße entlang findest Du Michael fahr zu ihm, er zeigt Dir wo es zur Stadt geht.")
					SetNewWaypoint(-1693.4327392578,2430.3383789063,29.774850845337);
					if bool then
						TriggerEvent("InteractSound_CL:PlayOnOne", "rentnerciao", 0.5)
						exports["grp_PopUp"]:Confirm("Tschüss", "Oma: Tschüss mein Kindchen, und pass gut auf Dich auf!")
					else
					
					end
					else
					TriggerEvent("InteractSound_CL:PlayOnOne", "rentneraggro", 0.5)
					exports["grp_PopUp"]:Confirm("Na hör mal!", "Oma: Also Ich darf ja wohl bitten! Opa: Ein bischen Respekt vor dem Alter bitte.")
					end

end)

RegisterNetEvent('vMenuOLD:6')
AddEventHandler('vMenuOLD:6', function()
			local bool = exports["grp_PopUp"]:Confirm("Michael", "Hallo Ich bin Michael. Ich werde gleich abgeholt also muss Ich schnell machen.")
					if bool then 
					exports["grp_PopUp"]:Confirm("Keine Zeit..", " Fahre zum Creative Hub! Wo es ist, habe ich Dir auf Deiner Karte markiert.")
					SetNewWaypoint(-1596.40637207031,-1045.118919372559,13.026879425049);
					if bool then
						exports["grp_PopUp"]:Confirm("Bis bald", "Ich hoffe meine Abholung kommt...")
					else
					
					end
					else
					exports["grp_PopUp"]:Confirm("Sicher?", "Sicher dass Du mich hier so stehen lassen willst?")
					end
end)

RegisterNetEvent('vMenuOLD:7')
AddEventHandler('vMenuOLD:7', function()
TriggerEvent("InteractSound_CL:PlayOnOne", "jungevorstellung", 0.5)
				local bool = exports["grp_PopUp"]:Confirm("Hey...", "Ich bin Felix und Du befindest Dich hier am Creative Hub. Hier kannst Du auf Dein Schliessfach zugreifen, Deinen Kleiderschrank öffnen, eine Werkbank benutzen und vieles mehr")
					if bool then 
					TriggerEvent("InteractSound_CL:PlayOnOne", "jungeaufgabe", 0.5)
					exports["grp_PopUp"]:Confirm("Kannst Du mir helfen?", "Ich habe meine lieblings Actionfigur verloren.. auf dem Boden der Figur ist ein Zettel der ECHT wichtig ist.. Besorg sie mir bitte..")
					
					if bool then
						TriggerEvent("InteractSound_CL:PlayOnOne", "jungedanke", 0.5)
						exports["grp_PopUp"]:Confirm("Danke..", "Danke für Deine Hilfe.. das hier kannst Du haben, Ich darf da eh noch nicht rein!")
					else
					
					end
					else
					TriggerEvent("InteractSound_CL:PlayOnOne", "jungeaggro", 0.5)
					exports["grp_PopUp"]:Confirm("Sir?", "Sie wollen einen kleinen Jungen einfach so stehen lassen?")
					end

end)

RegisterNetEvent('vMenuOLD:8')
AddEventHandler('vMenuOLD:8', function()
local bool = exports["grp_PopUp"]:Confirm("Verlorene Actionfigur", " Du hast sie gefunden! Willst du sie umdrehen um die Nachricht zu lesen?")
					if bool then 
					exports["grp_PopUp"]:Confirm("Trommelwirbel..", "Auf der Rückseite steht: Wer das liest ist doof. LG Felix")
					
					if bool then
						exports["grp_PopUp"]:Confirm("Au revoir", " Das war das Ende der ersten Questreihe. Vielen Dank fürs Mitmachen! Und jetzt viel Spaß auf GRP!")
					else
					
					end
					else
					exports["grp_PopUp"]:Confirm("Komm schon...", "Sei neugierig..")
					end
end)


RegisterNetEvent('vMenuOLD:skybar')
AddEventHandler('vMenuOLD:skybar', function()
					TriggerEvent("InteractSound_CL:PlayOnOne", "skybar", 0.5)
					exports["grp_PopUp"]:Confirm("xXGam3rg1rlKARENXxHD", "Herzlich willkommen in der Skybar. Hier kannst Du Billard spielen, an die Bar gehen, den Ausblick genießen und vieles mehr. Ich wünsche Dir einen schönen Aufenthalt.")
end)

RegisterNetEvent('vMenuOLD:skybarsaenger')
AddEventHandler('vMenuOLD:skybarsaenger', function()
					TriggerEvent("InteractSound_CL:PlayOnOne", "skybarsaenger", 0.5)
end)

RegisterNetEvent('vMenuOLD:baustelle1')
AddEventHandler('vMenuOLD:baustelle1', function()
					TriggerEvent("InteractSound_CL:PlayOnOne", "baustelle1", 0.5)
					exports["grp_PopUp"]:Confirm("Dieter Krause", "Um 7 uhr ist Arbeitsbeginn und ihr seid um halb 8 hier! Und wo ist Deine PSA und warum ruft jetzt schon wieder die Bauleitung an!")
end)

RegisterNetEvent('vMenuOLD:baustelle2')
AddEventHandler('vMenuOLD:baustelle2', function()
					TriggerEvent("InteractSound_CL:PlayOnOne", "baustelle2", 0.5)
					exports["grp_PopUp"]:Confirm("Kevin Hansen", "Beim 250 reißt die Kette und die Scheiß Werkstatt kommt net bei! Bring das Schwein Weg und geh zu Bomber! Der soll mit seinem Bagger die Böschung 1:15 machen  und Schnell.... JETZT NIMM DAS SCHWEIN WEG")
end)

Citizen.CreateThread(function()
    local badem = {
        `s_f_y_baywatch_01`,
    }
	local timst = {
        `g_m_y_lost_02`,
    }
	local frstr = {
        `mp_f_chbar_01`,
    }
	local kontroll = {
        `csb_mweather`,
    }
	local strassenra = {
        `a_m_o_genstreet_01`,
        `a_f_o_genstreet_01`,
    }
	local michaaeel = {
        `cs_dale`,
    }
	local felixx = {
        `ig_bankman`,
    }
	local skybarddrrr = {
        `a_f_y_bevhills_04`,
    }
	local skybvarrssaenger = {
        `cs_chrisformage`,
    }
	local schwewyyyn = {
        `a_c_pig`,
    }
	local bauarbeiter11111111 = {
        `s_m_y_construct_01`,
    }
	local bauarbeiter2222 = {
        `s_m_y_construct_02`,
    }
	exports['bt-target']:AddTargetModel(bauarbeiter2222, {
        options = {
            {
                event = "vMenuOLD:baustelle2",
                icon = "fas fa-question",
                label = "Ansprechen",
            },
        },
        job = {"all"},
        distance = 2.5
    })
	exports['bt-target']:AddTargetModel(bauarbeiter11111111, {
        options = {
            {
                event = "vMenuOLD:baustelle1",
                icon = "fas fa-question",
                label = "Ansprechen",
            },
        },
        job = {"all"},
        distance = 2.5
    })
	exports['bt-target']:AddTargetModel(schwewyyyn, {
        options = {
            {
                event = "",
                icon = "",
                label = "oink oink",
            },
        },
        job = {"all"},
        distance = 2.5
    })
	exports['bt-target']:AddTargetModel(skybvarrssaenger, {
        options = {
            {
                event = "vMenuOLD:skybarsaenger",
                icon = "fas fa-question",
                label = "Karaoke anhören",
            },
        },
        job = {"all"},
        distance = 2.5
    })
	exports['bt-target']:AddTargetModel(skybarddrrr, {
        options = {
            {
                event = "vMenuOLD:skybar",
                icon = "fas fa-comments",
                label = "Ansprechen",
            },
        },
        job = {"all"},
        distance = 2.5
    })
    exports['bt-target']:AddTargetModel(badem, {
        options = {
            {
                event = "vMenuOLD:1",
                icon = "fas fa-question",
                label = "Ivanka ansprechen",
            },
        },
        job = {"all"},
        distance = 2.5
    })
	exports['bt-target']:AddTargetModel(timst, {
        options = {
            {
                event = "vMenuOLD:2",
                icon = "fas fa-question",
                label = "Tim Streufeld ansprechen",
            },
			{
                event = "vMenuOLD:2.2",
                icon = "fas fa-car",
                label = "Möwen gegen Auto tauschen",
            },
        },
        job = {"all"},
        distance = 2.5
    })
	exports['bt-target']:AddTargetModel(frstr, {
        options = {
            {
                event = "vMenuOLD:3",
                icon = "fas fa-question",
                label = "Olga Streufeld ansprechen",
            },
        },
        job = {"all"},
        distance = 2.5
    })
	exports['bt-target']:AddTargetModel(kontroll, {
        options = {
            {
                event = "vMenuOLD:4",
                icon = "fas fa-question",
                label = "Kontrolleur ansprechen",
            },
        },
        job = {"all"},
        distance = 2.5
    })
	exports['bt-target']:AddTargetModel(strassenra, {
        options = {
            {
                event = "vMenuOLD:5",
                icon = "fas fa-question",
                label = "Oma u. Opa ansprechen",
            },
        },
        job = {"all"},
        distance = 2.5
    })
	exports['bt-target']:AddTargetModel(michaaeel, {
        options = {
            {
                event = "vMenuOLD:6",
                icon = "fas fa-question",
                label = "Michael ansprechen",
            },
        },
        job = {"all"},
        distance = 2.5
    })
	exports['bt-target']:AddTargetModel(felixx, {
        options = {
            {
                event = "vMenuOLD:7",
                icon = "fas fa-question",
                label = "Fiesen Felix ansprechen",
            },
        },
        job = {"all"},
        distance = 2.5
    })
    local actionfig = {
        -2122485935,
    }
    exports['bt-target']:AddTargetModel(actionfig, {
        options = {
            {
                event = "vMenuOLD:8",
                icon = "fas fa-question",
                label = "Actionfigur aufheben",
            },
        },
        job = {"all"},
        distance = 2.5
    })
end)


--quest anfang am spawn
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		--among us tastenbelegung
        --[[
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 613.96588134766,1129.0101318359,563.72418212891, true) < 100 then
		DrawAdvancedText(1, 0.053, 0.005, 0.0028, 0.4, "Among Us Steuerung:", 255, 0, 0, 255, 6, 0)
		DrawAdvancedText(1, 0.076, 0.005, 0.0028, 0.4, "Benutzen [E]", 255, 255, 255, 255, 6, 0)
		DrawAdvancedText(1, 0.099, 0.005, 0.0028, 0.4, "Reporten [G]", 255, 255, 255, 255, 6, 0)
		DrawAdvancedText(1, 0.122, 0.005, 0.0028, 0.4, "Meeting [Pfeil Unten]", 255, 255, 255, 255, 6, 0)
		DrawAdvancedText(1, 0.145, 0.005, 0.0028, 0.4, "Schacht benutzen [Pfeil Rechts]", 255, 255, 255, 255, 6, 0)
		DrawAdvancedText(1, 0.168, 0.005, 0.0028, 0.4, "Sabotieren [Pfeil Links]", 255, 255, 255, 255, 6, 0)
		DrawAdvancedText(1, 0.191, 0.005, 0.0028, 0.4, "Töten [Pfeil Oben]", 255, 255, 255, 255, 6, 0)

		end
        ]]
		--musik beim landen
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1616.4847412109,5272.3388671875,6.7839212417603, true) < 7 and not landemusik then
		   TriggerEvent("InteractSound_CL:PlayOnOne", "gelandet", 0.5)
		   landemusik = true
		end
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -2001.3980712891,3195.0095214844,33.039516448975, true) < 4 and not spawnhallenmusik then
		   inspawn = true
		end
		--Schönheitsklinik am Spawn
		DrawMarker(1, -1988.2419433594,3206.021484375,31.810287475586, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 0, 155, 255, 155, 0, 0, 2, 0, 0, 0, 0) 
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1988.2419433594,3206.021484375,32.810287475586, true) < 2 then
            --was passiert wenn man im marker ist
			DisplayHelpText("Drücke ~g~[E]~w~ um Dein Aussehen zu ändern. ")
            if (IsControlJustPressed(1, 38)) then
			TriggerEvent('esx_skin:openSaveableMenu', myIdentifiers.id)	
         end
		end
        --teleport von spawnhalle in den anfang
		DrawMarker(1, -1985.541015625,3222.9907226562,31.810253143311, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 0, 155, 255, 155, 0, 0, 2, 0, 0, 0, 0) 
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -1985.541015625,3222.9907226562,32.810253143311, true) < 2 then
            local ped = PlayerPedId()
            if (IsControlJustPressed(1, Key)) then
			DoScreenFadeOut(1000)
			
			TriggerEvent('skinchanger:getSkin', function(skin)
                if skin.sex == 0 then 
                        --männer
						local clothesSkin = { 
                        ['torso_1'] 	= 262, 	['torso_2'] 	= 0,
						['tshirt_1'] 	= 15, 	['tshirt_2'] 	= 0,
						['pants_1'] 	= 6, 	['pants_2'] 	= 1,
						['shoes_1'] 	= 8, 	['shoes_2'] 	= 0,
						['arms'] 	= 1,			['bproof_1']	= 0, 
						
                        } 
                        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                        TriggerServerEvent('esx_skin:save', skin)
                        end)
                else
						--frauen
                        local clothesSkin = { 
                        ['torso_1'] 	= 271, 	['torso_2'] 	= 0,
						['tshirt_1'] 	= 14, 	['tshirt_2'] 	= 0,
						['pants_1'] 	= 11, 	['pants_2'] 	= 1,
						['shoes_1'] 	= 1, 	['shoes_2'] 	= 0,
						['arms'] 	= 3,			['bproof_1']	= 0,  
						
                        } 
                        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                        TriggerServerEvent('esx_skin:save', skin)
                        end)               
                end 
			end)
			
			
			SetEntityCoords(ped, -1820.09703125,5612.4715820312,297.061800308228, false, false, false, true)
			FreezeEntityPosition(ped, true)
            DoScreenFadeIn(1000) 
			Citizen.Wait(2000)
            FreezeEntityPosition(ped, false)
			--KLAMOTTENAN ?

			
			
         end
		end
		if inspawn then 
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -2001.3980712891,3195.0095214844,33.039516448975, true) > 4 and not spawnhallenmusik then
		   TriggerEvent("InteractSound_CL:PlayOnOne", "spawnhalle3", 0.5)
		   Citizen.Wait(8130)
		   TriggerEvent("InteractSound_CL:PlayOnOne", "spawnhalle4", 0.5)
			spawnhallenmusik = true
		end	
		end
	end
end)

function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end


