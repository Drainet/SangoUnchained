--Classes/Objects/World/InteractiveWorld/SpinningTire.lua

module(..., package.seeall)

local scene = scene
InteractiveWorldClass = require('kalacool.sango.Classes.Objects.World.InteractiveWorld')

--INSTANCE FUNCTIONS
function new(config)

    local SpinningTire = InteractiveWorldClass.new()
    SpinningTire.setImage('kalacool/sango/image/world/interactiveWorld/tire.png')
    SpinningTire.show(config)
    SpinningTire.image.damage = "safe"
    SpinningTire.image.surface = "smooth"
    physics.addBody( SpinningTire.image,  "kinematic", { density=0.1, friction=0.9, bounce=0, radius = 220} )
    SpinningTire.image.angularVelocity = 60

    return SpinningTire
end
