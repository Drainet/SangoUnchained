--Classes/Objects/World/StaticWorld/hor_floor.lua

module(..., package.seeall)

local scene = scene
StaticWorldClass = require('kalacool.sango.Classes.Objects.World.StaticWorld')

--INSTANCE FUNCTIONS
function new(config)

    local hor_floor = StaticWorldClass.new()
    hor_floor.setImage(_World.StaticWorld.M_hor_floor.ImagePath)
    hor_floor.image.damage = _World.StaticWorld.M_hor_floor.Damage
    hor_floor.show(config)
    physics.addBody( hor_floor.image, _World.StaticWorld.M_hor_floor.Physic.Type, _World.StaticWorld.M_hor_floor.Physic.Option )

    return hor_floor
end