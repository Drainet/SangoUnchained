--Classes/Objects/World/StaticWorld/Box.lua

module(..., package.seeall)

local scene = scene
DynamicWorldClass = require('kalacool.sango.Classes.Objects.World.DynamicWorld')

--INSTANCE FUNCTIONS
function new(config)

    local Box = DynamicWorldClass.new()
    Box.setImage('kalacool/sango/image/world/dynamicWorld/box.png')
    Box.image.damage = "safe"
    Box.image.surface = "smooth"
    Box.show(config)
    physics.addBody( Box.image, "dynamic", { density=5, friction=0.6, bounce=0.1 } )

    return Box
end