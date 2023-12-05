Citizen.CreateThread(function()
	TriggerServerEvent('Badger-911:CheckPerms') -- nigga this is gonna kill performance
end)

RegisterNetEvent("Badger-911:SetWaypoint")
AddEventHandler("Badger-911:SetWaypoint", function(x, y)
	-- Set the waypoint for this player
	SetNewWaypoint(x, y)
	-- DEBUG: un comment the print statement below for debugging
	-- print(x, y) - remove this debug shit your ass
end)


Citizen.CreateThread(function()
	Citizen.Trace("\nAdding Chat Suggestions for Badger-911 \n")
	TriggerEvent('chat:addSuggestion', '/911', 'Make a 911 call', {{ name="Information", help="The Information for the 911 Call"}}) -- Add Config Here nigga
	TriggerEvent('chat:addSuggestion', '/resp', '[LEO ONLY] respond to the 911 call', {{ name="CallID", help="The Call ID to respond too"}}) -- This Shit  is ass
end)
