Config = {}
Config.Locale = 'en'
Config.DrawDistance = 5.5

Config.Duty = {
    {x = 440.05, y = -975.75, z = 30.69}, --- LSPD
    {x = -253.21, y = 6326.76, z = 32.46}, --- EMS Paleto
    {x = 306.89, y = -601.03, z = 43.28}, --- Krankenhaus Los Santos	
    {x = 2748.34, y = 3463.98, z = 55.76}, --- sheriff
	{x = 366.81, y = -1686.05, z = 27.31} --ordnungsamt
}

Config.JobWH = {
    ["ambulance"] = "https://discord.com/api/webhooks/815694595987734538/KYYWIbITXcIWvoucdpQaHt3Bhb1F70ubTk2HNkSXzc7rfVgBRC1P_1M5Nu9SX9ks19G8",
    ["offambulance"] = "https://discord.com/api/webhooks/815694595987734538/KYYWIbITXcIWvoucdpQaHt3Bhb1F70ubTk2HNkSXzc7rfVgBRC1P_1M5Nu9SX9ks19G8",
    ["police"] = "https://discord.com/api/webhooks/815694768662773800/8UFLQgMXeoX4HcdR4slu2rRuKh97wG7T5-wYzBscj1SsRXn7W8LbiD5v27yn3obyF99M",
    ["offpolice"] = "https://discord.com/api/webhooks/815694768662773800/8UFLQgMXeoX4HcdR4slu2rRuKh97wG7T5-wYzBscj1SsRXn7W8LbiD5v27yn3obyF99M",
    ["sheriff"] = "https://discord.com/api/webhooks/815694967921180712/xrQVaLoBthiSBLQ1XPNrE7Rx_ddzCYdiHJghR6SfDKFLhxYu1kPDeUbuBJ46KmhicRU_",
    ["offsheriff"] = "https://discord.com/api/webhooks/815694967921180712/xrQVaLoBthiSBLQ1XPNrE7Rx_ddzCYdiHJghR6SfDKFLhxYu1kPDeUbuBJ46KmhicRU_"
}

Config.Bot = {
	["Name"] = "grp_offduty",
	["Image"] = "https://i.ibb.co/HzXxbQw/Screenshot-18.png"
}

Config.Jobs = {
 'police',
 'offpolice',
 'ordnungsamt',
 'offordnungsamt', 
 'sheriff', 
 'offsheriff', 
 'ambulance',
 'offambulance'
}
