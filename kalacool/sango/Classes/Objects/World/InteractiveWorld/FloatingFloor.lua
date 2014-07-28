--Classes/Objects/World/InteractiveWorld/FloatingFloor.lua

module(..., package.seeall)

local scene = scene
local InteractiveWorldClass = require('kalacool.sango.Classes.Objects.World.InteractiveWorld')

--INSTANCE FUNCTIONS
function new(config)

    local FloatingFloor = InteractiveWorldClass.new()
    local speed
    local maxCount
    FloatingFloor.setImage(_World.InteractiveWorld.FloatingFloor.ImagePath)
    FloatingFloor.image.damage = _World.InteractiveWorld.FloatingFloor.Damage
    FloatingFloor.show(config)
    physics.addBody( FloatingFloor.image,  _World.InteractiveWorld.FloatingFloor.Physic.Type, _World.InteractiveWorld.FloatingFloor.Physic.Option )
    FloatingFloor.count=0
    if (config.speed == nil) then
        speed = _World.InteractiveWorld.FloatingFloor.Speed
    else
        speed = config.speed
    end
    if (config.maxCount==nil) then
        maxCount = 100
    else
        maxCount = config.maxCount
    end
    if (config.goUp == 1) then
        speed = -speed
    end
    function FloatingFloor:floatingFloorMoving(event)
        if( FloatingFloor.count == maxCount) then
            FloatingFloor.count = 0 
        end
        FloatingFloor.count = FloatingFloor.count + 1   
        if FloatingFloor.count == 1 then
            FloatingFloor.image:setLinearVelocity(0,speed)
        elseif FloatingFloor.count == maxCount/2 + 1 then
            FloatingFloor.image:setLinearVelocity(0,-speed)
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

