fx_version 'cerulean'
game 'gta5'

name 'qb-moneyHud'
author 'Lee Verse'
description 'Minimal glass Money/ID/Job HUD for QB-Core'
version '1.0.0'
lua54 'yes'

ui_page 'web/index.html'

files {
    'web/index.html',
    'web/style.css',
    'web/app.js',
    'web/img/logo.png'
}

client_scripts {
    'config.lua',
    'client.lua'
}

dependency 'qb-core'
