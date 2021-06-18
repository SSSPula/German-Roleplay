resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

fx_version 'cerulean'
games {'gta5'}

description 'd'

client_script "client.lua"

server_scripts {
	'@mysql-async/lib/MySQL.lua', --If you use ghmattimysql pls remove this :D
    "config.lua",
    "server/main.lua",
}