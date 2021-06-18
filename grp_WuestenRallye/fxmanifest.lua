fx_version 'adamant'
game 'gta5'
version '1.0.0'
ui_page 'ui/ui.html'

files {
	'ui/ui.html',
	'ui/style/style.css',
	'ui/bilder/bg.png',
	'ui/js/script.js',
}

client_scripts {
    'client.lua',
    'config.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server.lua',
    'config.lua'
}