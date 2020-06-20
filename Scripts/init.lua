local namespace = 'yourname/modname'
local name = 'Example mod'
local author = 'Your Name'
local uuid = '29776957-9e0e-4e5e-a9a0-dd1177967ca0'
local version = '1.0.0'
local partUuid = 'a2cd5dea-1559-48ed-99ec-b482d75af652'
local startupScripts = {
    { name = 'registrations', fileName = 'Scripts/registrations.lua', dependencies = {} }
}

-- Skip if the mod is already loaded
if MOD_REGISTERED then return end
MOD_REGISTERED = true

-- Run sm.interop initialization script
local ranInteropScript, err = pcall(dofile, '$CONTENT_e94ac99f-393e-4816-abe3-353435a1edf4/Scripts/init.lua')
if not ranInteropScript then
    if not sm.isServerMode() then
        sm.gui.displayAlertText('#ff0000Error: #ffffff' .. err)
    end
    error(err)
end

-- Register the mod with sm.interop, and register startup scripts
mod = sm.interop.mods.register(namespace, name, author, sm.uuid.new(uuid), version, sm.uuid.new(partUuid))
for _, startupScript in pairs(startupScripts) do
    sm.interop.startup.register(mod, startupScript.name, startupScript.fileName, startupScript.dependencies)
end
