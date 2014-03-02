module(..., package.seeall)


ObjectClass =  require('kalacool.sango.Classes.Object')
function new(config)
	local Dirt = ObjectClass.new()
	local scene = scene

	--- set Attribute of Dirt
	Dirt.image = display.newGroup( )
	Dirt.Filter = { categoryBits = 1} 
	
	Dirt.MaxHP = 8
	Dirt.HP = Dirt.MaxHP 
	Dirt.alive = true
	--- set Dirt's image
	local sheet = graphics.newImageSheet( "kalacool/sango/image/Mechanism/dirt.png", { width=60, height=60, numFrames=8} )
    local sequenceData = {
    	{ name="start", start=1, count=1, time= Dirt.remainTime, loopCount=1 },
        { name="break1", start=2, count=1, time= Dirt.remainTime, loopCount=1 },
        { name="break2", start=3, count=1, time= Dirt.remainTime, loopCount=1 },
        { name="break3", start=4, count=1, time= Dirt.remainTime, loopCount=1 },
        { name="explode", start=5, count=3, time=400 , loopCount=1}
    }
    local body =  display.newSprite( sheet , sequenceData )

    Dirt.body = body
    Dirt.body:setSequence( "start")


	Dirt.body.x = Dirt.image.x
	Dirt.body.y = Dirt.image.y
	Dirt.image.x = config.x
	Dirt.image.y =  config.y
	Dirt.image.surface = "rough"
	Dirt.image.damage = "safe"
	Dirt.image:insert(Dirt.body)

	physics.addBody( Dirt.image ,"static" , {friction=1,Filter=Dirt.Filter} )


	function Dirt.image:collision(event)
		if( event.other.type == "bullet") then
			if ( event.phase == "began") then
				Dirt.HP = Dirt.HP -event.other.power
				if (Dirt.HP < 1 and Dirt.alive == true) then
					Dirt.alive = false
					print( "AAA" )
					Dirt.body:setSequence( "explode")
					Dirt.body:play()
					timer.performWithDelay(400, Dirt.dispose)
				elseif (Dirt.HP/Dirt.MaxHP < 1/4 and Dirt.HP >1) then
					Dirt.body:setSequence( "break3")
				elseif(Dirt.HP/Dirt.MaxHP < 2/4 and Dirt.HP/Dirt.MaxHP >= 1/4)	then
					Dirt.body:setSequence( "break2")
				elseif(Dirt.HP/Dirt.MaxHP < 3/4 and Dirt.HP/Dirt.MaxHP >= 2/4)  then
					Dirt.body:setSequence( "break1")
				end
			end
		end
	end


 	Dirt.image:addEventListener( "collision" )
	Dirt.listeners[1] = {event="collision", listener = Dirt}
	return Dirt
end