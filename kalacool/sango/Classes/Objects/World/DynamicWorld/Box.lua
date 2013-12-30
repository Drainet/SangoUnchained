--Classes/Objects/World/StaticWorld/Box.lua

module(..., package.seeall)

local scene = scene
DynamicWorldClass = require('kalacool.sango.Classes.Objects.World.DynamicWorld')

--INSTANCE FUNCTIONS
function new(config)

    local Box = DynamicWorldClass.new()
    Box.setImage(_World.DynamicWorld.Box.ImagePath)
    Box.image.damage = _World.DynamicWorld.Box.Damage
    
    Box.image.surface = _World.DynamicWorld.Box.Surface
    Box.show(config)
    physics.addBody( Box.image, _World.DynamicWorld.Box.Physic.Type, _World.DynamicWorld.Box.Physic.Option )

    return Box
end