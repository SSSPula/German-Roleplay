fx_version 'bodacious'
game 'gta5'

server_script {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'server.lua'
}

client_script {
    'config.lua',
    'client.lua'
}

ui_page 'html/build/index.html'

files {
    'html/build/index.html',
    'html/build/*',
    'html/build/static/css/*',
    'html/build/static/js/*',
    'html/build/image/*',
    'html/build/language/*'
}