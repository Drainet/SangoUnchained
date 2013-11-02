--Classes/Objects/World/StaticWorld/Thorn.lua



module(..., package.seeall)

local scene = scene
StaticWorldClass = require('kalacool.sango.Classes.Objects.World.StaticWorld')


--INSTANCE FUNCTIONS
function new(config)

    local Thorn = StaticWorldClass.new()
    Thorn.setImage('kalacool/sango/image/World/staticWorld/thorn.png')
    Thorn.image.type="fatal"
    Thorn.show(config)
    physics.removeBody(Thorn.image)
    physics.addBody( Thorn.image, "static", { density=1, friction=0.3, bounce=0} )


    return Thorn
end