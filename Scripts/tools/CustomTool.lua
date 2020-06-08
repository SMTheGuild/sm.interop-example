dofile "$GAME_DATA/Scripts/game/AnimationUtil.lua"

CustomTool = sm.interop.tools.createClass(nil)

-- Load tool renderables
local renderablesTp = {"$SURVIVAL_DATA/Character/Char_Male/Animations/char_male_tp_bucket.rend", "$SURVIVAL_DATA/Character/Char_bucket/char_bucket_tp_animlist.rend"}
local renderablesFp = {"$SURVIVAL_DATA/Character/Char_Male/Animations/char_male_fp_bucket.rend", "$SURVIVAL_DATA/Character/Char_bucket/char_bucket_fp_animlist.rend"}
sm.tool.preloadRenderables( renderablesTp )
sm.tool.preloadRenderables( renderablesFp )

function CustomTool.client_onCreate(self)
    self:loadAnimations()
end

function CustomTool.loadAnimations( self )
	self.tpAnimations = createTpAnimations(
		self.tool,
		{
			idle = { "bucket_idle", { looping = true } },
		}
	)
	setTpAnimation( self.tpAnimations, "idle", 5.0 )

	if self.tool:isLocal() then
		self.fpAnimations = createFpAnimations(
			self.tool,
			{
				idle = { "bucket_idle", { looping = true } },
			}
		)
        setFpAnimation( self.fpAnimations, "idle", 0.25 )
	end
end

function CustomTool.client_onEquippedUpdate(self, primaryState, secondaryState, forceBuild)
    if primaryState == sm.tool.interactState.start then
        sm.gui.chatMessage('You left-clicked using your custom tool')
    end
    return true, false
end

function CustomTool.client_onUpdate(self)
end

function CustomTool.client_onEquip(self)
    self.tool:setTpRenderables( renderablesTp )
    self.tool:setFpRenderables( renderablesFp )
end

function CustomTool.client_onUnequip(self)
end
