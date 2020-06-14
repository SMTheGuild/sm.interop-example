CustomTool = sm.interop.tools.createClass('CustomTool', nil)

function CustomTool.client_onCreate(self)
end

function CustomTool.client_onEquippedUpdate(self, primaryState, secondaryState, forceBuild)
    if primaryState == sm.tool.interactState.start then
        sm.gui.chatMessage('You left-clicked using your custom tool')
    end
    return true, false
end

function CustomTool.client_onEquip(self)
end

function CustomTool.client_onUnequip(self)
end
