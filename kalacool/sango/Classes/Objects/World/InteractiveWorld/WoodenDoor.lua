--Classes/Objects/World/InteractiveWorld/WoodenDoor.lua

module(..., package.seeall)

local scene = scene
InteractiveWorldClass = require('kalacool.sango.Classes.Objects.World.InteractiveWorld')

--INSTANCE FUNCTIONS
function new(config)

    local WoodenDoor = InteractiveWorldClass.new()
    WoodenDoor.setImage(_World.InteractiveWorld.WoodenDoor.ImagePath)
    WoodenDoor.image.damage = _World.InteractiveWorld.WoodenDoor.Damage
    WoodenDoor.show(config)
    physics.addBody( WoodenDoor.image,  _World.InteractiveWorld.WoodenDoor.Physic.Type, _World.InteractiveWorld.WoodenDoor.Physic.Option )

    function WoodenDoor:removeAllEvent(event)
        WoodenDoor.dispose()
    end

    function WoodenDoor.preCollision(self, event)
        if ( event.other.type == "player" ) then
            -- scene:dispatchEvent({name='removePauseButton'})
            scene:dispatchEvent({name='levelComplete'})
            display.getCurrentStage():setFocus( nil )
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