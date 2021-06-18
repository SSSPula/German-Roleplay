Config = {

Text = {

	['someone_is_waiting'] = 'Jemand hat geklingelt',
	['press_to_call'] = 'Drücke ~g~[E]~w~ um zu klingeln.',
	['please_wait'] = 'Ein Mitarbeiter wurde informiert ~g~'

},

Desks = { 

  {coords = vector3(433.19537353516,-985.36730957031,30.710943222046 - 0.9), job = 'police'},
  {coords = vector3(-207.02462768555,-1327.0983886719,30.890380859375 - 0.9), job = 'mechanic'},
  {coords = vector3(309.00967407227,-591.82452392578,43.283992767334 - 0.9), job = 'ambulance'},
  {coords = vector3(107.4488525391,-149.29455566406,54.757635345459 - 0.9), job = 'mechanic2'},
  {coords = vector3(2748.8857421875,3464.5952148438,55.737831115723 - 0.9), job = 'sheriff'},
  {coords = vector3(-37.463577270508,-1113.5631103516,26.43710899353 - 0.9), job = 'cardealer'}                

}
	

}

-- Only change if you know what are you doing!
function SendNotice(msg)

		--SetNotificationTextEntry('STRING')
		--AddTextComponentString(msg)
		--DrawNotification(0,1)

		
		exports['mythic_notify']:SendAlert('inform', msg)

end
