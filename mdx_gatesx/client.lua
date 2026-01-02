local spawnedGates = {}
local gateStates = {}
local isInitialized = false
local isSpawning = false
local gateConfig = nil

local SPAWN_DISTANCE = 150.0
local DESPAWN_DISTANCE = 200.0
local CHECK_INTERVAL = 1000

function Notify(title, description, type)
    if lib and lib.notify then
        lib.notify({
            title = title,
            description = description,
            type = type
        })
    else
        SetNotificationTextEntry("STRING")
        AddTextComponentString(description)
        DrawNotification(false, true)
    end
end

function LoadModel(model, timeout)
    timeout = timeout or 10000
    
    if not IsModelValid(model) then
        return false
    end
    
    if HasModelLoaded(model) then
        return true
    end
    
    RequestModel(model)
    local startTime = GetGameTimer()
    
    while not HasModelLoaded(model) do
        if GetGameTimer() - startTime > timeout then
            return false
        end
        Citizen.Wait(10)
    end
    
    return true
end

function LoadAnimation(dict, timeout)
    timeout = timeout or 5000
    
    if not DoesAnimDictExist(dict) then
        return false
    end
    
    if HasAnimDictLoaded(dict) then
        return true
    end
    
    RequestAnimDict(dict)
    local startTime = GetGameTimer()
    
    while not HasAnimDictLoaded(dict) do
        if GetGameTimer() - startTime > timeout then
            return false
        end
        Citizen.Wait(10)
    end
    
    return true
end

function GetGateKey(gate)
    return string.format("%.6f_%.6f_%.6f", gate.GateCoords.x, gate.GateCoords.y, gate.GateCoords.z)
end

function SpawnGate(gate)
    local key = GetGateKey(gate)
    
    if spawnedGates[key] and DoesEntityExist(spawnedGates[key].entity) then
        return spawnedGates[key].entity
    end
    
    if not LoadModel(gate.model) then
        return nil
    end
    
    local gateEntity = CreateObjectNoOffset(gate.model, gate.GateCoords.x, gate.GateCoords.y, gate.GateCoords.z, false, false, false)
    
    if not DoesEntityExist(gateEntity) then
        SetModelAsNoLongerNeeded(gate.model)
        return nil
    end
    
    SetEntityAsMissionEntity(gateEntity, true, true)
    SetEntityRotation(gateEntity, gate.GateRotation.x, gate.GateRotation.y, gate.GateRotation.z, 2, true)
    FreezeEntityPosition(gateEntity, true)
    SetEntityCollision(gateEntity, true, true)
    SetEntityLodDist(gateEntity, 500)
    
    SetModelAsNoLongerNeeded(gate.model)
    
    spawnedGates[key] = {
        entity = gateEntity,
        data = gate,
        key = key
    }
    
    if not gateStates[key] then
        gateStates[key] = { isOpen = false, isAnimating = false }
    end
    
    return gateEntity
end

function DespawnGate(key)
    local gate = spawnedGates[key]
    if gate and DoesEntityExist(gate.entity) then
        SetEntityAsMissionEntity(gate.entity, false, true)
        DeleteEntity(gate.entity)
    end
    spawnedGates[key] = nil
end

function DespawnAllGates()
    for key, _ in pairs(spawnedGates) do
        DespawnGate(key)
    end
    spawnedGates = {}
end

function SpawnNearbyGates()
    if not gateConfig or isSpawning then
        return
    end
    
    isSpawning = true
    local playerCoords = GetEntityCoords(PlayerPedId())
    local spawned = 0
    local despawned = 0
    
    for stationName, gates in pairs(gateConfig) do
        for _, gate in ipairs(gates) do
            local key = GetGateKey(gate)
            local distance = #(playerCoords - gate.GateCoords)
            local existingGate = spawnedGates[key]
            
            if distance < SPAWN_DISTANCE then
                if not existingGate or not DoesEntityExist(existingGate.entity) then
                    if SpawnGate(gate) then
                        spawned = spawned + 1
                    end
                    Citizen.Wait(50)
                end
            elseif distance > DESPAWN_DISTANCE then
                if existingGate then
                    DespawnGate(key)
                    despawned = despawned + 1
                end
            end
        end
    end
    
    isSpawning = false
end

function ValidateSpawnedGates()
    for key, gate in pairs(spawnedGates) do
        if not DoesEntityExist(gate.entity) then
            spawnedGates[key] = nil
            
            local playerCoords = GetEntityCoords(PlayerPedId())
            local distance = #(playerCoords - gate.data.GateCoords)
            
            if distance < SPAWN_DISTANCE then
                SpawnGate(gate.data)
            end
        end
    end
