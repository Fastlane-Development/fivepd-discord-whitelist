--Do not touch anything here unless you know what you're doing
local roles = nil

RegisterServerEvent('discordcheck:fivepdrequest')
AddEventHandler('discordcheck:fivepdrequest', function()
    local isAllowed = false
    roles = exports.Badger_Discord_API:GetDiscordRoles(source)
    if roles ~= nil then
        for i = 1, #roles do
            for j = 1, #allowedRoles do
                if roles[i] == allowedRoles[j] then
                    return true
                end
            end
        end
    else
        local pname = GetPlayerName(source)
        print("[FivePD Discord] Unable to get discord roles for "..pname.."!")
    end
    TriggerClientEvent('discordcheck:fivepdreturn', source, isAllowed)
end)