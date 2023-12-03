--- CONFIG ---
webhookURL = Config.webhookURL
prefix = Config.prefix
roleList = Config.roleList


--- CODE ---
function sendMsg(src, msg)
    TriggerClientEvent('chat:addMessage', src, {
        args = { prefix .. msg }
    })
end
function sendToDisc(title, message, footer, name)
    local embed = {}
    embed = {
        {
            ["color"] = 16711680, -- GREEN = 65280 --- RED = 16711680
            ["title"] = "**".. title .."**",
            ["description"] = "" .. message ..  "",
            ["footer"] = {
                ["text"] = footer,
            },
        }
    }
    -- Start
    PerformHttpRequest(webhookURL, 
    function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
  -- END
end


IsCop = {}
AddEventHandler('playerDropped', function (reason) 
  -- Clear their lists 
  local src = source;
  IsCop[src] = nil;
end)

RegisterNetEvent('Badger-911:CheckPerms')
AddEventHandler('Badger-911:CheckPerms', function()
    local src = source;
    for k, v in ipairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
            identifierDiscord = v
        end
    end
    -- TriggerClientEvent("FaxDisVeh:CheckPermission:Return", src, true, false)

if identifierDiscord then
    local roleIDs = exports.Badger_Discord_API:GetDiscordRoles(src)
    if not (roleIDs == false) then
        for i = 1, #roleList do
            for j = 1, #roleIDs do
                if exports.Badger_Discord_API:CheckEqual(roleList[i], roleIDs[j]) then
                    IsCop[tonumber(src)] = true;
                    print("[911]" .. GetPlayerName(src) .. " received Badger-911 permissions SUCCESS")
                end
            end
        end
    else
        print(GetPlayerName(src) .. " did not receive permissions because roles == false")
    end

elseif identifierDiscord == nil then
        print("identifierDiscord == nil")
    end
end)


-- Trackers
LocationTracker = {}
IdCounter = 0;

function mod(a, b)
    return a - (math.floor(a/b)*b)
end



RegisterCommand(Config.respondCommand, function(source, args, raw)
    if IsPlayerAceAllowed(source, Config.respAce) then
        if (#args > 0) then 
            if tonumber(args[1]) ~= nil then 
                if LocationTracker[tonumber(args[1])] ~= nil then 
                    local loc = LocationTracker[tonumber(args[1])]
                    TriggerClientEvent("Badger-911:SetWaypoint", source, loc[1], loc[2]);
                    sendMsg(source, "Your waypoint has been set to the situation!")
                else 
                    sendMsg(source, "^1 [ERROR] That is not a valid situation...")
                end
            else 
                sendMsg(source, "^1 [ERROR] That is not a valid number you supplied...")
            end
        end
    else
        sendMsg(source, "^1 [ERROR] You do not have permission to use this command.")
    end
end, false)


RegisterCommand(Config.emergencyCommand, function(source, args, raw)
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(source)));
    if (#args > 0) then 
        IdCounter = IdCounter + 1;
        LocationTracker[IdCounter] = {x, y};
        if mod(IdCounter, 12) == 0 then 
            local cout = IdCounter - 12;
            while cout < (IdCounter - 6) do 
                LocationTracker[cout] = nil;
                cout = cout + 1;
            end
            IdCounter = 1;
            LocationTracker[IdCounter] = {x, y};
        end
        sendMsg(source, "Your 911 call has been received! The authorities are on their way!");
        sendToDisc("[RESPONSE CODE: " .. IdCounter .. "] " ..
         "INCOMING TRANSMISSION:", table.concat(args, " "), "[" .. source .. "] " .. GetPlayerName(source))
        for _, id in ipairs(GetPlayers()) do 
            if IsCop[tonumber(id)] ~= nil and IsCop[tonumber(id)] == true then 
                sendMsg(id, "[^7Use ^2/resp " .. IdCounter .. "^7 to respond^3] " .. "^1INCOMING TRANSMISSION: ^3" .. table.concat(args, " "));
            end
        end
    end
end, false)
