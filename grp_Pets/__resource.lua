resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

author 'grd'
description 'ein einfaches script zum setzen von PEDS'

server_scripts {
	"@mysql-async/lib/MySQL.lua",
	'server/main.lua'
}

client_scripts {
  'client/main.lua'
}