end

RegisterNetEvent('mdx_Station_Gates:SpawnGates')
AddEventHandler('mdx_Station_Gates:SpawnGates', function(config)
    if isInitialized then
        return
    end
    
    gateConfig = config
    isInitialized = true
    
    Citizen.CreateThread(function()
        Citizen.Wait(500)
        SpawnNearbyGates()
    end)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(CHECK_INTERVAL)
        
        if isInitialized and gateConfig then
            SpawnNearbyGates()
            ValidateSpawnedGates()
        end
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    
    if not isInitialized then
        TriggerServerEvent('mdx_Station_Gates:RequestGates')
    end
end)

Citizen.CreateThread(function()
    local notificationCooldown = 0
    
    while true do
        Citizen.Wait(300)
        
        if notificationCooldown > 0 then
            notificationCooldown = notificationCooldown - 300
        end
        
        local nearGate = false
        local playerCoords = GetEntityCoords(PlayerPedId())
        
        for key, gate in pairs(spawnedGates) do
            if DoesEntityExist(gate.entity) then
                local distOutside = #(playerCoords - gate.data.KeyCoordsOutside)
                local distInside = #(playerCoords - gate.data.KeyCoordsInside)
                local interactDist = gate.data.InteractionDistance or 5.0
                
                if distOutside < interactDist or distInside < interactDist then
                    nearGate = true
                    
                    if notificationCooldown <= 0 then
                        Notify("Gate Interaction", "Press [E] to open the gate!", "inform")
                        notificationCooldown = 5000
                    end
                    break
                end
            end
        end
        
        if not nearGate then
            Citizen.Wait(500)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        
        local gateCount = 0
        for _ in pairs(spawnedGates) do gateCount = gateCount + 1 end
        
        if gateCount == 0 then
            Citizen.Wait(1000)
        else
            local playerCoords = GetEntityCoords(PlayerPedId())
            
            for key, gate in pairs(spawnedGates) do
                if DoesEntityExist(gate.entity) then
                    local distOutside = #(playerCoords - gate.data.KeyCoordsOutside)
                    local distInside = #(playerCoords - gate.data.KeyCoordsInside)
                    local interactDist = gate.data.InteractionDistance or 5.0
                    
                    if (distOutside < interactDist or distInside < interactDist) and IsControlJustReleased(0, 38) then
                        local state = gateStates[key]
                        
                        if state and not state.isAnimating then
                            TriggerServerEvent('mdx_Station_Gates:PlayAnimation', gate.data)
                            Citizen.Wait(500)
                        end
                        break
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('mdx_Station_Gates:PlayAnimation')
AddEventHandler('mdx_Station_Gates:PlayAnimation', function(gateData)
    local key = GetGateKey(gateData)
    local gate = spawnedGates[key]
    
    if not gate or not DoesEntityExist(gate.entity) then
        return
    end
    
    local state = gateStates[key]
    if not state then
        gateStates[key] = { isOpen = false, isAnimating = false }
        state = gateStates[key]
    end
    
    if state.isAnimating then
        return
    end
    
    state.isAnimating = true
    
    if LoadAnimation(gateData.animationDict) then
        local entity = gate.entity
        
        FreezeEntityPosition(entity, false)
        SetEntityCollision(entity, false, false)
        
        PlayEntityAnim(entity, gateData.animationName, gateData.animationDict, 8.0, false, true, false, 0, 0)
        
        state.isOpen = true
        
        Citizen.SetTimeout(22000, function()
            if DoesEntityExist(entity) then
                StopEntityAnim(entity, gateData.animationName, gateData.animationDict, 0)
                SetEntityCollision(entity, true, true)
                FreezeEntityPosition(entity, true)
                
                SetEntityRotation(entity, gateData.GateRotation.x, gateData.GateRotation.y, gateData.GateRotation.z, 2, true)
            end
            
            state.isOpen = false
            state.isAnimating = false
        end)
        
        RemoveAnimDict(gateData.animationDict)
    else
        state.isAnimating = false
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    DespawnAllGates()
    isInitialized = false
    gateConfig = nil
end)

AddEventHandler('onClientResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        isInitialized = false
        gateConfig = nil
        spawnedGates = {}
        gateStates = {}
        
        Citizen.Wait(2000)
        TriggerServerEvent('mdx_Station_Gates:RequestGates')
    end
end)
