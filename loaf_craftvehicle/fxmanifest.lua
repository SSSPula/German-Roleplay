fx_version "adamant"

game "gta5"

server_script "@mysql-async/lib/MySQL.lua"
client_script "client/*.lua"
shared_script "config/*.lua"
server_script "server/*.lua"