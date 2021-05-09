--[[
    Do not edit the code below, unless you know what you're doing.
]]--

local prefix, suffix = MessageAnnouncer.Prefix, MessageAnnouncer.Suffix
local delay = MessageAnnouncer.Delay * 60 * 1000 -- Minutes, to seconds, to milliseconds.
local messages, currentMessage, totalMessages = MessageAnnouncer.Messages, 1, #MessageAnnouncer.Messages
local resetChatColor = "^7^r"

Citizen.CreateThread( function()
    while true do
        Wait( delay )

        TriggerClientEvent( "chat:addMessage", -1, {
            color = { 255, 255, 255 },
            multiline = true,
            args = { prefix, resetChatColor .. messages[ currentMessage ] .. resetChatColor .. suffix }
        } )

        currentMessage = currentMessage + 1

        if ( currentMessage > totalMessages ) then currentMessage = 1 end
    end
end )

print( "^1MessageAnnouncer ^7| Successfully started." )