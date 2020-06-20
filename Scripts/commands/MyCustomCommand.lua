MyCustomCommand = class()

function MyCustomCommand.client_onCall(self, arguments)
    sm.gui.chatMessage('Called my custom command with '.. #arguments ..' parameters:')
    for i,argument in ipairs(arguments) do
        sm.gui.chatMessage('##'.. i ..': '.. argument)
    end

    self.network:sendToServer('server_generateRandomNumber', {
        player = sm.localPlayer.getPlayer(),
        min = 10,
        max = 20
    })
end

function MyCustomCommand.server_generateRandomNumber(self, params)
    self.network:sendToClient(params.player, 'client_sendRandomNumber', {
        number = math.random(params.min, params.max)
    })
end

function MyCustomCommand.client_sendRandomNumber(self, params)
    sm.gui.chatMessage('Random number: '.. params.number)
end
