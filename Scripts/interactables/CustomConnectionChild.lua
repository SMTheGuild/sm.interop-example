-- Load sm.interop
dofile '../init.lua'

CustomConnectionChild = class(nil)
CustomConnectionChild.connectionInput = sm.interop.connectionType
CustomConnectionChild.connectionOutput = sm.interactable.connectionType.logic
CustomConnectionChild.maxParentCount = 1
CustomConnectionChild.maxChildCount = 1
CustomConnectionChild.moddedConnectionInput = {
    "yourname/modname:custom-connection"
}


function CustomConnectionChild.server_onCreate(self)
    -- Register part to sm.interop (Important!)
    self.interop = sm.interop.connections.registerShape(mod, self)
end

function CustomConnectionChild.server_onFixedUpdate(self, dt)
    local parent = self.interop:getSingleParentByType('yourname/modname:custom-connection')
    if parent then
        self.network:sendToClients('cl_showTime', { time = parent:getValue() })
    end
end

function CustomConnectionChild.cl_showTime(self, params)
    sm.gui.displayAlertText('CustomConnectionParent active for ' .. math.floor(params.time) .. 's')
end
