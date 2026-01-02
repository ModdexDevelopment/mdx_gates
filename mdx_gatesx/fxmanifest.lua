fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

shared_script '@ox_lib/init.lua'

client_scripts {
    'client.lua'
}

shared_script 'config.lua' -- ✅ make config available to both client & server

server_script 'server.lua'

dependency 'ox_lib'
