--Classes/Objects/World/InteractiveWorld/SpinningTire.lua

module(..., package.seeall)

local scene = scene
InteractiveWorldClass = require('kalacool.sango.Classes.Objects.World.InteractiveWorld')

--INSTANCE FUNCTIONS
function new(config)

    local SpinningTire = InteractiveWorldClass.new()
    SpinningTire.setImage(_World.InteractiveWorld.SpinningTire.ImagePath)
    SpinningTire.show(config)
    SpinningTire.image.damage = _World.InteractiveWorld.SpinningTire.Damage
    _World.InteractiveWorld.SpinningTire.Physic.Option.radius = SpinningTire.image.width/2
    physics.addBody( SpinningTire.image,  _World.InteractiveWorld.SpinningTire.Physic.Type, _World.InteractiveWorld.SpinningTire.Physic.Option )
    SpinningTire.image.angularVelocity = _World.InteractiveWorld.SpinningTire.AngularVelocity
    
    return SpinningTire
end
