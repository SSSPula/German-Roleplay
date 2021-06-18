resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_scripts {
    '@es_extended/locale.lua',
	'locales/de.lua',
	'config.lua',
	'client/client.lua'
}

server_scripts {
	'server/server.lua'
}

ui_page('html/index.html') --THIS IS IMPORTENT

--[[The following is for the files which are need for you UI (like, pictures, the HTML file, css and so on) ]]--
files({

})
dependencies { 
	'bt-target',
	'PolyZone',
	'es_extended'
}

