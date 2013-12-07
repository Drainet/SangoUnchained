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
    local Shape = {-35,-1,-13,-10,14,-2,25,26,6,54,-24,54,-43,42,-49,22}
    local Filter = { categoryBits = 1, maskBits = 2 }
    physics.addBody( FireBall.image,  "kinematic", { density=10, friction=99, bounce=0, shape=Shape, filter = Fiter} )
    FireBall.image:setLinearVelocity( -250, 500 ) --(X velocity, Y velocity)


    function FireBall.moving()
       FireBall.timers[1] = timer.performWithDelay(2000 + math.random(0, 3)*500, FireBall.reset)
    end

    --math.random(70, 80)  ---> an integer between 70 and 80 (inclusive)
    function FireBall.reset()
       FireBall.show({x=FireBall.configX + math.random(-2, 2)*100, y=FireBall.configY}) 
       FireBall.moving()
    end

    FireBall.moving()

    return FireBall
end

