--Classes/Objects/World/StaticWorld/leftTop_floor.lua

module(..., package.seeall)

local scene = scene
StaticWorldClass = require('kalacool.sango.Classes.Objects.World.StaticWorld')

--INSTANCE FUNCTIONS
function new(config)

    local leftTop_floor = StaticWorldClass.new()
    leftTop_floor.setImage(_World.StaticWorld.leftTop_floor.ImagePath)
    leftTop_floor.image.damage = _World.StaticWorld.leftTop_floor.Damage
    leftTop_floor.show(config)
    physics.addBody( leftTop_floor.image, _World.StaticWorld.leftTop_floor.Physic.Type, _World.StaticWorld.leftTop_floor.Physic.Option )

    return leftTop_floor
end