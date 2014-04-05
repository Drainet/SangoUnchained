--Classes/Objects/World/StaticWorld/pipeDown.lua
module(..., package.seeall)

local scene = scene
local StaticWorldClass = require('kalacool.sango.Classes.Objects.World.StaticWorld')


--INSTANCE FUNCTIONS
function new(config)

    local pipeDown = StaticWorldClass.new()
    pipeDown.setImage(_World.StaticWorld.pipeDown.ImagePath)
    pipeDown.image.damage = _World.StaticWorld.pipeDown.Damage

    pipeDown.show(config)
    physics.addBody( pipeDown.image, _World.StaticWorld.pipeDown.Physic.Type, _World.StaticWorld.pipeDown.Physic.Option )
    
    return pipeDown
end