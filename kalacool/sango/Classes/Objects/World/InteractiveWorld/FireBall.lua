--Classes/Objects/World/InteractiveWorld/FireBall.lua

module(..., package.seeall)

local scene = scene
InteractiveWorldClass = require('kalacool.sango.Classes.Objects.World.InteractiveWorld')

--INSTANCE FUNCTIONS
function new(config)

    local FireBall = InteractiveWorldClass.new()
    FireBall.setImage(_World.InteractiveWorld.FireBall.ImagePath)
    FireBall.show(config)
    FireBall.configX = config.x
    FireBall.configY = config.y
    FireBall.image.damage = _World.InteractiveWorld.FireBall.Damage
    physics.addBody( FireBall.image,  _World.InteractiveWorld.FireBall.Physic.Type, _World.InteractiveWorld.FireBall.Physic.Option)
    FireBall.image:setLinearVelocity( _World.InteractiveWorld.FireBall.Velocity.Vx, _World.InteractiveWorld.FireBall.Velocity.Vy ) --(X velocity, Y velocity)


    function FireBall.moving()
       FireBall.timers[1] = timer.performWithDelay(math.random(_World.InteractiveWorld.FireBall.RespawnTimeBegin, _World.InteractiveWorld.FireBall.RespawnTimeEnd)*1000, FireBall.reset)
    end

    --math.random(70, 80)  ---> an integer between 70 and 80 (inclusive)
    function FireBall.reset()
       FireBall.show({x=FireBall.configX + math.random(-2, 2)*100, y=FireBall.configY}) 
       FireBall.moving()
    end

    FireBall.moving()

    return FireBall
end

