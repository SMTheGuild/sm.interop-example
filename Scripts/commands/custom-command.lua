function myCustomCommand(arguments)
    sm.gui.chatMessage('Called my custom command with '.. #arguments ..' parameters:')
    for i,argument in ipairs(arguments) do
        sm.gui.chatMessage('##'.. i ..': '.. argument)
    end
end
