module(..., package.seeall)


ObjectClass =  require('kalacool.sango.Classes.Object')
function new(config)
	local DisappearFloor = ObjectClass.new()
	local scene = scene

	--- set Attribute of disappearFloor
	DisappearFloor.image = display.newGroup( )
	DisappearFloor.Filter = { categoryBits = 16 , maskBits = 11} 
	DisappearFloor.remainTime = 2000
	DisappearFloor.isActive = false
	--- set disappearFloor's image
	local sheet = graphics.newImageSheet( "kalacool/sango/image/Mechanism/disappearFloor.png", { width=265, height=40, numFrames=10 } )
    local sequenceData = {
        { name="fadeAway", start=1, count=10, time= DisappearFloor.remainTime, loopCount=1 },
    }
    local body =  display.newSprite( sheet , sequenceData )

    DisappearFloor.body = body
    DisappearFloor.body:setSequence( "fadeAway")

	DisappearFloor.body.x = DisappearFloor.image.x
	DisappearFloor.body.y = DisappearFloor.image.y
	DisappearFloor.image.x = config.x
	DisappearFloor.image.y =  config.y
	DisappearFloor.image.surface = "rough"
	DisappearFloor.image.damage = "safe"
	DisappearFloor.image:insert(DisappearFloor.body)

	physics.addBody( DisappearFloor.image ,"static" , {Filter=DisappearFloor.Filter} )
	DisappearFloor.image.isSensor = true

	function DisappearFloor.active()
		DisappearFloor.body:setSequence( "fadeAway")
		DisappearFloor.show(config)
		DisappearFloor.isActive = false
	end
	function DisappearFloor.clear()
		DisappearFloor.hide()
		DisappearFloor.image.isSensor = true	
		dog.image.isAwake = true
		DisappearFloor.timerID = timer.performWithDelay( 1500 , DisappearFloor.active)
	end
	function DisappearFloor.image:collision(event)
		if( (DisappearFloor.image.y > event.other.y+40) and ( DisappearFloor.image.isSensor ~= false )  and  (DisappearFloor.isActive ~= true)) then
			if ( event.phase == "began") then
				DisappearFloor.isActive = true
				DisappearFloor.image.isSensor = false
				DisappearFloor.body:play()
				DisappearFloor.timerID = timer.performWithDelay( DisappearFloor.remainTime , DisappearFloor.clear )
			end
		end
	end

	function DisappearFloor:removeAllEvent()
		if(DisappearFloor.timerID ~= nil) then
			timer.cancel( DisappearFloor.timerID )
		end
		DisappearFloor.dispose()
	end

 	DisappearFloor.image:addEventListener( "collision" )
	scene:addEventListener( 'removeAllEvent', DisappearFloor)
	DisappearFloor.listeners[1] = {event='removeAllEvent', listener = DisappearFloor}
	DisappearFloor.listeners[2] = {event="collision", listener = DisappearFloor}
	return DisappearFloor
end