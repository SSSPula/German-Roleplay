fx_version 'adamant'

game 'gta5'

description 'ddd'

version '1.0.0'

client_scripts {
	'client/main.lua',
}

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	"server.lua"
}

ui_page 'html/index.html'

files {
  'html/index.html'
}
dependencies {
	'es_extended'
}