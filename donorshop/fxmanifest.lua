fx_version 'adamant'
games { 'rdr3', 'gta5' }

dependencies {
  'meta_libs',
  'mysql-async'
} 

client_scripts {
  'config.lua',
  'src/client/main.lua',
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'config.lua',
  'src/server/main.lua',
}

