RegisterServerEvent('devx:checkPerms')
AddEventHandler('devx:checkPerms', function(perm)
    local src = source
    if IsPlayerAceAllowed(src, perm) then
        TriggerClientEvent('devx:returnPerms', src, true)
    else
        TriggerClientEvent('devx:returnPerms', src, false)
    end
end)
