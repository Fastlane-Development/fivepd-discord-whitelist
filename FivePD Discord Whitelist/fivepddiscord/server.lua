--Do not touch anything here unless you know what you're doing
RegisterServerEvent('discordcheck:fivepdrequest')
AddEventHandler('discordcheck:fivepdrequest', function()
    local isAllowed = false
    local roles = exports.Badger_Discord_API:GetDiscordRoles(source)
    if roles ~= false then
        for i = 1, #roles do
            for j = 1, #allowedRoles do
                if roles[i] == allowedRoles[j] then
                    isAllowed = true
                    goto done
                end
            end
        end
        goto done
    else
        local pname = GetPlayerName(source)
        print("[FivePD Discord] Unable to get discord roles for "..pname.."! Allowed false")
        goto done
    end
    ::done::
    TriggerClientEvent('discordcheck:fivepdreturn', source, isAllowed)
end)