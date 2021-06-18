fx_version 'adamant'
game "gta5"

description "dccc"
author "gh"
client_script 'Client.lua'
server_scripts {
    'Server/Cbot.js', 'Server/Config.lua', 'server.js', 'Server/Server.lua',
    'Server/Commands.lua'
}

server_exports {'RegisterDiscordCommand'}

