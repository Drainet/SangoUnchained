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

-------- Argument
    -- floorOriginX        = config.x
    -- floorOriginY        = config.y

    floorDirection      = config.floorDirection     -- left, right, up, down
    -- floorWattingTime    = config.floorWattingTime   -- ms
    -- floorMovment        = config.floorMovment       -- pixel
    -- floorDirection      = right
    -- floorWattingTime    = 3000
    -- floorMovment        = 200
--------
    FloatingFloor.count = 0
    maxCount = 200
    physics.addBody( FloatingFloor.image,  _World.InteractiveWorld.FloatingFloor.Physic.Type, _World.InteractiveWorld.FloatingFloor.Physic.Option )

    local move = 0
    function FloatingFloor:floatingFloorMoving(event)
        
        -- if(math.round(FloatingFloor.image.x) == floorOriginX )  then
        --     local function listener( event )
        --         FloatingFloor.image:setLinearVelocity(50,0)
        --     end
        --     FloatingFloor.image.x = FloatingFloor.image.x + 1
        --     FloatingFloor.image:setLinearVelocity(0,0)
        --     timer.performWithDelay( floorWattingTime, listener )
        -- elseif (math.round(FloatingFloor.image.x) == floorOriginX + floorMovment ) then
        --     local function listener( event )
        --         FloatingFloor.image:setLinearVelocity(-50,0)
        --     end
        --     FloatingFloor.image.x = FloatingFloor.image.x - 1
        --     FloatingFloor.image:setLinearVelocity(0,0)
        --     timer.performWithDelay( floorWattingTime, listener )
        -- end
        if(floorDirection == "right")then
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
    end

    function FloatingFloor:removeAllEvent(event)
        FloatingFloor.dispose()
    end

    function FloatingFloor.image:preCollision(event)
        local vx , vy = event.other:getLinearVelocity()
        if((event.otherElement~=1 or vy<0) and event.contact~=nil)then
            event.contact.isEnabled=false
        end
    end
    
    scene:addEventListener( 'floatingFloorMoving', FloatingFloor )
    --scene:addEventListener( 'removeAllEvent', FloatingFloor )
    FloatingFloor.image:addEventListener( "preCollision")

    FloatingFloor.listeners[1] = {event='floatingFloorMoving' , listener = FloatingFloor}
    --FloatingFloor.listeners[2] = {event='removeAllEvent' , listener = FloatingFloor}
    --FloatingFloor.listeners[3] = {event="preCollision", listener = FloatingFloor.image}

    return FloatingFloor
end

