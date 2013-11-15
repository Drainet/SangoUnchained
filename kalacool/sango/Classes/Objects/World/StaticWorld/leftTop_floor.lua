--Classes/Objects/World/StaticWorld/leftTop_floor.lua

module(..., package.seeall)

local scene = scene
StaticWorldClass = require('kalacool.sango.Classes.Objects.World.StaticWorld')

--INSTANCE FUNCTIONS
function new(config)

    local leftTop_floor = StaticWorldClass.new()
    leftTop_floor.setImage('kalacool/sango/image/world/staticWorld/leftTop_floor.png')
    leftTop_floor.image.damage = "safe"
    leftTop_floor.image.surface = "smooth"
    leftTop_floor.show(config)
    --local Shape= { -250, -130, 250, 150, 260, 130, -240, -150 }
    local Shape= { -250, -130, -240, -150, 260, 130, 250, 150 }
    physics.addBody( leftTop_floor.image, "static", { density=1, friction=0, bounce=0, shape=Shape} )

    return leftTop_floor
end