-- Load sm.interop
dofile '../init.lua'

local simpleInterface = sm.interop.connections.simpleInterface

CustomConnectionParent = class(nil)
CustomConnectionParent.connectionInput = sm.interactable.connectionType.logic
CustomConnectionParent.connectionOutput = sm.interop.connectionType
CustomConnectionParent.maxParentCount = 1
CustomConnectionParent.maxChildCount = 1
CustomConnectionParent.moddedConnectionOutput = {
    ["yourname/modname:custom-connection"] = simpleInterface({
        getValue = 'sv_getValue'
    })
}

function CustomConnectionParent.server_onCreate(self)
    -- Register part to sm.interop (Important!)
    self.interop = sm.interop.connections.registerShape(mod, self)
    self.time = 0
end

function CustomConnectionParent.server_onFixedUpdate(self, dt)
    local parent = self.interactable:getSingleParent()
    if parent then
        if parent:isActive() then
            self.time = self.time + dt
        else
            self.time = 0
        end
    else
        self.time = 0
    end
end

function CustomConnectionParent.sv_getValue(self)
    return self.time
end
