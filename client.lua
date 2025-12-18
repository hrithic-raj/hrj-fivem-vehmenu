local menuPool = nil
local mainMenu = nil
local isMenuOpen = false
local pendingPermissionCallback = nil
local lastSpawnedVehicle = nil

-- Debug: Check if NativeUI loaded
Citizen.CreateThread(function()
    if NativeUI then
        print("[DevX VehicleMenu] NativeUI loaded! Version:", NativeUI.Version or "unknown")
    else
        print("[DevX VehicleMenu] ERROR: NativeUI not loaded properly.")
    end
end)

-- Register permission callback only once
RegisterNetEvent('devx:returnPerms')
AddEventHandler('devx:returnPerms', function(result)
    if pendingPermissionCallback then
        pendingPermissionCallback(result)
        pendingPermissionCallback = nil
    end
end)

-- Check if player has global or category ACE permission
function hasAcePermission(categoryPerm, callback)
    if not Config.UseAcePerms then
        callback(true)
        return
    end

    pendingPermissionCallback = function(globalPerm)
        if globalPerm then
            callback(true)
        else
            pendingPermissionCallback = callback
            TriggerServerEvent('devx:checkPerms', categoryPerm)
        end
    end

    TriggerServerEvent('devx:checkPerms', Config.GlobalAcePerm or "devx.vehiclemenu")
end

-- function spawnVehicle(model)
--     local player = PlayerPedId()
--     local coords = GetEntityCoords(player)
--     local heading = GetEntityHeading(player)

--     -- Delete previous vehicle if it exists
--     if lastSpawnedVehicle and DoesEntityExist(lastSpawnedVehicle) then
--         SetEntityAsMissionEntity(lastSpawnedVehicle, true, true)
--         DeleteVehicle(lastSpawnedVehicle)
--         lastSpawnedVehicle = nil
--     end

--     RequestModel(model)
--     while not HasModelLoaded(model) do
--         Citizen.Wait(0)
--     end

--     local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z, heading, true, false)
--     SetEntityAsMissionEntity(vehicle, true, true)
--     TaskWarpPedIntoVehicle(player, vehicle, -1)
--     SetModelAsNoLongerNeeded(model)

--     lastSpawnedVehicle = vehicle
-- end

-- function spawnVehicle(model)
--     local player = PlayerPedId()
--     local coords = GetEntityCoords(player)
--     local heading = GetEntityHeading(player)

--     -- Only delete the last spawned vehicle if the player is inside it
--     if lastSpawnedVehicle and DoesEntityExist(lastSpawnedVehicle) then
--         if IsPedInVehicle(player, lastSpawnedVehicle, false) then
--             SetEntityAsMissionEntity(lastSpawnedVehicle, true, true)
--             DeleteVehicle(lastSpawnedVehicle)
--             lastSpawnedVehicle = nil
--         end
--     end

--     -- Load the model
--     RequestModel(model)
--     while not HasModelLoaded(model) do
--         Citizen.Wait(0)
--     end

--     -- Create new vehicle
--     local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z, heading, true, false)
--     SetEntityAsMissionEntity(vehicle, true, true)
--     TaskWarpPedIntoVehicle(player, vehicle, -1)
--     SetModelAsNoLongerNeeded(model)

--     lastSpawnedVehicle = vehicle
-- end


function spawnVehicle(model)
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
    local heading = GetEntityHeading(player)

    -- Check if the player is inside ANY vehicle
    if IsPedInAnyVehicle(player, false) then
        local veh = GetVehiclePedIsIn(player, false)

        if DoesEntityExist(veh) then
            SetEntityAsMissionEntity(veh, true, true)
            DeleteVehicle(veh)

            -- If the deleted vehicle was the last stored one, clear the reference
            if veh == lastSpawnedVehicle then
                lastSpawnedVehicle = nil
            end
        end
    end

    -- Spawn the new vehicle
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(0)
    end

    local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z, heading, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    TaskWarpPedIntoVehicle(player, vehicle, -1)
    SetModelAsNoLongerNeeded(model)

    lastSpawnedVehicle = vehicle
end


function openVehicleMenu()
    if isMenuOpen then return end
    isMenuOpen = true

    menuPool = NativeUI.CreatePool()
    mainMenu = NativeUI.CreateMenu("Vehicle Spawner", "~b~Select a vehicle")
    menuPool:Add(mainMenu)

    local totalCategories = #Config.VehicleCategories
    local loadedCount = 0

    for _, category in ipairs(Config.VehicleCategories) do
        hasAcePermission(category.acePerm, function(hasPerm)
            if hasPerm then
                local submenu = menuPool:AddSubMenu(mainMenu, category.label)
                for _, vehicle in pairs(category.vehicles) do
                    local item = NativeUI.CreateItem(vehicle.label, "Spawn this vehicle")
                    submenu:AddItem(item)
                    item.Activated = function(sender, item, index)
                        spawnVehicle(vehicle.name)
                    end
                end
            end

            loadedCount = loadedCount + 1
            if loadedCount == totalCategories then
                menuPool:RefreshIndex()
                mainMenu:Visible(true)
                SetNuiFocus(false, false) -- Hide cursor and regain camera control
            end
        end)
    end

    -- Detect when menu is manually closed
    Citizen.CreateThread(function()
        while true do
            menuPool:ProcessMenus()

            -- No cursor lock, no camera restrictions
            -- Cursor remains hidden unless a NativeUI item forces it (we override with SetNuiFocus)

            Citizen.Wait(0)

            if not menuPool:IsAnyMenuOpen() then
                isMenuOpen = false
                break
            end
        end
    end)
end

function checkMenuPermissionAndOpen()
    if Config.UseAcePerms then
        local hasAnyPerm = false
        local categories = Config.VehicleCategories
        local checked = 0

        for _, category in pairs(categories) do
            hasAcePermission(category.acePerm, function(hasPerm)
                checked = checked + 1
                if hasPerm then hasAnyPerm = true end
                if checked == #categories then
                    if hasAnyPerm then
                        openVehicleMenu()
                    else
                        print("[DevX VehicleMenu] No permission to open any category.")
                    end
                end
            end)
        end
    else
        openVehicleMenu()
    end
end

-- Register commands or key mappings
if Config.MenuTrigger == 'key' then
    RegisterKeyMapping('open_vehicle_menu', 'Open Vehicle Spawn Menu', 'keyboard', Config.MenuKey)

    RegisterCommand('open_vehicle_menu', function()
        checkMenuPermissionAndOpen()
    end, false)
elseif Config.MenuTrigger == 'command' then
    RegisterCommand(Config.MenuCommand, function()
        checkMenuPermissionAndOpen()
    end, false)
end
