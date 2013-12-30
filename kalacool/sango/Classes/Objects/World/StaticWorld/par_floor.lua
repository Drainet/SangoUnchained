--Classes/Objects/World/StaticWorld/par_floor.lua

module(..., package.seeall)

local scene = scene
StaticWorldClass = require('kalacool.sango.Classes.Objects.World.StaticWorld')

--INSTANCE FUNCTIONS
function new(config)

    local par_floor = StaticWorldClass.new()
    par_floor.setImage(_World.StaticWorld.par_floor.ImagePath)
    par_floor.image.damage = _World.StaticWorld.par_floor.Damage
    par_floor.show(config)
    physics.addBody( par_floor.image, _World.StaticWorld.par_floor.Physic.Type, _World.StaticWorld.par_floor.Physic.Option )

    return par_floor
end