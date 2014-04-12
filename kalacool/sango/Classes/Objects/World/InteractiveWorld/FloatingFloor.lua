--Classes/Objects/World/InteractiveWorld/FloatingFloor.lua

module(..., package.seeall)

local scene = scene
local InteractiveWorldClass = require('kalacool.sango.Classes.Objects.World.InteractiveWorld')

--INSTANCE FUNCTIONS
function new(config)

    local FloatingFloor = InteractiveWorldClass.new()
    FloatingFloor.setImage(_World.InteractiveWorld.FloatingFloor.ImagePath)
    FloatingFloor.image.width = _World.InteractiveWorld.FloatingFloor.Width
    FloatingFloor.image.height = _World.InteractiveWorld.FloatingFloor.Height
    FloatingFloor.image.damage = _World.InteractiveWorld.FloatingFloor.Damage
    FloatingFloor.show(config)
    physics.addBody( FloatingFloor.image,  _World.InteractiveWorld.FloatingFloor.Physic.Type, _World.InteractiveWorld.FloatingFloor.Physic.Option )
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
        FloatingFloor.dispose()
    end

    function FloatingFloor.image:preCollision(event)

        local vx , vy = event.other:getLinearVelocity()
        
        -- if(vy<0)then
            
            -- event.contact.isEnabled=false
        -- end

        if((event.otherElement~=1 or vy<0) and event.contact~=nil)then
            
            event.contact.isEnabled=false
        end

       
    end
    
    scene:addEventListener( 'floatingFloorMoving', FloatingFloor )
    --scene:addEventListener( 'removeAllEvent', FloatingFloor )
    -- FloatingFloor.image:addEventListener( "preCollision")

    FloatingFloor.listeners[1] = {event='floatingFloorMoving' , listener = FloatingFloor}
    --FloatingFloor.listeners[2] = {event='removeAllEvent' , listener = FloatingFloor}
    --FloatingFloor.listeners[3] = {event="preCollision", listener = FloatingFloor.image}

    return FloatingFloor
end

