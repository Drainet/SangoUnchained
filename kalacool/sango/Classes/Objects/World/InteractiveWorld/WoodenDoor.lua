--Classes/Objects/World/InteractiveWorld/WoodenDoor.lua

module(..., package.seeall)

local scene = scene
InteractiveWorldClass = require('kalacool.sango.Classes.Objects.World.InteractiveWorld')

--INSTANCE FUNCTIONS
function new(config)

    local WoodenDoor = InteractiveWorldClass.new()
    WoodenDoor.setImage('kalacool/sango/image/world/interactiveWorld/woodenDoor.png')
    WoodenDoor.image.damage = "safe"
    WoodenDoor.image.surface = "rough"
    WoodenDoor.show(config)
    physics.addBody( WoodenDoor.image,  "kinematic", { density=1, friction=0.3, bounce=0} )

    return WoodenDoor
end