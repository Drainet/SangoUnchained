--Classes/Objects/World/StaticWorld/Thorn.lua



module(..., package.seeall)

local scene = scene
local StaticWorldClass = require('kalacool.sango.Classes.Objects.World.StaticWorld')


--INSTANCE FUNCTIONS
function new(config)

    local Thorn = StaticWorldClass.new()
    Thorn.setImage('kalacool/sango/image/world/staticWorld/thorn.png')
    Thorn.image.damage = "fatal"

    Thorn.show(config)
    Shape = {-47,61,-39,-61,37,-66,47,65}
    physics.addBody( Thorn.image, "static", { density=1, friction=0.3, bounce=0, shape = Shape} )


    return Thorn
end