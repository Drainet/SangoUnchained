--Classes/Objects/World/InteractiveWorld/FloatingFloor.lua

module(..., package.seeall)

local scene = scene
local InteractiveWorldClass = require('kalacool.sango.Classes.Objects.World.InteractiveWorld')

--INSTANCE FUNCTIONS
function new(config)

    local FloatingFloor = InteractiveWorldClass.new()
    FloatingFloor.setImage('kalacool/sango/image/world/interactiveWorld/floatingFloor.png')
    FloatingFloor.image.width = 240
    FloatingFloor.image.height = 20
    FloatingFloor.image.damage = "safe"
    FloatingFloor.image.surface = "rough"
    FloatingFloor.show(config)
    physics.addBody( FloatingFloor.image,  "kinematic", { density=10, friction=99, bounce=0} )
    FloatingFloor.count=0

    local maxCount = 100
    function FloatingFloor:floatingFloorMoving(event)
    if( FloatingFloor.count == maxCount) then
        FloatingFloor.count = 0 
    end

    FloatingFloor.count = FloatingFloor.count + 1   
        if FloatingFloor.count == 1 then
            FloatingFloor.image:setLinearVelocity(200,0)
        elseif FloatingFloor.count == maxCount/2 + 1 then
            FloatingFloor.image:setLinearVelocity(-200,0)
        end
    end

    function FloatingFloor:removeAllEvent(event)
        scene:removeEventListener( 'floatingFloorMoving', FloatingFloor )
        scene:removeEventListener( 'removeAllEvent', FloatingFloor )
    end
    
    scene:addEventListener( 'floatingFloorMoving', FloatingFloor )
    scene:addEventListener( 'removeAllEvent', FloatingFloor )

    return FloatingFloor
end

