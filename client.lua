Citizen.CreateThread(function()
	TriggerServerEvent('Badger-911:CheckPerms')
end)

RegisterNetEvent("Badger-911:SetWaypoint")
AddEventHandler("Badger-911:SetWaypoint", function(x, y)
	-- Set the waypoint for this player
	SetNewWaypoint(x, y)
	-- DEBUG: un comment the print statement below for debugging
	-- print(x, y)
end)


Citizen.CreateThread(function()
	Citizen.Trace("\nAdding Chat Suggestions for Badger-911 \n")
	TriggerEvent('chat:addSuggestion', '/911', '[STAFF ONLY] Announcement to Server', {{ name="Information", help="The Information for the 911 Call"}})
	TriggerEvent('chat:addSuggestion', '/resp', '[LEO ONLY] respond to the 911 call', {{ name="CallID", help="The Call ID to respond too"}})
end)