--Classes/Objects/World/InteractiveWorld/flappybird.lua

module(..., package.seeall)

local scene = scene
local InteractiveWorldClass = require('kalacool.sango.Classes.Objects.World.InteractiveWorld')

--INSTANCE FUNCTIONS
function new(config)

    local flappybird = InteractiveWorldClass.new()
    flappybird.wave = config.wave
    flappybird.setImage(_World.InteractiveWorld.flappybird.ImagePath)
    local time = (config.xR - config.x )/_World.InteractiveWorld.flappybird.Velocity
    flappybird.image.damage = _World.InteractiveWorld.flappybird.Damage

    flappybird.show(config)
    physics.addBody( flappybird.image, _World.InteractiveWorld.flappybird.Physic.Type, _World.InteractiveWorld.flappybird.Physic.Option ) 
	flappybird.image:setLinearVelocity(_World.InteractiveWorld.flappybird.Velocity,0)

    function flappybird.stop()
    	flappybird.image:setLinearVelocity(0,0)
    end

    flappybird.timers[1] = timer.performWithDelay(time*1000, flappybird.stop)

    return flappybird
end