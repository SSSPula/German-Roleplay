
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description ""

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	"config.lua",
	"server/server.lua"
}

client_scripts {
	"config.lua",
	"client/utils.lua",
	"client/client.lua"
}


ui_page 'html/index.html'

files {
    'html/css/*',
	'html/js/*',
	'html/*'
}

exports {
	'openMenu',
}


