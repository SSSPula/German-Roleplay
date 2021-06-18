fx_version 'cerulean'
games { 'gta5' }

author 'k'
description 'k'
version '1.0.0'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/config.js',
    'html/app.js',
    '/html/img/*.webp',
    '/html/img/*.png',
}

client_scripts {
    'client.lua',
    'config.lua',
}

server_scripts {
    'server.lua',
    'config.lua',
}