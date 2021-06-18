fx_version 'adamant'
games { 'gta5' };

name 'esx_identity'
description 'Esx Identity by @HydraDev'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'client/main.lua'
}

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/css/style.css',
	'html/js/bootstrap.min.js',
	'html/js/imagesloaded.pkgd.min.js',
	'html/js/jquery-3.5.0.min.js',
	'html/js/main.js',
	'html/bilder/bg.png',
	'html/bilder/logo.png',
	'html/js/popper.min.js',
	'html/js/script.js',
	'html/js/validator.min.js'
}

dependency 'es_extended'