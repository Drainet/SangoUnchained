--Classes/Objects/World/StaticWorld/hor_floor.lua

module(..., package.seeall)

local scene = scene
StaticWorldClass = require('kalacool.sango.Classes.Objects.World.StaticWorld')

--INSTANCE FUNCTIONS
function new(config)

    local hor_floor = StaticWorldClass.new()
    hor_floor.setImage('kalacool/sango/image/world/staticWorld/hor_floor.png')
    hor_floor.image.damage = "safe"
    hor_floor.image.surface = "smooth"
    hor_floor.show(config)
    physics.addBody( hor_floor.image, "static", { density=1, friction=0.9, bounce=0} )

    return hor_floor
end