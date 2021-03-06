fx_version 'adamant'

game 'gta5'

ui_page 'ui/index.html'

files {
  'ui/index.html',
  'ui/style.css',
  'ui/img/ta1.png',
  'ui/img/ta2.png',
  'ui/img/tac0.png',
  'ui/img/tac1.png',
  'ui/img/tac2.png',
  'ui/img/tac3.png',
  'ui/script.js'
}
client_scripts {
	'@es_extended/locale.lua',
	'client/client.lua',
	'client/entityiter.lua',
	'config.lua',
	'locales/*lua'
}
server_scripts {
	'@es_extended/locale.lua',
	'server/server.lua',
	'config.lua',
	'locales/*lua'
}



