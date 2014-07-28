--Classes/Objects/World/InteractiveWorld/chasingTrap.lua

module(..., package.seeall)

local scene = scene
local InteractiveWorldClass = require('kalacool.sango.Classes.Objects.World.InteractiveWorld')

--INSTANCE FUNCTIONS
function new(config)

    local chasingTrap = InteractiveWorldClass.new()
    chasingTrap.wave = config.wave
    chasingTrap.setImage(_World.InteractiveWorld.chasingTrap.ImagePath)
    local time = (config.xR - config.x )/_World.InteractiveWorld.chasingTrap.Velocity
    chasingTrap.image.damage = _World.InteractiveWorld.chasingTrap.Damage

    chasingTrap.show(config)
    physics.addBody( chasingTrap.image, _World.InteractiveWorld.chasingTrap.Physic.Type, _World.InteractiveWorld.chasingTrap.Physic.Option ) 
	chasingTrap.image:setLinearVelocity(_World.InteractiveWorld.chasingTrap.Velocity,0)

    function chasingTrap.stop()
    	chasingTrap.image:setLinearVelocity(0,0)
    end

    chasingTrap.timers[1] = timer.performWithDelay(time*1000, chasingTrap.stop)

    return chasingTrap
end