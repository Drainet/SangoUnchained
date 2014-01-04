--Classes/Objects/World/StaticWorld/Thorn.lua



module(..., package.seeall)

local scene = scene
local StaticWorldClass = require('kalacool.sango.Classes.Objects.World.StaticWorld')


--INSTANCE FUNCTIONS
function new(config)
	local checkDoor = StaticWorldClass.new()

	local sheet = graphics.newImageSheet( _World.StaticWorld.checkDoor.ImagePath, _World.StaticWorld.checkDoor.ImageSheet )
	
	local sequenceData = {
 
		{ name="uncheck",frames= {1}, time=300 , loopDirection = "bounce" },
		{ name="check",frames= {2}, time=300 , loopDirection = "bounce"},
		{ name="portal", frames={ 3, 4, 3, 4, 3, 4,3, 4, 2}, time=1000 ,loopCount = 1}
 
	}

	
	
	local image = display.newSprite( sheet, sequenceData )
	checkDoor.image = image
	checkDoor.image.damage = _World.StaticWorld.checkDoor.Damage
   

    checkDoor.show(config)
    local Shape1 = { -70,-100, 0,-125, 70,-100,  90,100, -90,100 }
    local Shape2 = {-80,100,80,100,90,120,-90,120}
    physics.addBody( checkDoor.image, _World.StaticWorld.checkDoor.Physic.Type, {  shape = Shape1 , isSensor =true,filter =  { categoryBits = 8, maskBits = 2 }}
    	,{density=1, friction=1, bounce=0,shape = Shape2})

    function checkDoor.image:collision(event )

			---³æ°å¨ç‰©é«”è¡¨---
		if ( event.phase == "began" ) then
			---³æ°å¨ç‰©é«”è¡¨---
			if(event.other.type=="player" and checkDoor.image.sequence ~= "portal") then

				scene:dispatchEvent( {name='onDoorCheck'} )

				if(checkDoor.image.sequence == "uncheck" )then
					checkDoor.image:setSequence( "check" )
					checkDoor.image:play()
				end
				event.other.lastCheckPoint = { x=self.x ,y=self.y }
				--timer.resume( Player.Magazine.reloadTimer )
			end
			


		end			
	

    end

    function checkDoor:onDoorCheck(event)
    	checkDoor.image:setSequence( "uncheck" )
		checkDoor.image:play()
    	
    end

    function checkDoor:playerRespawn(event)
    	
    	if(checkDoor.image.sequence ~= "uncheck")then
			checkDoor.image:setSequence( "portal" )
			checkDoor.image:play()
		end
		
    end

    function checkDoor:removeAllEvent(event)
        checkDoor.dispose()
        
    end

    scene:addEventListener( 'onDoorCheck', checkDoor)
    scene:addEventListener( 'playerRespawn', checkDoor)
    scene:addEventListener( 'removeAllEvent', checkDoor )

    checkDoor.listeners[1] = {event='onDoorCheck' , listener = checkDoor}
    checkDoor.listeners[2] = {event='playerRespawn' , listener = checkDoor}
    checkDoor.listeners[3] = {event='removeAllEvent' , listener = checkDoor}

    checkDoor.image:addEventListener( "collision")

    -- physics.setDrawMode( "hybrid" )
    return checkDoor
end