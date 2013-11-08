--Classes/Objects/World/InteractiveWorld/SpinningCog.lua

module(..., package.seeall)

local scene = scene
InteractiveWorldClass = require('kalacool.sango.Classes.Objects.World.InteractiveWorld')

--INSTANCE FUNCTIONS
function new(config)

    local SpinningCog = InteractiveWorldClass.new()
    SpinningCog.setImage('kalacool/sango/image/world/interactiveWorld/spinningCog.png')
    SpinningCog.show(config)
    SpinningCog.image.damage = "safe"
    SpinningCog.image.surface = "smooth"
    physics.addBody( SpinningCog.image,  "kinematic", { density=1, friction=0.3, bounce=0, radius = 220} )
    SpinningCog.image.angularVelocity = 2000

    return SpinningCog
end
