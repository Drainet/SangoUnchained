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
    FireBall.image.type = "fatal"
    Shape = {-103,51,-60,32,-21,45,0,88,-25,134,-69,142,-102,120,-115,88}
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

