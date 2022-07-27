
----------------------------------------------
----------------------------------------------
---------- Peter's Logging System -----------
----------------------------------------------
----------------------------------------------

-- Collecting Values --

local webhook = Config.webhook
local name = "Peters's Log System"
local logo = "https://media.discordapp.net/attachments/943168636699418664/1001817241744060457/Schermafbeelding_2022-07-27_134220.png" -- Must end with png, jpg e.t.c.



-- Player Connecting Event --

AddEventHandler('playerConnecting', function()
    local playerName = GetPlayerName(source)
    local playerIp = GetPlayerEndpoint(source)
    local playerHex = GetPlayerIdentifier(source)
    local playerPing = GetPlayerPing(source)
    local connecting = {
        {
            ["color"] = "000000",
            ["title"] = "Speler Aan het joinen....",
            ["description"] = "Speler Naam: *"..playerName.."*\n\nSpeler Steam Hex: *"..playerHex.."*\n Speler Ping: *"..playerPing.."*",
	        ["footer"] = {
                ["text"] = name,
                ["icon_url"] = logo,
            },
        }
    }

    
-- Sending Embed To Discord Webhook --

PerformHttpRequest(webhook, function (err, text, headers) end, 'POST', json.encode({username = name, embeds = connecting}), { ['Content-Type'] = 'application/json' })
end)

-- Player Disconnecting Event --
AddEventHandler('playerDropped', function(reason)
    local playerName = GetPlayerName(source)
    local playerIp = GetPlayerEndpoint(source)
    local playerPing = GetPlayerPing(source)
    local playerHex = GetPlayerIdentifier(source)
    local playerId = source
    local disconnecting = {
        {
            ["color"] = "000000",
            ["title"] = "Player Disconnecting",
            ["description"] = "Speler Naam: *"..playerName.."*\nSpeler Steam Hex: *"..playerHex.."*\n Speler Ping: *"..playerPing.."*",
            ["footer"] = {
                ["text"] = name,
                ["icon_url"] = logo,
            },
        }
    }




-- Sending Embed To Discord Webhook --

PerformHttpRequest(webhook, function (err, text, headers) end, 'POST', json.encode({username = name, embeds = disconnecting}), { ['Content-Type'] = 'application/json' })
end)
print("Dit werkt peter")