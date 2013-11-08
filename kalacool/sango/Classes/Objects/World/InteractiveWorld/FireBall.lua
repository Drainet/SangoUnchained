--Classes/Objects/World/InteractiveWorld/FireBall.lua

module(..., package.seeall)

local scene = scene
InteractiveWorldClass = require('kalacool.sango.Classes.Objects.World.InteractiveWorld')

--INSTANCE FUNCTIONS
function new(config)

    local FireBall = InteractiveWorldClass.new()
    FireBall.setImage('kalacool/sango/image/world/interactiveWorld/fireBall.png')
    FireBall.show(config)
    FireBall.configX = config.x
    FireBall.configY = config.y
    FireBall.image.damage = "fatal"
    Shape = {-35,-1,-13,-10,14,-2,25,26,6,54,-24,54,-43,42,-49,22}
    physics.addBody( FireBall.image,  "kinematic", { density=10, friction=99, bounce=0, shape=Shape} )


    function FireBall.moving()

        FireBall.image:setLinearVelocity( -250, 500 ) --(X velocity, Y velocity)
        timer.performWithDelay(3000 + math.random(0, 3)*1000, FireBall.reset)

    end

    --math.random(70, 80)  ---> an integer between 70 and 80 (inclusive)
    function FireBall.reset()
       FireBall.show({x=FireBall.configX + math.random(-2, 2)*100, y=FireBall.configY}) 
       FireBall.moving()
    end

    FireBall.moving()

    return FireBall
end

