--Classes/Objects/World/StaticWorld/pipeUp.lua
module(..., package.seeall)

local scene = scene
local StaticWorldClass = require('kalacool.sango.Classes.Objects.World.StaticWorld')


--INSTANCE FUNCTIONS
function new(config)

    local pipeUp = StaticWorldClass.new()
    pipeUp.setImage(_World.StaticWorld.pipeUp.ImagePath)
    pipeUp.image.damage = _World.StaticWorld.pipeUp.Damage

    pipeUp.show(config)
    physics.addBody( pipeUp.image, _World.StaticWorld.pipeUp.Physic.Type, _World.StaticWorld.pipeUp.Physic.Option )
    
    return pipeUp
end