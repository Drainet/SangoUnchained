--Classes/Objects/World/InteractiveWorld/WoodenDoor.lua

module(..., package.seeall)

local scene = scene
InteractiveWorldClass = require('kalacool.sango.Classes.Objects.World.InteractiveWorld')

--INSTANCE FUNCTIONS
function new(config)

    local WoodenDoor = InteractiveWorldClass.new()
    WoodenDoor.setImage('kalacool/sango/image/world/interactiveWorld/woodenDoor.png')
    WoodenDoor.image.damage = "safe"
    WoodenDoor.image.surface = "rough"
    WoodenDoor.show(config)
    physics.addBody( WoodenDoor.image,  "kinematic", { density=1, friction=0.3, bounce=0} )

    function WoodenDoor:removeAllEvent(event)
        WoodenDoor.dispose()
        print("wdddddd")
    end

    function WoodenDoor.preCollision(self, event)
        if ( event.other.type == "player" ) then
            -- scene:dispatchEvent({name='removePauseButton'})
            scene:dispatchEvent({name='levelComplete'})

            local completeClass = require "kalacool.sango.HUD.YouComplete"
    		local complete = completeClass.new()
 			WoodenDoor.image:removeEventListener( "preCollision", WoodenDoor)
        end
	end
 	
 	WoodenDoor.image:addEventListener( "preCollision", WoodenDoor)
 	WoodenDoor.listeners[1] = {event='removeAllEvent' , listener = WoodenDoor}

 	WoodenDoor[1] = {event="preCollision" , listener = WoodenDoor}
    WoodenDoor[2] = {event='removeAllEvent' , listener = WoodenDoor}

    return WoodenDoor
end