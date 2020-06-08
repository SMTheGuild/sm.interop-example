local mod = sm.interop.startup.getCurrentMod()
if not mod then return end

-- Register custom connection types
sm.interop.connections.register(mod, 'custom-connection')

-- Register custom tools
sm.interop.tools.register(mod, 'custom-tool', 'Scripts/tools/CustomTool.lua', 'CustomTool')
-- sm.interop.tools.register(mod, 'custom-tool', 'Scripts/tools/AnimatedTool.lua', 'AnimatedTool') -- Example on how to use animations taken from Survival Bucket

-- Attach a tool script to a tool part (uuid, ShapeSets/tools.json). This way, multiple tool parts can have the same tool scripts
sm.interop.tools.attach('yourname/modname:custom-tool', sm.uuid.new('532a91b1-57cd-4458-b086-504d1a4b0beb'))

-- Load custom command functions
dofile 'commands/custom-command.lua'

-- Register custom commands, callable using /mod <command-name>
sm.interop.commands.register(mod, 'custom-command', myCustomCommand)
