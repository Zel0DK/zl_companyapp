fx_version "cerulean"
game "gta5"
lua54 'yes'

author 'Aspect - Zel0'
description 'Apt Companyapp'
version '1.0.0'

ui_page "ui/dist/index.html"

client_scripts {
    "client.lua"
}

server_scripts {
    "server.lua"
}

files {
    "ui/dist/**/*",
    "ui/icon.png"
}

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
}
