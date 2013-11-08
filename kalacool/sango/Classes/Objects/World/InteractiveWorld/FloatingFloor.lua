--Classes/Objects/World/InteractiveWorld/FloatingFloor.lua

module(..., package.seeall)

local scene = scene
InteractiveWorldClass = require('kalacool.sango.Classes.Objects.World.InteractiveWorld')

--INSTANCE FUNCTIONS
function new(config)

    local FloatingFloor = InteractiveWorldClass.new()
    FloatingFloor.setImage('kalacool/sango/image/world/interactiveWorld/floor.png')
    FloatingFloor.image.width = 300
    FloatingFloor.image.height = 40
    FloatingFloor.type = "safe"
    FloatingFloor.show(config)
    physics.addBody( FloatingFloor.image,  "kinematic", { density=10, friction=99, bounce=0} )
    FloatingFloor.count=0


    function moving()

        FloatingFloor.count = FloatingFloor.count +1
        if FloatingFloor.count % 2 ==1 then
            FloatingFloor.image:setLinearVelocity(200,0)
            timer.performWithDelay(2000 , moving,1)
        else
            FloatingFloor.image:setLinearVelocity(-200,0)
            timer.performWithDelay(2000 , moving,1)
        end

    end

    moving()

    return FloatingFloor
end

