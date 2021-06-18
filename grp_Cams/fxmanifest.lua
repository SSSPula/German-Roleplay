-- Manifest data
fx_version "adamant"
game "gta5"

-- Resource Information
description ""
version ""
author ""
url ""

-- Resource Data
shared_script"shared/shared.lua"

client_scripts {
    "client/classes/*.lua",
    "client/managers/*.lua",
    "client/*.lua",
}

server_script "server/main.lua"

export "GetClosestCam"