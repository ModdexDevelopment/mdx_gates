local allGateData = Config.Gates
local playerGateStatus = {}

RegisterServerEvent('mdx_Station_Gates:RequestGates')
AddEventHandler('mdx_Station_Gates:RequestGates', function()
    local src = source
    
    if playerGateStatus[src] and (os.time() - playerGateStatus[src]) < 5 then
        return
    end
    
    playerGateStatus[src] = os.time()
    TriggerClientEvent('mdx_Station_Gates:SpawnGates', src, allGateData)
end)

RegisterServerEvent('mdx_Station_Gates:PlayAnimation')
AddEventHandler('mdx_Station_Gates:PlayAnimation', function(gateData)
    TriggerClientEvent('mdx_Station_Gates:PlayAnimation', -1, gateData)
end)

AddEventHandler('playerDropped', function()
    local src = source
    playerGateStatus[src] = nil
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        Citizen.Wait(3000)
        
        local players = GetPlayers()
        for _, playerId in ipairs(players) do
            local pid = tonumber(playerId)
            playerGateStatus[pid] = os.time()
            TriggerClientEvent('mdx_Station_Gates:SpawnGates', pid, allGateData)
        end
    end
end)
