--Classes/Objects/World/StaticWorld/par_floor.lua

module(..., package.seeall)

local scene = scene
StaticWorldClass = require('kalacool.sango.Classes.Objects.World.StaticWorld')

--INSTANCE FUNCTIONS
function new(config)

    local par_floor = StaticWorldClass.new()
    par_floor.setImage('kalacool/sango/image/world/staticWorld/par_floor.png')
    par_floor.image.surface = "rough"
    par_floor.show(config)
    physics.addBody( par_floor.image, "static", { density=1, friction=0.2, bounce=0} )

    return par_floor
end